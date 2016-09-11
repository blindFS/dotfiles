# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="vim"
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH=$HOME/bin:$PATH
fi

PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
PATH=/opt/cuda/bin:$PATH

# export JAVA_HOME=/opt/oracle/jdk1.7.0_79
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT_STYLE_OVERRIDE=gtk
export XMODIFIERS="@im=fcitx"
export GTAGSROOT=/home/farseer/src/linux
# export _JAVA_OPTIONS='-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export _JAVA_OPTIONS='-Dswing.defaultlaf=javax.swing.plaf.nimbus.NimbusLookAndFeel'
