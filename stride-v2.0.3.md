# Stride v2.0.3 upgrade (previously named v2.0.0)

The Upgrade is scheduled for block `754555`. Countdown clock at [here](https://ping.pub/stride/gov/5)

This guide assumes cosmovisor is used to manage upgrades

# Get new version
```bash
cd stride
git pull
git checkout v2.0.3
make install
```

# Check version

```bash
# Should show v2.0.3
strided version
# Should be commit 650c9903b5adb7a4c4420f6bfcd3153c39308c77
strided version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
mkdir -p $HOME/.stride/cosmovisor/upgrades/v2/bin
cp $HOME/go/bin/strided $HOME/.stride/cosmovisor/upgrades/v2/bin
```

# Confirm new version

```bash
# Should show v2.0.3
$HOME/.stride/cosmovisor/upgrades/v2/bin/strided version
```
