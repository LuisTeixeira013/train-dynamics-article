# Scientific Research Project Rules

## Mission
Develop reproducible engineering research from traceable literature, real data, and executed simulations. Produce code, verification reports, figures, manuscripts, and submission packages without fabricating evidence.

## Non-negotiable evidence rules
- Never invent experimental data, simulation outputs, references, DOIs, author information, funding, conflicts of interest, journal requirements, or validation claims.
- Label every numerical result as one of: published data, digitized secondary data, supplied data, or simulation output.
- Keep original files immutable under `data/raw/` and `references/pdfs/`.
- Record provenance in `data/provenance.csv` with source, DOI/URL, page/table/figure, extraction method, units, uncertainty, and license/redistribution note.
- Digitized curves are secondary data, never raw measurements. Save extraction settings and a source-file SHA-256 hash.
- Distinguish verification, calibration, in-sample agreement, cross-validation, and external validation.
- Do not call a reconstruction an exact reproduction unless the original equations, parameters, inputs, code, and outputs are all available and match.
- When evidence is insufficient, state the limitation and stop the unsupported claim.

## Required workflow
1. Inspect the repository, available evidence, and previous outputs.
2. Write a plan with acceptance criteria before major edits.
3. Create or update an evidence ledger and claim-evidence map.
4. Implement analyses as scripts or notebooks; figures and tables must be generated from saved data.
5. Run tests, convergence checks, conservation/admissibility checks, and independent result verification.
6. Compare generated numbers with the manuscript and fail on mismatches.
7. Write conditionally: conclusions apply only to the tested models, parameters, operating domain, numerical criteria, and available evidence.
8. Produce a final package with manuscript, source, figures, data, code, environment, logs, checksums, and submission checklist.

## Numerical standards
- Use SI internally; state every reported unit.
- Fix random seeds where randomness is used and record them.
- Save the software environment and exact commands needed to reproduce outputs.
- Report time-step/integration convergence for dynamic simulations.
- Report momentum and energy residuals when applicable.
- Check constitutive-envelope violations, negative compression, nonphysical restitution, negative dissipation, NaN/Inf, and incomplete runs.
- Benchmark runtime only after warm-up and multiple repetitions. Report hardware, Python version, median, spread, number of runs, and timing method.
- Never compare runtime measurements obtained on different environments as though they were directly equivalent.

## Statistical standards
- State the sample size and the independence structure.
- Do not use significance tests when assumptions or sample size do not support them.
- Test whether rankings change under reasonable metric weights or thresholds.
- Prefer uncertainty intervals and sensitivity analyses over unsupported precision.

## Manuscript standards
- The abstract must match the generated results exactly.
- Separate Methods, Results, Discussion, Limitations, and Conclusions.
- State novelty explicitly and compare it with the closest prior work.
- Avoid universal wording such as “best”, “validated”, or “accurate” unless the evidence supports it.
- Use phrases such as “within the tested domain” and “under the declared criterion” when appropriate.
- Cite primary sources for technical claims and official journal pages for submission requirements.
- Do not add an author or acknowledgement without explicit confirmation.
- Leave explicit placeholders for unconfirmed funding, conflicts, telephone, repository DOI, and author contributions.

## Repository conventions
- Source code: `src/`
- Tests: `tests/`
- Raw evidence: `data/raw/`
- Processed data: `data/processed/`
- Results: `results/`
- Figures: `figures/`
- Manuscript: `manuscript/`
- References: `references/`
- Submission files: `submission/`
- Reproducibility logs: `reports/`

## Required final checks
Run `powershell -ExecutionPolicy Bypass -File scripts/run_checks.ps1` before declaring the work complete.
A task is not complete if tests fail, generated artifacts are stale, manuscript numbers differ from result files, provenance is missing, or unconfirmed administrative information is presented as fact.

## Git safety
- Never commit raw proprietary data, secrets, `.env`, API keys, temporary files, or copyrighted PDFs unless redistribution is authorized.
- Do not push, publish a release, submit a manuscript, or mint/publish a DOI without explicit user approval.
- Prefer a feature branch and a reviewable pull request for major changes.
