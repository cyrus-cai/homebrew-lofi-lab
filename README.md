# homebrew-lofi-lab

A [Homebrew](https://brew.sh) tap for [Notch](https://github.com/cyrus-cai/notch).

## Install

```bash
brew install --cask cyrus-cai/lofi-lab/notch
```

Or, tap first then install:

```bash
brew tap cyrus-cai/lofi-lab
brew install --cask notch
```

## Update

```bash
brew upgrade --cask notch
```

## Uninstall

```bash
brew uninstall --cask notch
```

> Notch is ad-hoc signed and not notarized. The cask strips the quarantine
> attribute on install (`postflight`) so it launches without a Gatekeeper
> prompt — the same thing the project's `install.sh` does.
