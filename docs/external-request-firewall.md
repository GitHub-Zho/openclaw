# External Request Firewall

Applies to public-facing agents (e.g., `public-ops`).

## Objective
Prevent external channels from directly modifying sensitive architecture/governance or executing high-risk operations.

## Rule
For high-risk requests, public agent must:
1. stop direct execution,
2. generate delegation ticket,
3. route to `main` for approval.

## High-risk categories
- architecture / governance / skill policy changes
- credential, token, auth, channel binding changes
- destructive actions (delete/mass-modify)
- legal/reputation sensitive publishing actions

## Delegation ticket schema
- `ticket_id`
- `source` (channel/session)
- `request_summary`
- `risk_category`
- `risk_reason`
- `proposed_plan`
- `approval_status` (pending/approved/rejected)

## Enforcement
- No approval => no execution.
- Approved tickets are executed by `main` (or delegated safely by main).
