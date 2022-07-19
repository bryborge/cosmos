# Packer-generated Base Images

## Versioning

Base images in this project use Semantic Versioning ([SemVer](https://semver.org/)). Versions are defined in a file
called `versions.pkrvars.hcl` located at each OS distro's base directory.

## Example Commands

*   Validate all Ubuntu Proxmox builds.

    ```sh
    cd packer/ubuntu && \
    packer validate \
      -var-file="versions.pkrvars.hcl" \
      -var-file="../../secrets/proxmox/common/secrets.json" \
      -var-file="../../secrets/proxmox/packer/secrets.json" .
    ```

*   Validate an Ubuntu 22.04 Proxmox build.

    ```sh
    cd packer/ubuntu && \
    packer validate \
      -only=ubuntu.proxmox.22.04 \
      -var-file="versions.pkrvars.hcl" \
      -var-file="../../secrets/proxmox/common/secrets.json" \
      -var-file="../../secrets/proxmox/packer/secrets.json" .
    ```

*   Build an Ubuntu 22.04 Proxmox build.

    ```sh
    cd packer/ubuntu && \
    packer validate \
      -only=ubuntu.proxmox.22.04 \
      -var-file="versions.pkrvars.hcl" \
      -var-file="../../secrets/proxmox/common/secrets.json" \
      -var-file="../../secrets/proxmox/packer/secrets.json" .
    ```

## References

*   [Ubuntu Image Locator](https://cloud-images.ubuntu.com/locator/) - Ubuntu cloud image location lookup.
