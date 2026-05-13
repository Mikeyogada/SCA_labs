# Dependency Introduction Gate Lab

## Overview

This lab demonstrates a CI/CD security control that detects dependency manifest changes during pull requests and pushes.

The workflow monitors `package.json` for dependency-related modifications and blocks the pipeline when dependency activity is detected.

This simulates an early-stage software supply-chain security control used in DevSecOps environments.

---

## Security Objective

The goal of this control is to detect:

- New third-party dependency introduction
- Dependency modifications
- Unauthorized package additions
- Potential supply-chain risk activity

This helps organizations review external software before it enters the build pipeline.

---

## Repository Structure

dep-intro-lab/
├── .github/
│   └── workflows/
│       └── 03-dependency-introduction.yml (workflow)
├── scripts/
│   └── check-dependency-changes.sh (dependency check file)
├── package.json
├── package-lock.json
└── README.md


---

## Workflow Overview

The GitHub Actions workflow:

1. Starts a GitHub-hosted Ubuntu runner
2. Checks out the repository
3. Fetches the latest two commits
4. Executes the dependency detection script
5. Fails the pipeline if dependency activity is detected

---

## Dependency Detection Logic

The script performs the following :

- Compares the latest commit against the previous commit
- Detects changes to `package.json`
- Extracts added lines from the diff
- Searches for dependency-related modifications
- Exits with a non-zero status code if dependency activity is found

Example:

```bash
git diff HEAD~1 HEAD
```

---

## Running the Lab

### Trigger the Workflow

The workflow executes on:

- `push`
- `pull_request`

### Test the Control

Add a dependency:

```bash
npm install lodash
```

Commit and push the change.

The workflow should fail and report:

```text
Potential dependency introduction detected
```

---

## CI/CD Security Concepts Demonstrated

- Dependency governance
- Supply-chain security
- Preventative CI/CD controls
- Diff-based policy enforcement
- Shift-left security
- Automated pipeline enforcement

---

## Current Limitations

This implementation is intentionally simplified for learning purposes.

Current limitations:

- Uses string matching instead of structured JSON parsing
- May produce false positives
- Does not identify exact dependency names
- Does not perform CVE or license analysis

---

## Future Improvements

Potential future enhancements:

- Parse dependencies using `jq`
- Compare dependency graphs
- Add SBOM generation
- Integrate CVE scanning
- Add dependency approval workflows
- Validate signed packages and provenance

---

## Educational Purpose

This lab is designed to teach foundational DevSecOps and software supply-chain security concepts using GitHub Actions and Bash scripting.