```bash
wget -O ~/.oh-my-zsh/themes/zhuangzhuang.zsh-theme https://github.com/ydzydzydz/zhuangzhuang.zsh-theme/raw/master/zhuangzhuang.zsh-theme
sed -i ".bak" 's/^ZSH_THEME=.*$/ZSH_THEME="zhuangzhuang"/' ~/.zshrc

# git
sed -i ".bak" 's/^plugins=(/plugins=( svn /' ~/.zshrc

# svn
sed -i ".bak" 's/^plugins=(/plugins=( svn /' ~/.zshrc

# ruby
sed -i ".bak" 's/^plugins=(/plugins=( ruby rbenv /' ~/.zshrc

# Python venv
echo "export VIRTUAL_ENV_DISABLE_PROMPT=true" >> ~/.zshrc
sed -i ".bak" 's/local env_for_python=.*$/local env_for_python="venv"/' ~/.oh-my-zsh/themes/zhuangzhuang.zsh-theme

# Python conda
echo "changeps1: False" >> ~/.condarc
sed -i ".bak" 's/local env_for_python=.*$/local env_for_python="conda"/' ~/.oh-my-zsh/themes/zhuangzhuang.zsh-theme

source ~/.zshrc
```

  



