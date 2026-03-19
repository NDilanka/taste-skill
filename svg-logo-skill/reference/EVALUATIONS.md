# Evaluation Scenarios

Test the skill against these 8 scenarios. Each covers a different archetype, industry, and difficulty level. After generating, run `scripts/validate-svg.sh` on the output, then check the quality signals manually.

---

## Scenario 1: Abstract Mark — Tech SaaS
**Prompt:** "Create a logo for Nexus, a cloud infrastructure platform for developers."
**Expected archetype:** Abstract Mark or Geometric Monogram
**Quality signals:**
- No literal cloud shape (banned pattern)
- No code brackets `</>` (banned pattern)
- Color differentiation from blue (competitive landscape is blue-heavy)
- ≤ 5 shapes, works at 16px
**Common failures:** Generic cloud icon, circuit board traces, purple-blue gradient

## Scenario 2: Wordmark — Consumer Brand
**Prompt:** "Design a logo for Oat, a plant-based milk company. The brand should feel warm, natural, and approachable."
**Expected archetype:** Wordmark (3-letter name, consumer brand)
**Quality signals:**
- All text as `<path>`, no `<text>` elements
- Humanist or rounded sans-serif voice (warm adjectives)
- At least one distinctive letterform modification
- Warm color palette, not cool/corporate
**Common failures:** Generic leaf/sprout icon, `<text>` element instead of paths, all-green cliché

## Scenario 3: Geometric Monogram — Developer Tool
**Prompt:** "Logo for KV, a key-value database for real-time applications."
**Expected archetype:** Geometric Monogram (2-letter name, dev tool)
**Quality signals:**
- K and V constructed from geometric primitives
- Letters integrated into geometry (not just placed inside a shape)
- Monospace or geometric sans voice
- Works as a 16px favicon
**Common failures:** Garbled letterforms, code brackets, generic database cylinder

## Scenario 4: Pictorial Reduction — Animal Brand
**Prompt:** "Create a logo for Finch, a personal finance app. It should feel trustworthy but not corporate."
**Expected archetype:** Pictorial Reduction (brand name IS a bird)
**Quality signals:**
- Bird reduced to ≤ 5 shapes, recognizable from silhouette
- NOT a literal detailed bird illustration
- Warmth balanced with trust (rounded forms + enclosed shapes)
- Differentiated from fintech blue
**Common failures:** Over-detailed bird (clip-art), generic shield, too many shapes

## Scenario 5: Combination Mark — New Brand
**Prompt:** "Design a logo for Bloom Health, a telehealth platform for mental wellness. We want it to feel calming and modern."
**Expected archetype:** Combination Mark (unfamiliar brand, needs name recognition)
**Quality signals:**
- Icon and wordmark work independently
- Separate `<g id="mark">` and `<g id="wordmark">` groups
- No literal medical symbols (cross, caduceus, heart — all banned)
- Calming palette (teal, muted green, warm neutrals — not clinical blue)
- Mark-to-wordmark ratio follows 1:1 to 1.618:1 rule
**Common failures:** Generic leaf/flower, literal heart shape, purple-blue gradient

## Scenario 6: Negative Space — Clever Mark
**Prompt:** "Create a logo for Arrow Logistics. We want something clever and memorable."
**Expected archetype:** Negative Space Mark (user asked for "clever")
**Quality signals:**
- An arrow or directional element formed by negative space (NOT drawn as a positive shape)
- The positive shapes serve dual purpose (foreground form + background meaning)
- Works when colors are inverted
- Primary reading dominates at small sizes
**Common failures:** Drawing the arrow explicitly (defeats the purpose), misaligned vertices destroying the illusion, too-subtle negative space

## Scenario 7: Emblem — Heritage Brand
**Prompt:** "Design a logo for Ironwood Brewing Co., established 2008. We want a badge-style mark that feels authentic and handcrafted."
**Expected archetype:** Emblem (user explicitly requests badge style)
**Quality signals:**
- Container shape (circle, rounded rectangle) with interior elements
- ≤ 7 shapes total
- Simplified interior (no ornamental flourishes)
- Icon-only variant provided for favicon (text inside emblem vanishes at small sizes)
- No generic shield (banned)
**Common failures:** Too much interior detail, curved text failing, no favicon variant, generic wheat/hops illustration

## Scenario 8: Revision Round — Feedback Translation
**Prompt (initial):** "Create a logo for Vertex, an AI research lab."
**Follow-up feedback:** "This feels too corporate. Can you make it more approachable but keep it smart?"
**Quality signals for revision:**
- Shapes soften (more rounded corners, organic curves)
- Colors warm up (shift from navy/charcoal toward warmer tones)
- Typography shifts toward lowercase or humanist sans
- The core concept is preserved (not a complete pivot)
- Constraint accumulation: any previously approved elements stay locked
**Common failures:** Complete concept pivot instead of parameter refinement, making it too playful (overcorrecting), losing the "smart" feel

---

## Automated Validation Checklist
After each scenario, run `scripts/validate-svg.sh <output.svg>` to verify:
- [ ] No banned SVG elements
- [ ] Accessibility attributes present
- [ ] `viewBox` set, no hardcoded dimensions
- [ ] Integer-first coordinates
- [ ] All paths closed with `Z`
- [ ] File size within budget
- [ ] Shape count within budget
