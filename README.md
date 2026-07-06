# homebrew-lofi-lab

A [Homebrew](https://brew.sh) tap for [Notchi](https://github.com/cyrus-cai/notchi).

## Install

```bash
brew install --cask cyrus-cai/lofi-lab/notchi
```

Or, tap first then install:

```bash
brew tap cyrus-cai/lofi-lab
brew install --cask notchi
```

## Update

```bash
brew upgrade --cask notchi
```

## Uninstall

```bash
brew uninstall --cask notchi
```

> Notchi is ad-hoc signed and not notarized. The cask strips the quarantine
> attribute on install (`postflight`) so it launches without a Gatekeeper
> prompt — the same thing the project's `install.sh` does.
