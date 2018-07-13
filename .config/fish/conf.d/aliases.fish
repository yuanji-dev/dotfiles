alias balin 'mosh yuanji@balin'
alias dev2 'mosh yuanji@doubandev2'
alias dev3 'mosh yuanji@doubandev3'
alias balrog2 'mosh yuanji@balrog2'
alias nano 'mosh --ssh="ssh -p 26114" root@nano.gimo.me'
alias mio 'mosh --ssh="ssh -p 23333" mio@mio.gimo.me'

alias ll 'ls -alh'
alias cat bat

function proxy_on
  set -xU http_proxy 'http://127.0.0.1:1080'
  set -xU https_proxy 'http://127.0.0.1:1080'
end

function proxy_off
  set -eU http_proxy
  set -eU https_proxy
end
