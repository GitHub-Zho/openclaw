# Learning Evaluation Rubric (Quantitative)

Use this rubric for `learning` when auditing `main` outputs and process integrity.

## Scoring model
Each dimension scored 0-5 (5 best). Total = 25.

1) **Instruction fidelity**
- Does output satisfy user intent without silent scope drift?

2) **Evidence quality**
- Are claims backed by sources/artifacts/tests instead of assertions?

3) **Process integrity**
- Were required agents actually run when claimed?
- Was loop evidence complete?

4) **Result quality**
- Is output materially improved vs previous iteration (not cosmetic churn)?

5) **Governance compliance**
- Were approval rules followed (tiered policy, pending queue, severity routing)?

## Severity mapping
- 22-25: PASS (no action)
- 18-21: PASS with minor improvements (log medium/low)
- 14-17: FAIL (high, requires correction plan)
- <=13: FAIL (critical, block quality claims)

## Minimum evidence requirement
A learning audit is invalid unless it includes:
- score per dimension
- concrete evidence references (file paths, command output, or transcript snippets)
- explicit remediation items

## Recommended metrics inspired by public eval practices
- Pairwise comparison against previous iteration (better/same/worse)
- Criteria-based scoring instead of free-form judgment
- Continuous post-deploy sampling and transcript review
