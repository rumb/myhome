#----------------------------
# シェル毎設定
#----------------------------

case ${OSTYPE} in
  linux* )
    ##########         bash設定          ##########
    alias ls='ls --color=auto' # 端末に色付きで出力
    xcolors

    # 大文字小文字を区別しない
    set completion-ignore-case on
    # 履歴共有
    function share_history {
    history -a  # .bash_historyに前回コマンドを1行追記
    history -c  # 端末ローカルの履歴を一旦消去
    history -r  # .bash_historyから履歴を読み込み直す

  }
  PROMPT_COMMAND='share_history'  # 上記関数をプロンプト毎に自動実施
  # .bash_history追記モードは不要なのでOFFに
  shopt -u histappend
  ##########       bash設定 終了       ##########
  ;;

darwin* )
  ##########         zsh設定           ##########

  alias ls='ls -GF' # 端末に色付きで出力
  # キーバインド
  bindkey -d

  # 補完機能
  autoload -U compinit
  compinit
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別しない
  zstyle ':completion:*' list-colors "${LS_COLORS}"    # 色付きの候補一覧
  zstyle ':completion:*:default' menu select=1 # コマンド履歴検索
  autoload history-search-end
  zle -N history-beginning-search-backward-end history-search-end zle -N history-beginning-search-forward-end history-search-end bindkey "^P" history-beginning-search-backward-end
  bindkey "^N" history-beginning-search-forward-end
  # 補完候補を詰めて表示する
  setopt list_packed
  # ディレクトリ名を入力するだけで移動
  setopt auto_cd
  # 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
  setopt auto_pushd
  # 補完候補一覧でファイルの種別をマーク表示
  setopt list_types
  # 補完時にヒストリを自動的に展開
  setopt hist_expand

  # 履歴を複数の端末で共有する
  setopt share_history
  # 履歴検索中、(連続してなくとも)重複を飛ばす
  setopt HIST_FIND_NO_DUPS
  # 履歴をインクリメンタルに追加
  setopt inc_append_history
  setopt append_history
  ## 余分な空白は詰めて記録
  setopt hist_reduce_blanks
  # 古いコマンドと同じものは無視
  setopt hist_save_no_dups
  # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
  setopt hist_ignore_all_dups


  # python関係
  PATH=/usr/local/bin:/usr/local/share/python:$PATH

  # Tex関係
  PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin/

  # Vim関係
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  ##########       zsh設定 終了        ##########
  ;;
esac

#----------------------------
# エイリアス設定
#----------------------------
alias rm='rm -i' # 削除確認
alias mv='mv -i' # 上書き確認
alias cp='cp -i' # 上書き確認

#----------------------------
# コマンド履歴の設定
#----------------------------
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.cmd_history
export HISTSIZE=1000
## 保存する履歴の数
export SAVEHIST=10000
# 重複履歴を無視
export HISTCONTROL=ignoredups
export HISTIGNORE="fg*:bg*:history*:ls*:cd"

#----------------------------
# プロント設定
#----------------------------
PROMPT=$'%{\e[38;5;46m%}nodew%(!.#.$) %{\e[m%} '
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"
RPROMPT="%{$fg[cyan]%}[%~]%{$reset_color%}"

#----------------------------
# TMUX自動起動設定
#----------------------------
function is_exists() {
type "$1" >/dev/null 2>&1
return $?
}
function is_osx() {
[[ $OSTYPE == darwin* ]]
}
function is_screen_running() {
[ ! -z "$STY" ]
}
function is_tmux_runnning() {
[ ! -z "$TMUX" ]
}
function is_screen_or_tmux_running() {
is_screen_running || is_tmux_runnning
}
function shell_has_started_interactively() {
[ ! -z "$PS1" ]
 }
 function is_ssh_running() {
 [ ! -z "$SSH_CONECTION" ]
 }

 function tmux_automatically_attach_session()
 {
   if is_screen_or_tmux_running; then
     ! is_exists 'tmux' && return 1

     if is_tmux_runnning; then
       echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
       echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
       echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
       echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
       echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
       echo "${fg_bold[red]}                          ${reset_color}"
       echo "======= CheatSheet ======="
       echo "      [C-z : Prefix]      "
       echo " ? : ヘルプ"
       echo " t : 時計"
       echo " s : セッション一覧"
       echo " d : セッションデタッチ"
       echo " $ : セッションの名前変更"
       #echo " c : ウィンドウ作成"
       #echo " n or p : ウィンドウ移動"
       #echo " | or - : ペイン分割"
       #echo " h or j or k or l : ペイン移動"
       echo " 0~9 : 番号のウィンドウへ移動"
       echo " q : ペイン番号表示"
       echo " q 0~9 : 番号のペインへ移動"
       echo " w : ウィンドウ一覧"
       #echo " , : ウィンドウ名変更"
       echo " . : ウィンドウ番号変更"
       echo " & : ウィンドウ消去"
       echo " ! : ペイン分割解除"
       echo " x : ペイン消去"
       echo " { or } : ペイン入れ替え"
       echo " :join-pane -s:1.2 : ペインをウィンドウ1から持ってくる"
       echo " :join-pane -dt:1 : ペインをウィンドウ1へ移動"

     elif is_screen_running; then
       echo "This is on screen."
     fi
   else
     if shell_has_started_interactively && ! is_ssh_running; then
       if ! is_exists 'tmux'; then
         echo 'Error: tmux command not found' 2>&1
         return 1
       fi

       if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
         # detached session exists
         tmux list-sessions
         echo -n "Tmux: attach? (y/N/num) "
         read
         if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
           tmux attach-session
           if [ $? -eq 0 ]; then
             echo "$(tmux -V) attached session"
             return 0
           fi
         elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
           tmux attach -t "$REPLY"
           if [ $? -eq 0 ]; then
             echo "$(tmux -V) attached session"
             return 0
           fi
         fi
       fi

       if is_osx && is_exists 'reattach-to-user-namespace'; then
         # on OS X force tmux's default command
         # to spawn a shell in the user's namespace
         tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
         tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
       else
         tmux new-session && echo "tmux created new session"
       fi
     fi
   fi
 }
 tmux_automatically_attach_session
