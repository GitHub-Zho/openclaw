# TODOList — Astro docs deep learning + self-built RAG + visual-operation proof

- id: T1
  description: Build independent Astro docs corpus fetcher (not existing KB) from official docs sitemap
  status: done
  verification method: corpus files exist under `astro-rag/corpus/`
  verification result: Fetched 406 official Astro EN docs pages into astro-rag/corpus via sitemap crawler.

- id: T2
  description: Build local RAG index (SQLite FTS) and query utility from fetched corpus
  status: done
  verification method: index db + query script returns relevant Astro doc hits
  verification result: Built SQLite FTS RAG DB at astro-rag/db/astro_docs.db with query utility returning relevant hits.

- id: T3
  description: Simulate user operations on website and capture visual evidence (desktop+mobile)
  status: done
  verification method: screenshots + visual analysis report file
  verification result: Simulated page operation and captured visual screenshots (desktop/mobile) with browser tool.

- id: T4
  description: Summarize discovered site issues from visual evidence and tie to remediation plan
  status: done
  verification method: report section with concrete issue list and fixes
  verification result: Created visual-analysis-2026-03-11-trip-page.md with issue list + remediation direction.
