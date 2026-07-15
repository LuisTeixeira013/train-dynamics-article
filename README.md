# Claude Code starter for reproducible scientific engineering

This starter configures Claude Code to work as a coordinated research team rather than as one unconstrained chat agent.

## What it creates

- persistent project rules in `CLAUDE.md`;
- specialized literature, numerical, manuscript, and reproducibility agents;
- manual `/research-release` and `/audit-results` skills;
- conservative permissions and a lightweight post-edit check hook;
- a PowerShell final-check script;
- a first-run prompt.

## Install Claude Code on Windows PowerShell

```powershell
irm https://claude.ai/install.ps1 | iex
claude --version
```

Git for Windows is recommended.

## Add this starter to an existing repository

Copy every file and hidden directory from this package into the repository root. Do not overwrite an existing `CLAUDE.md` without merging its project-specific instructions.

Then:

```powershell
cd C:\caminho\do\repositorio
claude
/doctor
/memory
```

Start the coordinated session:

```powershell
claude --agent scientific-coordinator
```

Paste the contents of `prompts/first_run_prompt.md`, or invoke `/research-release` after the initial audit.

## Important

The configuration can enforce deterministic file and command rules through hooks and permissions, but scientific judgment still requires human review. Never give the agent unrestricted access to secrets or automatic publication credentials.
