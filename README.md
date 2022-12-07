<div align="center">
  <br />
  <img src="assets/imgs/logo.png" alt="The Cosmos project logo depicting an astronaut" width="190" height="226" />
  <br />
  <h1 align="center">Cosmos</h1>
  <p align="center">
    <i>"If you wish to make an 🍎 🥧 from scratch, you must first invent the universe."</i> -- Carl Sagan
    <br />
    <br />
    <a href="https://github.com/sonofborge/cosmos/README.md"><strong>Explore the docs »</strong></a>
  </p>
  <br />
</div>

## Table of Contents

<details>
  <summary>Show/Hide</summary>
  <ol>
    <li>
      <a href="#-about-the-project">About The Project</a>
      <ul>
        <li><a href="#-definitions">Definitions</a></li>
      </ul>
    </li>
    <li>
      <a href="#-structure">Structure</a>
      <ul>
        <li><a href="#golden-images">Golden Images</a></li>
        <li><a href="#infrastructure">Infrastructure</a></li>
      </ul>
    </li>
    <li>
      <a href="#-tooling">Tooling</a>
    </li>
    <li>
      <a href="#-license">License</a>
    </li>
    <li>
      <a href="#-further-reading">Further Reading</a>
    </li>
  </ol>
</details>

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

## 🧬 Structure

This project is split out into two primary sections -- "golden image" definitions and infrastructure (iac).

### Golden Images

```sh
📁 golden-images # base image templates, organized by os/distro
├── 📁 ...
└── 📁 ubuntu
    ├── 📁 cloud-init   # config for cloud-init
    ├── 📁 packer       # Packer code, organized by plugin/provider
    └── 📁 provisioners # Ansible and shell code
```
### Infrastructure

```sh
📁 infrastructure # infrastructure defined as code
├── 📁 aws        # Amazon Web Services (provider)
├── 📁 ...
└── 📁 proxmox    # Proxmox VE Server (on-prem)
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
