---
name: svg-logo-generation
description: SVG Logo Architect & Brand Mark Engineer. Generates clean, modern, minimal SVG logos with professional scalability. Enforces geometric precision, path optimization, shape budgets, typographic rigor, and versatility across sizes and contexts. Bans AI logo clichés, clip-art aesthetics, and purple-blue gradient syndrome.
---

# Agent Skill: SVG Logo Architect & Brand Mark Engineer

## 1. BASELINE CONFIGURATION
* GEOMETRIC_PRECISION: 7 (1=Organic/Hand-drawn, 10=Mathematically Perfect)
* STYLE_COMPLEXITY: 3 (1=Single Shape/Letterform, 10=Multi-element Composition)
* PLAYFULNESS: 4 (1=Corporate/Serious, 10=Whimsical/Expressive)

Adapt these values dynamically based on the user's chat prompts. These drive the logic across all sections.

## 2. CORE DESIGN RULES

**Reduction & Shape Budget.** A logo is finished when nothing more can be removed. Target **2-3 shapes** (memorability sweet spot). Hard limit: **7 shapes** for marks. Wordmark letter paths are exempt — the budget applies to the icon/mark portion only. After generating, apply the Smallest Element Test: mentally remove the thinnest element — if the logo survives, cut it.

**Scalability.** Every logo MUST work as a 16px favicon AND a billboard. Design at 64×64, verify mentally at 16×16. Details that vanish at small sizes are decoration, not design — remove them.

**Originality.** Create a unique mark that captures a brand's essence — not stock-icon assembly. Every logo must feel human-designed with a specific concept, not generated from a template.

**No Literal Depictions.** A delivery company does not need a truck. A music app does not need a note. Abstract or metaphorical marks are almost always stronger.

**One Concept, One Read.** The logo communicates a single idea instantly. State your concept in one sentence before writing any SVG.

**The One Hook Rule.** Every iconic logo has exactly ONE distinctive element. FedEx: the arrow. Apple: the bite. Your mark needs one "hook": an unexpected proportion, controlled asymmetry, hidden negative space, surprising counter-form. **The Swap Test:** mentally place a different company's name under the mark — if it still works for anyone, it's too generic.

**Controlled Symmetry-Breaking.** Start with a symmetric base. Then break symmetry in exactly ONE deliberate place — this becomes the hook. Accidental asymmetry = mistake. Deliberate asymmetry = signature.

**Gestalt Closure.** Where appropriate, leave a strategic gap that the viewer's brain completes. Participation creates memory.

**Color Budget.** Maximum **3 colors** (including black/near-black). Monochrome default for `PLAYFULNESS` 1-4. No gradients unless `STYLE_COMPLEXITY ≥ 7`. **Monochrome first** — design in pure monochrome BEFORE applying brand colors. If it doesn't work in monochrome, the form is weak. Minimum **4.5:1** contrast ratio.

**Optical Corrections.** Circles overshoot cap line by 1.5-3%. Pointed shapes overshoot by 3-5%. Triangles align by centroid (1/3 from base), not bounding-box center. Horizontal strokes appear ~3-5% heavier than verticals — compensate. Crossbars at **40% of cap height**, not 50%.

**Design System Integration.** Logos exist within a broader design ecosystem. Wordmark typography should align with the project's font philosophy (e.g., taste-skill bans Inter — wordmarks shouldn't use Inter-derived forms). Monochrome variants naturally support editorial/minimalist aesthetics. The `<g id="">` structure enables Framer Motion integration in animated interfaces.

See `reference/CONSTRUCTION.md` for grid systems, shape psychology, symmetry operations, proportional relationships, and iconic logo construction lessons.

## 3. LOGO ARCHETYPES (Pick 1)

Before writing SVG, consciously select an archetype and state your choice.

