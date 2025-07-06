# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Codchi Development Environment

This is a Codchi configuration for creating a reproducible development environment with VSCode and aider-chat. Codchi is a development environment management tool by aformatik that uses NixOS modules to create isolated, reproducible development environments.

### Configuration Files

- `codchi.nix`: NixOS system-level configuration module that defines the code machine environment
  - Enables unfree packages (required for VSCode)
  - Installs VSCode in the system environment
- `shell.nix`: Development shell configuration for command-line tools
  - Provides Python 3 and Git
  - Automatically installs aider-chat via pip on shell entry

### Development Workflow

**Initialize Codchi Environment:**
```bash
# Initialize the code machine from this directory
codchi init vscode-aider . nixosModules.default

# Launch VSCode in the environment
codchi exec vscode-aider code

# Enter development shell with aider
codchi exec vscode-aider nix-shell
```

**Inside the development environment:**
```bash
aider        # Start AI pair programming
code .       # Open current directory in VSCode (if not already open)
```

**Management Commands:**
```bash
codchi status                    # Check environment status
codchi rebuild vscode-aider      # Apply configuration changes
codchi delete vscode-aider       # Remove environment
```

### Architecture

This configuration creates an AI-assisted development environment:
- **System level**: VSCode IDE with unfree package support
- **Shell level**: Python toolchain with Git and aider-chat for AI pair programming
- **Isolation**: Uses Codchi's containerization for reproducible environments
- **Portability**: Works across Windows (WSL) and Linux via Codchi

The setup is optimized for AI-assisted development workflows using aider-chat while providing a full IDE experience through VSCode.