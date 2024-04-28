<div align="center">
  <br />
  <img src="../assets/logo.png?raw=true" alt="The Cosmos project logo depicting an astronaut" width="190" height="226" />
  <br />
  <h1 align="center">Cosmos</h1>
  <p align="center">
    <i>"If you wish to make an 🍎 🥧 from scratch, you must first invent the universe."</i> -- Carl Sagan
    <br />
    <br />
    <a href="https://github.com/bryborge/cosmos/blob/main/README.md">
      <strong>Explore the docs »</strong>
    </a>
  </p>
  <br />
</div>

## 🚀 About the Project

**Cosmos** is a monorepo where I define and manage infrastructure in my homelab and on various cloud provider platforms,
adhering to Infrastructure as Code (IaC) principles where possible.

### 🧬 Structure

This project is subdivided by cloud provider platform.  Each platform contains documentation specific to what tools are
used to manage it, and how to use them.

### 📖 Definitions

*   IT Infrastructure

    > _Information technology (IT) infrastructure are the components required to operate and manage enterprise IT
    > environments. IT infrastructure can be deployed within a cloud computing system, or within an organization's own
    > facilities._
    >
    > -- Red Hat ([Source article](https://www.redhat.com/en/topics/cloud-computing/what-is-it-infrastructure))

*   Infrastructure as Code

    With that understanding of IT Infrastructure, we can describe Infrastructure as Code (IaC) in the following way.

    > _Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code instead of through
    > manual processes._
    >
    > -- Red Hat ([Source article](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac))

## 🔧 Tooling

*   [Ansible](https://www.ansible.com/) - a radically simple IT automation platform that makes your applications and
    systems easier to deploy and maintain.
*   [Terraform](https://www.terraform.io/) - Infrastructure automation to provision and manage resources in any cloud or data center.
*   [Secrets OPerationS (SOPS)](https://github.com/mozilla/sops) - Simple and flexible tool for managing secrets.
*   [Age](https://github.com/FiloSottile/age) - A simple, modern and secure encryption tool (and Go library) with small
    explicit keys, no config options, and UNIX-style composability.

## 🔐 Security / Secrets Management

TODO: Add overview of secrets management in general and why it's important, considerations, SOPs and Age, and alternatives.

## 🔤 Naming Convention

I use the following convention to name my compute where possible:

*   **Platform**
    *   `HLB` = Homelab
    *   `AWS` = Amazon Web Services
    *   `GCP` = Google Cloud Platform
    *   `MAZ` = Microsoft Azure
*   **Compute Type**
    *   `P` = Physical machine
    *   `V` = Virtual machine
*   **Configuration**
    *   `S` = Standalone
    *   `C` = Cluster
*   **Environment**
    *   `D` = Development
    *   `T` = Test
    *   `P` = Production
*   **Sequential ID**
    *   `NNN` = (ex: `001`, `002`, ... `100`)

### Examples

*   `HLB-PSD-001` - A **homelab**-hosted (`HLB`) **physical** machine (`P`) in a **standalone** (`S`) configuration used
    for **development** (`D`) environment workloads.

*   `AWS-VCP-666` - An **AWS**-hosted (`AWS`) **virtual** machine (`V`) in a **cluster** (`C`) configuration used for
    **production** (`P`) environment workloads.

## 🪪 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
