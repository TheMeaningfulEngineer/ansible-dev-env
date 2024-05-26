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


## Dev usage

When developing , in `main-play.yml` change to `HOME_USER_DIR: "{{ playbook_dir }}/fake_home_user"`.
This won't pollute your default home directory.
Running `tree -a fake_home_user` will give you a good impression on what happened after the playbook executed.


# Nvim stuff 

## Lazy 

To start the Lazy package manager UI run `:lazy`.

The structure of the plugins is such that

```
tree ~/.config/nvim/
├── init.lua
├── lazy-lock.json
└── lua
    ├── archive
    │   └── cmp.lua
    └── plugins
        ├── init.lua
        ├── telescope.lua
        └── treesitter.lua
```

The configuration for big plugins is crammed into the plugin directory.
i.e. telescope.lua contains both the installation and customisation in the same file

Smaller plugins are still all in init.lua, possible some dependencies as well.

The archive contains the example I haven't migrated yet.
Would like to get some python language server running but so that it's actually useful.


## Getting nvim to basic state

```
rm -rf ~/.cache/nvim
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

## For experimenting with new configs

```
ln -s $(pwd)/roles/nvim_appimage/files/nvim ~/.config/nvim
```


## Ignoring in yocto repo

Below is an example of what needs to be put in .rgignore for the yocto example where I care only about the meta-mender layer.

```
*build
*.pyc
artifacts
projects/rpi4/*
projects/rpi3/*
!projects/rpi4/meta-mender
```

Or if you want to ignore everything besides meta-mender.
You have to put one for the directory and then one for all subdirectories.


```
*
!meta-mender/
!meta-mender/**
```


## Regex search and replace

```
:'<,'>s/\vuse (.*)/\1,/gc
```

The `\v` is the mode in which you don't have to replace regex.
In the code above we're replacing:

```
use (.*) 
```

Everything after "use " will be put into a group match.
With:

```
\1,
```

The content of the group and a quote.

## Applying a macro

You can record a macro by pressing `qa` (`a` is the register name).
You than do your stuff and the macro gets recorded.
You press `q` to stop the recording.


To execute the macro press `@a` and it will get executed.




















# TODO

* the variables can be set smarter (currently hardcoding on multiple places)
* make dependencies between roles 
* split roles into sudo and non sudo roles
