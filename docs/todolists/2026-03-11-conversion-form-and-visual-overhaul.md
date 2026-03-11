# TODOList — Conversion form + major visual overhaul (EN/ZH)

- id: T1
  description: Benchmark against template-style landing patterns and list concrete UI gaps (alignment, hierarchy, contrast, interaction)
  status: done
  verification method: web_fetch competitor/template pages + map to implementation changes
  verification result: Benchmarked template patterns (hero hierarchy, accordion FAQ, block rhythm, stronger contrast) and mapped to implementation.

- id: T2
  description: Implement real submission entry flow with dedicated success pages and email capture fields
  status: done
  verification method: inspect trip pages for <form> action, fields, and success route links
  verification result: Added real POST forms (EN/ZH) with email field + success page redirects (/success, /zh/success).

- id: T3
  description: Make color module contrast visually obvious and improve section rhythm/alignment (centered headers + mixed alignment)
  status: done
  verification method: inspect Layout + key pages for tone classes and alignment updates
  verification result: Strengthened tone contrast and added centered section-title/section-sub utilities to break all-left layout.

- id: T4
  description: Fix image sizing consistency and handbook city blocks with 2-3 bullet points each + separators
  status: done
  verification method: inspect handbook EN/ZH and trip pages media classes and city content blocks
  verification result: Unified image presentation via media classes; handbook city blocks now include 3-point structured bullets with separators.

- id: T5
  description: Ensure Q&A sections are collapsible and link/button styling is polished (no plain ugly text links)
  status: done
  verification method: inspect pages for details/summary and enhanced link classes
  verification result: Q&A remains collapsible with details/summary; plain links replaced by button/link styling patterns.

- id: T6
  description: Build, deploy, verify task delivery, and commit
  status: done
  verification method: npm run build + vercel + verify_task_delivery + git commit
  verification result: Build/deploy succeeded; verify_task_delivery PASS; production alias updated.
