# Golden Images

## Versioning

Golden images in this project use Semantic Versioning ([SemVer](https://semver.org/)). Versions are defined in a file
called `version.pkrvars.hcl` located at each OS distro's base directory.

## Useful Commands

*   Validate all Ubuntu builds.

    ```sh
    packer validate -var-file="../../version.pkrvars.hcl" .
    ```

*   Validate an Ubuntu 22.04 Proxmox build.

    ```sh
    packer validate \
      -only=ubuntu.proxmox.22.04 \
      -var-file="../../version.pkrvars.hcl" .
    ```

*   Build an Ubuntu 22.04 AWS golden image.

    ```sh
    packer build \
      -only=ubuntu.amazon-ebs.22.04 \
      -var "distro_short_name=jammy" \
      -var-file="../../version.pkrvars.hcl" .
    ```

*   Build an Ubuntu 20.04 Proxmox golden image.

    ```sh
    packer validate \
      -only=ubuntu.proxmox.20.04 \
      -var "distro_short_name=focal" \
      -var-file="../../version.pkrvars.hcl" .
    ```

*   Query for a specific AMI's information

    ```sh
    aws ssm get-parameters --names \
      /aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id
    ```

## References

*   [Ubuntu Image Locator](https://cloud-images.ubuntu.com/locator/) - Ubuntu cloud image location lookup.
