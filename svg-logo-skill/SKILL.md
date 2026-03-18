---
name: svg-logo-generation
description: SVG Logo Architect & Brand Mark Engineer. Generates clean, modern, minimal SVG logos with professional scalability. Enforces geometric precision, path optimization, shape budgets, typographic rigor, and versatility across sizes and contexts. Bans AI logo clichés, clip-art aesthetics, and purple-blue gradient syndrome.
---

# Agent Skill: SVG Logo Architect & Brand Mark Engineer

## 1. ACTIVE BASELINE CONFIGURATION
* GEOMETRIC_PRECISION: 7 (1=Organic/Hand-drawn, 10=Mathematically Perfect)
* STYLE_COMPLEXITY: 3 (1=Single Shape/Letterform, 10=Multi-element Composition)
* PLAYFULNESS: 4 (1=Corporate/Serious, 10=Whimsical/Expressive)

**AI Instruction:** These are the default values (7, 3, 4) for all logo generations. Do not ask the user to edit this file. ALWAYS listen to the user: adapt these values dynamically based on what they explicitly request in their chat prompts. Use these baseline (or user-overridden) values as your global variables to drive the logic in Sections 2 through 10.

## 2. CORE DESIGN PHILOSOPHY

**Rule 1: The Reduction Mandate.** A logo is finished not when there is nothing left to add, but when there is nothing left to remove. Every shape, path, and color must justify its existence. If removing an element doesn't break recognition, remove it. Count your shapes — then try to cut one more.

**Rule 2: The Scalability Law.** Every logo you generate MUST work as a 16px favicon AND a billboard. Design at 64×64, verify mentally at 16×16. If fine details vanish at small sizes, the logo fails. Details that disappear at small sizes must be removed — they are decoration, not design.

**Rule 3: The Originality Imperative.** Your job is to create a unique mark that captures a brand's essence — not to assemble stock-icon parts. Every logo must feel like it was designed by a human with a specific concept in mind, not generated from a template.

**Rule 4: No Literal Depictions.** A delivery company does not need a truck. A music app does not need a musical note. A cloud company does not need a cloud. Abstract or metaphorical marks are almost always stronger than literal illustrations of what the company does. The mark should evoke the *feeling* of the brand, not depict its product.

**Rule 5: One Concept, One Read.** The logo communicates a single idea instantly. Do not layer multiple clever visual metaphors into one mark. If a viewer needs more than 2 seconds to "get it," the concept is too complex. State your concept in one sentence before writing any SVG — if you can't, simplify.

**Rule 6: The Silhouette Test.** Fill the entire logo with solid black on a white background. If the shape is still distinctive and recognizable, the design works. If it becomes an unreadable blob or looks like every other logo, simplify. **Companion — The Blur Test:** Mentally blur the mark aggressively (imagine it at 8px or viewed from 50 feet away). If the proportional mass distribution is still distinctive and different from other marks, the form is strong. The silhouette test validates the outline; the blur test validates the proportions. Apply both.

**Rule 7: The Distinctiveness Mandate.** Clean and forgettable is worse than slightly awkward and memorable. Every mark must have one element of deliberate tension — an unexpected proportion, a controlled asymmetry, an unusual angle, a surprising negative space. If your mark could be swapped with any other company's logo without anyone noticing, it fails. The Airbnb Bélo was widely mocked for looking unusual — and is now instantly recognizable worldwide. Sagi Haviv: *"Memorable identities must be unusual in some way, even awkward sometimes."*

## 3. LOGO ARCHETYPES (Pick 1)
Before writing any SVG, you MUST consciously select an archetype and state your choice. Do not freestyle.

### A. Geometric Monogram
* **What:** Single or double letterform set within or constructed from geometric shapes.
* **When:** SaaS products, tech startups, professional services, developer tools.
* **Shape Budget:** ≤ 4 shapes. The letterform IS the mark.
* **Approach:** Integrate the letter into the geometry — a letter cut from a circle, a letter built from grid-aligned strokes, a letter that IS a shape.
* **Small Size:** Letterform must remain legible at 16px. Avoid thin strokes below `stroke-width="2"` at 64×64 scale.

### B. Abstract Mark
* **What:** Non-representational geometric shape that conveys a concept through form, not depiction.
* **When:** Brands wanting flexibility, companies that will outgrow a literal symbol, global brands needing cross-cultural recognition.
* **Shape Budget:** ≤ 5 shapes. Prefer 2-3.
* **Approach:** Use geometric relationships (overlap, rotation, nesting, intersection) to create visual tension and meaning. The mark should feel intentional, not random.
* **Small Size:** Must read as a single unified form, not scattered parts.

