# Dotfiles

![Livio Dotfiles](https://i.imgur.com/bJX02NT.png)

## Dependencies
 - [i3](https://i3wm.org/)
    - [i3-gaps](https://github.com/Airblader/i3): 
[Installation Ubuntu 16.04](https://gist.github.com/aaronsaderholm/872d55a1cec3969a5baf549f840147f1)
    - [i3lock-color](https://github.com/chrjguill/i3lock-color): [Installation](https://github.com/chrjguill/i3lock-color#building)
 - [polybar](https://github.com/jaagr/polybar)
 - [zsh](http://www.zsh.org/)
    - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh): [Installtion](https://github.com/robbyrussell/oh-my-zsh#basic-installation)
        - [spaceship-prompt](https://github.com/denysdovhan/spaceship-prompt)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): [Installation](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
    - [the-fuck](https://github.com/nvbn/thefuck)

```bash
pip install Pygments
```

## Shortcuts

### Custom Keyboard Shortcuts

```
$MOD+L # Lock desktop
$MOD+M # Move current floating window
```

### Custom Aliases

```bash
ai # install apt package
ccat # formatted cat
```

## Installation


```bash
cd /tmp
git clone https://github.com/BrunnerLivio/Dotfiles.git
cd Dotfiles
cp -rf i3 ~/.config/i3
cp -rf polybar ~/.config/polybar
cp ./zsh/.zshrc $HOME
cp ./zsh/.zsh_aliases $HOME
```