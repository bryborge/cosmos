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

*   [Packer](https://www.packer.io/) - Identical machine images for multiple platforms from a single source 
    configuration.
*   [Cloud Init](https://cloudinit.readthedocs.io/en/latest/) - Industry standard multi-distribution method for
    cross-platform cloud instance initialization.
*   [Terraform](https://www.terraform.io/) - IaC tool for building, changing, and versioning infrastructure safely
    and efficiently.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
