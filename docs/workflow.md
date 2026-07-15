# Recommended workflow

## Interactive research session

```powershell
claude --agent scientific-coordinator
```

Then invoke:

```text
/research-release Proceedings of the Institution of Mechanical Engineers, Part F; revise the draft-gear transition manuscript and prepare a reviewable package
```

## Independent audit

Open a new session so the verifier has less authoring-context bias:

```powershell
claude --agent numerical-verifier
```

Then invoke:

```text
/audit-results full manuscript, all figures and tables
```

## GitHub workflow

After the local setup is stable, run `/install-github-app` inside Claude Code. Use issues such as:

```text
@claude Re-run the full reproducibility workflow, fix only verified failures, and open a pull request. Do not change scientific conclusions without showing the supporting output.
```

Require human review before merging or releasing.
