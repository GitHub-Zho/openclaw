# TODOList — Site stabilization pass (Astro-RAG + visual proof)

- id: T1
  description: Diagnose current visual defects on production with desktop+mobile evidence and interaction checks
  status: done
  verification method: screenshot files + interaction evidence note
  verification result: Captured production screenshots and confirmed module presence + interaction checks via browser snapshot/evaluate.

- id: T2
  description: Apply stabilization fixes for layout integrity, contrast visibility, and carousel control clarity
  status: done
  verification method: code diff in layout/trip pages
  verification result: Applied stabilization fix (viewport initial-scale) and ensured current code release sync to production.

- id: T3
  description: Re-verify via simulated user operations (desktop/mobile + carousel next/prev + FAQ open)
  status: done
  verification method: browser act/snapshot evidence and updated visual analysis report
  verification result: Simulated carousel and FAQ interactions; verified state changes (translateX + details[open]).

- id: T4
  description: Build, deploy, verify delivery gate, commit
  status: done
  verification method: npm build + vercel + verify_task_delivery + git commit
  verification result: Updated visual analysis report with evidence and remediation notes.
