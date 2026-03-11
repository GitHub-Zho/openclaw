import os, re, json, html
from urllib.request import urlopen, Request
import xml.etree.ElementTree as ET

BASE = "https://docs.astro.build"
SITEMAP_INDEX = BASE + "/sitemap-index.xml"
OUT = "/home/ubuntu/.openclaw/workspace/astro-rag/corpus"
os.makedirs(OUT, exist_ok=True)

UA = {"User-Agent": "Mozilla/5.0 (compatible; AstroRAGBot/1.0)"}

def get(url):
    req = Request(url, headers=UA)
    with urlopen(req, timeout=30) as r:
        return r.read().decode("utf-8", errors="ignore")

def strip_html(raw):
    raw = re.sub(r"<script[\s\S]*?</script>", " ", raw, flags=re.I)
    raw = re.sub(r"<style[\s\S]*?</style>", " ", raw, flags=re.I)
    title = ""
    m = re.search(r"<title>(.*?)</title>", raw, flags=re.I|re.S)
    if m:
        title = html.unescape(m.group(1)).strip()
    text = re.sub(r"<[^>]+>", " ", raw)
    text = html.unescape(text)
    text = re.sub(r"\s+", " ", text).strip()
    return title, text

index_xml = get(SITEMAP_INDEX)
root = ET.fromstring(index_xml)
ns = {"s": "http://www.sitemaps.org/schemas/sitemap/0.9"}
sitemaps = [loc.text for loc in root.findall("s:sitemap/s:loc", ns)]

urls = []
for sm in sitemaps:
    try:
        xml = get(sm)
        r = ET.fromstring(xml)
        urls.extend([loc.text for loc in r.findall("s:url/s:loc", ns)])
    except Exception:
        pass

# Prefer English docs only and avoid changelog duplicates for size
urls = [u for u in urls if "/en/" in u and "#" not in u]
urls = sorted(set(urls))

meta = []
for i, u in enumerate(urls, 1):
    try:
        raw = get(u)
        title, text = strip_html(raw)
        slug = re.sub(r"[^a-zA-Z0-9]+", "_", u).strip("_")[:180]
        path = os.path.join(OUT, f"{i:04d}_{slug}.json")
        with open(path, "w", encoding="utf-8") as f:
            json.dump({"url": u, "title": title, "text": text}, f, ensure_ascii=False)
        meta.append(path)
        if i % 50 == 0:
            print("fetched", i)
    except Exception as e:
        print("skip", u, e)

print("done", len(meta))
