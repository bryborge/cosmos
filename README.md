# Cosmos

> "If you wish to make an apple pie from scratch, you must first invent the universe."
> 
> -- Carl Sagan

## 🚀 About the Project

**Cosmos** is a monorepo where I define and manage infrastructure in my homelab and on various cloud provider platforms,
adhering to infrastructure-as-code principles where possible.

### 📖 Definitions

*   Golden Image

    > _A golden image is a base image on top of which developers can build applications, letting them focus on the
    > application itself instead of system dependencies and patches. A typical golden image includes common system,
    > logging, and monitoring tools, recent security patches, and application dependencies._
    >
    > -- Hashicorp ([Source article](https://learn.hashicorp.com/tutorials/packer/golden-image-with-hcp-packer))

*   IT Infrastructure

    > _Information technology (IT) infrastructure are the components required to operate and manage enterprise IT
    > environments. IT infrastructure can be deployed within a cloud computing system, or within an organization's own
    > facilities._
    >
    > -- Red Hat ([Source article](https://www.redhat.com/en/topics/cloud-computing/what-is-it-infrastructure))

*   Infrastructure (as Code)

    With that understanding of IT Infrastructure, we can describe Infrastructure as Code (IaC) in the following way.

    > _Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code instead of through
    > manual processes._
    >
    > -- Red Hat ([Source article](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac))

### 🧬 Structure

This project is split out into two primary sections -- "golden image" definitions and infrastructure (iac).

#### Golden Images

```sh
📁 golden-images     # base image templates defined as code
├── 📁 cloud-init    # cross-platform cloud instance initialization definition
└── 📁 distros       # version- and platform- specific build definitions by distro (e.g. ubuntu, centos)
```
#### Infrastructure

```sh
📁 infrastructure    # infrastructure defined as code
├── 📁 homelab       # on-prem infrastructure (e.g. proxmox, openstack)
└── 📁 providers     # platform-specific infrastructure (e.g. aws, gcp)
```

## 🔧 Tooling

*   [Ansible](https://www.ansible.com/) - Machine provisioning automation platform.
*   [Packer](https://www.packer.io/) - Identical machine images for multiple platforms from a single source 
    configuration.
*   [Terraform](https://www.terraform.io/) - IaC tool for building, changing, and versioning infrastructure safely
    and efficiently.
*   [pass](https://www.passwordstore.org/) - CLi Password Manager.
    *   [How to configure](https://www.howtogeek.com/devops/how-to-use-pass-a-command-line-password-manager-for-linux-systems/)
## ⭐ License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## 📚 Further Reading

*   https://learn.hashicorp.com/tutorials/packer/golden-image-with-hcp-packer
