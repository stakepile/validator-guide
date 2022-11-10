# Chihuahua v4.0.0 Upgrade (burnmech redo)

Upgrade is scheduled for block `4787878`. Countdown clock [here](https://www.mintscan.io/chihuahua/blocks/4787878)

This guide assumes cosmovisor is used to manage upgrades

```bash
# Get new version
cd chihuahua
git pull
git checkout v4.0.0
make install
```

# Check version

```bash
# Should show v4.0.0
chihuahuad version
# Should be commit ef7a6b9f416f8175ca11bb4838e763384ab98107
chihuahuad version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
# Make sure the below commands use .chihuahuad and NOT the old .chihuahua folder
mkdir -p $HOME/.chihuahuad/cosmovisor/upgrades/v400/bin
cp $HOME/go/bin/chihuahuad $HOME/.chihuahuad/cosmovisor/upgrades/v400/bin
```

# Confirm new version

```bash
# Should show v4.0.0
$HOME/.chihuahuad/cosmovisor/upgrades/v400/bin/chihuahuad version
```