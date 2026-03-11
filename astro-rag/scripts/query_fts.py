import sqlite3, sys
DB = '/home/ubuntu/.openclaw/workspace/astro-rag/db/astro_docs.db'
q = ' '.join(sys.argv[1:]).strip() or 'content collections'
con = sqlite3.connect(DB)
cur = con.cursor()
rows = cur.execute("""
SELECT d.url, d.title, snippet(docs_fts, 1, '[', ']', ' … ', 16) as snip
FROM docs_fts JOIN docs d ON d.id = docs_fts.rowid
WHERE docs_fts MATCH ?
LIMIT 5
""", (q,)).fetchall()
for i,r in enumerate(rows,1):
    print(f"{i}. {r[1]}\n   {r[0]}\n   {r[2]}\n")
