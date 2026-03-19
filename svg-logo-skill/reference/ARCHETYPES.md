# Logo Archetypes — Full Reference

Before writing any SVG, consciously select one archetype and state your choice.

## A. Geometric Monogram
* **What:** Single or double letterform set within or constructed from geometric shapes.
* **When:** SaaS products, tech startups, professional services, developer tools.
* **Shape Budget:** ≤ 4 shapes. The letterform IS the mark.
* **Approach:** Integrate the letter into the geometry — a letter cut from a circle, a letter built from grid-aligned strokes, a letter that IS a shape. Use `fill-rule="evenodd"` compound paths to cut letterforms from containers.
* **Small Size:** Letterform must remain legible at 16px. Avoid thin strokes below `stroke-width="2"` at 64×64 scale.
* **Exemplars:** IBM (striped block letters), Chanel (interlocking Cs), HP (letters touching circle boundary).

## B. Abstract Mark *(AI's strongest archetype)*
* **What:** Non-representational geometric shape that conveys a concept through form, not depiction.
* **When:** Brands wanting flexibility, companies that will outgrow a literal symbol, global brands needing cross-cultural recognition.
* **Shape Budget:** ≤ 5 shapes. Prefer 2-3.
* **Approach:** Use geometric relationships (overlap, rotation, nesting, intersection) to create visual tension and meaning. For overlapping shapes (Mastercard style), calculate intersection geometry explicitly — don't rely on blend modes. See `PATTERNS-AND-EXPORT.md` for the Mastercard-style intersection pattern.
* **Small Size:** Must read as a single unified form, not scattered parts.
* **Exemplars:** Nike swoosh (single curve), Chase octagon (4 rotated wedges), Mastercard (overlapping circles with explicit intersection path), Airbnb Bélo (multiple readings in one form).

## C. Wordmark *(AI's hardest non-emblem archetype)*
* **What:** The brand name set in custom-lettered typography with a distinctive character.
* **When:** Brands with short, unique names (≤ 8 characters). Names that are themselves distinctive.
* **Shape Budget:** One path per letterform. Total paths = character count. **Wordmark letter paths are exempt from the 7-shape mark budget** — the budget applies to icon/mark portions only.
* **Approach:** ALL text MUST be converted to `<path>` elements — never use `<text>`. Modify at least one letterform to create distinctiveness. Build from rectangular stems + arc/circle bowls (see `TYPOGRAPHY.md`).
* **Small Size:** May need a separate single-letter monogram variant for favicon use.
* **Exemplars:** Google (custom geometric sans with tilted 'e'), FedEx (hidden arrow in kerning), Coca-Cola (Spencerian script unchanged for 140 years).
* **Reliability Note:** Keep names to ≤ 5 characters for reliable AI output. Favor letters with straight strokes (H, I, L, E, T, F). See `TYPOGRAPHY.md` for letter difficulty guide.

## D. Pictorial Reduction
* **What:** A real-world object reduced to its absolute minimal geometric essence.
* **When:** Brands with a strong conceptual anchor to a physical object, animal, or natural form.
* **Shape Budget:** ≤ 5 shapes. The object must be recognizable from silhouette alone.
* **Approach:** Start from the real object. Remove detail until only the essential silhouette and one defining characteristic remain. Build from basic primitives (`<circle>`, `<rect>`, `<path>`). Use circle-based construction (the Twitter bird was built entirely from overlapping circles of two radii — see `CONSTRUCTION.md`).
* **Small Size:** Silhouette must be instantly recognizable. No internal detail that vanishes.
* **Exemplars:** Apple (silhouette + bite), Twitter bird (circle-constructed), WWF panda (Gestalt closure with incomplete outlines), Target (two concentric circles — ultimate reduction).

## E. Negative Space Mark *(AI's second-hardest archetype)*
* **What:** Uses the counter-form or background space to create a secondary image or meaning.
* **When:** Brands that want cleverness, memorability, or a "hidden message" quality.
* **Shape Budget:** ≤ 4 shapes. The magic is in what's NOT drawn.
* **Approach:** Design the positive AND negative shapes simultaneously. Both readings must be intentional. Test by inverting colors — both versions should work. Use `fill-rule="evenodd"` on compound paths to punch out counter-forms. **Design the negative shape first, then build positive shapes around it.** See `PATTERNS-AND-EXPORT.md` for negative space pattern.
* **Small Size:** The primary reading must dominate at small sizes. The secondary reading is a bonus at larger scales.
* **Exemplars:** FedEx (arrow between E and x from pure kerning), NBC peacock (body formed by absence between feathers).
* **AI Challenge:** LLMs fundamentally struggle to design absence. The hidden image depends on mathematically exact spatial relationships; even 1-2 unit drift destroys it.

## F. Emblem *(AI's hardest archetype — use with caution)*
* **What:** Text or letterforms contained inside a geometric shape — a badge, seal, or crest. NOT a generic shield (shields are banned).
* **When:** Heritage brands, institutions, sports teams, government entities, food & beverage with "established since" positioning.
* **Shape Budget:** ≤ 7 shapes total. Outer container + interior elements.
* **Approach:** Start with the container shape (circle, rounded rectangle). Place the brand name and/or monogram inside. Interior elements must be radically simplified. Convert all curved text to outlined paths.
* **Small Size:** Text inside emblems vanishes at small sizes. MUST provide an icon-only variant for favicon use.
* **Exemplars:** Starbucks (progressive simplification over decades), BMW roundel (quartered circle).
* **AI Challenge:** Combines every LLM weakness: curved text, illustration, containment, and small-size legibility. Use monogram-inside-circle rather than full text. If curved text is needed, keep to ≤ 8 characters.

## G. Combination Mark
* **What:** An icon/symbol placed alongside a wordmark. The most common logo type in the real world.
* **When:** New brands needing both visual identity and name recognition. Brands that need flexibility to use mark alone or with text.
* **Shape Budget:** Mark ≤ 4 shapes + wordmark paths. The mark and wordmark are separate `<g>` groups.
* **Approach:** Design the mark and wordmark independently — both must work standalone.
* **Small Size:** Use the mark alone as the favicon. The wordmark is used only when display size permits full legibility.
* **Lockup Proportional Rules:**
  - **Mark-to-wordmark ratio:** Mark height should be **1:1 to 1.618:1** relative to wordmark cap height. The mark should never be shorter than the cap height.
  - **Horizontal lockup (default):** Gap between mark and wordmark = **1/3 of cap height**, or the width of a recognizable brand element (e.g., the lowercase "o").
  - **Vertical/stacked lockup:** The mark must be **enlarged 130-200%** compared to the horizontal variant (long wordmarks: 130%, short wordmarks: 200%). Target a roughly **square** overall aspect ratio.
  - **Clear space:** Define as a ratio of a brand element (e.g., "clear space = cap height of the wordmark"), not a fixed pixel value.
* **SVG Structure:** Use separate `<g id="mark">` and `<g id="wordmark">` groups. Position the wordmark via `transform="translate(X, Y)"`.

## Common AI Failures Across All Archetypes
* **Over-decoration:** LLMs add shapes "for visual interest" that dilute the concept. After generating, apply the Smallest Element Test — if removing the smallest element doesn't break recognition, remove it.
* **Coordinate drift:** Symmetric shapes get 1-5 unit drift between hand-drawn halves. Always use `<defs>` + `<use>` for symmetry.
* **Letterform garbling:** Typography is LLMs' #1 failure mode. Complex interlocking letter geometry fails. Keep to 1-2 letters max for monograms.
* **Clip-art output:** If you have more than 5-7 paths, you're illustrating, not reducing. A logo is not an illustration.
