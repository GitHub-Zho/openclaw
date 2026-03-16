import { readFileSync, readdirSync, statSync } from 'node:fs';
import { join } from 'node:path';

const ROOT = process.cwd();
const SRC = join(ROOT, 'src');

function walk(dir) {
  const out = [];
  for (const name of readdirSync(dir)) {
    const p = join(dir, name);
    const s = statSync(p);
    if (s.isDirectory()) out.push(...walk(p));
    else if (/\.(astro|ts|js|md)$/.test(name)) out.push(p);
  }
  return out;
}

const files = walk(SRC);
const failures = [];

for (const f of files) {
  const c = readFileSync(f, 'utf8');

  // 1) Ban dynamic random image endpoint
  if (c.includes('source.unsplash.com')) {
    failures.push(`${f}: uses source.unsplash.com (dynamic/random image endpoint is banned)`);
  }

  // 2) Ban user-facing external tool links
  if (/figma\.com|notion\.so/i.test(c)) {
    failures.push(`${f}: contains figma/notion external link in user-facing source`);
  }

  // 3) Catch obvious unresolved placeholders
  const badPlaceholders = c.match(/\b(placeholder|tbd|todo)\b/gi) || [];
  if (badPlaceholders.length > 0 && /src\/pages\//.test(f)) {
    failures.push(`${f}: contains placeholder/TBD/TODO markers`);
  }
}

if (failures.length) {
  console.error('\n❌ Quality gate failed:\n');
  for (const e of failures) console.error(`- ${e}`);
  console.error('\nFix above issues before deploy.\n');
  process.exit(1);
}

console.log('✅ Quality gate passed');
