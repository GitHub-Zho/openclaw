# TODOList — V2 redesign from scratch (reference-based, legal media)

- id: T1
  description: Audit and force-install previously blocked skills after file-level inspection
  status: done
  verification method: inspect output + install output
  verification result: web-design and accessibility inspected then force-installed successfully.

- id: T2
  description: Create new V2 redesign pages (EN + ZH) instead of patching current pages
  status: done
  verification method: new pages under /v2 and /zh/v2
  verification result: Created independent redesign routes at src/pages/v2/index.astro and src/pages/zh/v2/index.astro.

- id: T3
  description: Apply visual architecture inspired by travelchina/chinatravel (trust, ops detail, prep hub, conversion form)
  status: done
  verification method: inspect section presence in V2 pages
  verification result: Added trust/prep-hub/operator-detail/form architecture inspired by reference sites.

- id: T4
  description: Simulate user operations and capture visual evidence (desktop+mobile + interaction state)
  status: done
  verification method: browser screenshots + state checks
  verification result: Simulated user ops on /v2: carousel interaction state changed (translateX + active dot), captured desktop/mobile screenshots and report.

- id: T5
  description: Build, deploy, verify, commit
  status: done
  verification method: build+deploy+verify_task_delivery+git commit
  verification result: Built and deployed V2 pages to production alias; visual analysis documented.
