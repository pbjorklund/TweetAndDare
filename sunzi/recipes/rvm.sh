# Install RVM
if [ -d /home/deploy/.rvm ]; then
  echo 'RVM already installed'
else
  su deploy -c "curl -L https://get.rvm.io | bash -s stable --ruby"
  su deploy -c "echo '[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm' >> ~/.bash_profile"
fi
su deploy -c "source ~/.bash_profile"
