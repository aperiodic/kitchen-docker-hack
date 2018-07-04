#!/bin/bash

set -e

REAL_SCRIPT='https://raw.githubusercontent.com/saltstack/kitchen-salt/master/assets/install.sh'

echo 'Updating apt before running the real kitchen-salt bootstrap script...'
sudo apt-get update -y

BOOTSTRAP_DIR="$(mktemp -d /tmp/kitchen-salt-bootstrap-XXXXXXXX)"
pushd $BOOTSTRAP_DIR

echo "Downloading kitchen-salt bootstrap script from $REAL_SCRIPT..."
curl -o install.sh $REAL_SCRIPT
chmod +x install.sh
echo 'Running kitchen-salt bootstrap...'
sudo ./install.sh

echo 'Completed kitchen-salt bootstrap, cleaning up...'
popd >/dev/null
rm -rf $BOOTSTRAP_DIR
