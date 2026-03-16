# Incident: Learning Loop Not Actually Executed via Learning Agent

## Type
Process integrity failure (architecture-implementation gap), specifically:
- **Role-bypass error**: governance task executed by orchestrator instead of designated governance agent.
- **Control-plane drift**: declared multi-agent model existed, but runtime path remained single-threaded.

## Why this matters
- False confidence: system appears to have independent QA while actually self-reviewing.
- Reduced defect detection: no independent challenge function.
- High recurrence risk: without enforcement, convenience overrides architecture.

## Root cause analysis
### Process level
- No hard requirement to provide delegation evidence when claiming "learning loop complete".

### Architecture level
- Roles were documented, but execution contracts lacked machine-checkable proof fields.

### Implementation level
- No gate/checklist item requiring:
  1) learning-agent artifact,
  2) decision record (main+learning),
  3) applied-patch provenance.

## Corrective controls
1. Add **loop-evidence contract** to governance docs:
   - learning output artifact path
   - main decision record
   - applied file list
2. Add checklist item: "No self-approval claims without independent learning artifact".
3. Add runbook step to block closure until evidence exists.

## Verification for future runs
A run is valid only if all are present:
- `workspace-learning/...` artifact for this incident
- recorded decision in governance log (approved/rejected)
- actual patch diff linked to incident id
