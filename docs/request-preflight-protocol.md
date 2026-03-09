# Request Preflight Protocol (Default)

Purpose: reduce partial implementations and hidden misses by forcing a short analysis pass before execution.

## When to run
Run on every non-trivial request (especially build/design/automation tasks).

## Steps
1. **Intent decomposition**
   - Break user request into explicit sub-goals.
   - Mark required vs optional outcomes.

2. **Related-issue scan**
   - Search docs/memory/known incidents for similar failures.
   - Reuse known safeguards.

3. **External reference check**
   - Pull 2-5 relevant references or standards when domain quality matters.
   - Extract actionable constraints (not generic advice).

4. **Risk pre-mortem**
   - List likely failure modes (semantic mismatch, missing scope, inconsistent language/currency, accessibility gaps, etc.).
   - For each risk, define preventive action.

5. **Execution packet**
   - Produce a concrete task packet for sub-agents:
     - scope
     - constraints
     - acceptance criteria
     - known risks + mitigations

6. **Completion verification**
   - Verify all required sub-goals were delivered (not just main one).
   - Run loop integrity check when claiming multi-agent execution.

## Mandatory output fields (internal)
- Sub-goal checklist
- Risk list + mitigation mapping
- Acceptance criteria checklist
- Verification evidence
