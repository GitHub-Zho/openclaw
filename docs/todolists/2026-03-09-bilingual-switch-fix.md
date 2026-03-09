# TODOList — Bilingual Switch & Full Chinese Content Fix

- id: T1
  description: Add language switch button behavior in layout with path-aware EN/ZH mapping
  status: done
  verification method: inspect Layout.astro for button + path mapping
  verification result: Layout.astro updated with path-aware EN/ZH switch button

- id: T2
  description: Ensure zh trip page has full Chinese copy (summary, itinerary, FAQ)
  status: done
  verification method: grep/inspect zh trip file for English leftovers
  verification result: zh trip now uses Chinese summary/itinerary/FAQ/inclusion text

- id: T3
  description: Ensure zh handbook page uses Chinese itinerary content
  status: done
  verification method: inspect zh handbook file
  verification result: zh handbook now uses Chinese sections and itinerary

- id: T4
  description: Build and deploy updated site
  status: done
  verification method: npm run build + vercel deploy output
  verification result: build passed and deployed to explore-china-site.vercel.app

- id: T5
  description: Verify TODO delivery gate passes
  status: done
  verification method: tools/verify_task_delivery.sh
  verification result: verify_task_delivery.sh returned PASS
