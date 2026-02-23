# kquicvm

- Set up: `./fetch-setup.sh`, which downloads the relevant Ubuntu 24.04 LTS cloud init image.
- `./start.sh`, which sets up the VM using cloud init, with username `testuser` and password `password` (very secure, I know). Run with `./start.sh vm1` to create a VM called vm1
- `./run-vm.sh`, which runs the VM. Run with parameters: `./run-vm.sh img/vm1.img`
