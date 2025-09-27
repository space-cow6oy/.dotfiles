# Установка ZSH в Linux

1. Чтобы установить zsh в Debian 11, запустите:
  ```$ sudo apt install zsh```
2. Чтобы проверить установку zsh:
  ``` $ which zsh ```
  ``` /usr/bin/zsh ```
Из выходных данных видно, что zsh успешно установлен в /usr/bin/zsh.

3. Изменить текущую оболочку
Сначала проверьте, в какой оболочке вы сейчас работаете, с помощью следующей команды echo:
  ``` echo $SHELL ```
  ``` /bin/bash ```
Приведенный выше вывод показывает, что в настоящее время используется оболочка bash.
Чтобы изменить оболочку по умолчанию, вы должны выполнить следующую команду chsh:

    ``` $ chsh -s $(which zsh) ```

Выйдите из текущего сеанса, теперь, когда вы войдете заново в терминал, у вас будет оболочка Zsh вместо bash по умолчанию.



## Установка фреймворка Oh my zsh

1. Cкачайте установочный скрипт Oh My Zsh, запустите:
  ``` $ wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh ```
  
2. Папка установки – «~/.oh-my-zsh», запустите команду ls, чтобы просмотреть ее содержимое:
  ``` 
  $ ls ~/.oh-my-zsh 
  CODE_OF_CONDUCT.md   LICENSE.txt  cache	 lib  oh-my-zsh.sh  templates  tools
  CONTRIBUTING.md     README.md	 custom  log  plugins	    themes
  ```
 
3. 
```
rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/ 

## Как включить плагины

Чтобы включить плагины, отредактируйте файл .zshrc и добавьте соответствующие плагины в строку «plugins».

Например:
```
plugins=(git docker)
```

## Настроика подсветки синтаксиса на Zsh

Если вы хотите включить подсветку синтаксиса в оболочке Zsh, клонируйте zsh-syntax-hightlighting из github и переместите его в папку плагинов:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc
```

# power10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


- touch ~/.gigarc

- sudo apt install zoxide
- sudo apt install eza

- echo "bindkey \"^[l\" autosuggest-accept" >> ~/.oh-my-zsh/lib/key-bindings.zsh
