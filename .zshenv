export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/id_rsa"
export PATH="$HOME/bin:$PATH"
export USER="jd"
export EDITOR="vim"
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
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
