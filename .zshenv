export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/id_rsa"
export PATH="$HOME/bin:$PATH"
export USER="jd"
export EDITOR="vim"
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$HOME/.exenv/bin:$PATH"
if [[ -s "/usr/libexec/java_home" ]]; then
	export JAVA_HOME=`/usr/libexec/java_home`
fi
export PATH="$HOME/.exenv/shims/elixir:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/go_home
export PATH=$PATH:$GOPATH/bin
export DJANGO_DEV=true
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="/usr/local/opt/imagemagick/bin:$PATH"
export MAGICK_HOME="/usr/local/opt/imagemagick"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
export PATH=~/.npm-global/bin:$PATH
export SELENIUMJAR=/usr/share/selenium-server/selenium-server-standalone.jar
export KUBE_EDITOR="nvim"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME="/Users/jd/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/tools 
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH/:$ANDROID_HOME/platform-tools
#export QT_SCALE_FACTOR=2
#export QT_WAYLAND_FORCE_DPI="200"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'left:40%' --exact --padding=1 --margin 10% --layout=reverse --border=double --preview 'bat --color=always --style=header,numbers --highlight-line {2} {1}'"
export BAT_THEME="OneHalfDark"
. "$HOME/.cargo/env"
export LDFLAGS="-L/opt/homebrew/opt/protobuf@21/lib"
export CPPFLAGS="-I/opt/homebrew/opt/protobuf@21/include"
export PATH="/opt/homebrew/bin:$PATH" >> ~/.zshrc
