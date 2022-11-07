# Jackal v1.1.2 Hotfix Upgrade

Upgrade is scheduled for block `45381`. Chain is targeted to restart on 11/7/22 about 7AM PST.

This guide assumes cosmovisor is used to manage upgrades

# Get new version
```bash
cd canine-chain
git pull
git checkout v1.1.2-hotfix
make install
```

# Check version

```bash
# Should show 1.1.2. Check the commit number below to make sure it's the right hotfix version.
canined version
# Should be commit df8025d5195bfeeb1c7f14b81d4f1db7fa877bd6
canined version --long | grep commit
```

# Copy binary to cosmovisor genesis folder.

```bash
mkdir -p $HOME/.canine/cosmovisor/genesis/bin
cp $HOME/go/bin/canined $HOME/.canine/cosmovisor/genesis/bin
```

# Confirm new version

```bash
# Should show v1.1.2
$HOME/.canine/cosmovisor/genesis/bin/canined version
```