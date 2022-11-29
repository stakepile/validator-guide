# Stride v3.0.0 upgrade (Aquarius upgrade)

See Github release for [change details](https://github.com/Stride-Labs/stride/releases/tag/v3.0.0)

Upgrade is scheduled for block `1149411`. Countdown clock at [here](https://ping.pub/stride/gov/7)

# Pre-requisites
- Go v1.19+
- Cosmovisor -- this guide assumes cosmovisor is used to manage upgrades. If upgrading manually, simply stop your node *after* the block indicated above and install the new version

# Get new version
```bash
cd $HOME/stride
git pull
git checkout v3.0.0
make install
```

# Check version

```bash
# Should show v3.0.0
strided version
# Should be commit 8ebccb4fe53084faf044ffa2c1e4523952f28307
strided version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
mkdir -p $HOME/.stride/cosmovisor/upgrades/v3/bin
cp $HOME/go/bin/strided $HOME/.stride/cosmovisor/upgrades/v3/bin
```

# Confirm new version

```bash
# Should show v3.0.0
$HOME/.stride/cosmovisor/upgrades/v3/bin/strided version
```

# Additional notes
- Pruning config in config/app.toml should be set to 'nothing' upon restarting. Other pruning config will result in apphash error