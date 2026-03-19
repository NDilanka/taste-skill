#!/usr/bin/env bash
# SVG Logo Validation Script
# Checks generated SVG against the skill's technical requirements.
# Usage: ./validate-svg.sh <path-to-svg>

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <svg-file>"
  exit 1
fi

SVG_FILE="$1"
if [[ ! -f "$SVG_FILE" ]]; then
  echo "Error: File not found: $SVG_FILE"
  exit 1
fi

PASS=0
FAIL=0
WARN=0

pass() { echo "  ✓ PASS: $1"; ((PASS++)); }
fail() { echo "  ✗ FAIL: $1"; ((FAIL++)); }
warn() { echo "  ⚠ WARN: $1"; ((WARN++)); }

echo "=== SVG Logo Validation: $SVG_FILE ==="
echo ""

# --- Banned Elements ---
echo "Banned Elements:"
for elem in "<text" "<tspan" "<filter" "<feGaussianBlur" "<feDropShadow" "<image" "<style" "<script" "<animate" "<foreignObject"; do
  if grep -q "$elem" "$SVG_FILE"; then
    fail "Contains banned element: $elem"
  fi
done
# Check for base64 embedded data
if grep -q "base64," "$SVG_FILE"; then
  fail "Contains embedded base64 data"
fi
# Check for external use references
if grep -qE 'href="https?://' "$SVG_FILE"; then
  fail "Contains external URL reference"
fi
if [[ $FAIL -eq 0 ]]; then
  pass "No banned elements found"
fi

echo ""

# --- Accessibility ---
echo "Accessibility:"
if grep -q "<title" "$SVG_FILE"; then
  pass "<title> element present"
else
  fail "Missing <title> element"
fi

if grep -q "<desc" "$SVG_FILE"; then
  pass "<desc> element present"
else
  fail "Missing <desc> element"
fi

if grep -q 'role="img"' "$SVG_FILE"; then
  pass 'role="img" present'
else
  fail 'Missing role="img" on root <svg>'
fi

if grep -q "aria-labelledby" "$SVG_FILE"; then
  pass "aria-labelledby present"
else
  fail "Missing aria-labelledby on root <svg>"
fi

echo ""

# --- ViewBox & Dimensions ---
echo "ViewBox & Dimensions:"
if grep -q "viewBox" "$SVG_FILE"; then
  pass "viewBox attribute present"
else
  fail "Missing viewBox attribute"
fi

# Check for hardcoded pixel dimensions (width="123px" or height="123px")
if grep -qE '(width|height)="[0-9]+(px)?"' "$SVG_FILE" | head -1 && grep -qE '<svg[^>]*(width|height)="[0-9]+(px)?"' "$SVG_FILE"; then
  warn "Root <svg> has hardcoded width/height — prefer viewBox-only for scalability"
fi

if grep -q 'xmlns="http://www.w3.org/2000/svg"' "$SVG_FILE"; then
  pass "xmlns namespace present"
else
  fail "Missing xmlns namespace"
fi

echo ""

# --- Coordinate Precision ---
echo "Coordinate Precision:"
# Find coordinates with more than 2 decimal places in path data
EXCESS_DECIMALS=$(grep -oE '[0-9]+\.[0-9]{3,}' "$SVG_FILE" | wc -l)
if [[ $EXCESS_DECIMALS -gt 0 ]]; then
  fail "Found $EXCESS_DECIMALS coordinates with >2 decimal places"
else
  pass "All coordinates within 2 decimal places"
fi

echo ""

# --- Path Closure ---
echo "Path Closure:"
# Extract all d="..." attributes and check each subpath ends with Z/z
# This is a heuristic: count M/m commands vs Z/z commands in path data
M_COUNT=$(grep -oE '[Mm]' "$SVG_FILE" | wc -l)
Z_COUNT=$(grep -oE '[Zz]' "$SVG_FILE" | wc -l)
if [[ $M_COUNT -gt 0 && $Z_COUNT -lt $M_COUNT ]]; then
  warn "Found $M_COUNT path subpaths but only $Z_COUNT closures (Z) — some paths may be unclosed"
