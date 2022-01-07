# Setup MacOs With Ansible

> Most of the stuff here is taken from Red Shirt Jeff's Repository: https://github.com/geerlingguy/mac-dev-playbook

1. Add the following command to your `.zshrc` to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.8/bin:/opt/homebrew/bin:$PATH"`
2. Upgrade Pip: `sudo pip3 install --upgrade pip`
3. Install Ansible: `pip3 install ansible`
4. Test if it's working: `ansible-playbook hello_world.yml`
5. Run: `ansible-playbook -v --ask-become-pass setup.yml`
    * `-v` to get more information from the commands
    * `--ask-become-pass` asks your password once

The downloaded `.dmg` files are stored in Homebrew cache.
`brew --cache` gives the folder where the packages are stored.

`brew cleanup` only cleans outdated package versions if you have the newest version installed,

To simulate a cleanup, i.e. see what would be removed, you may use the `-n` option: `brew cleanup -n`


## TODO
 * All commands are executed with `become` (see inventory)?

 * Check if brew is installed, if not execute the brew install command
 * trash-cli with `npm install --global trash-cli`

 * remove `.DS_Store`???
 * Itsycal - config
    * TODO launch at login -> add this to `.zshprofile`: `open -a 'Itsycal'`
    
### VsCode 
 * git push does not use ssh key
 * Automate plugins?

### zsh
 * zsh (setup and configure)
    - `zsh --version` gives `zsh 5.8 (x86_64-apple-darwin21.0)` back. Is there an arm version?


 * git - config
 * Iterm2 - config
 * Firefox - config, bookmarks, extensions, make it default browser
 * IntelliJ - config
 * Alfred - config
 * Maven - Has a dependency openjdk. Brew will also install Java 17
 * Snagit (AppStore)
 * SnippetsLab (AppStore)



# --------- Notes from earlier ---------

 1. Make sure the native Terminal is started (check with “arch”, must give “arm64” back)
 2. Install Homebrew (and add it to PATH manually, see “next step” section)
	`echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/kleiner/.zprofile`
    `eval "$(/opt/homebrew/bin/brew shellenv)"`

### SSH Config
1. Create an .ssh folder
3. Copy your public and private key there
4. Create a ~/.ssh/config file (See https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use)
5. Global git settings user and email

Git is still asking for username/password with ~/.ssh/config present
https://stackoverflow.com/questions/10909221/why-is-github-asking-for-username-password-when-following-the-instructions-on-sc

Here is an official answer to this:
> If Git prompts you for a username and password every time you try to interact with GitHub, you're probably using the HTTPS clone URL for your repository. Using an HTTPS remote URL has some advantages: it's easier to set up than SSH, and usually works through strict firewalls and proxies. 
> However, it also prompts you to enter your GitHub credentials every time you pull or push a repository. 
> You can configure Git to store your password for you. If you'd like to set that up, read all about setting up password caching.


### Clone Dotfiles/config Repository
1. Cloned dotfiles and put it in home folder

### Karabiner Elements
1. Karabiner Elements with homebrew (requires password)
2. Symlink the karabiner config: `ln -s ~/config/dotfiles/config/karabiner karabiner`
3. Karabiner picked up the config automatically after restart
4. TODO: Preferences >> Keyboard >> modifier keys >> which one to choose? (Still not sure)
5. TODO: when using the laptop, the modifiers change, fix that

### VsCode
1. VS-Code with brew
2. Symlinked settings.json and keybindings.json to “~/Library/Application\ Support/Code/User/”
3. TODO argv.json symlink?
4. TODO: extensions manually or a better way??

### Git
* TODO - add email and name?
* Push changes to config repo


### Yabai
* See README in config/yabai (TODO - stack line not working)


### Fonts
* Installed Monaco Nerd Font


## —— System Settings ——
1. Turn off bluetooth
2. Install Rosetta (an installation popup shows up when you try to open an “old” program)

### Finder 
* View > Show Path Bar
* View > Show Status Bar

### Keyboard
* System Preferences > Keyboard > Shortcuts > Spotlight > Disable both
* Add Turkish Q Layout
* 

### Dock & Menu Bar (in System preferences)
* Add your own icons
* Make it smaller
* Preferences >
    * Minimise window using “scale effect”
    * enable “minimise windows into application icon”
    * disable “animate opening applications” 
    * enable “Automatically hide an show the dock”
    * disable “Show recent applications in Dock”
* Spotlight > disable “show in menu bar”
* Sound > always

### Trackpad
* Enable tap to click

### Display
* Displays > display settings > change the MacBook resolution to “scaled” and select the middle scale (the 3rd option there should be 5 options)