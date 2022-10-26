# Teritori v1.3.0 Upgrade

Upgrade is scheduled for block `378256`. Countdown clock at [here](https://explorer.teritori.com/teritori/gov/4)

This guide assumes cosmovisor is used to manage upgrades

```bash
# get new version
cd teritori-chain
git pull
git checkout v1.3.0
make install
```

# Check version

```bash
# Should show 1.3.0
teritorid version
# Should be commit c0e74d294f36882aa2c18a785d753349c2a322ef
teritorid version --long | grep commit
```

# Make new upgrades folder and copy binary to cosmovisor upgrade folder

```bash
mkdir -p $HOME/.teritorid/cosmovisor/upgrades/v1.3.0/bin
cp $HOME/go/bin/teritorid $HOME/.teritorid/cosmovisor/upgrades/v1.3.0/bin
```

# Verify new version

```bash
# Should show v1.3.0
$HOME/.teritorid/cosmovisor/upgrades/v1.3.0/bin/teritorid version
```
