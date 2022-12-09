#!/bin/bash -e

# Comdex Tendermint upgrade script
# ***ONLY USED IF RUNNING COSMOVISOR AND UPGRADE IS A VANILLA COSMOVISOR IN-PLACE UPGRADE. OTHERWISE, USE OUR UPGRADE INSTRUCTIONS ***

# =========CONSTANTS===================
# Chain and project constants -- Only need to set once
BINARY_NAME="comdex"
# User home directory. Modify this folder according to your user setup
USER_HOME="/home/user"
# Chain folder on the server
CHAIN_FOLDER="${USER_HOME}/.comdex"
# URL of the project's Github repo
GIT_REPO="https://github.com/comdex-official/comdex.git"
# Folder in server where we clone the Github repo
GIT_FOLDER="${USER_HOME}/comdex"

# Version upgrade constants -- Change here for each upgrade
# NEW_VERSION is used to download Git release. NEW_VERSION_NAME is used for Cosmovisor upgrade path. Sometimes they're the same, but usually are different.
NEW_VERSION="v6.0.1"
NEW_VERSION_NAME="v6.0.0"
# Commit hash is used to match up version release hash. If not matched, script will exit. Logic to be added later
COMMIT_HASH="9eec555de779c3ba3e5981d784cd9fc64d829cf7"
# Go version prerequisite. If version matched or higher, we won't upgrade Go. Else we upgrade Go. Logic to be added later
GO_DOWNLOAD="go1.19.3.linux-amd64.tar.gz"

# Auto-generated from above constants
UPGRADE_FOLDER="${CHAIN_FOLDER}/cosmovisor/upgrades/${NEW_VERSION_NAME}/bin"
# =========END OF CONSTANTS============

# =========START OF SCRIPT=============

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

echo "Done. Make sure Cosmovisor is running: journalctl -fu cosmovisor. Cosmovisor will automatically upgrade at preset upgrade height."
