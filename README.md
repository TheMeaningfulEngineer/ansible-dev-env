# About

This is the repo containing the ansible roles to set up my dev environment.
Check the roles for details on what that means.

# System requirements

Ansible, Git (for downloading Neovim plugins), tar, and gzip must already be available. The default installation targets Linux x86-64 and does not require sudo or a compiler.

# Usage

**Running with the default values will modify files in your home directory.**

```
ansible-playbook main-play.yml
```

The default installs the Neovim AppImage and precompiled ripgrep under your home directory, links this checkout's configuration, and adds the local bin directory to your shell PATH. It does not install system packages.

Tree-sitter highlighting and folding use only the parsers bundled with Neovim: C, Lua, Markdown (including inline markup), Vimscript, Vimdoc, and query files. Other languages use Neovim's built-in syntax files. No parser downloads, Tree-sitter CLI, or compilation are needed. Telescope uses the native fzy sorter with its bundled Linux x86-64 binary; Git submodules are fetched automatically, with no build step. The native fzf extension and Tree-sitter textobject plugin are no longer installed. The custom `ab`/`ib` Tree-sitter mappings are removed.

Language servers, their Node.js runtime, ShellCheck, shfmt, shell customizations, and standalone fzf are opt-in. Existing installations are not removed. Neovim enables configured language servers only when their executables are available on PATH.

The Obsidian Neovim plugin is installed by default with `personal` (`~/vaults/personal`) and `work` (`~/vaults/work`) workspaces. Switch with `:Obsidian workspace personal` or `:Obsidian workspace work`. The Obsidian desktop app remains optional.

Install optional tools using tags:

```bash
ansible-playbook main-play.yml --tags lsp         # All configured language servers
ansible-playbook main-play.yml --tags lsp-python  # Python (basedpyright)
ansible-playbook main-play.yml --tags lsp-bash    # Bash, ShellCheck, shfmt
ansible-playbook main-play.yml --tags lsp-lua     # Lua
ansible-playbook main-play.yml --tags fzf         # Shell fuzzy finder integration
ansible-playbook main-play.yml --tags shell      # Prompt trimming and vim/vi aliases
```

Tag selection runs only the selected tasks. Combine tags, such as `--tags nvim,lsp-python`, to install Neovim alongside an optional tool. Restart your shell or run `export PATH="$HOME/.local/bin:$PATH"` after installation.

To also apply desktop-specific settings:

```bash
ansible-playbook -K main-play.yml -e INCLUDE_DESKTOP=true
```

To also apply personal apps:

```bash
ansible-playbook -K main-play.yml -e INCLUDE_PERSONAL=true
```

To install only the Python language server without sudo:

```bash
ansible-playbook main-play.yml --tags lsp-python
```

Profiles:
- `tooling`: Neovim by default; language servers and shell tools via explicit tags
- `desktop`: keybindings, fonts, terminal settings
- `personal`: personal app choices such as Obsidian


## Updating an existing installation

After updating this checkout, rerun `ansible-playbook main-play.yml` to install the pinned Neovim and ripgrep versions. Optional tools are upgraded only when you select their tags again.

Plugin revisions are recorded in `nvim/lazy-lock.json`. In Neovim, run `:Lazy restore`, wait for completion, then fully quit and reopen Neovim so it loads the updated plugin code. `:Lazy clean` removes plugins no longer used by this configuration. Previously installed compiler packages and parser files are not deleted by the playbook.

## Isolated Neovim Install

To try the Neovim role without writing user-level files into your real home directory, override the install root at runtime:

```bash
ansible-playbook main-play.yml -e INSTALL_ROOT="$PWD/fake_home_user" --tags nvim
```

This installs the same bundled-parser setup without changing your real home directory or installing system packages.

To run the isolated vim run:

```bash
HOME="$PWD/fake_home_user" PATH="$PWD/fake_home_user/.local/bin:$PATH" nvim
```
