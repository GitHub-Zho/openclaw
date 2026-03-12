id: V1-R1-001
status: done
description: Unify brand string to Explore China on v1 mainline routes and shared components.
verification method: grep brand residue in src/pages src/components src/layouts src/data
verification result: PASS (no "Exploration & Travel Club" residue in scanned targets)

id: V1-R1-002
status: done
description: Simplify navbar policy for handbook/success pages and keep trip/handbook/language/apply mapping.
verification method: inspect Layout props + header link extraction in production HTML
verification result: PASS (handbook/success use minimal nav, no dead anchor links)

id: V1-R1-003
status: done
description: Remove debug preview success links from EN/ZH trips forms.
verification method: grep for "Preview success page|预览成功页" in trips page sources
verification result: PASS (no matches)

id: V1-R1-004
status: done
description: Build and deploy production.
verification method: npm run build + vercel --prod output
verification result: PASS (quality/build pass and alias updated to production)
