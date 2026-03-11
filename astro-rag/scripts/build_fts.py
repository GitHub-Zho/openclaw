import os, json, sqlite3, glob
DB = '/home/ubuntu/.openclaw/workspace/astro-rag/db/astro_docs.db'
CORPUS = '/home/ubuntu/.openclaw/workspace/astro-rag/corpus/*.json'
os.makedirs(os.path.dirname(DB), exist_ok=True)
con = sqlite3.connect(DB)
cur = con.cursor()
cur.execute('DROP TABLE IF EXISTS docs')
cur.execute('DROP TABLE IF EXISTS docs_fts')
cur.execute('CREATE TABLE docs(id INTEGER PRIMARY KEY, url TEXT, title TEXT, text TEXT)')
cur.execute("CREATE VIRTUAL TABLE docs_fts USING fts5(title, text, content='docs', content_rowid='id')")
files = sorted(glob.glob(CORPUS))
for fp in files:
    d = json.load(open(fp, encoding='utf-8'))
    cur.execute('INSERT INTO docs(url,title,text) VALUES(?,?,?)', (d.get('url',''), d.get('title',''), d.get('text','')))
cur.execute("INSERT INTO docs_fts(docs_fts) VALUES('rebuild')")
con.commit()
print('indexed', len(files), 'docs ->', DB)
