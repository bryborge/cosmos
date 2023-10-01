# ☁️  Amazon Web Services (AWS)

All the Infrastructure as Code (IaC) for the various resources in AWS that I use lives here.

## 🌎 Overview

All infrastructure for this platform provider is managed with [Terraform](https://www.terraform.io/) and follows the
following structure.

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
