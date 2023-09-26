# ☸️ K3s Ansible

Provisions a [Lightweight Kubernetes (k3s)](https://k3s.io/) cluster with Ansible.

This is intentionally _not_ a high availability (HA) cluster configuration. By design, this is a basic k3s cluster for
tinkering and learning Kubernetes. In the future, this will be refactored for HA (and fault tolerance) like a proper
production cluster.

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

To create the k3s cluster, run the base playbook.

```sh
ansible-playbook site.yml
```

To run updates and reboots, run those playbooks as needed.

```sh
ansible-playbook playbooks/update.yml
ansible-playbook playbooks/reboot.yml
```

To remove k3s from all nodes, run the reset playbook.

```sh
ansible-playbook playbooks/reset.yml
```

## 📚 Resources

*   [Official Ansible Documentation](https://docs.ansible.com/)
