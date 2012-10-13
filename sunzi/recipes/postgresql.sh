# postgres

if aptitude search '~i ^postgresql$' | grep -q postgresql; then
  echo 'postgresql already installed, skipping.'
else
  aptitude -y install postgresql
fi

aptitude -y install libpq-dev
