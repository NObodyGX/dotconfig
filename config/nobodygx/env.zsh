# terminal-cmd: clear
export TERMINFO=/usr/share/terminfo
# curl ssh error
export CURL_CA_BUNDLE=/opt/anaconda/ssl/cacert.pem
# ccache
export USE_CCACHE=1
export CCACHE_SLOPPINESS=file_macro,include_file_mtime,time_macros
export CCACHE_UMASK=002

# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
function g_path_append() {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

# terminal proxy
function proxy_switch() {
  # port: http: 20171: sock: 20170 http_clb: 20172
  if [ -z $http_proxy ];then
    echo "proxy on"
    export http_proxy=http://127.0.0.1:20172
    export https_proxy=$http_proxy
  else
    echo "proxy off"
    unset http_proxy
    unset https_proxy
  fi
}

# themes
function set_gnome_theme() {
  gsettings set org.gnome.desktop.interface gtk-theme $1
  gsettings set org.gnome.desktop.wm.preferences theme $1
  echo "set theme to $1 done."
}

#======== rust ========#
## rust proxy ##
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
# export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
# export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export RUSTBIN=/home/xun/.cargo/bin
g_path_append $RUSTBIN
#======= golang =======#
export GOROOT=/usr/lib/go
export GOPATH=/home/xun/software/go
export GOBIN=$GOPATH/gobin
g_path_append $GOBIN
#======== ruby ========#
export RUBYBIN=/home/xun/.local/share/gem/ruby/3.0.0/bin
g_path_append $RUBYBIN
#======== nvm =========#
source /usr/share/nvm/init-nvm.sh
export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
export NVM_NPM_ORG_MIRROR=https://npmmirror.com/mirrors/npm/

unfunction g_path_append
