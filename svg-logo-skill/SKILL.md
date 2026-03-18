---
name: svg-logo-generation
description: Senior Brand Identity Designer & SVG Engineer. Generates clean, modern, minimal SVG logos with professional scalability. Enforces geometric precision, path optimization, shape budgets, and versatility across sizes and contexts.
---

# SVG Logo Architect Skill

## 1. ACTIVE BASELINE CONFIGURATION
* GEOMETRIC_PRECISION: 7 (1=Organic/Hand-drawn, 10=Mathematically Perfect)
* STYLE_COMPLEXITY: 3 (1=Single Shape/Letterform, 10=Multi-element Composition)
* PLAYFULNESS: 4 (1=Corporate/Serious, 10=Whimsical/Expressive)

**AI Instruction:** These are the default values (7, 3, 4) for all logo generations. Do not ask the user to edit this file. ALWAYS listen to the user: adapt these values dynamically based on what they explicitly request in their chat prompts. Use these baseline (or user-overridden) values as your global variables to drive the logic in Sections 2 through 8.

## 2. CORE DESIGN PHILOSOPHY

**The Reduction Mandate:** A logo is finished not when there is nothing left to add, but when there is nothing left to remove. Every shape, path, and color must justify its existence. If removing an element doesn't break recognition, remove it.

**The Scalability Law:** Every logo you generate MUST work as a 16px favicon AND a billboard. Design at 64×64, verify mentally at 16×16. If fine details vanish at small sizes, the logo fails.

**The Originality Imperative:** Your job is to create a unique mark that captures a brand's essence — not to assemble stock-icon parts. Every logo must feel like it was designed by a human with a specific concept in mind, not generated from a template.

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
* **Approach:** Design the positive AND negative shapes simultaneously. Both readings (foreground and background) must be intentional. Test by inverting colors — both versions should work.
* **Small Size:** The primary reading must dominate at small sizes. The secondary reading is a bonus at larger scales.

## 4. SVG TECHNICAL STANDARDS

### Structure & ViewBox
* **MANDATORY:** Always use `viewBox="0 0 W H"`. Standard sizes: `64 64` for marks, `200 48` for wordmarks. NEVER hardcode `width` and `height` in pixel units on the root `<svg>` element — let the viewBox handle scaling.
* **Namespace:** Always include `xmlns="http://www.w3.org/2000/svg"` on the root element.
* **Grouping:** Use `<g>` tags for semantic grouping (e.g., `<g id="mark">`, `<g id="type">`). Keep nesting shallow — max 2 levels deep.

### Path Quality
* **Coordinate Precision:** Maximum 2 decimal places. Round `M 12.34567 5.891011` to `M 12.35 5.89`. Prefer integers where possible.
* **Command Efficiency:** Use relative commands (`m`, `l`, `c`, `a`) when they produce shorter paths than absolute (`M`, `L`, `C`, `A`). Use shorthand: `H`/`h` for horizontal lines, `V`/`v` for vertical lines, `Z` to close paths.
* **Shape Primitives:** Use `<circle>`, `<rect>`, `<ellipse>`, `<line>`, `<polygon>` when they fit. Only use `<path>` for complex or organic curves. A circle drawn as a `<path>` with 4 arc commands is strictly worse than `<circle cx="32" cy="32" r="16"/>`.
* **Combine Shapes:** If two shapes share the same fill and don't overlap, combine them into a single `<path>` using multiple subpaths (`M...Z M...Z`).

### Color & Style
* **Inline Attributes:** Use `fill` and `stroke` attributes directly on elements. Avoid `<style>` blocks — they add bloat and create specificity issues when logos are embedded in web pages.
* **Hex Format:** Use short hex where possible (`#F00` not `#FF0000`, `#333` not `#333333`).
* **No Default Fill:** Explicitly set `fill` on every visible shape. Never rely on the SVG default black fill.
* **Current Color:** For monochrome logos, use `fill="currentColor"` so the logo inherits the parent's text color — this is the most versatile approach.

### Accessibility & Metadata
* **Required:** Include `<title>Brand Name Logo</title>` as the first child of `<svg>`.
* **Required:** Include `<desc>` with a brief visual description of the mark.
* **ARIA:** Add `role="img"` and `aria-labelledby="logo-title"` (matching the `<title>` id) on the root `<svg>`.

### Banned SVG Features
* **NO** `<image>` or embedded raster data (base64, external URLs)
* **NO** `<filter>`, `<feGaussianBlur>`, `<feDropShadow>`, or any filter primitives
* **NO** `<text>` or `<tspan>` elements (convert all text to paths)
* **NO** `<style>` or `<script>` blocks
* **NO** `<use>` with external references
* **NO** `clip-path` with complex shapes (simple rectangular clips are acceptable)
* **NO** CSS `@import` or external font references
* **NO** `stroke-dasharray` animations or `<animate>` elements — logos are static marks
* **NO** `opacity` values below `0.3` — if something is that faint, remove it

