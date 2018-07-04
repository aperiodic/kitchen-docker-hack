#!/bin/bash

set -e

REAL_SCRIPT='https://raw.githubusercontent.com/saltstack/kitchen-salt/master/assets/install.sh'

echo 'Updating apt before running the real kitchen-salt bootstrap script...'
sudo apt-get update -y

BOOTSTRAP_DIR="$(mktemp -d /tmp/kitchen-salt-bootstrap-XXXXXXXX)"

echo "Downloading kitchen-salt bootstrap script from $REAL_SCRIPT..."
sudo curl -o $BOOTSTRAP_DIR/install.sh $REAL_SCRIPT
sudo chmod +x $BOOTSTRAP_DIR/install.sh
echo 'Running kitchen-salt bootstrap...'
sudo $BOOTSTRAP_DIR/install.sh

echo 'Completed kitchen-salt bootstrap, cleaning up...'
sudo rm -rf $BOOTSTRAP_DIR
