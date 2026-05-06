# About

This is the repo containing the ansible roles to set up my dev environment.
Check the roles for details on what that means.

# System requirements

```
sudo apt-get install ansible
```

# Usage

**Running with the default values will modify files in your home directory.**

```
ansible-playbook -K main-play.yml
```

This now applies the `tooling` profile only, which is intended to avoid desktop and session-specific changes on an SSH-accessed server.

To also apply desktop-specific settings:

```bash
ansible-playbook -K main-play.yml -e INCLUDE_DESKTOP=true
```

To also apply personal apps:

```bash
ansible-playbook -K main-play.yml -e INCLUDE_PERSONAL=true
```

To apply everything on a workstation:

```bash
ansible-playbook -K main-play.yml -e INCLUDE_DESKTOP=true -e INCLUDE_PERSONAL=true
```

To install only the Python language server without sudo:

```bash
ansible-playbook main-play.yml --tags lsp-python
```

Profiles:
- `tooling`: shell/editor/tool installation shared by desktop and server
- `desktop`: keybindings, fonts, terminal settings
- `personal`: personal app choices such as Obsidian


## Isolated Neovim Install

To try the Neovim role without writing user-level files into your real home directory, override the install root at runtime:

```bash
ansible-playbook main-play.yml -e INSTALL_ROOT="$PWD/fake_home_user" --tags nvim --skip-tags system
```

This keeps user-level files under `fake_home_user`:

```text
fake_home_user/
  .bashrc
  .config/nvim -> <repo>/nvim
  .local/appimages/
  .local/bin/
  .local/share/
```

Inspect the result with:

```bash
tree -a fake_home_user
```

This prevents user-level Neovim files from touching the real home directory. The example skips system package tasks, so it does not install packages such as `git`, `make`, or `build-essential`. If you run without `--skip-tags system`, tasks using `apt`, `become: true`, or `/tmp` can still modify the host or VM system.

The playbook derives user-level paths from `INSTALL_ROOT`:

- `HOME_USER_DIR`
- `LOCAL_APPIMAGE_PATH`
- `LOCAL_BIN_PATH`
- `LOCAL_DOT_CONFIG_PATH`

Tasks should use those variables for user-level installs rather than writing directly to `{{ ansible_env.HOME }}`.
