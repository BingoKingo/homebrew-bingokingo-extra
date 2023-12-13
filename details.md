What is checked before submitted to this tap?

From [PULL_REQUEST_TEMPLATE.md](ttps://github.com/Homebrew/homebrew-core/blob/master/.github/PULL_REQUEST_TEMPLATE.md) and [CONTRIBUTING.md](https://github.com/Homebrew/homebrew-core/blob/master/CONTRIBUTING.md)
- [ ] `HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source <formula>` built successfully.
- [ ] `brew test <formula>` tested fine.
- [ ] `brew audit --strict <formula>` worked successfully.
- [ ] `brew audit --new <formula>` worked successfully.


From [PULL_REQUEST_TEMPLATE.md](https://github.com/Homebrew/homebrew-cask/blob/master/.github/PULL_REQUEST_TEMPLATE.md) and [CONTRIBUTING.md](https://github.com/Homebrew/homebrew-cask/blob/master/CONTRIBUTING.md)
- [ ] `brew audit --cask --online <cask>` is error-free.
- [x] `brew style --fix <cask>` reports no offenses.
- [ ] `brew audit --new-cask <cask>` worked successfully.
- [x] `brew install --cask <cask>` worked successfully.
- [x] `brew uninstall --cask <cask>` worked successfully.



