# Task T001: Failure Analysis — Website Deployment (2026-03-17)

## Objective
Analyze the failures in today's website deployment task and produce actionable lessons.

## Context
Main was asked to deploy the Explore China website using the `djyqrfz68` Vercel preview as base, adding back the DestinationCarousel. Main failed 3 times before getting it right:

### Failure 1: Wrong source branch
- User said: "以 djyqrfz68 preview 版本为基础"
- Main did: Used `origin/test` branch instead of `test/site-restructure`
- Result: Missing site.ts data, handbook content, trip page details
- User had to correct

### Failure 2: No post-deploy verification  
- Main pushed code and said "已部署完成"
- FAQ accordion was visually broken (CSS: grid-template-rows instead of display:none)
- User had to screenshot the bug
- Main only then compared CSS between preview and build

### Failure 3: Still wrong base after "fix"
- Main fixed the CSS but still had the wrong base code (origin/test)
- User had to point out AGAIN that the content didn't match djyqrfz68
- Main finally diffed ALL files and found 5 files with significant differences

### Failure 4: Learning not self-triggered
- User had to explicitly tell main to learn from the mistakes
- Learning agent was never auto-spawned

## Expected Output
1. Root cause analysis (why did main make assumptions instead of verifying?)
2. Pattern identification (is this a recurring problem?)
3. Proposed prevention rules (specific, testable)
4. Check existing lessons (L-0009, L-0010, L-0011) — are they sufficient or need refinement?
5. Write findings to `tasks/T001/report.md`
