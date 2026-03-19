# SVG Code Patterns & Export Guidance

## SVG Code Patterns Library
Reference patterns for common logo construction tasks. All use `viewBox="0 0 64 64"` with integer coordinates.

### Rotational Symmetry (3-fold / 4-fold)
Define one element in `<defs>`, replicate with `<use>` at equal angle intervals. **Always** use 3-argument `rotate(angle, cx, cy)`.
```svg
<defs><path id="petal" d="M32 32 L32 8 Q40 16 32 32Z" fill="#222"/></defs>
<use href="#petal" transform="rotate(0,32,32)"/>
<use href="#petal" transform="rotate(120,32,32)"/>
<use href="#petal" transform="rotate(240,32,32)"/>
```
For 4-fold: 0°, 90°, 180°, 270°. Angles must be exactly `k × (360/N)`. Build gaps into shape geometry, not spacing.

### Boolean Subtraction (Compound Path + evenodd)
Two subpaths in one `<path>` with `fill-rule="evenodd"`. **A full SVG circle requires TWO semicircular arcs.**
```svg
<path fill-rule="evenodd" fill="#222" d="
  M32 4  A28 28 0 1 1 32 60 A28 28 0 1 1 32 4 Z
  M32 18 A14 14 0 1 0 32 46 A14 14 0 1 0 32 18 Z"/>
```
Each subpath closes with `Z` before next `M`.

### Overlapping Circles with Explicit Intersection (Mastercard Style)
Two circles + lens-shaped third path. For equal-radius circles: intersection x = midpoint, y_offset = √(r² − (d/2)²). Lens uses two arcs with `large-arc-flag="0"`.
```svg
<circle cx="22" cy="32" r="20" fill="#eb001b"/>
<circle cx="42" cy="32" r="20" fill="#f79e1b"/>
<path d="M32 15 A20 20 0 0 1 32 49 A20 20 0 0 1 32 15Z" fill="#ff5f00"/>
```
**Common error:** Wrong arc flags/sweep = crescent instead of lens.

### Monogram Cut from Circle
Letter knocked out via `fill-rule="evenodd"`. Use only straight-line commands for the letter.
```svg
<path fill-rule="evenodd" fill="#222" d="
  M32 2 A30 30 0 1 1 32 62 A30 30 0 1 1 32 2 Z
  M20 18 L44 18 L44 26 L36 26 L36 48 L28 48 L28 26 L20 26 Z"/>
```

### Reflective Symmetry
Mirror with `translate(2×axis, 0) scale(-1, 1)`. For `64×64` at x=32: `transform="translate(64,0) scale(-1,1)"`. Translate **must** come first (transforms apply right-to-left).

### Negative Space Mark
Arrange positive shapes so the gap forms the shape. **Do not draw the implied shape.** Shared edge vertices must match exactly. Minimum gap: 10-12 units at 64×64.

### Universal AI-Safe SVG Practices
* Integer coordinates exclusively
* `fill-rule="evenodd"` on compound paths
* Full circles = two semicircular arcs
* Arc flag mnemonic: ≤half circle = `large-arc-flag="0"`, >half = `"1"`
* Short individual paths (minimize coordinate drift)
* Explicit layering order (SVG renders in document order)

---

## Export & Handoff Guidance

### Web: Framework Components
* **React (SVGR):** Replace `fill="#000"` with `fill="currentColor"`, add `{...props}` on root `<svg>`, use `width="1em" height="1em"`. Config: `{ icon: true, replaceAttrValues: { "#000": "currentColor" }, expandProps: "end" }`.
* **Vue:** `vite-svg-loader` with `?component` suffix. Same `currentColor` replacement.
* **Both:** Preserve `viewBox`. `aria-hidden="true"` for decorative; `role="img"` + `aria-label` for meaningful.

### Web: CSS Embedding
* **`<img src="logo.svg">`** — Simple placement, cached, no CSS control over fills.
* **Inline SVG** — Dynamic color theming via `currentColor` or CSS custom properties.
* **SVG sprite `<symbol>`/`<use>`** — Icon system alongside logo. One cached file.
* **CSS `background-image` data URI** — URL-encode (NOT base64). Only `#` needs encoding as `%23`.

### Favicon & Raster Generation
Modern favicon stack (3 files):
```html
<link rel="icon" href="/favicon.ico" sizes="32x32">
<link rel="icon" href="/icon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/apple-touch-icon.png"> <!-- 180×180 -->
```
Plus PWA manifest with 192×192 and 512×512 PNGs. Generate via `sharp` (Node.js) or `rsvg-convert` (CLI). `.ico` via ImageMagick.

### Design Tool Import (Figma)
Name `<g>` groups with meaningful `id` attributes (become layer names). Outline strokes to paths. Flatten booleans. Snap to pixel grid. Remove editor metadata. Ungroup after import.

### Print Production
SVG is RGB-only; print requires CMYK. Pipeline: SVG → Illustrator (or Inkscape + Scribus) → CMYK EPS/PDF. Convert text to outlines. Minimum reproduction: 0.5-1.5 inches wide. Include color spec sheet: Pantone, CMYK, RGB, HEX.

### SVG Optimization (SVGO)
Disable these plugins: `removeViewBox`, `cleanupIds`, `convertPathData`, `removeTitle`, `removeDesc`. Safe defaults remove 30-60% file size without visual impact.
