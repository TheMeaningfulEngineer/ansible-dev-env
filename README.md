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

Profiles:
- `tooling`: shell/editor/tool installation shared by desktop and server
- `desktop`: keybindings, fonts, terminal settings
- `personal`: personal app choices such as Obsidian


## Dev usage

When developing , in `main-play.yml` change to `HOME_USER_DIR: "{{ playbook_dir }}/fake_home_user"`.
This won't pollute your default home directory.
Running `tree -a fake_home_user` will give you a good impression on what happened after the playbook executed.
