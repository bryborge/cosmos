# ☁️  Amazon Web Services (AWS)

All the Infrastructure as Code (IaC) for the various resources in AWS that I use lives here.

## 🌎 Overview

All infrastructure for this platform provider is managed with [Terraform](https://www.terraform.io/) which, as written
here, heavily leverages the concept of [modules](https://developer.hashicorp.com/terraform/language/modules) to provide
a logical structure that enables me to speak at a "higher level" about my services and not about the low-level
components that make up my service infrastructure. Modules are sharable and re-usable to boot!

```sh
.
├── environments         # All of the various "live" environments I maintain on the AWS platform.
│   ├── development      # All of the "services" deployed within the specified environment.
│   │   ├── service-1    #   - A "service" is essentially a "root module" in Terraform parlance.
│   │   └── service-n    #   - A "service" is often comprised of several infrastructure components, or "sub-modules".
│   ├── production
│   └── staging
└── modules              # All sharable/re-usable modules that defines pieces of larger service infrastructure.
    ├── module-1         #   - A "module" is designed to be a reusable component that can be used in various services.
    └── module-n
```

### 🗒️  Hashicorp License Change

On 10 Aug, 2023, Hashicorp announced that they were changing Terraform's license from
[MPLv2](https://www.mozilla.org/en-US/MPL/2.0/) to [BSL](https://www.hashicorp.com/bsl). At some point, I will make the
switch to [OpenTofu](https://opentofu.org/). Until that time, I will remain on Terraform v1.5.5 which is still under
MPLv2.

For further reading, check out these articles from Terragrunt:
*   [The Impact of the HashiCorp License Change on Gruntwork Customers](https://blog.gruntwork.io/the-impact-of-the-hashicorp-license-change-on-gruntwork-customers-5fcd096ba86a)
*   [The Future of Terraform Must Be Open](https://blog.gruntwork.io/the-future-of-terraform-must-be-open-ab0b9ba65bca)

## 🚀 Getting Started

These instructions will walk you through tooling installation and setup on your local machine.

**Note:** The following steps assumes you are installing this project on a machine running macOS.

### ✅ Prerequisites

*   [Homebrew](https://brew.sh/) - The missing package manager for macOS.
*   [tfenv](https://github.com/tfutils/tfenv) - Terraform version manager.
*   [Terragrunt](https://terragrunt.gruntwork.io/) - A thin wrapper that provides extra tools for keeping configurations
    DRY, working with multiple Terraform modules, and managing remote state.
*   [terraform-docs](https://github.com/terraform-docs/terraform-docs/) - A utility to generate documentation from
    Terraform modules in various output formats.

### 💻 Installing

1.  Install tfenv and terragrunt.

    ```sh
    brew install tfenv terragrunt
    ```

2.  Install terraform with tfenv (it will install the specified version in `.terraform-version` file).

    ```sh
    tfenv install
    ```

## 🧠 Additional Materials

*  [How to Build Reusable, Composable, Battle-tested Terraform Modules](https://www.youtube.com/watch?v=LVgP63BkhKQ)
