# Execution Mode Selector (Lean vs Full)

Use this before dispatching sub-agents.

## Step 1: Score request complexity (0-2 each)
- Scope breadth (single page/task vs multi-page/system)
- Ambiguity (clear spec vs fuzzy intent)
- Risk (low impact vs public/high-stakes)
- Novelty (known pattern vs new domain)
- Failure history (no repeats vs repeated misses)

Total score: 0-10.

## Step 2: Select mode
- **Lean**: score 0-4
- **Full**: score 5-10

Force **Full** even with low score if any trigger is true:
1. User says quality is still poor after previous iteration.
2. Compliance/safety-sensitive output.
3. Cross-language/cross-region consistency required.
4. User explicitly asks for multi-agent closed-loop proof.

## Step 3: Record decision
Write mode decision in run note with:
- score breakdown
- selected mode
- escalation triggers (if any)

## Step 4: Verify
- Lean: require prompt-optimizer + builder + qa evidence (research evidence if research was invoked)
- Full: require `verify_web_loop_round.sh docs/workflow-rounds/<round-id>` PASS
