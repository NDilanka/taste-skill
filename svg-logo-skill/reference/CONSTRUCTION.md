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

## Physical Production Constraints

The most **production-resilient** logo uses minimum 1.5mm strokes, ≤4 flat colors, no gradients, no floating interior shapes, and text ≥7mm cap height. Provide production-specific variants when needed.

| Method | Min Stroke | Max Colors | Gradients? | Key Constraint |
|---|---|---|---|---|
| **Embroidery** | 1.5 mm | 5-7 thread | No | No fine detail; sans-serif only; min 7mm text |
| **Screen Print** | 0.5-1.0 mm | 1-6 spot | Halftone only | Each color = separate screen; trap overlapping colors by 0.25-0.5mm |
| **Deboss/Emboss** | 0.5-1.0 mm | 1 (impression) | No | Counters must be ≥0.75mm wide; bold silhouettes work best |
| **Laser Cut** | 0.2 mm (engrave) / 1.0 mm (cut) | 2-3 tones | Dithered only | **Islands fall out** — add bridges for enclosed shapes (letter O, D, etc.) |
| **Foil Stamp** | 0.3-0.5 mm | 1-2 foil | No | Medium-weight serif minimum; hairline serifs break up |
| **Large Format** | 1 mm (close) / 15+ mm (distance) | Unlimited (CMYK) | Yes | Viewing distance rule: 25mm stroke per 10m distance; reds/yellows fade fastest |

**SVG preparation for production:**
- Convert all strokes to filled paths with enforced minimum widths
- Flatten transparency and remove all effects
- Close all paths (no open strokes)
- For laser cutting: provide a stencil variant with bridges connecting interior shapes to surrounding material
- For embroidery: provide a simplified variant with ≤4 colors and no detail below 1.5mm
- For print: deliver CMYK color specs alongside hex values

## Cultural Sensitivity in Logo Design

Beyond color (covered in COLOR-AND-INDUSTRY.md), shapes and symbols carry different meanings across cultures. When designing for global brands, avoid these unless contextually appropriate:

### Shapes & Gestures
* **Swastika / manji (卍):** Sacred in Hinduism, Buddhism, and Jainism (clockwise and counterclockwise). Strictly banned in Western contexts due to Nazi associations. Avoid any rotated cross that could be misread.
* **Inverted cross:** Satanic associations in Western culture; St. Peter's cross in Catholic tradition. Avoid in ambiguous contexts.
* **Pointing hand / fingers:** The "OK" sign (thumb-index circle) is offensive in Brazil and parts of Middle East. Thumbs-up is offensive in parts of the Middle East. The left hand is considered unclean in many Islamic and South Asian cultures.
* **Eye imagery:** The "evil eye" (nazar) is protective in Turkey/Greece but potentially unsettling in other contexts. The "Eye of Horus" carries Egyptian religious weight.

### Animals
* **Pig:** Offensive in Islamic cultures and some Jewish contexts. Avoid for any brand targeting the Middle East or Muslim-majority markets.
* **Dog:** Beloved in the West; considered unclean in some Islamic traditions. Context-dependent.
* **Owl:** Wisdom in the West; bad omen or associated with death in Middle East, India, and parts of East Asia.
* **Dragon:** Positive (power, fortune) in East Asia; negative (evil, destruction) in Western tradition.
* **Cow:** Sacred in Hinduism — never depict casually for Indian market. Avoid beef/leather associations.
* **Monkey:** Can carry racial connotations depending on context. Handle with extreme care.
* **Cat:** Generally positive globally, but black cats are unlucky in some Western traditions.

### Numbers
* **4:** Unlucky in China, Japan, Korea (sounds like "death" in Chinese/Japanese). Avoid 4-element designs for East Asian markets.
* **13:** Unlucky in Western cultures. Less relevant for logo shapes but matters for naming/taglines.
* **8:** Extremely lucky in China (sounds like "prosperity"). Positive associations.
* **7:** Lucky in most Western and Islamic cultures.

### Religious Symbols (Never Use Casually)
Cross, crescent, Star of David, Om (ॐ), lotus (sacred in Buddhism/Hinduism), hamsa/Hand of Fatima, yin-yang, torii gate, dharma wheel. Using these in commercial logos without genuine religious context is culturally appropriative and potentially offensive.

### Color Additions (Supplement to COLOR-AND-INDUSTRY.md)
* **White:** Mourning in China, Japan, Korea, India. Purity in Western cultures.
* **Yellow:** Imperial/sacred in China; mourning in parts of Latin America; caution in West.
* **Red:** Luck/prosperity in China; danger/warning in West; mourning in South Africa.
* **Purple:** Mourning in Thailand and parts of Latin America; royalty in West.
* **Green:** Sacred in Islam (color of the Prophet); nature/eco in West.

**Rule of thumb:** When designing for a specific cultural market, research that market. When designing for global use, stick to abstract geometric forms and avoid all figurative symbols, religious imagery, and culturally loaded animals.
