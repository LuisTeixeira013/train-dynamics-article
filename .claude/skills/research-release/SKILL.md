---
name: research-release
description: Run the controlled end-to-end workflow that prepares a verified manuscript and reproducibility package for a target journal.
argument-hint: "target journal and requested revision"
disable-model-invocation: true
context: fork
agent: scientific-coordinator
---
Prepare a research release for: $ARGUMENTS

1. Read `CLAUDE.md` and inspect the complete repository.
2. Create a branch-safe plan and explicit acceptance criteria.
3. Delegate the literature audit.
4. Delegate independent numerical verification.
5. Implement only analyses supported by real source data or executed simulations.
6. Regenerate all figures, tables, result manifests, and checksums.
7. Delegate manuscript revision after numerical results are frozen.
8. Delegate the reproducibility audit from a clean run.
9. Run `powershell -ExecutionPolicy Bypass -File scripts/run_checks.ps1`.
10. Assemble `submission/` and `release/` without proprietary PDFs or secrets.
11. Report unresolved placeholders separately. Do not publish, push, submit, or create a DOI without explicit approval.
