alias dev3 'mosh dev3'
alias balrog2 'mosh balrog2'
alias shin 'mosh shin'

alias douvpn_on 'sudo systemctl restart openvpn-client@douban.service'
alias douvpn_off 'sudo systemctl stop openvpn-client@douban.service'

alias ll 'ls -alh'
alias cat bat
alias vim nvim
alias pbcopy 'xsel --clipboard --input'

function proxy_on
  set -xU http_proxy 'http://127.0.0.1:1080'
  set -xU https_proxy 'http://127.0.0.1:1080'
end

function proxy_off
  set -eU http_proxy
  set -eU https_proxy
end
