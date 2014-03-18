# my dotfiles

## dotfiles
These are my current dotfiles. I use [dots](

### vim
Vim is divided into vundles and setings where I split the loading ov vundles into separate groups and try to separate the settings into logical files. The handling and grouping of vundles are copied from [Yan Pritzer](https://github.com/skwp), and is probably going to change as I start modifying it to my needs.

### bash
Bash is located under $XDG_CONFIG_HOME/bash and $HOME/.profile is where I set $XDG_CONFIG_HOME and source bashrc. This means that the shell have to be a login shell in order for this to work. This way I can start a shell with +ls if I should ever need an environment without my settings.

## usage
1. clone repo
2. source repo/init
3. dots groups set base ++
4. dots install

### install
```sh
git clone https://github.com/ingsme/dotfiles
source dotfiles/init
dots groups set base [other groups]
dots install
```

## thanks
I forked [Anders Vaage's](https://github/com/eckhart) dotfiles as a starting point for my repo. 

Apart from those allready mentioned I guess I should thank every other person whose dotfiles I have perused in search for inspiration and good ideas? I should of course have kept a log, but this I have not done. Anyway, if you see some idea or consept that may have originated from you: Thank you!
