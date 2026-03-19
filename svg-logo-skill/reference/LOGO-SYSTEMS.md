# Multi-Logo Systems — Full Reference

## Logo Family Architecture

A complete brand identity requires multiple logo variants, not just one mark. Design the **primary mark first**, then derive all variants from it.

| Variant | Purpose | Derivation |
|---|---|---|
| **Primary lockup** | Default brand presentation | Icon + wordmark (horizontal) |
| **Stacked lockup** | Square/vertical contexts | Icon above wordmark, mark enlarged 130-200% |
| **Icon only** | App icons, favicons, avatars | The mark/symbol extracted from the lockup |
| **Simplified icon** | Favicon (16-32px), tiny contexts | Icon reduced to ≤ 3 shapes, strokes thickened |
| **Monogram** | Single-letter shorthand | First letter or initials, geometric construction |
| **Wordmark only** | Contexts where the brand is already visually established | Typography alone, no icon |

## Variant Consistency Rules

All variants MUST:
- Share the **same ONE HOOK** (the distinctive element identified in concept commitment)
- Use the **same color palette** (brand colors don't change between variants)
- Share **geometric DNA** (if the primary uses circles, the favicon doesn't switch to squares)
- Be recognizable as the **same brand** when placed side-by-side

## Favicon Reduction Process

When the primary mark has > 4 shapes, create a simplified favicon:

1. **Identify the hook** — which element carries the brand's distinctiveness?
2. **Remove supporting shapes** — keep only the hook + its essential context (1-2 shapes max)
3. **Thicken strokes** — any remaining strokes should be ≥ 6% of viewBox (e.g., 4px at 64×64)
4. **Simplify curves** — replace complex Bezier paths with arcs or straight segments
5. **Test at 16×16** — the favicon must be recognizable as a unified form, not scattered dots
6. **Use a smaller viewBox** — `viewBox="0 0 32 32"` or `"0 0 16 16"` for tighter pixel control

## Scale-Based Lockup Switching

The switching trigger is **wordmark legibility** — when text becomes unreadable, drop it.

| Display Size | What to Show | SVG Source |
|---|---|---|
| 240px+ wide | Primary lockup (icon + wordmark + optional tagline) | `logo-primary.svg` |
| 144-240px | Horizontal lockup (icon + wordmark, no tagline) | `logo-primary.svg` at reduced size |
| 80-144px | Stacked lockup or icon + abbreviated wordmark | `logo-stacked.svg` |
| 40-80px | Icon only | `logo-icon.svg` |
| 16-40px | Simplified icon / favicon | `logo-favicon.svg` |

**Hard minimums:** Wordmark text below 16px cap height is unreadable — switch to icon only. Below 40px total lockup height, use simplified/flat icon.

## File Naming Convention

Standard naming for deliverable packages:

```
brand-name/
├── logo-primary.svg              # Full color, horizontal lockup
├── logo-primary-mono-dark.svg    # Monochrome dark (currentColor)
├── logo-primary-mono-light.svg   # Monochrome light (for dark backgrounds)
├── logo-stacked.svg              # Full color, vertical/stacked lockup
├── logo-icon.svg                 # Icon/mark only, full color
├── logo-favicon.svg              # Simplified icon for 16-32px
├── logo-favicon.ico              # ICO format for legacy browsers
├── logo-og.png                   # 1200×630 PNG for social sharing
├── logo-appicon-512.png          # 512×512 PNG for app stores
└── brand-colors.css              # CSS custom properties for brand palette
```

## Color Palette Handoff

Export brand colors as CSS custom properties so downstream projects (taste-skill, soft-skill, minimalist-skill) can consume them:

```css
:root {
  --brand-primary: #1a1a2e;
  --brand-accent: #0d6efd;
  --brand-bg: #ffffff;
  --brand-text: #1a1a2e;
}
```

Also document: Pantone (for print), CMYK (for print), RGB, and HEX values in a color specification table alongside the SVG deliverables.

## Sub-Brand Variants

When a brand has product lines or sub-brands:
- Sub-brand marks share the **primary mark's geometric DNA** (same grid, same proportions)
- Sub-brands use a **differentiated color** from the same palette family
- Sub-brand wordmarks use the **same typographic voice** (same font archetype, may vary weight)
- The primary mark should be recognizable even when the sub-brand mark appears alone
