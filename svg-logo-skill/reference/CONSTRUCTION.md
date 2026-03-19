# Construction Techniques — Full Reference

## Grid Construction
* **MANDATORY:** Design on a grid aligned to the viewBox. For `64×64`, use an **8-unit grid** (8 columns × 8 rows). All major vertices, centers, and tangent points should snap to grid intersections.
* **Keyline Shapes:** Before drawing, choose a keyline: circle, portrait rectangle, landscape rectangle, or square. The mark must fill this keyline consistently.
* **Content Zone:** Keep all mark elements within the central 80% of the viewBox (for `64×64`, roughly x:6 y:6 to x:58 y:58). For formal brand guidelines, define clear space as a **ratio of a mark element** (e.g., "= radius of the primary circle").
* **Grid Honesty:** Use the grid to verify and refine, not to constrain. If a shape looks right but doesn't snap perfectly, trust the eye.

## Construction Grid Lessons from Iconic Logos

* **Circle-packing (Twitter bird):** Build complex organic forms from overlapping circles of only 2 radii (related by φ ≈ 1.618). The final outline is pure circular arcs (`A` commands). Define radii, place centers, derive the contour via boolean union/difference.
* **Rotational symmetry (Chase octagon):** 4 identical trapezoid wedges at 0°/90°/180°/270°. Gaps between wedges are built into the shape geometry, not added as spacing. Use `<defs>` + `<use>` with `rotate()`.
* **Venn overlap (Mastercard):** Two equal circles offset horizontally. The lens intersection is an explicit third path using two arc commands. Three flat colors — no blend modes, no clipping needed.
* **Modular grid (Slack):** 8 elements (4 lozenges + 4 circles) on a 19×19 grid, arranged at 90° increments. Simple rounded rectangles and circles.
* **Single continuous stroke (Airbnb Bélo):** One closed `<path>` using cubic Bezier `C`/`S` commands. Meaningful marks can be a single path.

**Golden ratio reality check:** Most "golden ratio" logo analyses are retrofitted after design. Twitter's circle radii genuinely follow φ. Apple's and Google's are post-rationalizations. Use φ as a **starting ratio for proportions**, then adjust optically. The eye outranks the math.

## Stroke vs. Fill Decision
* **Fill-based marks** scale better and are more robust. Prefer fills for most archetypes.
* **Stroke-based marks** (wireframe, minimal, technical aesthetic):
  - Maintain **uniform stroke-width** across ALL elements.
  - Minimum stroke-width: **4% of viewBox dimension** (e.g., 2.5 for 64×64).
  - Always set `stroke-linecap` and `stroke-linejoin` explicitly: `"round"` for friendly, `"butt"`/`"miter"` for corporate.
  - Consider `vector-effect="non-scaling-stroke"` for wildly varying display sizes.

## Symmetry Operations (MANDATORY for symmetric marks)
* **NEVER manually draw both halves of a symmetric shape.** LLMs introduce 1-5 unit coordinate drift. Always define ONE unit and replicate via transforms:
  - **Rotational:** `<use transform="rotate(angle cx cy)">`. For 3-fold: 0°, 120°, 240°. For 4-fold: 0°, 90°, 180°, 270°. **Tip:** Use `viewBox="-32 -32 64 64"` (centered origin) so `rotate(angle)` defaults to center.
  - **Reflective:** `transform="translate(2*axis, 0) scale(-1, 1)"` for horizontal mirroring.
* **For production:** Consider flattening `<use>` into direct paths for cross-platform compatibility (Safari has `<use>` bugs in Shadow DOM).

## Shape Psychology
* **Circles/Curves:** Warmth, community, protection, unity. Default for wellness, social, consumer brands.
* **Squares/Rectangles:** Stability, reliability, trust, structure. Default for finance, government, institutions.
* **Triangles (upward only):** Dynamism, direction, innovation, aspiration. Default for tech, sports, growth companies. **Avoid downward-pointing triangles** — they signal instability.

## Counter-Forms & Negative Space
* Interior negative spaces must be **≥ 15% of the mark's total bounding area** to remain visible at small sizes.
* Use `fill-rule="evenodd"` on compound paths to create punch-through negative spaces.

## Boolean Operations Thinking
* Mentally construct complex shapes via: **union** (merge), **subtract** (cut), **intersect** (keep overlap).
* Implement as compound paths with `fill-rule="evenodd"`, not layered white fills (which break on non-white backgrounds).

## Proportional Relationships
* **φ-Scaling:** Relate multiple shapes through 1:1.618. If primary circle has radius R, secondary should be R × 0.618.
* **Fibonacci Spacing:** Gaps between elements use Fibonacci units relative to grid (2, 3, 5, 8 units).
* **Proportions as Verification:** Use φ-ratios to verify and refine, not as rigid constraints. The math validates what the eye already found pleasing.
