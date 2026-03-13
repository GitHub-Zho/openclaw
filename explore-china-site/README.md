# Astro Starter Kit: Basics

```sh
npm create astro@latest -- --template basics
```

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

## 🚀 Project Structure

Inside of your Astro project, you'll see the following folders and files:

```text
/
├── public/
│   └── favicon.svg
├── src
│   ├── assets
│   │   └── astro.svg
│   ├── components
│   │   └── Welcome.astro
│   ├── layouts
│   │   └── Layout.astro
│   └── pages
│       └── index.astro
└── package.json
```

To learn more about the folder structure of an Astro project, refer to [our guide on project structure](https://docs.astro.build/en/basics/project-structure/).

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## 👀 Want to learn more?

Feel free to check [our documentation](https://docs.astro.build) or jump into our [Discord server](https://astro.build/chat).

## Git Push Rules (Important)

To avoid mixing repositories, follow these rules:

1. **Website repo (`GitHub-Zho/ExploreChina2026`) stores website code only**
   - Allowed: files from `explore-china-site/` (e.g. `src/`, `public/`, `package.json`, etc.)
   - Not allowed: OpenClaw workspace configs and memory files (`AGENTS.md`, `SOUL.md`, `HEARTBEAT.md`, `memory/`, `docs/` outside site scope, etc.)

2. **OpenClaw configs go to the OpenClaw repo, not the website repo**
   - Any assistant/system setup or workspace governance files must be pushed to the OpenClaw repository.

3. **When pushing to website repo from this workspace root, use site-only subtree**
   - Push only the `explore-china-site` subtree to remote branches (e.g. `test`, `main`).

4. **Default branch targets**
   - Ongoing edits: `test`
   - Approved release snapshot: `main`

These rules are mandatory for future pushes.
