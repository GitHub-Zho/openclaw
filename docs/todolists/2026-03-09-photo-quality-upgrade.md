# TODOList — Photo Quality Upgrade (Curated Landmark Photos)

- id: T1
  description: Replace city visuals with higher-quality curated landmark photos
  status: done
  verification method: inspect `src/data/site.ts` cityVisuals URLs
  verification result: cityVisuals switched to curated Unsplash landmark photos

- id: T2
  description: Build and deploy updated site
  status: done
  verification method: build + deploy output
  verification result: build+deploy succeeded and alias updated

- id: T3
  description: Verify TODO delivery gate
  status: done
  verification method: verify_task_delivery.sh
  verification result: verify_task_delivery.sh PASS
