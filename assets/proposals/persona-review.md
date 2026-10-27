# Persona Review of the Course Website

Review of 27 October 2026 by five simulated personas, and what was changed as a result. For the course responsible and teaching staff.

## Reviewers

| Persona | Perspective |
| --- | --- |
| Prof. Kirsten Holm, professor of software engineering | Constructive alignment, learning goals, workload, assessment validity |
| Assoc. Prof. Rahul Menon, ML and data science | Currency of the ML content, evaluation, responsible AI, literature |
| Mette Sørensen, IT-Vest student and data analyst | Clarity, preparation, workload, where a Docker/Kubernetes beginner gets stuck |
| Lars Kjeldsen, principal MLOps engineer | Feasibility of the exercises on the course cluster, tooling, practices |
| Birgitte Vang, head of AI and data architecture | Value for the employer, industrial and regulatory constraints, confidentiality |

## What all reviewers would keep

- The weekly loop: a step on the shared reference project, then the same step on the student's own case.
- Three portfolios anchored in the seminar themes, revised into one report and examined orally.
- The honest handling of the cluster limits (push-based deployment from Git instead of a GitOps operator).
- The week 1 exercise using Sculley et al.'s figure as a checklist against the notebook.

## Main findings

| Finding | Raised by |
| --- | --- |
| External links remain on the site | All five |
| Confidentiality, case approval and fallback exist only in the internal proposal | Holm, Sørensen, Kjeldsen, Vang |
| No remote access to the cluster during self-study weeks | Sørensen, Kjeldsen, Vang |
| Cluster-wide read access includes other namespaces' secrets | Holm, Kjeldsen, Vang |
| Grading, exam duration, page limits and assessment criteria not published | Holm, Sørensen, Vang |
| Course learning goals miss the cloud continuum and data pipelines, and promise what a sandbox cannot assess | Holm, Menon |
| LLMs, model evaluation, ML testing and the EU AI Act are under-weighted | Menon, Vang |
| Weeks 4 and 6 are overloaded; P3 is due before the week 6 material is done | Holm, Kjeldsen, Sørensen |
| Weeks 4–6 name tools whose usual installation fails on the cluster (operators, CRDs, ClusterRoles) | Kjeldsen |
| No path for the model into the running service; CI cannot reach the cluster | Kjeldsen |
| Employer value and stakeholder communication not stated or assessed | Vang, Holm |
| Beginner traps: tools not listed, Apple Silicon images, private registry packages, jargon | Sørensen, Kjeldsen |

## Changes made

- **No external links:** all web links replaced by plain citations (index, weeks 1–6, course books). The office location is plain text.
- **index.html:**
  - Sharper course description and a "What you bring back to your organisation" paragraph.
  - Workload (about 137 h, about 19 h per week).
  - Seminar location and help channel marked TBD.
  - Seminar 3 named "Big Data & Data Science Technologies".
  - Docker/Podman install required.
  - Corrected assessment text (P3 gets written feedback only; the exam and grade are individual).
  - Glossary link and a "Before week 1" link.
- **portfolio.html:**
  - New "Your Case" section: suitability criteria, approval by Wed 3 Feb, confidentiality rules, evidence rule, groups.
  - Guiding questions and assessment criteria for each portfolio.
  - P1 now requires a model-quality scenario and an EU AI Act classification; LLM cases add prompt and model versioning, evaluation and guardrails.
  - P2 adds a build-vs-buy ADR and an OT/legacy integration question.
  - P3 names GDPR, NIS2 and the AI Act, and asks for an observability design with dashboards allowed in the final report.
  - The final report adds a one-page decision-maker recommendation.
  - Peer review is aligned with the assessment criteria, and deadlines are at 23:59.
