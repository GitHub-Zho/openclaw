# TODOList — Parity rebuild (interactions + visual architecture, original assets/text)

- id: P1
  description: Extract full interaction/architecture inventory from reference sites (desktop + mobile)
  status: done
  verification method: mapping doc with module-by-module and interaction-by-interaction list
  verification result: Extracted module/interaction inventory from chinatravel snapshot and travelchina structural review.

- id: P2
  description: Rebuild EN V3 page with same interaction classes (hero media, sticky nav behavior, carousels, accordions, layered cards, CTA flows)
  status: done
  verification method: source files + interaction test evidence
  verification result: EN V3 rebuilt with sticky anchor nav, carousel controls+dots, day-tab switch panel, FAQ accordions, apply form.

- id: P3
  description: Mirror ZH V3 page with same UI architecture and interaction parity
  status: done
  verification method: source files + interaction test evidence
  verification result: ZH V3 mirrored with same interaction architecture and localized copy.

- id: P4
  description: Visual-tuning pass for spacing, typography scale, contrast rhythm, hover/focus/transition curves
  status: in_progress
  verification method: desktop/mobile screenshot comparisons + checklist
  verification result:

- id: P5
  description: Simulated-user verification (desktop/mobile): each interaction proven with state change evidence
  status: pending
  verification method: browser action logs + visual report
  verification result:

- id: P6
  description: Build/deploy/verify/commit
  status: pending
  verification method: npm build + vercel + verify_task_delivery + git commit
  verification result:
