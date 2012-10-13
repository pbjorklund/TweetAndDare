# deploy user
# $1: application name

if [ -d /home/deploy ]; then
  echo 'deploy user already exists, skipping.'
else
  mkdir -p /home/deploy/$1/shared/pids
  mkdir -p /home/deploy/$1/shared/log

  useradd -m deploy
  chsh -s /bin/bash deploy
  chown -R deploy:deploy /home/deploy
  chmod -R 775 /home/deploy
  mkdir /home/deploy/.ssh
  mv files/deploy_key /home/deploy/.ssh/authorized_keys
  mv files/bash_profile /home/deploy/.bash_profile
  chown -R deploy:deploy /home/deploy/.ssh
  chmod 400 /home/deploy/.ssh/authorized_keys
  su deploy -c "ssh-keygen -q -P '' -f ~/.ssh/id_rsa"

  echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config
  service ssh restart
fi
