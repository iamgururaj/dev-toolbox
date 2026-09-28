# Dev Scripts Kit

This repository contains helper scripts for Git operations on both Windows and Linux.


## Available Commands

Below is a list of available scripts for both Linux and Windows, with their usage:

### Linux Scripts (in `linux/`)

| Script    | Usage Example                        | Description                                 |
|-----------|--------------------------------------|---------------------------------------------|
| gaa.sh    | `gaa.sh`                             | git add .                                   |
| gac.sh    | `gac.sh "commit msg"`               | git add . & commit with message             |
| gacp.sh   | `gacp.sh` (interactive)              | git add . & commit & push (prompts for msg & branch) |
| gb.sh     | `gb.sh`                              | git branch                                  |
| gsu.sh    | `gsu.sh`                             | set upstream to origin/<current-branch>     |
| gcl.sh    | `gcl.sh <repo-url>`                  | git clone <repo-url>                        |
| gcm.sh    | `gcm.sh`                             | git checkout main                           |
| gco.sh    | `gco.sh <branch>`                    | git checkout <branch>                       |
| gcob.sh   | `gcob.sh <branch>`                   | git checkout -b <branch>                    |
| gcom.sh   | `gcom.sh`                            | git checkout master                         |
| gi.sh     | `gi.sh`                              | git init                                    |
| gm.sh     | `gm.sh <branch>`                     | git merge <branch>                          |
| gp.sh     | `gp.sh`                              | git push                                    |
| gpf.sh    | `gpf.sh` (interactive)               | pull file from branch, commit, push         |
| gpom.sh   | `gpom.sh`                            | git push origin main                        |
| gpso.sh   | `gpso.sh <branch>`                   | git push origin <branch>                    |
| gr.sh     | `gr.sh <remote-url>`                 | git remote add origin <url>                 |
| gs.sh     | `gs.sh`                              | git status                                  |
| nb.sh     | `nb.sh <branch>`                     | git checkout -b <branch>                    |
| nci.sh    | `nci.sh`                             | npm ci                                      |
| nd.sh     | `nd.sh`                              | npm run dev                                 |
| ni.sh     | `ni.sh`                              | npm install                                 |
| nid.sh    | `nid.sh`                             | npm install & npm run dev                   |
| nl.sh     | `nl.sh`                              | npm list                                    |
| np.sh     | `np.sh`                              | npm publish                                 |
| ns.sh     | `ns.sh`                              | npm start                                   |
| nt.sh     | `nt.sh`                              | npm test                                    |

### Windows Scripts (in `win/`)

| Script    | Usage Example                        | Description                                 |
|-----------|--------------------------------------|---------------------------------------------|
| gaa.cmd   | `gaa.cmd`                            | git add .                                   |
| gac.cmd   | `gac.cmd "commit msg"`              | git add . & commit with message             |
| gacp.cmd  | `gacp.cmd` (interactive)             | git add . & commit & push (prompts for msg & branch) |
| gb.cmd    | `gb.cmd`                             | git branch                                  |
| gsu.cmd   | `gsu.cmd`                            | set upstream to origin/<current-branch>     |
| gcl.cmd   | `gcl.cmd <repo-url>`                 | git clone <repo-url>                        |
| gcm.cmd   | `gcm.cmd`                            | git checkout main                           |
| gco.cmd   | `gco.cmd <branch>`                   | git checkout <branch>                       |
| gcob.cmd  | `gcob.cmd <branch>`                  | git checkout -b <branch>                    |
| gcom.cmd  | `gcom.cmd`                           | git checkout master                         |
| gi.cmd    | `gi.cmd`                             | git init                                    |
| gm.cmd    | `gm.cmd <branch>`                    | git merge <branch>                          |
| gp.cmd    | `gp.cmd`                             | git push                                    |
| gpf.cmd   | `gpf.cmd` (interactive)              | pull file from branch, commit, push         |
| gpom.cmd  | `gpom.cmd`                           | git push origin main                        |
| gpso.cmd  | `gpso.cmd <branch>`                  | git push origin <branch>                    |
| gr.cmd    | `gr.cmd <remote-url>`                | git remote add origin <url>                 |
| gs.cmd    | `gs.cmd`                             | git status                                  |
| gcf.cmd   | `gcf.cmd`                            | git clean -fd (remove untracked files/dirs)  |
| nb.cmd    | `nb.cmd <branch>`                    | git checkout -b <branch>                    |
| nci.cmd   | `nci.cmd`                            | npm ci                                      |
| nd.cmd    | `nd.cmd`                             | npm run dev                                 |
| ni.cmd    | `ni.cmd`                             | npm install                                 |
| nid.cmd   | `nid.cmd`                            | npm install & npm run dev                   |
| nl.cmd    | `nl.cmd`                             | npm list                                    |
| np.cmd    | `np.cmd`                             | npm publish                                 |
| ns.cmd    | `ns.cmd`                             | npm start                                   |
| nt.cmd    | `nt.cmd`                             | npm test                                    |

