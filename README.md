# pinhook

This repository is a sample demonstrating the combination of [pinact](https://github.com/suzuki-shunsuke/pinact) and [lefthook](https://github.com/evilmartians/lefthook).

## Overview

- **pinact**: A CLI tool to edit GitHub Workflow and Composite action files and pin versions of Actions and Reusable Workflows
- **lefthook**: Fast and powerful Git hooks manager for any type of projects

This repository shows how to automatically pin action versions in GitHub Workflow files during commits using Git pre-commit hooks.

## Setup

```bash
git clone https://github.com/azu/pinhook
cd pinhook
make setup
```

This will install the necessary dependencies and set up the Git hooks.

## Usage

When you modify `.github/workflows/*.yml` files and commit them, lefthook's pre-commit hook will trigger and pinact will automatically pin the action versions.

```bash
# Modify files in .github/workflows directory
git add .github/workflows/some-workflow.yml
git commit -m "Update workflow"

# pinact will automatically pin action versions
```

## Configuration Files

- `lefthook.yml`: Git hooks configuration
- `Makefile`: Installation and setup for pinact and lefthook
