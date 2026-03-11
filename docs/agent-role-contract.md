# Agent Role Contract (v1)

## prompt-optimizer (expanded)
Responsibilities:
1. Optimize **user → main** understanding prompts to reduce requirement misread.
2. Optimize **main → research** retrieval prompts.
3. Optimize **brain → research** retrieval prompts.
4. Optimize **brain → builder** execution prompts.

Quality rule:
- prompt-optimizer must include ambiguity checks and requirement-restate blocks in optimized prompts.

## research (expanded)
Responsibilities:
1. Counter model-bias/knowledge-gaps from main/brain by gathering external, relevant, current signals.
2. Produce digested professional context (not raw dumps) for main/brain decisions.
3. Follow retrieval prompt scope provided by optimized prompts.

Flow rule:
- main/brain draft retrieval prompt → prompt-optimizer refines → research executes search/digest.
- research returns findings directly to main/brain (not routed back through optimizer).

Search target scope (minimum):
- comparable interaction patterns
- IA and conversion architecture patterns
- implementation constraints/best practices for chosen stack
- accessibility and mobile behavior guidance where relevant

## learning (expanded)
Responsibilities:
1. Monitor all subagent performance quality (brain/prompt-optimizer/research/builder/qa).
2. Detect weak patterns, root causes, and recurring failures.
3. Propose corrective actions and process/skill updates.

Control rule:
- learning-proposed fixes for subagents must be submitted to **main** first.
- only after main approval can optimization actions be applied.
- important-agent updates (`main`, `learning`) still require user approval.

## supervision model
- learning monitors subagent behavior quality, not factual truth arbitration of each output.
- main remains final orchestrator and approval authority for operational changes.
