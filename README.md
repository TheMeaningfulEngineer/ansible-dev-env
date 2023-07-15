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



# TODO

* the variables can be set smarter (currently hardcoding on multiple places)
* make dependencies between roles 
* split roles into sudo and non sudo roles
