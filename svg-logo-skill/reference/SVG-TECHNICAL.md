# SVG Technical Standards — Full Reference

## Structure & ViewBox
* **MANDATORY:** Always use `viewBox="0 0 W H"`. Standard sizes: `64 64` for marks, `200 48` for wordmarks. NEVER hardcode `width`/`height` in pixel units — let viewBox handle scaling.
* **Namespace:** Always include `xmlns="http://www.w3.org/2000/svg"`.
* **Scaling:** Default to `preserveAspectRatio="xMidYMid meet"`.
* **Grouping:** Use `<g>` for semantic grouping (`<g id="mark">`, `<g id="type">`). Max 2 levels deep.
* **Motion-ready:** Each distinct visual component should be its own `<g>` group for potential future animation.

## Path Quality
* **INTEGER-FIRST coordinates.** Integers are dramatically more reliable for AI generation. Decimals max 2 places, only when needed. For `64×64`, most coordinates should be multiples of 8.
* **Command Efficiency:** Use relative commands when shorter. `H`/`h` for horizontal, `V`/`v` for vertical, `Z` to close.
* **Shape Primitives:** Use `<circle>`, `<rect>`, `<ellipse>`, `<polygon>` when they fit. Only use `<path>` for complex curves. A circle as a path with 4 arcs is worse than `<circle cx="32" cy="32" r="16"/>`.
* **Close All Paths:** Every filled shape MUST end with `Z`. Unclosed paths leave visible gaps.
* **Curve Preference:** For circular curves, prefer arc commands (`A`) over cubic beziers (`C`). Arcs are exact for circles; beziers are approximations.
* **Combine Same-Fill Shapes:** If two shapes share fill and don't overlap, combine into one `<path>` with multiple subpaths.
* **No Overlapping Same-Fill:** Identical fill + overlap = anti-aliasing seam artifacts. Combine into compound path.
* **Fill Rule:** `nonzero` (default) for simple shapes. `evenodd` for compound paths with interior holes.
* **Internal `<use>`:** For rotational/reflective symmetry, define one unit and replicate. DRY + mathematically perfect symmetry.
* **Transform Origin:** SVG defaults to (0,0), not element center. Always specify: `transform="rotate(120 32 32)"`.

## Color & Style
* **Inline Attributes:** Use `fill`/`stroke` directly. Avoid `<style>` blocks.
* **Hex Format:** 6-digit hex for brand colors. Short hex only for pure neutrals.
* **No Default Fill:** Explicitly set `fill` on every visible shape.
* **currentColor:** For monochrome logos, use `fill="currentColor"`. Only works inline in DOM, not via `<img>`.

## Accessibility & Metadata
* **Required:** `<title id="logo-title">Brand Name Logo</title>` as first child of `<svg>`.
* **Required:** `<desc id="logo-desc">` with brief visual description.
* **ARIA:** `role="img"` and `aria-labelledby="logo-title logo-desc"` on root `<svg>`.

## AI Generation Reliability (Research-Backed)
From LLM4SVG (CVPR 2025), Chat2SVG (CVPR 2025), Reason-SVG (2025):

* **Most reliable:** `<rect>`, `<circle>`, `<ellipse>`, `<line>` — fewest parameters.
* **Moderate:** `<polygon>`, `<path>` with L/H/V commands.
* **Least reliable:** `<path>` with cubic Bezier (C) and arc (A) — control points frequently misplaced.

Compose from primitives. Reserve `<path>` for organic curves only. Keep individual paths short to minimize coordinate drift.

## Banned SVG Features
* NO `<image>` or embedded raster data
* NO `<filter>`, `<feGaussianBlur>`, `<feDropShadow>`
* NO `<text>` or `<tspan>` (convert to paths)
* NO `<style>` or `<script>` blocks
* NO `<use>` with external references
* NO complex `clip-path` (simple rectangular clips OK)
* NO `stroke-dasharray`, `stroke-dashoffset`, or `<animate>`
* NO `opacity` below 0.3 on visible elements

## Cross-Renderer Compatibility Tiers
* **Tier 1 (Universal):** Basic shapes, `<path>` M/L/C/Q/A/Z, `viewBox`, solid fills with hex, `fill-rule="nonzero"`, `opacity`, `<g>` grouping, text as paths. Works everywhere: all browsers, Figma, Illustrator, iOS, Android VectorDrawable.
* **Tier 2 (Mostly safe):** `fill-rule="evenodd"` (Android pre-API 24 broken), gradients with `spreadMethod="pad"` (Android API 24+ only), simple `<clipPath>`, transforms on groups.
* **Tier 3 (Caution):** CSS `transform-origin` (Firefox/Chrome disagree), `<use>` (Safari Shadow DOM broken, Figma unsupported), `currentColor` (only inline DOM), `<mask>` (Figma/Android unsupported).
* **Tier 4 (Avoid):** `<filter>`, `<pattern>`, SMIL animation, `<foreignObject>`, embedded `<image>`, `<script>`, external resources, SVG fonts, CSS `@media` inside SVG.

**Platform notes:** Email = zero SVG support (rasterize to PNG). Social media = reject SVG uploads (rasterize to 1200×630 PNG). Android VectorDrawable = paths, basic shapes, group transforms, solid fills only.

## Size Budget
* **Simple marks** (monogram, abstract): < 1.5KB
* **Moderate marks** (pictorial, negative space): < 3KB
* **Wordmarks**: < 5KB

## Versatility Requirements

### Mandatory Variants
1. **Full Color** — primary brand version
2. **Monochrome (Dark)** — single dark color on transparent, using `fill="currentColor"`
3. **Monochrome (Light)** — for dark backgrounds, using `fill="currentColor"`

### Favicon Readiness
* If primary mark has > 4 shapes, provide simplified favicon variant (≤ 3 shapes, `viewBox="0 0 32 32"` or `16 16`).

### App Icon Safe Zones
* **iOS:** Inner 80% — corners are clipped by superellipse mask.
* **Android:** 66dp diameter safe zone circle (61% of 108dp canvas). Design for circle (worst case).
* **Social media:** Inner 70% — all platforms crop to circles.

### Responsive Logo System
| Size Range | What to Show |
|---|---|
| 240px+ wide | Icon + wordmark + tagline |
| 144-240px | Icon + wordmark (minimum legible lockup) |
| 80-144px | Stacked: icon above wordmark |
| 40-80px | Icon only |
| 16-40px | Simplified icon (≤ 3 bold shapes) |

**Hard minimums:** Wordmark not below 16px cap height. Below 40px total lockup height, use simplified icon.

### Independence
* Zero external dependencies. Dropping SVG into blank HTML must work.
* **Security:** No `<script>`, `<foreignObject>`, event handlers, or `<animate>` targeting `href`.
