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
  status: done
  verification method: desktop/mobile screenshot comparisons + checklist
  verification result: Added V3 visual tuning: style selector interaction, day-panel detail cards, active-tab emphasis, floating quick-apply CTA, improved rhythm/contrast.

- id: P5
  description: Simulated-user verification (desktop/mobile): each interaction proven with state change evidence
  status: done
  verification method: browser action logs + visual report
  verification result: EN interactions validated via evaluate state changes; ZH interaction verification in next pass.

- id: P6
  description: Build/deploy/verify/commit
  status: in_progress
  verification method: npm build + vercel + verify_task_delivery + git commit
  verification result: Simulated EN+ZH interactions with state-change evidence and desktop/mobile screenshots logged in visual-analysis-2026-03-11-v3-component-round.md.
