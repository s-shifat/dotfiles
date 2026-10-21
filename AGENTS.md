# Repository Guidance

## Repository Overview

This repository defines a reproducible NixOS configuration using Nix flakes.

The primary entry point is `flake.nix`, which composes:

- `system/hosts/wonderwall/` — Host-specific configuration.
- `system/modules/nixos/` — Reusable system-level NixOS modules.
- `system/users/shifat/` — User definitions and Home Manager integration.
- `system/modules/home/` — Home Manager modules for user-space applications and configuration.

## Configuration Conventions

- Follow the existing repository structure, naming conventions, and configuration patterns.
- Prefer declarative, reproducible Nix configurations over imperative setup or manually managed configuration files.
- Keep host-specific settings, system-level configuration, and user-space configuration within their respective modules.
- Favor small, focused, maintainable modules over monolithic configuration files.
- Avoid unnecessary dependencies, abstractions, or restructuring of unrelated modules.
- Before introducing a new configuration pattern, inspect existing implementations and reuse established conventions where appropriate.

## Home Manager

Home Manager modules reside in `system/modules/home/` and are imported through `system/modules/home/default.nix`.

**Before adding or modifying user-space applications, packages, or configurations, read `docs/home-manager-convention.md` and follow its documented module structure and conventions.**

Prefer native Home Manager options when available. Avoid duplicate package declarations or managing the same application through conflicting configuration mechanisms.

## Change Management

- Keep changes focused on the requested task while allowing reasonable improvements, refactoring, or supporting changes when they contribute to correctness, maintainability, or consistency.
- Preserve existing functionality and user preferences where practical. When changes to existing behavior are necessary, explain the rationale and potential impact.
- Consider dependencies, interactions, and downstream effects to ensure changes integrate cleanly with the rest of the configuration.
- Exercise engineering judgment rather than following instructions rigidly. If requirements conflict, introduce significant trade-offs, or require decisions beyond the agreed scope, consult the user before proceeding.
- Prefer solutions that are maintainable, reproducible, and consistent with the repository's established architecture.
- Verify module imports, configuration syntax, and option compatibility before considering a change complete.
- Run appropriate Nix formatting and evaluation/build checks when feasible.
- Do not execute `nixos-rebuild switch`, `home-manager switch`, or other activation commands unless explicitly authorized.
- Report modified files, important design decisions, validation results, and any remaining manual steps.