### C. Wordmark
* **What:** The brand name set in custom-lettered typography with a distinctive character.
* **When:** Brands with short, unique names (≤ 8 characters). Names that are themselves distinctive.
* **Shape Budget:** One path per letterform. Total paths = character count.
* **Approach:** ALL text MUST be converted to `<path>` elements — never use `<text>`. Modify at least one letterform to create distinctiveness (a custom ligature, a cut, a geometric replacement for one letter, unique terminals).
* **Small Size:** May need a separate single-letter monogram variant for favicon use.

### D. Pictorial Reduction
* **What:** A real-world object reduced to its absolute minimal geometric essence.
* **When:** Brands with a strong conceptual anchor to a physical object, animal, or natural form.
* **Shape Budget:** ≤ 5 shapes. The object must be recognizable from silhouette alone.
* **Approach:** Start from the real object. Remove detail until only the essential silhouette and one defining characteristic remain. Build from basic primitives (`<circle>`, `<rect>`, `<path>`) — no freehand illustration.
* **Small Size:** Silhouette must be instantly recognizable. No internal detail that vanishes.

### E. Negative Space Mark
* **What:** Uses the counter-form or background space to create a secondary image or meaning.
* **When:** Brands that want cleverness, memorability, or a "hidden message" quality.
* **Shape Budget:** ≤ 4 shapes. The magic is in what's NOT drawn.
* **Approach:** Design the positive AND negative shapes simultaneously. Both readings (foreground and background) must be intentional. Test by inverting colors — both versions should work. Use `fill-rule="evenodd"` on compound paths to punch out counter-forms.
* **Small Size:** The primary reading must dominate at small sizes. The secondary reading is a bonus at larger scales.

### F. Emblem
* **What:** Text or letterforms contained inside a geometric shape — a badge, seal, or crest. NOT a generic shield (shields are banned in Section 9).
* **When:** Heritage brands, institutions, sports teams, government entities, food & beverage with "established since" positioning.
* **Shape Budget:** ≤ 7 shapes total (the most complex archetype). Outer container + interior elements.
* **Approach:** Start with the container shape (circle, rounded rectangle, custom outline). Place the brand name and/or monogram inside. Interior elements must be radically simplified — no ornamental flourishes.
* **Small Size:** Text inside emblems vanishes at small sizes. MUST provide an icon-only variant that extracts the interior mark for favicon use.

