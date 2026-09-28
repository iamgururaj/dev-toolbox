# Repository Guidelines

## Linux Scripts

Keep Bash utilities in `linux/`. Most commands use extensionless names, such as `gac`, `gco`, and `ni`; shared helpers include `log_info.sh` and `log_time.sh`. Use the actual filenames when running commands.

Run a script directly with Bash:

```bash
bash /path/to/dev-toolbox/linux/gb
```

To run commands by name, make the required scripts executable and add the directory to your shell profile:

```bash
chmod +x /path/to/dev-toolbox/linux/gb
export PATH="$PATH:/path/to/dev-toolbox/linux"
```

Reload your profile or open a new terminal. Start Bash scripts with `#!/bin/bash`, quote path and argument variables, and follow the surrounding indentation. Use the existing `log_run` helper for command logging, loading it relative to the script's directory.

## Windows Scripts

Keep Windows batch utilities in `win/` with a `.cmd` extension, such as `gac.cmd`, `gco.cmd`, and `ni.cmd`.

Run a script from PowerShell using its path:

```powershell
.\win\gb.cmd
```

Run `set-win-path.cmd` from the repository root to add `win/` to your user PATH, then open a new terminal.

Start batch scripts with `@echo off`, use `REM` for comments, and quote paths that may contain spaces. Follow existing argument handling and return a nonzero exit code when an operation fails.

## Shared Usage and Maintenance

Install Git for Git commands, Node.js/npm for npm commands, and Maven for Maven commands. Run utilities from the target repository or project directory; operations use that working directory.

Use matching command names and behavior across Linux and Windows where applicable. Keep scripts small and update `README.md` when adding or changing command usage.
