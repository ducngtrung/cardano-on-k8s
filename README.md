# cardano-on-k8s
Deploy cardano-node and cardano-db-sync on Kubernetes

Write Kubernetes manifests to deploy [cardano-node](https://github.com/IntersectMBO/cardano-node) and [cardano-db-sync](https://github.com/IntersectMBO/cardano-db-sync), with the following requirements:
- Use testnet-preprod network
- Cardano Node to be restored from [mithril](https://github.com/input-output-hk/mithril) for fast bootstrapping
- Use pre-built binaries or Docker images (because building from source can take long)
- Bonus point: Make them auto-scalable
