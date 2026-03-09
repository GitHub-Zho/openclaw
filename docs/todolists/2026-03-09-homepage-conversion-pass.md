# TODOList — Homepage Conversion Pass (EN + ZH)

- id: T1
  description: Upgrade EN homepage hero with stronger visual and clear primary/secondary CTA hierarchy
  status: done
  verification method: inspect `src/pages/index.astro`
  verification result: EN hero updated with strong CTA hierarchy

- id: T2
  description: Add trust/proof module and registration steps module (EN)
  status: done
  verification method: inspect `src/pages/index.astro` for trust + 3-step sections
  verification result: EN trust/proof + 3-step timeline modules added

- id: T3
  description: Mirror core conversion structure in ZH homepage
  status: done
  verification method: inspect `src/pages/zh/index.astro`
  verification result: ZH homepage mirrored with trust + timeline + CTA hierarchy

- id: T4
  description: Build and deploy
  status: done
  verification method: `npm run build` + Vercel output
  verification result: build+deploy completed, alias updated

- id: T5
  description: Validate delivery gate
  status: done
  verification method: `tools/verify_task_delivery.sh <todo-file>`
  verification result: verify_task_delivery.sh returned PASS
