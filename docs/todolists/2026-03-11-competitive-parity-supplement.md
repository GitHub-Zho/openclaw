# TODOList — Competitive parity supplement (travelchina/chinatravel inspired)

- id: T1
  description: Add trust/authority module and SLA messaging on trip pages (EN/ZH)
  status: done
  verification method: inspect trip pages for trust cards and SLA text
  verification result: Added "Trust & service confidence/信任与执行保障" sections + 24h response promise.

- id: T2
  description: Add pricing rules and operational detail blocks (hotel/transport/meals granularity)
  status: done
  verification method: inspect pricing + ops sections in EN/ZH trip pages
  verification result: Added "Pricing & booking rules/价格与预订规则" and "Operational details/执行细节" sections.

- id: T3
  description: Add practical guide hub with outbound references to official and operator detail pages
  status: done
  verification method: inspect link cards and URLs
  verification result: Added styled reference links to travelchina.org.cn and chinatravel.com detailed page.

- id: T4
  description: Build + deploy + verify + commit
  status: done
  verification method: npm run build, vercel deploy, verify_task_delivery, git commit
  verification result: Build and deploy passed, alias updated; verify_task_delivery PASS; committed changes.
