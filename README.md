<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">

<img src="readmeai/assets/logos/purple.svg" width="30%" style="position: relative; top: 0; right: 0;" alt="Project Logo"/>

# .DOTFILES

<em></em>

<!-- BADGES -->
<!-- local repository, no metadata badges. -->

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/JSON-000000.svg?style=default&logo=JSON&logoColor=white" alt="JSON">
<img src="https://img.shields.io/badge/TOML-9C4121.svg?style=default&logo=TOML&logoColor=white" alt="TOML">
<img src="https://img.shields.io/badge/GNU%20Bash-4EAA25.svg?style=default&logo=GNU-Bash&logoColor=white" alt="GNU%20Bash">
<img src="https://img.shields.io/badge/Lua-2C2D72.svg?style=default&logo=Lua&logoColor=white" alt="Lua">

</div>
<br>

---

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

This are the dotfiles I am currently using. 
They are managed using [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html).

---

## Features

<code>❯ REPLACE-ME</code>

---

## Project Structure

```sh
└── .dotfiles/
    ├── README.md
    ├── alacritty
    ├── autostart
    ├── bash
    ├── conky
    ├── flutter
    ├── fzf
    ├── git
    ├── nvim
    ├── scripts
    │   ├── autostart_conky.sh
    │   ├── autostart_main.sh
    │   ├── git-autopush.sh
    │   ├── konsole-autostart.sh
    │   ├── matschbackup.sh
    │   ├── mount_hdds.sh
    │   ├── nas-backup.sh
    │   ├── setup-profile.sh
    │   ├── setup.sh
    │   ├── shutdown.sh
    │   ├── utils
    │   └── windows
    ├── shell
    │   ├── aliases.sh
    │   ├── envs.sh
    │   ├── functions.sh
    │   ├── projects.sh
    │   └── tools.sh
    ├── shutdown
    ├── tmux
    ├── vscode
    ├── yazi
    ├── zellij
    └── zsh
```

---

## Getting Started

### Prerequisites

This project requires the following dependencies:

- **Programming Language:** Shell
- **Tools:** [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html)

### Installation

Build .dotfiles from the source and intsall dependencies:

1. **Clone the repository:**

    ```sh
    git clone ../.dotfiles
    ```

2. **Navigate to the project directory:**

    ```sh
    cd .dotfiles
    ```


### Usage

Run the project with:

    ```sh
    stow <package_name>
    ```

---

## Contributing

- **💬 [Join the Discussions](https://LOCAL/matsch/.dotfiles/discussions)**: Share your insights, provide feedback, or ask questions.
- **🐛 [Report Issues](https://LOCAL/matsch/.dotfiles/issues)**: Submit bugs found or log feature requests for the `.dotfiles` project.
- **💡 [Submit Pull Requests](https://LOCAL/matsch/.dotfiles/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your LOCAL account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone /home/matsch/.dotfiles
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to LOCAL**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="left">
   <a href="https://LOCAL{/matsch/.dotfiles/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=matsch/.dotfiles">
   </a>
</p>
</details>

---

## License

.dotfiles is protected under the [LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

<div align="right">

[![][back-to-top]](#top)

</div>


[back-to-top]: https://img.shields.io/badge/-BACK_TO_TOP-151515?style=flat-square