else
  pass "Path closure count looks correct ($M_COUNT subpaths, $Z_COUNT closures)"
fi

echo ""

# --- File Size ---
echo "File Size:"
FILE_SIZE=$(wc -c < "$SVG_FILE")
if [[ $FILE_SIZE -gt 5120 ]]; then
  fail "File size ${FILE_SIZE} bytes exceeds 5KB wordmark budget"
elif [[ $FILE_SIZE -gt 3072 ]]; then
  warn "File size ${FILE_SIZE} bytes — OK for wordmarks, over budget for simple marks (<1.5KB) and moderate marks (<3KB)"
elif [[ $FILE_SIZE -gt 1536 ]]; then
  warn "File size ${FILE_SIZE} bytes — OK for moderate marks, over budget for simple marks (<1.5KB)"
else
  pass "File size ${FILE_SIZE} bytes — within simple mark budget"
fi

echo ""

# --- Shape Count ---
echo "Shape Count:"
# Count visible shape elements (rect, circle, ellipse, polygon, polyline, line, path)
SHAPE_COUNT=$(grep -coE '<(rect|circle|ellipse|polygon|polyline|line|path)[\s/>]' "$SVG_FILE" || echo 0)
# Subtract shapes inside <defs> (they're templates, not visible)
DEFS_SHAPES=$(sed -n '/<defs>/,/<\/defs>/p' "$SVG_FILE" | grep -coE '<(rect|circle|ellipse|polygon|polyline|line|path)[\s/>]' || echo 0)
VISIBLE_SHAPES=$((SHAPE_COUNT - DEFS_SHAPES))
# Add <use> elements (they instantiate shapes)
USE_COUNT=$(grep -coE '<use[\s/>]' "$SVG_FILE" || echo 0)
TOTAL=$((VISIBLE_SHAPES + USE_COUNT))

if [[ $TOTAL -gt 7 ]]; then
  warn "Shape count: $TOTAL visible elements (budget: ≤7 for marks, wordmark letters exempt)"
else
  pass "Shape count: $TOTAL visible elements (within budget)"
fi

echo ""

# --- Unused Defs ---
echo "Unused Defs:"
if grep -q "<defs>" "$SVG_FILE"; then
  # Extract IDs defined in defs
  DEFS_IDS=$(sed -n '/<defs>/,/<\/defs>/p' "$SVG_FILE" | grep -oE 'id="[^"]*"' | sed 's/id="//;s/"//' || true)
  UNUSED=0
  for id in $DEFS_IDS; do
    # Check if this ID is referenced elsewhere (href, url(), aria-labelledby, etc.)
    REF_COUNT=$(grep -c "$id" "$SVG_FILE" || echo 0)
    if [[ $REF_COUNT -le 1 ]]; then
      warn "Potentially unused def: id=\"$id\""
      ((UNUSED++))
    fi
  done
  if [[ $UNUSED -eq 0 ]]; then
    pass "All defs appear to be referenced"
  fi
else
  pass "No <defs> block (nothing to check)"
fi

echo ""

# --- Editor Metadata ---
echo "Editor Metadata:"
METADATA_FOUND=0
for pattern in "data-name" "xml:space" "inkscape:" "sodipodi:" "illustrator" "sketch:"; do
  if grep -qi "$pattern" "$SVG_FILE"; then
    fail "Contains editor metadata: $pattern"
    ((METADATA_FOUND++))
  fi
done
if [[ $METADATA_FOUND -eq 0 ]]; then
  pass "No editor metadata found"
fi

echo ""

# --- Summary ---
echo "=== Summary ==="
echo "  Passed: $PASS"
echo "  Failed: $FAIL"
echo "  Warnings: $WARN"
echo ""

if [[ $FAIL -gt 0 ]]; then
  echo "RESULT: FAIL ($FAIL issues must be fixed)"
  exit 1
else
  echo "RESULT: PASS (with $WARN warnings)"
  exit 0
fi
