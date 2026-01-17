# Homebrew Tap

Personal Homebrew tap for custom formulae.

## Purpose

Distribute personal tools via Homebrew:
- `zhtw` - Simplified to Traditional Chinese (Taiwan) converter

## Structure

```
homebrew-tap/
├── Formula/
│   └── zhtw.rb    # zhtw formula
└── README.md      # User documentation
```

## Commands

```bash
# Test formula locally
brew install --build-from-source ./Formula/zhtw.rb

# Audit formula
brew audit --strict Formula/zhtw.rb

# Update formula (after new release)
# 1. Update version and sha256 in Formula/zhtw.rb
# 2. Test install
# 3. Commit and push
```

## Formula Update Checklist

When updating `zhtw` formula after a new release:

1. Get new version's SHA256:
   ```bash
   curl -sL https://github.com/rajatim/zhtw/archive/refs/tags/vX.Y.Z.tar.gz | sha256sum
   ```
2. Update `Formula/zhtw.rb`: version and sha256
3. Test: `brew install --build-from-source ./Formula/zhtw.rb`
4. Commit and push

## Related

- Main project: [zhtw](https://github.com/rajatim/zhtw)
