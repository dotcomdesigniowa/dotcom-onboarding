# Dotcom Design Team Onboarding

The Dotcom Design team onboarding system. New hires get a single message to
paste into Hermes, which handholds them through the full setup.

## For new hires

1. Install Hermes: `curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash`
   (Or download the Windows installer)
2. Open Hermes and paste this message:

```
I'm starting my onboarding at Dotcom Design. Please run the dotcom-onboard skill to set up my AI operating system.

My GitHub username is: [your-username]
```

3. Hermes walks you through the rest — Composio setup, the interview, the
   build, GitHub backup, and Claude Code. Just follow along.

## For Josh

- **To push company context updates:** say "push company updates" in Hermes
- **To add a new employee to GitHub:** add them as a collaborator to
  `dotcom-company-context` (and their personal repo once created)
- **The Composio API key** is needed for the Composio setup step. Share the
  `ck_` key with the new hire or set it up for them.

## What's in this repo

| Path | What it is |
|---|---|
| `SKILL.md` | The full onboarding flow (7 phases) |
| `BOOTSTRAP.md` | The message a new hire pastes into Hermes |
| `company-context/` | The 7 company docs (ICP, North Star, etc.) |
| `file-templates/` | Templates for CLAUDE.md, AGENTS.md, LESSONS.md, etc. |
| `agent-stubs/` | Ava and Craig agent stubs for employees |
| `sync/` | Daily backup scripts + company push script |
| `push-company-updates/` | Josh's skill for pushing context to the team |

## Related repos

- `dotcom-company-context` — shared company context (employees pull from this)
- `dotcom-os-vault` — Josh's full vault backup