### G. Combination Mark
* **What:** An icon/symbol placed alongside a wordmark. The most common logo type in the real world.
* **When:** New brands needing both visual identity and name recognition. Brands that need flexibility to use mark alone or with text.
* **Shape Budget:** Mark ≤ 4 shapes + wordmark paths. The mark and wordmark are separate `<g>` groups.
* **Approach:** Design the mark and wordmark independently — both must work standalone. Horizontal layout is default. The mark should sit to the left of the wordmark with a clear gap (≥ the width of the wordmark's capital "I").
* **Small Size:** Use the mark alone as the favicon. The wordmark is used only when display size permits full legibility.

**Archetype Selection Defaults:** If the user does not specify a preference, choose based on context: **Abstract Mark** for tech/SaaS companies. **Wordmark** for consumer brands with short, distinctive names (≤ 8 characters). **Combination Mark** when the brand is new or unfamiliar. **Geometric Monogram** for developer tools and professional services. **Emblem** only when the user explicitly requests a badge/seal aesthetic.

## 4. SVG TECHNICAL STANDARDS

### Structure & ViewBox
* **MANDATORY:** Always use `viewBox="0 0 W H"`. Standard sizes: `64 64` for marks (aligns with favicon dimensions, divides cleanly by 4/8/16 for grid construction), `200 48` for wordmarks. NEVER hardcode `width` and `height` in pixel units on the root `<svg>` element — let the viewBox handle scaling.
* **Namespace:** Always include `xmlns="http://www.w3.org/2000/svg"` on the root element.
* **Scaling Behavior:** Default to `preserveAspectRatio="xMidYMid meet"` (centers the mark and maintains aspect ratio). Only omit or change this if the logo intentionally needs different scaling behavior.
* **Grouping:** Use `<g>` tags for semantic grouping (e.g., `<g id="mark">`, `<g id="type">`). Keep nesting shallow — max 2 levels deep.
* **Motion-ready structure:** Even though logos are static marks, structure the SVG so individual elements could be independently animated in the future. Each distinct visual component should be its own `<g>` group — this enables designers to later add entrance animations, hover effects, or loading sequences without restructuring the SVG.

### Path Quality
* **Coordinate Precision:** Maximum 2 decimal places. Round `M 12.34567 5.891011` to `M 12.35 5.89`. Prefer integers where possible.
* **Command Efficiency:** Use relative commands (`m`, `l`, `c`, `a`) when they produce shorter paths than absolute (`M`, `L`, `C`, `A`). Use shorthand: `H`/`h` for horizontal lines, `V`/`v` for vertical lines, `Z` to close paths.
* **Shape Primitives:** Use `<circle>`, `<rect>`, `<ellipse>`, `<line>`, `<polygon>` when they fit. Only use `<path>` for complex or organic curves. A circle drawn as a `<path>` with 4 arc commands is strictly worse than `<circle cx="32" cy="32" r="16"/>`.
* **Combine Shapes:** If two shapes share the same fill and don't overlap, combine them into a single `<path>` using multiple subpaths (`M...Z M...Z`).
* **Fill Rule:** Use `fill-rule="nonzero"` (the default) for simple shapes. Use `fill-rule="evenodd"` for compound paths where you need interior shapes to punch through as negative space (essential for the Negative Space Mark archetype and counter-forms in lettermarks).
* **Internal `<use>` Encouraged:** For marks with rotational or reflective symmetry, define one unit and replicate it with `<use>` referencing an internal `id`. This keeps the SVG DRY and the symmetry mathematically perfect. (External `<use>` with URLs is still banned.)
* **Transform Origin:** SVG `transform-origin` defaults to `0 0` (NOT the element center like CSS). When using rotation for symmetry, always specify the rotation center explicitly: `transform="rotate(120 32 32)"` for a 120° rotation around the center of a `64×64` viewBox.

### Color & Style
* **Inline Attributes:** Use `fill` and `stroke` attributes directly on elements. Avoid `<style>` blocks — they add bloat and create specificity issues when logos are embedded in web pages.
* **Hex Format:** Use 6-digit hex for brand colors (`#1a1a2e`, `#0d6efd`). Short hex (`#000`, `#FFF`, `#333`) is acceptable for pure neutrals only.
* **No Default Fill:** Explicitly set `fill` on every visible shape. Never rely on the SVG default black fill.
* **Current Color:** For monochrome logos, use `fill="currentColor"` so the logo inherits the parent's text color — this is the most versatile approach.

### Accessibility & Metadata
* **Required:** Include `<title id="logo-title">Brand Name Logo</title>` as the first child of `<svg>`. The `id` attribute is mandatory.
* **Required:** Include `<desc id="logo-desc">` with a brief visual description of the mark (e.g., "Abstract geometric mark formed by two interlocking triangles").
* **ARIA:** Add `role="img"` and `aria-labelledby="logo-title logo-desc"` on the root `<svg>`, referencing both IDs.

### Banned SVG Features
* **NO** `<image>` or embedded raster data (base64, external URLs)
* **NO** `<filter>`, `<feGaussianBlur>`, `<feDropShadow>`, or any filter primitives
* **NO** `<text>` or `<tspan>` elements (convert all text to paths)
* **NO** `<style>` or `<script>` blocks
* **NO** `<use>` with external references (internal `<use>` for symmetry is encouraged — see Path Quality above)
* **NO** `clip-path` with complex shapes (simple rectangular clips are acceptable)
* **NO** CSS `@import` or external font references
* **NO** `stroke-dasharray`, `stroke-dashoffset`, or `<animate>` elements — logos are static marks
* **NO** `opacity` below `0.3` on visible design elements — if something is that faint, remove it. (Construction guides during development are fine.)
* **Stroke-based logos:** If strokes are the primary visual style, consider adding `vector-effect="non-scaling-stroke"` so strokes maintain consistent width regardless of the SVG's display size.

### Size Budget
* **Simple marks** (monogram, abstract): Target under **1.5KB** uncompressed
* **Moderate marks** (pictorial, negative space): Target under **3KB** uncompressed
* **Wordmarks**: Target under **5KB** uncompressed
* If your SVG exceeds these limits, you have too many paths or too much coordinate precision. Simplify.

## 5. TYPOGRAPHY IN LOGOS (THE FONT PHANTOM BAN)

**The Font Phantom Ban:** `<text>` and `<tspan>` elements are BANNED in all final SVG output. All typography MUST be converted to `<path>` elements. Why: `<text>` elements depend on the viewer's installed fonts — the logo will render differently (or break entirely) on every machine. Your letterforms must be pure vectors, just like every other shape in the mark.

### Font Archetype Reference
Even though output is paths, you must design letterforms with a clear typographic voice. Use these archetypes as your visual reference:
* **Geometric Sans (Futura archetype):** Clean circles and straight lines. Modern tech, minimal SaaS. Best for `GEOMETRIC_PRECISION ≥ 6`.
* **Humanist Sans (Frutiger archetype):** Calligraphic stroke variation, open apertures. Approachable, warm. Healthcare, consumer apps.
* **Slab Serif (Rockwell archetype):** Thick rectangular serifs. Sturdy, established. Construction, finance, heritage.
* **High-Contrast Serif (Didot archetype):** Extreme thick/thin stroke contrast. Luxury, fashion, editorial. Best for `PLAYFULNESS ≤ 3`.
* **Monospace (Courier archetype):** Equal-width characters. Developer tools, technical products, hacker aesthetic.
* **Custom Hand-Drawn:** Irregular strokes, organic curves. Craft brands, artisan, children's brands. Best for `PLAYFULNESS ≥ 7` and `GEOMETRIC_PRECISION ≤ 3`.

### Kerning & Spacing
* **Tighten by default.** Logo wordmarks use tighter letter-spacing than body text. The letters should feel like a unified word-shape, not individual characters.
* **Optical kerning pairs:** AV, WA, To, LT, VA, TA, Ty require manual spacing adjustment. The gap must look even to the eye, not measure even with a ruler.
* **Tracking:** Uppercase wordmarks benefit from slightly wider tracking (`+2-5%`). Lowercase wordmarks benefit from tighter tracking (`-1-3%`).

### Weight & Case
* **Weight:** Use Medium (500) to Bold (700) for primary wordmarks. Thin and Light weights vanish at small sizes and are BANNED for logo use. Regular (400) is acceptable only for very short names (≤ 4 characters) at `STYLE_COMPLEXITY ≤ 2`.
* **Lowercase** reads as friendly, modern, approachable (google, spotify). Default for tech startups and consumer apps.
* **Uppercase** reads as authoritative, established, institutional (IBM, NASA). Default for `PLAYFULNESS ≤ 3`.
* **Small-caps + wide tracking** reads as luxury, fashion, editorial. Use sparingly and only when the brand context demands it.

### Letterform Construction
* Build each character from geometric primitives: circles, arcs, straight lines. Start with the skeleton (central stroke path), then apply weight.
* Ensure consistent stroke terminals across all letters. If one letter has round terminals, all letters must have round terminals.
* For Wordmark and Emblem archetypes: modify at least one letterform to create distinctiveness — a custom ligature, an unusual counter-form, a geometric replacement for one stroke.
* **Counter spaces** — the enclosed or semi-enclosed white space within letters (the hole in O, the bowl of B, the aperture of c) — are design opportunities, not just leftover space. Examine them deliberately. Shape them consistently across all letters to create unified rhythm. A distinctive counter can become the logo's hidden signature. The FedEx arrow was discovered inside a counter space between E and x.

## 6. CONSTRUCTION TECHNIQUES

### Grid Construction
* **MANDATORY:** Design on a grid aligned to the viewBox. For a `64×64` viewBox, use an **8-unit grid** (8 columns × 8 rows). All major vertices, centers, and tangent points should snap to grid intersections.
* **Keyline Shapes:** Before drawing, choose a keyline: circle, portrait rectangle, landscape rectangle, or square. The mark must fill this keyline consistently. This ensures visual weight consistency if the logo appears alongside other icons.
* **Content Zone:** Keep all mark elements within the central 80% of the viewBox as a general guide (for `64×64`, roughly `x:6 y:6` to `x:58 y:58`). For formal brand guidelines, define clear space as a **ratio of a mark element** — e.g., "clear space equals the x-height of the wordmark" or "equals the radius of the primary circle" — rather than a fixed percentage. State this ratio in usage notes.
* **Grid Honesty:** Use the grid to **verify and refine**, not to constrain. Design intuitively first, then check grid alignment. If a shape looks right but doesn't snap perfectly to grid, trust the eye — optical harmony outweighs mathematical perfection.

### Stroke vs. Fill Decision
* **Fill-based marks** scale better and are more robust. Prefer fills for most archetypes.
* **Stroke-based marks** have a specific aesthetic (wireframe, minimal, technical). If using strokes:
  - Maintain **uniform `stroke-width`** across ALL elements. Mixed stroke widths create visual noise.
  - Minimum `stroke-width`: **4% of viewBox dimension** (e.g., `stroke-width="2.5"` for `64×64`). Below this, strokes vanish at small sizes.
  - Always set `stroke-linecap` and `stroke-linejoin` explicitly: `"round"` for friendly/modern, `"butt"` / `"miter"` for technical/corporate.
  - Consider `vector-effect="non-scaling-stroke"` if the logo will be displayed at wildly different sizes.

### Symmetry Operations
* When a mark has rotational or reflective symmetry, define ONE unit and replicate it:
  - **Rotational:** Define the unit in `<defs>`, then use `<use transform="rotate(angle cx cy)">` to replicate. For 3-fold symmetry: 0°, 120°, 240°. For 4-fold: 0°, 90°, 180°, 270°.
  - **Reflective:** Use `transform="scale(-1 1) translate(-W 0)"` for horizontal mirroring.
* This keeps the SVG clean, DRY, and the symmetry mathematically perfect. NEVER manually draw near-identical shapes when a transform achieves the same result.

### Counter-Forms & Negative Space
* Interior negative spaces (counter-forms) must be **≥ 15% of the mark's total bounding area** to remain visible at small sizes. A counter-form that's 5% of the mark will collapse into nothing at 16px.
* Use `fill-rule="evenodd"` on compound paths to create punch-through negative spaces without needing separate white shapes on top.

### Boolean Operations Thinking
* Mentally construct complex shapes by combining simple primitives: **union** (merge shapes), **subtract** (cut one from another), **intersect** (keep only overlap).
* Implement subtractions and intersections as compound paths with `fill-rule="evenodd"`, not as layered shapes with white fills on top (the white-fill hack breaks on non-white backgrounds).

### Proportional Relationships
* **φ-Scaling:** When a mark contains multiple circles or shapes at different sizes, relate them through the golden ratio (1:1.618). If the primary circle has radius R, the secondary should be R × 0.618. This creates subconsciously harmonious proportions — National Geographic's yellow rectangle IS a golden rectangle; Mastercard's overlap zone sits at the golden section.
* **Fibonacci Spacing:** For gaps between elements, use Fibonacci-sequence units relative to your grid (e.g., 2, 3, 5, 8 units on an 8-unit grid). This produces natural visual rhythm.
* **Proportions as Verification:** Use φ-ratios and Fibonacci to **verify and refine** your design, not as a rigid starting constraint. Many famous "golden ratio" logo grids (including Apple's) were reverse-engineered after the design was complete. The math validates what the eye already found pleasing.

## 7. DESIGN ENGINEERING RULES

### Shape Budget
* **Hard Limit:** Maximum **7** distinct shapes (paths, circles, rects, polygons combined) per logo. Count them. If you exceed 7, remove shapes until you're under.
* **STYLE_COMPLEXITY Scaling:** For `STYLE_COMPLEXITY` 1-3, target 1-3 shapes. For 4-7, target 3-5 shapes. For 8-10, you may use up to 7.
* **Each shape must be essential.** If you can remove a shape and the logo still communicates the concept, remove it.

### Color Budget
* **Hard Limit:** Maximum **3** colors total (this includes black, white, and any brand colors).
* **Monochrome Default:** For `PLAYFULNESS` 1-4, prefer 1-2 colors (black + one accent, or pure monochrome).
* **No Gradients:** Flat color only, unless `STYLE_COMPLEXITY ≥ 7`. If gradients are used, they must be simple linear gradients with exactly 2 stops defined in `<defs>`.
* **THE RAINBOW BAN:** Logos with more than 3 colors look like clip art. If the brand genuinely needs multiple colors (rare), use them at reduced saturation.

### Optical Corrections
* **Circle Overshoot:** Circles and rounded shapes must visually overshoot the bounding box by ~2-3% to appear optically aligned with flat-edged elements.
* **Pointed Overshoot:** Triangles and pointed shapes overshoot by ~3-5%.
* **Horizontal Centering:** When centering a triangle or asymmetric shape, shift it slightly toward its visual mass center, not its geometric center.
* **Horizontal vs. Vertical Strokes:** Horizontal strokes appear thicker than vertical strokes at the same width. Compensate by making horizontal strokes ~5% thinner.

### Scalability & Context Verification
* **16×16:** The overall silhouette must be recognizable. No internal detail expected.
* **32×32:** Primary form and any negative space trick should read clearly.
* **64×64:** Full detail visible. This is your design canvas.
* **512×512:** Must not reveal jagged compromises or misaligned geometry.
* **Background test:** Must remain clear on white, black, and mid-gray (#808080) backgrounds without modification to the mark itself.
* **Squint test:** Squint until the mark blurs into abstract shapes — the mass distribution should still be distinctive and different from common marks. If it looks like a generic blob, the proportions need more tension.

## 8. COLOR THEORY FOR LOGOS

### Monochrome First
* **MANDATORY:** Design the logo in **pure monochrome** (single dark color on light, or light on dark) BEFORE applying brand colors. If the logo doesn't work in monochrome, the color is a crutch and the form is weak.

### Contrast Requirements
* Minimum **4.5:1** contrast ratio between the mark and its background for the primary variant.
* For reversed (light on dark) variants, maintain the same contrast threshold.
* **NO** reliance on color alone to create shape differentiation — shapes must be distinguishable by form, not just by color.

### Palette Rules
* **1 brand color + black/white** is the ideal. 2 brand colors maximum.
* **Saturation Control:** Brand colors should sit between 50-80% saturation. Below 50% looks washed out; above 80% looks cheap.
* **Hex Format:** Use **6-digit hex** for all brand colors (`#1a1a2e`, `#0d6efd`). Short hex (`#F00`) is acceptable only for pure neutrals (`#000`, `#FFF`, `#333`). 6-digit hex is the standard for brand documentation and cross-renderer consistency.
* **No pure black (`#000`)** in colored versions. Use a very dark shade of the brand color or a warm/cool near-black (`#1a1a2e`, `#0d1117`, `#1c1917`).
* **No pure white (`#FFF`)** as a shape fill in colored versions. Use the background to provide white space.
* **Simultaneous Contrast:** When two brand colors touch or overlap (common in Abstract Mark and Negative Space archetypes), each color shifts in perceived hue, value, and saturation based on its neighbor. The Mastercard orange appears lighter against the red circle and darker against the yellow — creating perceived dimensionality from three flat colors. Design overlap/junction zones deliberately as a third visual element, not an accidental blend.

### Color Psychology
When the user does not specify colors, select based on industry and brand context:
* **Blue:** Trust, stability, technology, corporate. Default for fintech, enterprise SaaS, healthcare.
* **Red:** Energy, urgency, passion. Default for food, entertainment, sports.
* **Green:** Nature, growth, health. Default for environmental, agriculture, wellness.
* **Orange/Yellow:** Optimism, creativity, warmth. Default for education, creative tools, food delivery.
* **Purple:** Luxury, creativity, wisdom. Use carefully — see THE AI PURPLE BAN below.
* **Black:** Premium, authority, sophistication. Default for luxury, fashion, automotive.
* **Pink (desaturated):** Modern, playful, inclusive. Acceptable for consumer apps at `PLAYFULNESS ≥ 5`.
* **Cultural awareness:** These associations are Western-centric. For global brands, research target markets. White signals mourning in East Asia; purple signals mourning in Latin America; red signals luck/prosperity in China. A color that communicates "trust" in New York may communicate "death" in Beijing.

### THE AI PURPLE BAN
The purple-to-blue gradient is the **single strongest signal** of AI-generated design. It is the visual equivalent of "lorem ipsum" — it screams "no human made this." Purple-blue gradient backgrounds, purple accent glows, and the generic "AI/tech purple" palette (`#7C3AED` → `#3B82F6`) are **strictly BANNED**. If the brand genuinely operates in a purple color space (luxury, creative, wellness), use a single, flat, desaturated purple — never a purple-to-blue gradient.

### PLAYFULNESS Color Scaling
* **1-3 (Corporate):** Monochrome or single accent. Navy, charcoal, deep green. Conservative.
* **4-6 (Balanced):** One vibrant brand color + neutrals. Confident but restrained.
* **7-10 (Expressive):** Up to 3 colors permitted. Higher saturation acceptable. May include complementary or split-complementary combinations.

## 9. THE GENERIC MARK DIRECTIVE (Banned Patterns)
If your generated SVG includes ANY of the following, the logo instantly fails. These are the hallmarks of AI-generated clip art, not professional brand marks:

### Banned Shapes & Concepts
* **NO** generic globe/earth shapes (the "international" cliché)
* **NO** generic shield or crest shapes (the "security/trust" cliché)
* **NO** swoosh or Nike-derivative curves (the "dynamic movement" cliché)
* **NO** generic lightbulb shapes (the "ideas/innovation" cliché)
* **NO** interlocking puzzle pieces (the "collaboration" cliché)
* **NO** generic leaf/tree/sprout (the "eco/growth" cliché — unless the brand IS environmental)
* **NO** generic rocket ships (the "startup/launch" cliché)
* **NO** generic chat bubbles (the "communication" cliché)
* **NO** generic mountain peaks (the "achievement" cliché)
* **NO** circuit board traces or binary digits (the "tech" cliché)
* **NO** code brackets `</>` (the "developer" cliché)
* **NO** generic infinity symbols (the "limitless" cliché)
* **NO** gear/cog shapes (the "engineering/settings" cliché)
* **NO** laurel wreaths (unless the brand is specifically classical/academic and user requests it)
* **NO** orbital rings or arcs circling a shape (the "global/dynamic" cliché)

### Banned Visual Treatments
* **NO** drop shadows or outer glows of any kind
* **NO** complex gradient meshes or multi-stop gradients
* **NO** purple-to-blue gradients (see THE AI PURPLE BAN, Section 8)
* **NO** decorative borders, ornamental frames, or badge outlines with serifs
* **NO** 3D perspective or isometric rendering
* **NO** clip-art levels of detail (more than 7 shapes means you're illustrating, not designing a logo)
* **NO** stock-icon aesthetics (Flaticon, Noun Project, Material Icons lookalikes)
* **NO** starburst or sunburst patterns
* **NO** concentric rings that serve no conceptual purpose

### Conceptual Anti-Patterns
* **NO** literal depictions of what the company does (a delivery company does not need a truck, a music app does not need a musical note — see Rule 4, Section 2)
* **NO** "dual-meaning" combination marks that force two objects into one shape (house + heart, mountain + book, pen + lightbulb). These are overused and rarely work. Exception: genuinely clever dual-meaning concepts may be permitted at `STYLE_COMPLEXITY ≥ 6` IF they pass the silhouette test.
* **NO** trendy design fads that date quickly: impossible geometry overlapping shapes, generative AI swirl patterns, "metaverse" hexagonal grids, NFT-style pixel art marks.
* **NO** assembling multiple unrelated symbols into one mark (a circle + leaf + arrow + wave = visual noise, not a logo).

### Banned SVG Practices
* **NO** `<text>` elements (all type must be `<path>` — see THE FONT PHANTOM BAN, Section 5)
* **NO** embedded images or base64 data
* **NO** `<filter>` elements
* **NO** `stroke-dasharray` or animation elements
* **NO** paths with more than 2 decimal places of coordinate precision
* **NO** redundant transforms (flatten all transforms into path coordinates unless using symmetry operations from Section 6)
* **NO** empty groups, invisible elements, or `display="none"` leftovers
* **NO** unused `<defs>` blocks or unreferenced definitions
* **NO** editor metadata: `data-name`, `xml:space`, Illustrator/Inkscape comments, namespaced attributes

## 10. VERSATILITY REQUIREMENTS

### Mandatory Variants
Every logo generation MUST include these variants:

1. **Full Color** — The primary brand version
2. **Monochrome (Dark)** — Single dark color on transparent background, using `fill="currentColor"`
3. **Monochrome (Light)** — Single light color for use on dark backgrounds, using `fill="currentColor"` (explain this works by setting parent `color` to white)

### Favicon Readiness
* If the primary mark has more than **4 shapes**, provide a **simplified favicon variant** that reduces to ≤ 3 shapes while maintaining recognition.
* Favicon variant MUST use `viewBox="0 0 32 32"` or `viewBox="0 0 16 16"`.

### App Icon Readiness
* If the logo may be used as a mobile app icon, the mark must work inside a **rounded-corner square** container (the shape iOS and Android enforce). Keep all critical mark elements within the **inner 70%** of the bounding box — platform corner radii clip the outer edges. Test by mentally inscribing the mark inside a squircle.
* For Combination Mark archetypes: only the icon/mark portion is used as the app icon, never the wordmark.

### Independence
* The SVG must render correctly with **zero external dependencies** — no fonts, no external images, no linked stylesheets.
* Test criterion: dropping the SVG into a blank HTML page should produce the intended result with no missing elements.

### Format Guidance
* Provide usage notes: recommended minimum display size, recommended clear space, and which variant to use on light vs. dark backgrounds.

## 11. EXECUTION PROTOCOL

Follow this sequence for every logo generation. Do NOT skip steps.

1. **[BRIEF INTAKE]** Parse the user's request. Identify: brand name, industry/context, values or adjectives, any specific requests. If the user is vague, infer reasonable defaults from the brand name and context — do not ask excessive clarifying questions.

2. **[ARCHETYPE SELECTION]** Consciously choose one archetype from Section 3. State your choice and the reasoning in one sentence. Example: *"Archetype: Geometric Monogram — the short brand name and tech context favor a letter-based mark."*

3. **[CONCEPT DESCRIPTION]** Before writing any SVG, describe the concept in 1-2 sentences. What is the visual idea? What makes it specific to THIS brand? Example: *"The letter 'N' constructed from two overlapping parallelograms, creating a sense of forward momentum through negative space."*

4. **[MONOCHROME DRAFT]** Write the SVG in pure monochrome first. Single fill color on transparent. This is your structural foundation.

5. **[SHAPE AUDIT]** Count every distinct shape element. If count > 7, reduce. If count > STYLE_COMPLEXITY + 2, reduce. State the count.

6. **[COLOR APPLICATION]** Apply brand colors to the monochrome draft. Respect the color budget (Section 7) and color theory (Section 8). If no colors were specified, choose a palette that fits the industry using the Color Psychology guide.

7. **[SCALE & CONTEXT VERIFICATION]** Mentally verify at 16px, 32px, 64px, and 512px. Also test against: white background, black background, mid-gray background. Apply the squint test (blur mentally — does the mass distribution remain distinctive?). State any concerns. If 16px readability is poor, note that a simplified favicon variant is needed.

8. **[CODE CLEANUP]** Final pass:
   * Round all coordinates to ≤ 2 decimal places
   * Remove redundant attributes (`fill-rule="nonzero"` if default)
   * Flatten transforms into path coordinates
   * Verify `viewBox` is set, no hardcoded dimensions
   * Add `<title>`, `<desc>`, `role="img"`, `aria-labelledby`
   * Check file size against budget

9. **[VARIANT OUTPUT]** Output all three required variants (full color, monochrome dark, monochrome light) plus favicon/app icon variant if needed. Include:
   * Brief usage notes (minimum display size, which variant for which background)
   * **Design rationale** (3-4 sentences): Why this archetype was chosen, what the visual concept communicates about the brand, why this color palette, and one notable geometric or proportional relationship in the mark.

## 12. PRE-FLIGHT CHECKLIST
Evaluate your SVG against this matrix before outputting. Every box must be checked.

### Process
- [ ] Archetype was consciously selected and stated
- [ ] Concept was described in one sentence before SVG was written
- [ ] Monochrome version was designed first, color applied second
- [ ] Design rationale included (archetype reason, concept, color rationale, geometric relationship)

### Structure & Code
- [ ] `viewBox` is set; no hardcoded `width`/`height` in pixels
- [ ] `preserveAspectRatio` is set or intentionally omitted
- [ ] `xmlns` attribute present on root `<svg>`
- [ ] `<title id="logo-title">` and `<desc id="logo-desc">` present with `role="img"` and `aria-labelledby` on root
- [ ] Path coordinates use ≤ 2 decimal places
- [ ] SVG file size within budget (1.5KB / 3KB / 5KB depending on type)
- [ ] No `<image>`, `<filter>`, `<text>`, `<style>`, `<script>`, or base64 content
- [ ] No external dependencies (fonts, URLs, linked resources)
- [ ] No unused `<defs>` blocks or unreferenced definitions
- [ ] No editor metadata (`data-name`, `xml:space`, Illustrator/Inkscape artifacts)
- [ ] `fill-rule` explicitly set on compound paths and negative-space marks

### Design Quality
- [ ] ≤ 7 shapes total
- [ ] ≤ 3 colors total (including black/near-black)
- [ ] No AI purple/blue gradient aesthetic anywhere in the palette
- [ ] Works on white, black, and mid-gray backgrounds
- [ ] Recognizable as a unified form at 16×16 pixels
- [ ] Passes the silhouette test (distinctive as solid black fill)
- [ ] Passes the blur test (distinctive mass distribution when defocused)
- [ ] Mark has at least one element of distinctiveness/tension (not just clean and generic)
- [ ] No banned shapes, concepts, or visual treatments from Section 9
- [ ] No literal depictions of what the company does
- [ ] The logo looks like a human designed it, not like AI assembled stock icons

### Deliverables
- [ ] All three mandatory variants provided (full color, mono dark, mono light)
- [ ] Favicon variant provided if primary mark has > 4 shapes
- [ ] App icon readiness verified if mark may be used in mobile context
- [ ] Brief usage notes included (minimum display size, variant guidance)
