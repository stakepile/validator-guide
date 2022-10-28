# JUNO v11.0.0 upgrade

The Upgrade is scheduled for block `5480000`. Countdown clock at [here](https://ping.pub/juno/gov/47)

This guide assumes cosmovisor is used to manage upgrades

# Get new version
```bash
cd juno
git pull
git checkout v11.0.0
make install
```

# Check version

```bash
# Should show v11.0.0
junod version
# Should be commit b27fc7d9312267b293d3355dd4a06523d76e247f
junod version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
mkdir -p $HOME/.juno/cosmovisor/upgrades/v11/bin
cp $HOME/go/bin/junod $HOME/.juno/cosmovisor/upgrades/v11/bin
```

# Confirm new version

```bash
# Should show v11.0.0
$HOME/.juno/cosmovisor/upgrades/v11/bin/junod version
```

# NEW configuration

***IMPORTANT*** - This upgrade requires the following new configuration to be added to the file .starsd/config/app.toml
This block of new configurations should be added below the line 'index-events = []' and above the block of Telemetry Configuration

```bash
# IavlCacheSize set the size of the iavl tree cache.
# Default cache size is 50mb.
iavl-cache-size = 781250

# IAVLDisableFastNode enables or disables the fast node feature of IAVL.
# Default is true.
iavl-disable-fastnode = true
```
