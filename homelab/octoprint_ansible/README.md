# 🐙 Octoprint Ansible

Provisions [Octoprint](https://octoprint.org/) server with Ansible on Raspberry Pi.

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

## Usage

To run updates and reboots, run those playbooks as needed.

```sh
ansible-playbook playbooks/update.yml
ansible-playbook playbooks/reboot.yml
```

## Octoprint Webcam

To get the USB Logitech webcam working for both still images and streaming, add the following values under
`Settings > Plugins > Classic Webcam` in the Octoprint UI:

**Stream URL:** `http://<server-ip>:8080/?action=stream`
**Snapshot URL:** `http://127.0.0.1:8080/?action=snapshot`

## 📚 Resources

*   [Official Ansible Documentation](https://docs.ansible.com/)
