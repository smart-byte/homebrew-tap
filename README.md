# Leani Homebrew tap

Install the Leani preview release:

```sh
brew install smart-byte/tap/leani
leani --version
```

Upgrade with `brew update && brew upgrade leani`.

The formula installs verified native archives from
[Leani releases](https://github.com/smart-byte/leani/releases). It supports
Apple silicon and Intel macOS, and ARM64 and x86-64 Linux. The Linux archives
require glibc 2.39 or newer; use the Leani container or a source build on older
distributions. Installation is tested on macOS 15 and Ubuntu 24.04.

This is a release candidate. Read Leani's
[preview limitations](https://github.com/smart-byte/leani/blob/v0.1.0-rc.1/docs/operations/preview-limitations.md)
before deploying it.

Leani and this tap are MIT licensed. The installation retains dependency
notices under `share/leani/THIRD_PARTY_LICENSES.txt` in the formula prefix.