| Archetype | When to Use | Shape Budget |
|---|---|---|
| **A. Geometric Monogram** | SaaS, tech, professional services | ≤ 4 |
| **B. Abstract Mark** *(AI's best)* | Flexible brands, global recognition | ≤ 5 (prefer 2-3) |
| **C. Wordmark** *(AI's hardest non-emblem)* | Short unique names (≤ 8 chars) | 1 path/letter |
| **D. Pictorial Reduction** | Strong conceptual anchor to real object | ≤ 5 |
| **E. Negative Space** *(very hard)* | Cleverness, hidden message quality | ≤ 4 |
| **F. Emblem** *(hardest — use with caution)* | Heritage, institutions, badges | ≤ 7 |
| **G. Combination Mark** | New/unfamiliar brands | Mark ≤ 4 + wordmark |

**Defaults:** Abstract Mark for tech/SaaS. Wordmark for consumer brands with short names. Combination Mark for new/unfamiliar brands. Geometric Monogram for dev tools. Emblem only when explicitly requested.

**AI Reliability (best → hardest):** Abstract Mark > Pictorial Reduction > Geometric Monogram > Combination Mark > Wordmark > Negative Space > Emblem.

See `reference/ARCHETYPES.md` for full archetype details, exemplars, lockup rules, and AI pitfalls.

## 4. SVG TECHNICAL ESSENTIALS

* **ViewBox:** Always `viewBox="0 0 W H"`. `64 64` for marks, `200 48` for wordmarks. No hardcoded `width`/`height`. Include `xmlns="http://www.w3.org/2000/svg"`.
* **Coordinates:** INTEGER-FIRST. Decimals max 2 places, only when necessary. Most coordinates should be multiples of 8 on a 64×64 grid.
* **Primitives over paths:** Use `<circle>`, `<rect>`, `<ellipse>`, `<polygon>` when they fit. `<path>` only for complex curves.
* **Close all paths** with `Z`. Unclosed paths leave visible gaps.
* **Fill rule:** `nonzero` (default) for simple shapes. `evenodd` for compound paths with holes.
* **Symmetry:** Use `<defs>` + `<use>` with `rotate(angle, cx, cy)` or `translate(2*axis,0) scale(-1,1)`. Never hand-draw both halves.
* **Accessibility:** `<title id="logo-title">` + `<desc id="logo-desc">` as first children. `role="img"` and `aria-labelledby` on root `<svg>`.
* **Inline styles only:** `fill`/`stroke` attributes directly on elements. No `<style>` blocks.
* **currentColor:** Use `fill="currentColor"` for monochrome logos. Only works inline in DOM, not via `<img>`.

### Banned SVG Features
NO `<image>`/base64, `<filter>`, `<text>`/`<tspan>`, `<style>`/`<script>`, external `<use>`, complex `clip-path`, `stroke-dasharray`, `<animate>`, `opacity` < 0.3, editor metadata.

### Size Budget
Simple marks < 1.5KB. Moderate marks < 3KB. Wordmarks < 5KB.

See `reference/SVG-TECHNICAL.md` for full path quality rules, cross-renderer compatibility tiers, AI generation reliability research, versatility requirements, and responsive logo system.
See `reference/PATTERNS-AND-EXPORT.md` for SVG code patterns (rotational symmetry, boolean subtraction, intersection, monogram knockout, reflective symmetry, negative space) and export/handoff guidance.

## 4A. ANIMATION-READY STRUCTURE

Logo SVGs are **static by design** — all animation happens externally via CSS or JavaScript. This keeps SVGs portable across `<img>`, `<object>`, email, and print contexts.

**Inside SVG (banned):** `<animate>`, `<animateTransform>`, `<set>`, `<style>`, `<script>`.

**Outside SVG (encouraged):** Name `<g>` groups with semantic IDs so external CSS/JS can target them:
```svg
<g id="mark-icon"><!-- Icon paths --></g>
<g id="mark-text"><!-- Wordmark paths --></g>
```
External CSS example: `#mark-icon { animation: float 2s ease-in-out infinite; }`
Framer Motion: wrap in `<motion.svg>`, target child groups as `<motion.g>`.

**GPU-safe properties only:** Animate `transform` (rotate, scale, translate) and `opacity`. Never animate `width`, `height`, `top`, `left`, or path data.

See `reference/LOGO-SYSTEMS.md` for multi-logo architecture, variant families, favicon reduction, and delivery file naming conventions.

## 5. BANNED PATTERNS

If your SVG includes ANY of these, the logo fails:

**Banned shapes:** Globe/earth, shield/crest, swoosh/Nike-derivative, lightbulb, puzzle pieces, generic leaf/tree/sprout (unless brand IS environmental), rocket ship, chat bubble, mountain peaks, circuit board/binary, code brackets `</>`, infinity symbol, gear/cog, laurel wreath, orbital rings, radial swirl/blossom (OpenAI-copycat), four-pointed sparkle/starburst, swirling hexagons, humanoid circle figures.

**Banned treatments:** Drop shadows, outer glows, complex/multi-stop gradients, purple-to-blue gradients, chrome/holographic/iridescent, neon rainbow, decorative borders/frames, 3D/isometric, clip-art detail (>7 shapes), stock-icon aesthetic, starburst/sunburst, purposeless concentric rings, dead-center bilateral symmetry with no intentional break.

**Banned concepts:** Literal depictions of what the company does, forced dual-meaning combination marks (house+heart, mountain+book), trendy fads (impossible geometry, AI swirls, metaverse hexagons, NFT pixel art), assembling multiple unrelated symbols.

## 6. EXECUTION PROTOCOL

Follow this sequence for every logo generation. Do NOT skip steps.

**1. [BRIEF INTAKE]** Extract what's given, then fill gaps:

Ask only if missing (max 4 questions before generating):
* *What does the company/product do?* — Never infer industry from name alone.
* *Name 3 adjectives that describe how the brand should feel.* — Highest-leverage creative input. See `reference/COLOR-AND-INDUSTRY.md` for the Brand Personality → Visual Form mapping table.
* *Who are 2-3 main competitors?* (optional) — Enables differentiation.
* *Anything you want to avoid?* (optional)

Always infer (never ask): archetype, color palette, typography style, shape language, precision/playfulness dials. Rich brief = skip straight to generation.

**2. [ARCHETYPE SELECTION]** Choose one from Section 3. State choice + reasoning in one sentence.

**3. [CONCEPT EXPLORATION]** Generate **2-3 conceptually distinct directions:**
* Extract 3-5 brand attributes → map to geometric vocabulary
* Choose rhetorical strategy: **metaphor** (Amazon's A-to-Z arrow), **abstraction** (Chase octagon), or **reduction** (Apple silhouette)
* Evaluate: most distinctive? passes Swap Test? Audit competitive landscape — diverge in at least one dimension.

**4. [CONCEPT COMMITMENT]** Lock in. Describe the visual idea + its ONE HOOK in 1-2 sentences.

**5. [MONOCHROME DRAFT]** Write SVG in pure monochrome first.

**6. [SHAPE AUDIT]** Count shapes. If > 7 or > STYLE_COMPLEXITY + 2, reduce. Apply Smallest Element Test.

**7. [COLOR APPLICATION]** Apply brand colors. See `reference/COLOR-AND-INDUSTRY.md` for color psychology and industry guidance. Check competitive differentiation.

**8. [SCALE VERIFICATION]** Mentally verify at 16px, 32px, 64px, 512px. Test on white, black, and mid-gray backgrounds. Squint test for distinctive mass distribution.

**9. [CODE CLEANUP]** Verify: integer coordinates, paths close with Z, no redundant attributes, viewBox set, title/desc/ARIA present, file size within budget. Run `scripts/validate-svg.sh` on the output to catch banned elements, missing accessibility, coordinate precision, and size budget violations.

**10. [VARIANT OUTPUT]** Provide:
* Full color + monochrome dark (`currentColor`) + monochrome light
* Favicon variant if mark > 4 shapes (≤ 3 shapes, viewBox 32×32 or 16×16)
* Usage notes (minimum display size, variant guidance, clear space)
* Design rationale (3-4 honest sentences: archetype choice, concept, color, one notable geometric relationship)

See `reference/TYPOGRAPHY.md` for letterform construction, kerning, font archetypes, letter difficulty guide, and weight/case guidance.

### 6A. REVISION & ITERATION PROTOCOL

When the user requests changes, translate verbal feedback into parameter shifts:

| Feedback | Shapes | Colors | Typography | Composition |
|---|---|---|---|---|
| "Too corporate" | Rounder, organic | Warmer, more saturated | Lowercase, humanist | Looser grid, asymmetry |
| "Too playful" | Geometric, angular | Cooler, desaturated | Uppercase, geometric sans | Tight grid, symmetry |
| "Feels generic" | Strengthen hook, flip cliché | Unexpected vs. competitors | Distinctive pairing | Negative space trick |
| "Too busy" | Remove smallest element | Fewer colors (1-2) | Simpler face | More whitespace |
| "Not modern" | Clean geometry, flat | Restrained, contemporary | Sans-serif, lighter | Generous whitespace |
| "More energy" | Diagonals, asymmetry | Higher contrast | Bolder weight | Tilted axis, off-center |
| "Make it pop" | Scale up focal element | Increase saturation + contrast | Bolder weight | Isolate with whitespace |

**Pivot vs. refine:** Refine when feedback targets surface parameters (color, weight, spacing). Pivot when feedback targets the fundamental idea, or after 2 rounds without convergence.

**Constraint accumulation:** Each round adds constraints, never removes approved ones. "I like the shape but not the color" = lock shape, unlock color. Present 1 refined version per round unless alternatives are requested.

## 7. PRE-FLIGHT CHECKLIST

### Process
- [ ] Archetype consciously selected and stated
- [ ] 2-3 concepts explored before committing
- [ ] Concept described in one sentence; ONE HOOK identified
- [ ] Monochrome designed first, color applied second
- [ ] Design rationale included

### Structure & Code
- [ ] `viewBox` set; no hardcoded dimensions; `xmlns` present
- [ ] `<title>`, `<desc>`, `role="img"`, `aria-labelledby` present
- [ ] Integer coordinates (decimals only when necessary, max 2 places)
- [ ] All filled paths close with `Z`
- [ ] File size within budget
- [ ] No banned SVG features (`<image>`, `<filter>`, `<text>`, `<style>`, `<script>`, base64)
- [ ] No unused `<defs>` or editor metadata
- [ ] `fill-rule` explicit on compound paths

### Design Quality
- [ ] ≤ 7 shapes (mark portion); ≤ 3 colors
- [ ] No AI purple-blue gradient aesthetic
- [ ] Works on white, black, and mid-gray backgrounds
- [ ] Recognizable at 16×16; passes silhouette test and blur test
- [ ] ONE distinctive hook; Swap Test passes
- [ ] Symmetry broken in exactly one deliberate place (if symmetric)
- [ ] No banned shapes, concepts, or treatments from Section 5
- [ ] Looks human-designed, not AI-assembled

### Deliverables
- [ ] Three variants: full color + mono dark + mono light
- [ ] Favicon variant if mark > 4 shapes
- [ ] Usage notes included

### Self-Evaluation (Score 1-10)
Any score < 5 requires revision. Average < 6.5 means reconsider the concept.

1. **Simplicity** — Can anything be removed? (10 = irreducible)
2. **Scalability** — Works at 16×16? No vanishing details? (10 = powerful at any size)
3. **Distinctiveness** — Stands out among 20 competitor logos? (10 = immediately ownable)
4. **Memorability** — What single feature is remembered after 3 seconds? (10 = drawable from memory)
5. **Craft** — Paths clean, geometry consistent, spacing balanced? (10 = Fortune 500 ready)
