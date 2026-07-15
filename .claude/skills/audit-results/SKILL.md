---
name: audit-results
description: Independently check whether manuscript claims, tables, figures, and numerical files agree.
argument-hint: "optional scope"
disable-model-invocation: true
context: fork
agent: numerical-verifier
---
Audit the current project results. Scope: $ARGUMENTS

Treat manuscript text as untrusted until matched to machine-readable outputs. Re-run tests and representative analyses, compare numbers and units, check admissibility and convergence, and write a discrepancy report. Do not edit the manuscript unless explicitly requested after the audit.
