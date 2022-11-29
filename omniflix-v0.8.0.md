# Omniflix v0.8.0 Upgrade (marketplace auctions)

See Github release for [change details](https://github.com/OmniFlix/omniflixhub/releases/tag/v0.8.0)

Upgrade is scheduled for block `4175400`. Countdown clock [here](https://www.mintscan.io/omniflix/blocks/4175400)

# Pre-requisites
- Go v1.19.3+
- Cosmovisor -- this guide assumes cosmovisor is used to manage upgrades. If upgrading manually, simply stop your node *after* the block indicated above and install the new version

# Get new version

```bash
# Get new version
cd $HOME/omniflixhub
git pull
git checkout v0.8.0
make install
```

# Check version

```bash
# Should show v0.8.0
omniflixhubd version
# Should be commit 7974ee279ae0ebfc5a638beb9849a6e38fc5ad71
omniflixhubd version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
mkdir -p $DAEMON_HOME/cosmovisor/upgrades/upgrade_1/bin
cp $HOME/go/bin/omniflixhubd $DAEMON_HOME/cosmovisor/upgrades/upgrade_1/bin
```

# Confirm new version

```bash
# Should show v0.8.0
$DAEMON_HOME/cosmovisor/upgrades/upgrade_1/bin/omniflixhubd version
```

# Additional note
- Make sure to add the following config to config/app.toml right above the Telemetry config block. The location within the file when adding this config is important
- This needs to be added before the upgrade block height
```bash
iavl-disable-fastnode = false
```
