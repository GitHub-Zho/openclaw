# TODOList — Dynamic media + microinteraction pass

- id: T1
  description: Add dynamic media module (auto-playing carousel) to EN/ZH trip pages using free-safe assets already in project
  status: done
  verification method: inspect trip pages for marquee/motion section and animated media cards
  verification result: Added obvious JS autoplay carousel with prev/next buttons + pagination dots on EN/ZH trip pages.

- id: T2
  description: Improve microinteractions globally (cards/buttons/accordion motion)
  status: done
  verification method: inspect Layout styles for hover/transition/accordion indicators
  verification result: Added global card/button hover transitions, accordion +/- indicators, and reduced-motion fallback.

- id: T3
  description: Add clear note on media licensing approach (no unauthorized source-video copying)
  status: done
  verification method: verify section copy references free/public assets only
  verification result: Added explicit compliant copy: no unauthorized source-video copying; free-safe media usage only.

- id: T4
  description: Build, deploy, verify gate, commit
  status: done
  verification method: npm run build + vercel + verify_task_delivery + git commit
  verification result: Build/deploy passed and alias updated; verify_task_delivery PASS; committed.
