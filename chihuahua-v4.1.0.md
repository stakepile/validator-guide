# Chihuahua v4.1.0 Upgrade (burn parameters)

Upgrade is scheduled for block `4886666`. Countdown clock [here](https://www.mintscan.io/chihuahua/blocks/4886666)

This guide assumes cosmovisor is used to manage upgrades

```bash
# Get new version
cd chihuahua
git pull
git checkout v4.1.0
make install
```

# Check version

```bash
# Should show v4.1.0
chihuahuad version
# Should be commit 49a1b6d8f71bb0e981f6ff0fce5deae63e270324
chihuahuad version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
# Make sure the below commands use .chihuahuad and NOT the old .chihuahua folder
mkdir -p $HOME/.chihuahuad/cosmovisor/upgrades/v410/bin
cp $HOME/go/bin/chihuahuad $HOME/.chihuahuad/cosmovisor/upgrades/v410/bin
```

# Confirm new version

```bash
# Should show v4.1.0
$HOME/.chihuahuad/cosmovisor/upgrades/v410/bin/chihuahuad version
```