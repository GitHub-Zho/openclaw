# Design Flow Enforcement (User-required)

For every design/generation round, follow this exact sequence:

1. **Astro-RAG consult first**
   - Query local Astro RAG for relevant capabilities/components/patterns.
   - Record query terms and selected approach.

2. **Reference compare**
   - Inspect reference sites for layout rhythm + interaction model.
   - List what to replicate (architecture + interaction), not brand/text/assets.

3. **Component choice order**
   - Prefer Astro-native/reusable component approach first.
   - If no equivalent exists, implement custom component.
   - Avoid page-level duplicated interaction code.

4. **Implementation**
   - Build with reusable components.
   - Keep EN/ZH architecture parity.

5. **Visual proof gate (mandatory each round)**
   - Desktop screenshot
   - Mobile screenshot
   - Interaction state-change proof for each dynamic module
   - If missing any item: cannot claim completion.

6. **Claim discipline**
   - If code is shipped but visual proof incomplete, say: "shipped in code, visual verification pending".
