# Learning Evaluation Rubric

Each dimension scored 0-5 (5 best). Total = 25.

## Dimensions

1. **Instruction fidelity** — Does output satisfy user intent without silent scope drift?
2. **Evidence quality** — Are claims backed by sources/artifacts/tests instead of assertions?
3. **Process integrity** — Were required agents actually run? Was loop evidence complete?
4. **Result quality** — Is output materially improved vs previous iteration (not cosmetic churn)?
5. **Governance compliance** — Were approval rules followed (tiered policy, severity routing)?

## Severity Mapping

- 22-25: PASS (no action)
- 18-21: PASS with minor improvements (log medium/low)
- 14-17: FAIL (high, requires correction plan)
- ≤13: FAIL (critical, block quality claims)

## Minimum Evidence Requirement

A learning audit is invalid unless it includes:
- Score per dimension with concrete evidence references
- Explicit remediation items (if any)
- Pairwise comparison against previous iteration (better/same/worse)
