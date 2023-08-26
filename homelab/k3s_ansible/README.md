## K3s Ansible

Provision a [Lightweight Kubernetes (k3s)](https://k3s.io/) cluster with Ansible.

## 🛠️ Built With

*   [Python](https://www.python.org/)
*   [Ansible](https://www.ansible.com/)
*   [Jinja](https://jinja.palletsprojects.com/)

## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine.

**Note:** The following steps assumes you are installing this project on a machine running macOS.

### ✅ Prerequisites

*   [Homebrew](https://brew.sh/) - The missing package manager for macOS.
*   [pyenv](https://github.com/pyenv/pyenv/) - Simple Python version management.

### 💻 Installing

1.  Install pyenv (via Homebrew)

    ```sh
    brew install pyenv
    ```

2.  Install python with pyenv (it will install the specified version in the `.python-version` file)

    ```sh
    pyenv install
    ```

3.  Install pipenv with pip

    ```sh
    pip install pipenv
    ```

4.  Open a shell with the correct version of python

    ```sh
    pipenv shell
    ```

5.  Install dependencies (including `development` dependencies)

    ```sh
    pipenv install --dev
    ```

## Testing

*   `ansible-lint` - Code style linter for Ansible

tbd

## Usage

tbd

## 📚 Resources

*   [Official Ansible Documentation](https://docs.ansible.com/)
