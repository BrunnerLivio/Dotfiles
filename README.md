# Dotfiles

![Livio Dotfiles](https://i.imgur.com/9Qj8IaF.jpg)

## Dependencies
 - [i3](https://i3wm.org/)
    - [i3-gaps](https://github.com/Airblader/i3): 
[Installation Ubuntu 16.04](https://gist.github.com/aaronsaderholm/872d55a1cec3969a5baf549f840147f1)
 - [polybar](https://github.com/jaagr/polybar)
 - [zsh](http://www.zsh.org/)
    - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh): [Installtion](https://github.com/robbyrussell/oh-my-zsh#basic-installation)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): [Installation](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

```bash
pip install Pygments
```

## Installation


```bash
cd /tmp
git clone https://github.com/BrunnerLivio/Dotfiles.git
cd Dotfiles
cp -rf i3 ~/.config/i3
cp -rf polybar ~/.config/polybar
cp zsh/* ~
```