Windows `nxs.cmd <package> [additional params...]` runs `npx skills add` with Codex, GitHub Copilot, and Claude Code selected by default. Extra arguments are forwarded, for example: `nxs.cmd vercel-labs/agent-skills --skill web-design-guidelines`.

### Global Skill Installation (Linux/macOS and Windows)

Use `nxsg <package> [additional params...]` to install skills globally for Codex, GitHub Copilot, and Claude Code. Both `linux/nxsg` and `win/nxsg.cmd` forward extra arguments to `npx skills add` and include `-g`.

```sh
nxsg vercel-labs/agent-skills --skill web-design-guidelines
```

On Linux/macOS, make the script executable with `chmod +x /path/to/dev-toolbox/linux/nxsg` and add `linux/` to PATH. On Windows, add `win/` to PATH or run `.\win\nxsg.cmd <package>` from PowerShell. Node.js/npm must be installed.

## Instructions

### Adding Scripts to PATH

#### Windows

##### Automatic Setup (Recommended)

Simply run the provided setup script from Command Prompt, PowerShell, or by double-clicking it:

```cmd
set-win-path.cmd
```
*(or `setup-path.cmd`)*

This script automatically resolves the full absolute path of the `win` directory and adds it permanently to your User `PATH` environment variable without length limits, and makes all commands (`gaa`, `gac`, `gacp`, `gp`, `gs`, etc.) immediately executable from any terminal.

##### Manual Setup

To manually add the `win` folder to your system PATH:

1. Open the Start menu and search for "Environment Variables".
2. Click on "Edit the system environment variables".
3. In the System Properties window, click "Environment Variables...".
4. Under "System variables" or "User variables", find and select the `Path` variable, then click "Edit...".
5. Click "New" and add the full path to your `win` folder (e.g., `C:\guru\projects\dev-toolbox\win`).
6. Click OK to save and close all dialogs.
7. Restart your terminal or Command Prompt for changes to take effect.

Now you can run `gac.cmd` or `gacp.cmd` from any directory.

#### Linux

To run the scripts from any directory, add the `linux` folder to your PATH. You can do this by adding the following line to your `~/.bashrc`, `~/.zshrc`, or equivalent shell profile:

```bash
export PATH="$PATH:/path/to/dev-scripts-kit/linux"
```

Replace `/path/to/dev-scripts-kit/linux` with the actual path to your `linux` folder. Then reload your shell configuration:

```bash
source ~/.bashrc  # or source ~/.zshrc
```

Now you can run `gac.sh` or `gacp.sh` from any directory.

### Windows

1. Open a Command Prompt or PowerShell window.
2. Navigate to the repository directory:
   ```powershell
   cd path\to\dev-scripts-kit\win
   ```
3. Run the desired script:
   - To add and commit:
     ```powershell
     .\gac.cmd "Your commit message here"
     ```
   - To add, commit, and push:
     ```powershell
     .\gacp.cmd "Your commit message here"
     ```

### Linux

1. Open a terminal window.
2. Navigate to the repository directory:
   ```bash
   cd path/to/dev-scripts-kit/linux
   ```
3. Make the script executable (first time only):
   ```bash
   chmod +x gac.sh gacp.sh
   ```
4. Run the desired script:
   - To add and commit:
     ```bash
     ./gac.sh "Your commit message here"
     ```
   - To add, commit, and push:
     ```bash
     ./gacp.sh "Your commit message here"
     ```

---

## Notes
- Make sure you have Git installed and configured on your system.
- These scripts assume you are in a Git repository directory.
- `gsu.sh` / `gsu.cmd` require a real branch checkout and an existing `origin/<branch>` remote-tracking ref; they will fail on detached HEAD or if the branch has not been fetched/pushed yet.
- For any issues, check script permissions and your Git configuration.
