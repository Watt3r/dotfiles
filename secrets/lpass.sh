read -p "Use lpass to install secrets? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo
  read -p "Username: " -r
  lpass login $REPLY
  lpass show "Setup/prometheus" --field="Private Key" > ~/.ssh/prometheus
  lpass show "Setup/prometheus" --field="Public Key" > ~/.ssh/prometheus.pub
  chmod 0600 ~/.ssh/prometheus
  lpass logout --force
fi
