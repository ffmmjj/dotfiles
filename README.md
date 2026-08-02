# dotfiles

Personal macOS dotfiles, managed with [mise](https://mise.jdx.dev/) and versioned here for easy reproduction on a new machine.

## What's in here

| Path | What it is | Managed by |
|---|---|---|
| `.zshrc` | zsh config (starship prompt, aliases, mise activation) | mise `[dotfiles]` symlink |
| `.gitconfig` | git aliases + identity | mise `[dotfiles]` symlink |
| `.vimrc` | vim config (Vundle plugins) | mise `[dotfiles]` symlink |
| `.config/mise/config.toml` | mise manifest: tools, dotfiles, bootstrap hook (self-managed) | mise `[dotfiles]` symlink |
| `Brewfile` | remaining Homebrew formulae + casks | `brew bundle` |
| `.gitignore` | excludes `.env`, backups, `.DS_Store` | git |

## Reproducing on a new MacBook

```sh
# 1. Install mise
curl https://mise.run | sh

# 2. Clone this repo
git clone git@github.com:ffmmjj/dotfiles.git ~/.dotfiles

# 3. One command: installs all 12 tools, applies the 4 dotfile symlinks,
#    and wires the docker compose CLI plugin (via post-packages hook)
mise bootstrap

# 4. Homebrew packages + casks
brew bundle install --file=~/.dotfiles/Brewfile

# 5. Secrets — recreate manually (NOT in git, by design)
#    Create ~/.env with your ZHIPU_API_KEY (or use macOS Keychain instead)
```

After this, open a new shell — `.zshrc` runs `mise activate zsh` and everything (node, python, java, docker, colima, compose, vim, glow, uv, gcloud…) is on PATH.

## Tools (mise, 12)

`aqua`: colima, docker CLI, lima, uv, docker compose · `asdf`: vim, glow, gcloud · core: java (graalvm), jq, node (lts), python

Remaining Homebrew leaves: ack, fd, ffmpeg, fontconfig, h2o, httpd, httpie, ripgrep, starship, wrk (+ casks: nerd fonts, jumpcut; npm: corepack). `herdr` is intentionally **not** in the Brewfile.

## How it works

- **mise `[dotfiles]`** — symlinks `~/.zshrc`, `~/.gitconfig`, `~/.vimrc`, `~/.config/mise/config.toml` to this repo. Edit the repo files; changes apply immediately.
- **`[bootstrap.hooks] post-packages`** — after every `mise install`/`mise bootstrap`, re-points `~/.docker/cli-plugins/docker-compose` at the current mise-installed compose version (survives version bumps).
- **Secrets** — `~/.env` (gitignored, chmod 600) holds `ZHIPU_API_KEY`; `.zshrc` sources it. Never commit secrets here.

## Maintenance

```sh
mise bootstrap dotfiles status        # check symlink state
mise bootstrap dotfiles add ~/.X      # capture a new dotfile into the repo
mise install                          # install missing tools
brew bundle dump --force --file=Brewfile   # refresh Brewfile after brew changes
```
