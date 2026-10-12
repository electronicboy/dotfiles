# dotfiles

Managed with [chezmoi](https://chezmoi.io). One repo for Intel Macs, Apple Silicon Macs and Linux.

## New machine

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply --ssh electronicboy/dotfiles
```

That asks for your git name/email once, then:

1. installs Xcode CLT, then **MacPorts** (Intel Mac) or **Homebrew** (Apple Silicon)
2. installs **mise**
3. writes the dotfiles and fetches zsh plugins
4. installs system packages and every tool in `~/.config/mise/config.toml`
5. applies a few macOS defaults, installs the Nerd Font and the iTerm2 profile

## Layout

| Path | What |
|---|---|
| `dot_zshenv`, `dot_zprofile.tmpl`, `dot_zshrc` | zsh. No plugin manager; plugins come from `.chezmoiexternal.toml.tmpl` |
| `dot_config/mise/config.toml.tmpl` | languages + CLI tools (JDKs, node, go, rg, fd, kubectl...) |
| `.chezmoidata/packages.yaml` | the few things mise can't provide per platform |
| `dot_config/git/` | git config (SSH commit signing if `~/.ssh/id_ed25519.pub` exists) + global ignore |
| `dot_config/starship.toml` | prompt (Nerd Font icons) |
| `.chezmoiexternal.toml.tmpl` | zsh plugins + JetBrains Mono Nerd Font (into `~/Library/Fonts`) |
| `Library/Application Support/iTerm2/DynamicProfiles/` | iTerm2 profile "Shane" using the Nerd Font, set as default |
| `dot_local/bin/` | personal scripts (`apatch`, ...) |
| `.chezmoiscripts/` | bootstrap / package install / macOS defaults |

## Day to day

```sh
chezmoi edit ~/.zshrc        # edit source, then `chezmoi apply`
chezmoi re-add               # pull changes made directly to managed files back in
chezmoi diff                 # see what apply would change
chezmoi update               # git pull + apply
chezmoi cd                   # jump into this repo to commit/push
```

Untracked, per-machine overrides: `~/.zshrc.local`, `~/.zprofile.local`.

## Why MacPorts on Intel?

Homebrew dropped Intel to Tier 3 in Sept 2026 (no bottles) and stops running on Intel in Sept 2027;
Nixpkgs drops x86_64-darwin after 26.05. MacPorts still ships Intel binaries. mise covers most CLI
tools on every platform; MacPorts only fills the gaps (eza, delta, atuin have no Intel macOS builds).
