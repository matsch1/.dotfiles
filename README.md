<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">

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
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

This are my dotfiles.
They are managed using [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html).
  
I no longer use all of that tools, so it can be that some of the doftfiles are not up to date.

### Current Stack

**Terminal & Shell**
- WezTerm
- Zsh
- Zellij (terminal multiplexer)

**Tools**
- Neovim (editor)
- Yazi (file manager)
- fzf (fuzzy finder)
- Git -> Lazygit (version control)

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
    ├── ghostty
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
    ├── wezterm
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

<div align="right">

[![][back-to-top]](#top)

</div>


[back-to-top]: https://img.shields.io/badge/-BACK_TO_TOP-151515?style=flat-square

