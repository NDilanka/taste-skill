# Typography in Logos — Full Reference

**The Font Phantom Ban:** `<text>` and `<tspan>` elements are BANNED in all final SVG output. All typography MUST be converted to `<path>` elements. `<text>` elements depend on the viewer's installed fonts — the logo will render differently on every machine.

## Font Archetype Reference
Design letterforms with a clear typographic voice:
* **Geometric Sans (Futura archetype):** Clean circles and straight lines. Modern tech, minimal SaaS. Best for `GEOMETRIC_PRECISION ≥ 6`.
* **Humanist Sans (Frutiger archetype):** Calligraphic stroke variation, open apertures. Approachable, warm. Healthcare, consumer apps.
* **Slab Serif (Rockwell archetype):** Thick rectangular serifs. Sturdy, established. Construction, finance, heritage.
* **High-Contrast Serif (Didot archetype):** Extreme thick/thin stroke contrast. Luxury, fashion, editorial. Best for `PLAYFULNESS ≤ 3`.
* **Monospace (Courier archetype):** Equal-width characters. Developer tools, technical products, hacker aesthetic.
* **Custom Hand-Drawn:** Irregular strokes, organic curves. Craft brands, artisan, children's brands. Best for `PLAYFULNESS ≥ 7` and `GEOMETRIC_PRECISION ≤ 3`.

## Kerning & Spacing
* **Tighten by default.** Logo wordmarks use tighter letter-spacing than body text — the letters should feel like a unified word-shape.
* **Optical kerning pairs:** AV, WA, To, LT, VA, TA, Ty require manual spacing adjustment. The gap must look even to the eye, not measure even with a ruler.
* **H-O-H Reference:** Establish baseline letter spacing by mentally setting H, O, H in sequence. The visual area between H and O becomes your spacing unit.
* **Tracking:** Uppercase wordmarks: slightly wider (+2-5%). Lowercase wordmarks: tighter (-1-3%).

## Weight & Case
* **Weight:** Medium (500) to Bold (700) for primary wordmarks. Thin/Light weights are BANNED for logo use (vanish at small sizes). Regular (400) only for very short names (≤ 4 characters).
* **Lowercase** = friendly, modern, approachable (google, spotify). Default for tech startups and consumer apps.
* **Uppercase** = authoritative, established, institutional (IBM, NASA). Default for `PLAYFULNESS ≤ 3`.
* **Small-caps + wide tracking** = luxury, fashion, editorial. Use sparingly.

## Letterform Construction
* Build each character from geometric primitives: circles, arcs, straight lines. Start with the skeleton, then apply weight.
* **Crossbar placement:** Position at **40% of cap height** (not 50%). The optical center is at ~55% of height — the lower half appears heavier.
* **Stroke-to-height ratio:** ~1/7 to 1/8 of cap height. For 48-unit cap height: stroke width ≈ 6-7 units.
* **Counter width:** Interior spaces must be **1.5-2× the stroke width** for legibility at small sizes.
* Ensure consistent stroke terminals across all letters.
* Modify at least one letterform to create distinctiveness — a custom ligature, unusual counter-form, or geometric replacement.
* **Counter spaces** (holes in O, bowl of B, aperture of c) are design opportunities. Shape them consistently. The FedEx arrow was discovered inside a counter space.

## Letter Difficulty & Construction Guide

**Easy (rectangles + straight lines):** H, I, L, T, E, F — build from `<rect>` elements or straight `<path>` segments. Almost never fail.

**Medium (simple arcs):** O, C, D, U, J — use `<circle>` or `<ellipse>` primitives, arc commands (`A`) otherwise.

**Hard (compound curves + junctions):**
* **S:** Two opposing arcs with different radii. Lower bowl ~3-5% larger than upper. Use `C` + `S` commands for tangent continuity. Never build from two identical semicircles.
* **R:** Vertical stem + half-circle bowl + diagonal leg. Bowl height: upper ~53% of cap height. Thin junction where leg meets bowl to ~80% of stroke width.
* **B:** Vertical stem + two half-circle bowls. **Lower bowl ~5-10% wider than upper.** Waist sits slightly above geometric center (~53%).
* **G:** Start with C shape, add horizontal crossbar at ~45-50% from baseline extending to approximately the counter's horizontal center.
* **K:** Vertical stem + upper arm (~55-65° from horizontal) + lower leg (~35-45°). Junction slightly above center. Arm and leg should NOT meet at equal angles.
* **Q:** Copy of O + diagonal tail from ~4-5 o'clock, extending below baseline by 20-35% of cap height.

**Winding direction for counters:** Letters with holes (A, B, D, O, P, Q, R) need outer contour clockwise and inner counter-clockwise under `nonzero` fill rule. Use `fill-rule="evenodd"` as a safer alternative — it doesn't depend on winding direction.
