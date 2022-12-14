#!/bin/bash -e

# Stargaze Tendermint upgrade script
# ***ONLY USED IF RUNNING COSMOVISOR. OTHERWISE, NEED TO STOP CHAIN FIRST ***

# =========CONSTANTS===================
# Chain and project constants -- Only need to set once
BINARY_NAME="starsd"
# User home directory. Modify this folder according to your user setup
USER_HOME="/home/user"
# Chain folder on the server
CHAIN_FOLDER="${USER_HOME}/.starsd"
# URL of the project's Github repo
GIT_REPO="https://github.com/public-awesome/stargaze"
# Folder in server where we clone the Github repo
GIT_FOLDER="${USER_HOME}/stargaze"

# Version upgrade constants -- Change here for each upgrade
# NEW_VERSION is used to download Git release. NEW_VERSION_NAME is used for Cosmovisor upgrade path. Sometimes they're the same, but usually are different.
NEW_VERSION="v8.0.0"
NEW_VERSION_NAME="v8"
# Commit hash is used to match up version release hash. If not matched, script will exit. Logic to be added later
COMMIT_HASH="77e1b25a06f684676932b6e837d2f06cfeb2a064"
# Go version prerequisite. If GO_DOWNLOAD is not blank, we'll upgrade Go before chain upgrade
GO_DOWNLOAD="go1.19.4.linux-amd64.tar.gz"

# Auto-generated from above constants
UPGRADE_FOLDER="${CHAIN_FOLDER}/cosmovisor/upgrades/${NEW_VERSION_NAME}/bin"
# =========END OF CONSTANTS============

# =========START OF SCRIPT=============

# Check Go download and if it's not blank, then upgrade Go before chain upgrade
echo "Current Go version on server: $(go version)"
if [ -n $GO_DOWNLOAD ]; then 
	echo "Go version required: ${GO_DOWNLOAD}"
	echo "Upgrading Go to new version..."
	cd ${USER_HOME}
	rm -rf /usr/local/go
	wget https://golang.org/dl/${GO_DOWNLOAD}
	sudo tar -C /usr/local -xzf ${GO_DOWNLOAD}
	echo "Go upgraded!"
fi

# Build the latest version
echo "Building and installing latest version from Github..."
cd ${USER_HOME}
if [ -d "$GIT_FOLDER" ]; then 
	rm -rf ${GIT_FOLDER}
fi

git clone ${GIT_REPO}
cd ${GIT_FOLDER}
git checkout ${NEW_VERSION}
make install

# Verify version
echo "Verifying version and commit hash..."
${BINARY_NAME} version
${BINARY_NAME} version --long | grep commit

# Create new cosmovisor upgrade folder and copy new version to it
echo "Creating cosmovisor folder and copying over new version..."
if [ ! -d "$UPGRADE_FOLDER" ]; then 
	mkdir -p ${UPGRADE_FOLDER}
fi
cp ${USER_HOME}/go/bin/${BINARY_NAME} ${UPGRADE_FOLDER}

echo "Verifying version from cosmovisor upgrade folder..."
${UPGRADE_FOLDER}/${BINARY_NAME} version

echo "Chain upgraded! Make sure Cosmovisor is running: journalctl -fu cosmovisor. Cosmovisor will automatically upgrade at preset upgrade height."