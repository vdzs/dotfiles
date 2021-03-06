# Dotfiles for Ubuntu

A convenient starting configuration for Ubuntu Desktop or similar OS. This includes:

- A suggested serving of standard repository programs (see `scripts/install.sh`)
- The [powerline-shell terminal prompt](https://github.com/b-ryan/powerline-shell)
- The programs included in `scripts/programs/`, some of which are:
  - Docker
  - Firefox Next
  - Node and npm installed via nvm
  - Python
  - Visual Studio Code with extensions

Modify files in `scripts/install.sh` and `scripts/programs/` to modify your installation. Please verify that you understand the programs that will be installed before running the script.

## Usage

After installing your fresh OS, do:

```sh
sudo apt install git vim -y
```

Use Vim to create any SSH keys you need to access GitHub, and remember to run `ssh-add` as well as `chmod 600 <key_name>`. Then clone this repository:

```sh
git clone git@github.com:vdzs/dotfiles.git

# Or use HTTPS
git clone https://github.com/vdzs/dotfiles.git
```

You may optionally like to pass the `--depth` argument to clone only a few of the [most recent commits](https://github.com/vdzs/dotfiles/commits/master).

Examine the files in `scripts/programs/` and ensure you want them all installed. Remove any scripts for programs you don't want. Likewise, examine `install.sh`.

Close your web browser if it's open, then run the installation script.

```sh
cd dotfiles/scripts/
./install.sh
```

Set up [powerline-shell](https://github.com/b-ryan/powerline-shell):

```sh
cd powerline-shell/
sudo python3 setup.py install
```

Then restart your terminal to see changes, or run:

```sh
cd ~
source .bashrc
```

Don't forget to run any security check scripts you may need.

## Random Helpful Stuff (TM)

### Clone all your remote repositories

Given a list of repository URLs, `gh-repos.txt`, run:

```sh
xargs -n1 git clone < gh-repos.txt
```

Use the `firewood` Bash alias (see `.bashrc`) to collect remote branches.

See [How to write Bash one-liners for cloning and managing GitHub and GitLab repositories](https://victoria.dev/blog/how-to-write-bash-one-liners-for-cloning-and-managing-github-and-gitlab-repositories/) for more.

### Saving and loading configuration settings

The `settings.dconf` file provides a couple terminal themes and configuration for the desktop. They're optional to use.

Load `settings.dconf` with:

```sh
dconf load /org/gnome/ < settings.dconf
```

Back up new settings with:

```sh
dconf dump /org/gnome/ > settings.dconf
```

Run `man dconf` on your machine for more.

### Set up SSH keys for GitHub

See [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

## Recommended additions

- GNOME Tweaks
- [Emoji Selector](https://extensions.gnome.org/extension/1162/emoji-selector/) ❤️✨🦄
