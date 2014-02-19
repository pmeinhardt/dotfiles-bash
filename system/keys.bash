# Pipe my public key to my clipboard.
if test $(which pbcopy); then
  alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> public key copied to pasteboard'"
fi