- **Week pages:**
  - Week 1: "Before Week 1" checklist; the pitch may be sanitised.
  - Week 2: Bass ch. 4 required for LLM cases; AI Act and architecture references; per-class evaluation and a time-based split.
  - Week 3: "Before you push" box (platform, public package, slim images, immutable tags); notes on no egress and DNS.
  - Week 4: Core/Stretch exercises; model loaded from MLflow by alias; CI evaluation gate; DVC and image scanning moved to stretch; notes on which installations work.
  - Week 5: Core/Stretch; validation and training-serving skew; clients run as pods; regulations; LLM note.
  - Week 6: service SLO vs. model-quality signal; proxy metrics; shadow deployment as stretch; namespace-scoped monitoring notes.
  - Week 7: decision-maker recommendation; adding the week 6 evidence to the report.
- **kubernetes.html:**
  - Security box and resource quota (TBD).
  - Off-campus access (TBD) with a local fallback.
  - Windows PowerShell commands.
  - Corrected `get nodes` text and the cross-namespace test.
  - More cheat-sheet commands and a troubleshooting table.
- **New `glossary.html`**, linked from the index and weeks 1–2.
- **Course books:** recommended reading added (Bass, Clements & Kazman; Kästner; Amershi et al.; Breck et al.; Kreuzberger et al.; Shankar et al.; model cards; datasheets; the AI Act).
- **hello-kubernetes.yaml:** resource requests and limits added.
- **Proposal:** model-quality scenario, single-rig dataset caveat, and a revised workload split.

## Open decisions (course responsible or cluster admin)

Resolved after the review:

- Cluster resources are shared between students, with no quota per namespace (kubernetes.html).
- Kubeconfigs are sent by email (week1.html).
- The oral exam follows the BSc structure: 5–7 min presentation, 15–20 min dialogue, 5 min assessment (portfolio.html).
- Starter files are postponed until the students' level is known.
- The P3 deadline stays on Wed 3 Mar. P3 is anchored in Seminar 3 (big data), whose material is complete by then. Week 6 observability evidence goes into the final report.

Also resolved:

- Off-campus access is through the university VPN (kubernetes.html).
- Seminars and the exam are at SDU Odense: Seminar 1 in U162, Seminar 2, Seminar 3 and the oral exam (Fri 12 Mar 2027) in U165.
- Grading uses the Danish 7-point scale; groups have at most 3 students; deadlines are at 23:59.
- Portfolios and the final report are submitted in Moodle (Aalborg University).
- Re-exams follow the rules of Aalborg University.
- The final report is 15–20 pages.
- Literature PDFs are not hosted in the repo; plain citations only.
- The course learning goals stay as in the official description for now; the proposal below is kept for later.

Still open:

| Decision | Where it shows on the site |
| --- | --- |
| Replace the cluster-wide read-only ClusterRole so it excludes secrets | Cluster setup (create-user.sh) |
| Help channel for questions during self-study weeks | index.html, Course Format |

## Proposed course learning goals (not adopted for now)

The current goals follow the official course description. Two reviewers found them too many, partly unmeasurable, and missing the cloud continuum, data pipelines, model evaluation and responsible AI. Proposed replacement:

**Knowledge**

1. Explain how AI systems differ from conventional software in lifecycle, architecture and failure modes, including systems built on foundation models.
2. Identify sources of technical debt in AI systems and explain their long-term consequences.
3. Describe MLOps concepts: CI/CD for ML, experiment tracking, model registry, data versioning and monitoring.
4. Explain how ML models and LLM-based components are evaluated and tested beyond aggregate accuracy.
5. Describe responsible-AI obligations, including the EU AI Act risk categories, and their consequences for architecture and documentation.

**Skills**

1. Specify measurable quality-attribute scenarios for an AI system and justify architectural decisions in ADRs.
2. Decide and justify the placement of AI components across edge, on-premises and cloud under security and data-sovereignty constraints.
3. Containerise, deploy and version an ML service reproducibly with CI and Git-driven deployment.
4. Design batch and stream data pipelines and storage for an AI system, including data-quality checks and governance rules.
5. Set up monitoring that separates service health from model quality, and use it to trigger retraining or rollback.

**Competences**

1. Evaluate trade-offs in architecture, deployment and data infrastructure for an AI system in an industrial context, including build vs. buy.
2. Communicate technical decisions and their risks to technical and non-technical stakeholders.

If adopted, each weekly learning goal can be tagged with the course goal it serves (e.g. "S2").
