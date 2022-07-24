# Cosmos

> "If you wish to make an apple pie from scratch, you must first invent the universe."
> 
> -- Carl Sagan

## About the Project

Cosmos is a monorepo where I define and manage infrastructure in my homelab, and on various cloud provider platforms,
adhering to infrastructure-as-code principles where possible.

## Naming Structure

| Name                        | Description                         |
| --------------------------- | ----------------------------------- |
| _Cosmos_                    | _This IaC monorepo_                 |
| Galaxy Name                 | A platform (e.g. AWS, GCP, Proxmox) |
| Star Name                   | A Virtual Private Cloud (VPC)       |
| Planetary/Space Object Name | A Computational Resource            |

### Tools

*   [Ansible](https://www.ansible.com/) - Machine provisioning automation platform.
*   [Cloud Init](https://cloudinit.readthedocs.io/en/latest/) - Industry standard multi-distribution method for
    cross-platform cloud instance initialization.
*   [Packer](https://www.packer.io/) - Identical machine images for multiple platforms from a single source 
    configuration.
*   [Terraform](https://www.terraform.io/) - IaC tool for building, changing, and versioning infrastructure safely
    and efficiently.
*   [pass](https://www.passwordstore.org/) - CLi Password Manager.
    *   [How to configure](https://www.howtogeek.com/devops/how-to-use-pass-a-command-line-password-manager-for-linux-systems/)
## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