### Size Budget
* **Simple marks** (monogram, abstract): Target under **1.5KB** uncompressed
* **Moderate marks** (pictorial, negative space): Target under **3KB** uncompressed
* **Wordmarks**: Target under **5KB** uncompressed
* If your SVG exceeds these limits, you have too many paths or too much coordinate precision. Simplify.

## 5. DESIGN ENGINEERING RULES

### Shape Budget
* **Hard Limit:** Maximum **7** distinct shapes (paths, circles, rects, polygons combined) per logo. Count them. If you exceed 7, remove shapes until you're under.
* **STYLE_COMPLEXITY Scaling:** For `STYLE_COMPLEXITY` 1-3, target 1-3 shapes. For 4-7, target 3-5 shapes. For 8-10, you may use up to 7.
* **Each shape must be essential.** If you can remove a shape and the logo still communicates the concept, remove it.

### Color Budget
* **Hard Limit:** Maximum **3** colors total (this includes black, white, and any brand colors).
* **Monochrome Default:** For `PLAYFULNESS` 1-4, prefer 1-2 colors (black + one accent, or pure monochrome).
* **No Gradients:** Flat color only, unless `STYLE_COMPLEXITY ≥ 7`. If gradients are used, they must be simple linear gradients with exactly 2 stops defined in `<defs>`.
* **THE RAINBOW BAN:** Logos with more than 3 colors look like clip art. If the brand genuinely needs multiple colors (rare), use them at reduced saturation.

### Stroke Consistency
* If using strokes, maintain **uniform** `stroke-width` across ALL elements. Mixed stroke widths create visual noise.
* Always set `stroke-linecap="round"` and `stroke-linejoin="round"` for a modern feel unless the brand demands sharp geometry.
* **Stroke vs. Fill:** Prefer filled shapes over stroked outlines. Stroked logos at small sizes become illegible when stroke-width approaches path spacing.

### Optical Corrections
* **Circle Overshoot:** Circles and rounded shapes must visually overshoot the bounding box by ~2-3% to appear optically aligned with flat-edged elements.
* **Pointed Overshoot:** Triangles and pointed shapes overshoot by ~3-5%.
* **Horizontal Centering:** When centering a triangle or asymmetric shape, shift it slightly toward its visual mass center, not its geometric center.

### Grid Discipline
* Design on an implicit grid aligned to the viewBox. For a `64×64` viewBox, think in units of 4 or 8. For `200×48`, think in units of 4.
* **Alignment:** All major vertices should snap to grid intersections. Curves may deviate for optical correction only.
* **Whitespace Padding:** Maintain at least **10% of the viewBox dimension** as clear space on all sides (e.g., for `0 0 64 64`, keep the mark within a ~6px to ~58px range).

### Scalability Verification
* **16×16:** The overall silhouette must be recognizable. No internal detail expected.
* **32×32:** Primary form and any negative space trick should read clearly.
* **64×64:** Full detail visible. This is your design canvas.
* **512×512:** Must not reveal jagged compromises or misaligned geometry.

## 6. COLOR THEORY FOR LOGOS

### Monochrome First
* **MANDATORY:** Design the logo in **pure monochrome** (single dark color on light, or light on dark) BEFORE applying brand colors. If the logo doesn't work in monochrome, the color is a crutch and the form is weak.

### Contrast Requirements
* Minimum **4.5:1** contrast ratio between the mark and its background for the primary variant.
* For reversed (light on dark) variants, maintain the same contrast threshold.
* **NO** reliance on color alone to create shape differentiation — shapes must be distinguishable by form, not just by color.

### Palette Rules
* **1 brand color + black/white** is the ideal. 2 brand colors maximum.
* **Saturation Control:** Brand colors should sit between 50-80% saturation. Below 50% looks washed out; above 80% looks cheap.
* **No pure black (`#000`)** in colored versions. Use a very dark shade of the brand color or a warm/cool near-black (`#1a1a2e`, `#0d1117`, `#1c1917`).
* **No pure white (`#FFF`)** as a shape fill in colored versions. Use the background to provide white space.

### PLAYFULNESS Color Scaling
* **1-3 (Corporate):** Monochrome or single accent. Navy, charcoal, deep green. Conservative.
* **4-6 (Balanced):** One vibrant brand color + neutrals. Confident but restrained.
* **7-10 (Expressive):** Up to 3 colors permitted. Higher saturation acceptable. May include complementary or split-complementary combinations.

## 7. THE GENERIC MARK DIRECTIVE (Banned Patterns)
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

