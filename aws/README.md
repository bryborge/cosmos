# ☁️  Amazon Web Services (AWS)

All the Infrastructure as Code (IaC) for the various resources in AWS that I use lives here.

## 🌎 Overview

All infrastructure for this platform provider is managed with [Terraform](https://www.terraform.io/) which, as written
here, heavily leverages the concept of [modules](https://developer.hashicorp.com/terraform/language/modules) to provide
a logical structure that enables me to speak at a "higher level" about my services and not about the low-level
components that make up my service infrastructure. Modules are sharable and re-usable to boot!

```sh
.
├── live                 # All of the various "live" environments I maintain on the AWS platform.
│   ├── development      # All of the "services" deployed within the specified environment.
│   │   ├── service-1    #   - A "service" is essentially a "root module" in Terraform parlance.
│   │   └── service-n    #   - A "service" is often comprised of several infrastructure components, or "sub-modules".
│   ├── production
│   └── staging
└── modules              # All sharable/re-usable modules that defines pieces of larger service infrastructure.
    ├── module-1         #   - A "module" is designed to be a reusable component that can be used in various services.
    └── module-n
```

## 🚀 Getting Started

These instructions will walk you through tooling installation and setup on your local machine.

**Note:** The following steps assumes you are installing this project on a machine running macOS.

### ✅ Prerequisites

*   [Homebrew](https://brew.sh/) - The missing package manager for macOS.
*   [tfenv](https://github.com/tfutils/tfenv)
*   [Terragrunt](https://terragrunt.gruntwork.io/)

### 💻 Installing

1.  Install tfenv and terragrunt.

    ```sh
    brew install tfenv terragrunt
    ```

2.  Install terraform with tfenv (it will install the specified version in `.terraform-version` file).

    ```sh
    tfenv install
    ```
