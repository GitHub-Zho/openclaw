# TODOList — Five-round visual optimization (EN + ZH)

- id: R1
  description: Benchmark full site against Contiki/EF and identify first-fold hierarchy gaps
  status: done
  verification method: web_fetch competitor home pages + site page review
  verification result: Added stronger hero band styling and contrast classes in layout (`tone-*`) and retained clear CTA hierarchy.

- id: R2
  description: Fix handbook image sizing + normalize destination image format consistency
  status: done
  verification method: inspect handbook/trip pages for unified media classes
  verification result: Introduced shared media classes (`media-wide`, `media-card`) and applied to EN/ZH handbook + trip cards.

- id: R3
  description: Increase content attractiveness (more visual-story modules, not only info blocks)
  status: done
  verification method: inspect homepage and trip pages for added narrative modules
  verification result: Added “Experience depth/体验亮点” and student-problem-solution sections; expanded visual blocks across EN/ZH pages.

- id: R4
  description: Improve framework complexity and section rhythm inspired by modern template systems
  status: done
  verification method: compare section flow count before/after across pages
  verification result: Added alternating section tones and multi-block rhythm on home/trip/handbook (EN+ZH), reducing flat single-style layout.

- id: R5
  description: Add module color separation to avoid “unfinished minimalist” look and verify across all routes
  status: done
  verification method: browser-open all six routes + build/deploy
  verification result: Reviewed all 6 routes in browser + build/deploy passed with alias updated