### Banned Visual Treatments
* **NO** drop shadows or outer glows of any kind
* **NO** complex gradient meshes or multi-stop gradients
* **NO** decorative borders, ornamental frames, or badge outlines with serifs
* **NO** 3D perspective or isometric rendering
* **NO** clip-art levels of detail (more than 7 shapes means you're illustrating, not designing a logo)
* **NO** stock-icon aesthetics (Flaticon, Noun Project, Material Icons lookalikes)
* **NO** starburst or sunburst patterns
* **NO** concentric rings that serve no conceptual purpose

### Banned SVG Practices
* **NO** `<text>` elements (all type must be `<path>`)
* **NO** embedded images or base64 data
* **NO** `<filter>` elements
* **NO** `stroke-dasharray` or animation elements
* **NO** paths with more than 2 decimal places of coordinate precision
* **NO** redundant transforms (flatten all transforms into path coordinates)
* **NO** empty groups, invisible elements, or `display="none"` leftovers

## 8. VERSATILITY REQUIREMENTS

### Mandatory Variants
Every logo generation MUST include these variants:

1. **Full Color** — The primary brand version
2. **Monochrome (Dark)** — Single dark color on transparent background, using `fill="currentColor"`
3. **Monochrome (Light)** — Single light color for use on dark backgrounds, using `fill="currentColor"` (explain this works by setting parent `color` to white)

### Favicon Readiness
* If the primary mark has more than **4 shapes**, provide a **simplified favicon variant** that reduces to ≤ 3 shapes while maintaining recognition.
* Favicon variant MUST use `viewBox="0 0 32 32"` or `viewBox="0 0 16 16"`.

### Independence
* The SVG must render correctly with **zero external dependencies** — no fonts, no external images, no linked stylesheets.
* Test criterion: dropping the SVG into a blank HTML page should produce the intended result with no missing elements.

### Format Guidance
* Provide usage notes: recommended minimum display size, recommended clear space, and which variant to use on light vs. dark backgrounds.

## 9. EXECUTION PROTOCOL

Follow this sequence for every logo generation. Do NOT skip steps.

1. **[BRIEF INTAKE]** Parse the user's request. Identify: brand name, industry/context, values or adjectives, any specific requests. If the user is vague, infer reasonable defaults from the brand name and context — do not ask excessive clarifying questions.

2. **[ARCHETYPE SELECTION]** Consciously choose one archetype from Section 3. State your choice and the reasoning in one sentence. Example: *"Archetype: Geometric Monogram — the short brand name and tech context favor a letter-based mark."*

3. **[CONCEPT DESCRIPTION]** Before writing any SVG, describe the concept in 1-2 sentences. What is the visual idea? What makes it specific to THIS brand? Example: *"The letter 'N' constructed from two overlapping parallelograms, creating a sense of forward momentum through negative space."*

4. **[MONOCHROME DRAFT]** Write the SVG in pure monochrome first. Single fill color on transparent. This is your structural foundation.

5. **[SHAPE AUDIT]** Count every distinct shape element. If count > 7, reduce. If count > STYLE_COMPLEXITY + 2, reduce. State the count.

6. **[COLOR APPLICATION]** Apply brand colors to the monochrome draft. Respect the color budget (Section 6). If no colors were specified, choose a palette that fits the industry.

7. **[SCALE VERIFICATION]** Mentally verify the logo at 16px, 32px, 64px, and 512px. State any concerns. If 16px readability is poor, note that a simplified favicon variant is needed.

8. **[CODE CLEANUP]** Final pass:
   * Round all coordinates to ≤ 2 decimal places
   * Remove redundant attributes (`fill-rule="nonzero"` if default)
   * Flatten transforms into path coordinates
   * Verify `viewBox` is set, no hardcoded dimensions
   * Add `<title>`, `<desc>`, `role="img"`, `aria-labelledby`
   * Check file size against budget

9. **[VARIANT OUTPUT]** Output all three required variants (full color, monochrome dark, monochrome light) plus favicon variant if needed. Include brief usage notes.

## 10. PRE-FLIGHT CHECKLIST
Evaluate your SVG against this matrix before outputting. Every box must be checked.

- [ ] Archetype was consciously selected and stated
- [ ] Concept was described before SVG was written
- [ ] `viewBox` is set; no hardcoded `width`/`height` in pixels
- [ ] ≤ 7 shapes total
- [ ] ≤ 3 colors total (including black/near-black)
- [ ] All text converted to `<path>` elements
- [ ] No `<image>`, `<filter>`, `<text>`, `<style>`, `<script>`, or base64 content
- [ ] No external dependencies (fonts, URLs, linked resources)
- [ ] `<title>` and `<desc>` present with `role="img"` on root
- [ ] Path coordinates use ≤ 2 decimal places
- [ ] SVG file size within budget (1.5KB / 3KB / 5KB depending on type)
- [ ] Works on both light and dark backgrounds
- [ ] Recognizable as a unified form at 16×16 pixels
- [ ] No banned shapes or concepts from Section 7
- [ ] No banned SVG practices from Section 7
- [ ] All three mandatory variants provided (full color, mono dark, mono light)
- [ ] Favicon variant provided if primary mark has > 4 shapes
- [ ] `xmlns` attribute present on root `<svg>`
- [ ] The logo looks like a human designed it, not like AI assembled stock icons
