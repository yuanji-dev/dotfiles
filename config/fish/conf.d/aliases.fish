alias balin 'mosh yuanji@balin'
alias dev2 'mosh yuanji@doubandev2'
alias na 'ssh -p 26114 root@nano.gimo.me'

alias ll 'ls -alh'
alias cat bat

function proxy_on
  set -xU http_proxy 'http://127.0.0.1:1087'
  set -xU https_proxy 'http://127.0.0.1:1087'
end

function proxy_off
  set -e http_proxy
  set -e https_proxy
end
