# Dotfiles

Welcome to my dotfiles repository! This repository is managed using [chezmoi](https://www.chezmoi.io), a tool for managing your dotfiles across multiple machines.

## Getting Started

### Prerequisites

- **Git**: Ensure you have Git installed on your system.
- **curl**: Used for downloading chezmoi.

### Installation

1. **Clone the Repository:**

   ```sh
   git clone https://github.com/BaguetteBoiTuna/dotfiles.git
   cd dotfiles
   ```

2. **Install chezmoi:**

   ```sh
   sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply BaguetteBoiTuna
   ```

This command initializes chezmoi and applies the dotfiles in this repository to your home directory.

### Adding New Dotfiles

To add a new dotfile to your repository, use the following command:

```sh
chezmoi add ~/.yourdotfile
```

This will add `~/.yourdotfile` to the chezmoi source directory and create a template file if specified.

### Applying Changes

After making changes to your dotfiles, apply them using:

```sh
chezmoi apply
```

This command ensures your dotfiles are updated according to the templates and configurations defined.

## Configuration and Templates

chezmoi uses [templates](https://www.chezmoi.io/docs/templates/) to manage machine-specific configurations. Here's an example of how to use templates with chezmoi:

1. **Creating a Template:**

   ```sh
   chezmoi add --template ~/.gitconfig
   ```

2. **Editing the Template:**

   ```sh
   chezmoi edit ~/.gitconfig
   ```

   Example content of `~/.local/share/chezmoi/dot_gitconfig.tmpl`:

   ```tmpl
   [user]
       email = {{ .email | quote }}
   ```

3. **Defining Variables:**

   Define variables in `~/.config/chezmoi/chezmoi.toml`:

   ```toml
   [data]
       email = "me@home.org"
   ```

## Scripts

You can add scripts to automate tasks during dotfile application. Place your scripts in the `.chezmoiscripts` directory.

Example script `run_once_after_update-config-and-install-plugins.sh.tmpl`:

```sh
#!/bin/sh
# This script runs once after chezmoi updates the configuration
```

## Updating Dotfiles

To pull the latest changes from your remote repository and apply them, use:

```sh
chezmoi update
```

## Ignoring Files

Use a `.chezmoiignore` file to ignore specific files or directories:

```
README.md
```

## Resources

- [chezmoi Documentation](https://www.chezmoi.io/docs/)
- [GitHub Repository](https://github.com/twpayne/chezmoi)
