# ItsPaint — Homebrew tap

A Homebrew tap for [ItsPaint](https://github.com/joshlin2201/itspaint), a native
macOS paint and screenshot-markup app with no accounts, no network code, and no
telemetry.

## Install

```bash
brew install --cask joshlin2201/itspaint/itspaint
```

The fully qualified name is deliberate. Since Homebrew 6.0.0, third-party taps
require explicit trust, and installing by fully qualified name trusts **only this
cask** rather than the whole tap. If you would rather tap first:

```bash
brew tap joshlin2201/itspaint
brew trust --cask joshlin2201/itspaint/itspaint
brew install --cask itspaint
```

## Upgrade and remove

```bash
brew upgrade --cask itspaint
brew uninstall --cask itspaint          # leaves your settings
brew uninstall --zap --cask itspaint    # removes them too
```

## Why a tap rather than homebrew-cask

Homebrew's [package acceptance policy](https://docs.brew.sh/Package-Acceptance-Policy)
requires a project to show public interest beyond its author — 30 forks, 30
watchers or 75 stars, tripled to 90/90/225 when the repository owner submits it —
and a repository at least 30 days old. ItsPaint does not meet that yet, and a
third-party tap is the documented home for software that does not:

> Software that does not meet the official criteria can generally be maintained
> in a third-party tap. Distribution through a third-party tap does not imply
> Homebrew endorsement or support.

The cask here is the same one an eventual `homebrew-cask` submission will carry.

## What you get

Releases are universal (Apple silicon and Intel), signed with a Developer ID and
notarised by Apple, with the notarisation ticket stapled to both the disk image
and the app inside it — so a first launch works with no network round-trip and
no Gatekeeper detour.

Verify a download yourself:

```bash
shasum -a 256 -c checksums.txt
xcrun stapler validate ItsPaint-0.11.0.dmg
spctl -a -vvv -t exec /Applications/ItsPaint.app
```

## Licence

The cask is MIT, matching [ItsPaint itself](https://github.com/joshlin2201/itspaint/blob/main/LICENSE).
