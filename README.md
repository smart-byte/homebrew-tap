# Leani Homebrew tap

Install the latest stable Leani release:

```sh
brew install smart-byte/tap/leani
leani --version
```

Or install the newest release, release candidates included:

```sh
brew install smart-byte/tap/leani-rc
```

Both formulae install `leani`, so keep one of them. Upgrade with
`brew update && brew upgrade leani` or `brew upgrade leani-rc`.

The formulae install verified native archives from
[Leani releases](https://github.com/smart-byte/leani/releases). They support
Apple silicon and Intel macOS, and ARM64 and x86-64 Linux. The Linux archives
require glibc 2.39 or newer; use the Leani container or a source build on older
distributions. Installation is tested on macOS 15 and Ubuntu 24.04.

Read Leani's
[known limitations](https://leani.dev/docs/operations/preview-limitations/)
before deploying it.

Leani and this tap are MIT licensed. The installation retains dependency
notices under `share/leani/THIRD_PARTY_LICENSES.txt`, or
`share/leani-rc/THIRD_PARTY_LICENSES.txt`, in the formula prefix.
