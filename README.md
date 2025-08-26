# Cosmos

> "If you wish to make an 🍎 🥧 from scratch, you must first invent the universe."
>
> -- Carl Sagan

## 🚀 About the Project

**Cosmos** is a monorepo where the infrastructure on various cloud provider platforms is defined, adhering to Infrastructure as Code (IaC) principles where possible.

## 🧬 Structure

This project is subdivided by cloud provider platform. Each platform contains documentation specific to what tools are used to manage it, and how to use them.

## 🔧 Tooling

*   [Ansible](https://www.ansible.com/) - a radically simple IT automation platform that makes your applications and systems easier to deploy and maintain.
*   [Terraform](https://www.terraform.io/) - Infrastructure automation to provision and manage resources in any cloud or data center.
*   [Secrets OPerationS (SOPS)](https://github.com/mozilla/sops) - Simple and flexible tool for managing secrets.
*   [Age](https://github.com/FiloSottile/age) - A simple, modern and secure encryption tool (and Go library) with small explicit keys, no config options, and UNIX-style composability.

## 🔐 SecOps

IT security and strategies for handling secrets is an entire discipline to itself. After much deliberation and weighing tradeoffs, I settled on using SOPs and Age for encryption of sensitive information that will be committed to version control.

| Pros | Cons |
|------|------|
| Ease of intergration (in the future) with other key management services | Operational overhead |
| File format agnostic | Key management complexity |
| It's free 💰 |  |

#### ✏️ Edit Encrypted File

*   Decrypt a file (in-place):

    ```sh
    sops --decrypt --in-place terraform.tfvars.enc
    ```

*   Make whatever edits you need.

*   Encrypt it (in-place):

    ```sh
    sops --encrypt --in-place terraform.tfvars.enc
    ```

### Please Note

This, by itself, is **NOT** comprehensive, but I have judged this to be "adequate enough" for my purposes. None of the workloads, systems, or processes I manage here are life-or-death. This project is, in large part, centered around learning and tinkering. That said, I have taken time to consider what security means to me and my IT infrastructure, and implore you to do the same.

## 🔤 Naming Convention

The following convention is used to name various instances of compute:

*   **Platform**

    Describes "where" the compute lives.

    | Code  | Description             |
    |-------|-------------------------|
    | `HLB` | Homelab                 |
    | `AWS` | Amazon Web Services     |
    | `GCP` | Google Cloud Platform   |
    | `MAZ` | Microsoft Azure         |

*   **Compute Type**

    Describes the "material" composition of the compute unit.

    | Code | Description       |
    |------|-------------------|
    | `P`  | Physical machine  |
    | `V`  | Virtual machine   |

*   **Configuration**

    Describes the "relationship" of the compute unit to other units.

    | Code | Description  |
    |------|--------------|
    | `S`  | Standalone   |
    | `C`  | Cluster      |

*   **Environment**

    Describes the environment "volatility" that the compute unit resides in. (e.g., development is highly volatile, test is less volatile but still not guaranteed to be fully operational, and production is reliable/available).

    | Code | Description   |
    |------|---------------|
    | `D`  | Development   |
    | `T`  | Test          |
    | `P`  | Production    |

*   **Numeric ID**

    Provides a "unique" numeric identifier (most useful for identifying units of compute in a large cluster configuration).

    | Code  | Description                           |
    |-------|---------------------------------------|
    | `NNN` | (ex: `001`, `002`, ... `100`)         |

### Examples

*   `HLB-PSD-001` - A **homelab**-hosted (`HLB`) **physical** machine (`P`) in a **standalone** (`S`) configuration used
    for **development** (`D`) environment workloads.

*   `AWS-VCP-666` - An **AWS**-hosted (`AWS`) **virtual** machine (`V`) in a **cluster** (`C`) configuration used for
    **production** (`P`) environment workloads.
