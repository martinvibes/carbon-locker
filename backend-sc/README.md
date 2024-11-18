# Backend: Carbon Token Locker

This folder contains the **smart contracts** powering the Carbon Token Locker dApp. These contracts handle locking carbon credits, issuing NFTs as proof, and offsetting credits after the lock period.

---

## Setup

### Requirements
- [Scarb](https://docs.swmansion.com/scarb/) (>= v2.6.0)

### Compile Contracts
```bash
scarb build
```

### Test Contracts
```bash
scarb test
```

To run a specific test:

```bash
scarb test <name_of_the_test>
```

### Format
```bash
scarb fmt
```