# Comdex v6.0.0 Upgrade - Lend module fixes

Upgrade is scheduled for block `5447500`. Countdown clock [here](https://www.mintscan.io/comdex/blocks/5447500)

This guide assumes cosmovisor is used to manage upgrades

```bash
# Get new version
cd comdex
git pull
git checkout v6.0.1
make install
```

# Check version

```bash
# Should show v6.0.1
comdex version
# Should be commit 9eec555de779c3ba3e5981d784cd9fc64d829cf7
comdex version --long | grep commit
```

# Copy binary to cosmovisor upgrade folder

```bash
mkdir -p $HOME/.comdex/cosmovisor/upgrades/v6.0.0/bin
cp $HOME/go/bin/comdex $HOME/.comdex/cosmovisor/upgrades/v6.0.0/bin
```

# Confirm new version

```bash
# Should show v6.0.1
$HOME/.comdex/cosmovisor/upgrades/v6.0.0/bin/comdex version
```