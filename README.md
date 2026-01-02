# trah

Development environment with comprehensive tooling for modern software development.

## Overview

This repository provides a fully configured DevContainer environment with:

- **Node.js 24** with npm and pnpm
- **Python 3.12**
- **Rust** with cargo, rustfmt, and clippy
- **Conda** package manager
- **Docker-in-Docker** support
- **OpenCode AI** platform integration
- **OpenAgents** framework
- **Custom GitHub Agents** and Skills
- **Automated Workflows** for PR management

## Features

### Development Tools

- **Node.js 24**: Latest Node.js with npm and pnpm package managers
- **Python 3.12**: Modern Python with pip package manager
- **Rust**: Complete Rust toolchain with cargo, rustfmt, and clippy
- **Conda**: Miniconda for package and environment management
- **NVM**: Node Version Manager for managing multiple Node.js versions
- **Docker-in-Docker**: Run Docker containers inside the dev container

### Users and Permissions

- **app**: Primary development user with sudo privileges (default)
- **bkg**: Secondary user with sudo privileges
- Both users have full access to the workspace and development tools

### AI and Automation

- **OpenCode AI**: Global installation of OpenCode platform
- **OpenAgents**: Integration with OpenAgents framework from https://github.com/darrenhinde/OpenAgents
- **Custom Agents**: Automated code review, documentation, testing, and security scanning
- **GitHub Skills**: Structured learning paths and automation patterns

### GitHub Workflows

- **Pull Request Workflow**: Automated validation and testing of PRs
- **Auto-Merge Workflow**: Automatic merging of approved PRs with `auto-merge` label
- **Close PR Workflow**: Automated PR closing and cleanup with labels like `wont-fix`, `duplicate`, `invalid`

## Getting Started

### Using the DevContainer

1. **Prerequisites**:
   - Docker installed
   - Visual Studio Code with Remote-Containers extension

2. **Open in DevContainer**:
   ```bash
   # Clone the repository
   git clone https://github.com/eyshoit-commits/trah.git
   cd trah
   
   # Open in VS Code
   code .
   
   # When prompted, click "Reopen in Container"
   # Or use Command Palette: Remote-Containers: Reopen in Container
   ```

3. **Wait for Container Build**:
   - The container will build automatically
   - Post-create scripts will install all dependencies
   - Check terminal output for installation progress

### Verify Installation

After the container starts, verify installations:

```bash
# Node.js and package managers
node --version        # Should show v24.x.x
npm --version
pnpm --version

# Python
python --version      # Should show 3.12.x

# Rust
rustc --version
cargo --version

# Conda
conda --version

# Docker
docker --version
```

### Working with the Environment

#### Node.js Development

```bash
# Install dependencies
npm install
# or
pnpm install

# Run scripts
npm run dev
npm run build
npm test
```

#### Python Development

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run Python scripts
python script.py
```

#### Rust Development

```bash
# Create new Rust project
cargo new my-project
cd my-project

# Build and run
cargo build
cargo run

# Format and lint
cargo fmt
cargo clippy
```

#### Conda Environments

```bash
# Create environment
conda create -n myenv python=3.12

# Activate environment
conda activate myenv

# Install packages
conda install numpy pandas
```

## GitHub Workflows

### Pull Request Workflow

Automatically runs when PRs are opened or updated:
- Validates PR format
- Runs linting and tests
- Comments on PR with results

### Auto-Merge Workflow

To enable auto-merge:
1. Add `auto-merge` or `automerge` label to PR
2. Ensure all checks pass
3. PR will be automatically merged

### Close PR Workflow

To auto-close a PR:
- Add label: `wont-fix`, `duplicate`, `invalid`, or `close`
- PR will be automatically closed with cleanup

## Custom Agents and Skills

### Agents

Located in `.github/agents/`:
- **Code Review Agent**: Automated code quality reviews
- **Documentation Agent**: Auto-generate documentation
- **Test Generator**: Create unit and integration tests
- **Security Scanner**: Scan for vulnerabilities
- **Workflow Automation**: Manage GitHub workflows

See `.github/agents/README.md` for details.

### Skills

Located in `.github/skills/`:
- Pull Request Management
- Code Quality
- CI/CD Workflows
- Collaboration

See `.github/skills/README.md` for details.

## OpenCode Integration

OpenCode AI platform is installed globally during container build:

```bash
# OpenCode is installed via:
curl -fsSL https://opencode.ai/install | bash
```

Configuration is in `.opencode.yml`.

## OpenAgents Integration

OpenAgents framework is cloned from https://github.com/darrenhinde/OpenAgents:

- Installed at `/opt/openagents`
- Linked to workspace at `.openagents`
- Provides additional agent templates and capabilities

## Configuration Files

- `.devcontainer/devcontainer.json`: DevContainer configuration
- `.devcontainer/Dockerfile`: Container image definition
- `.opencode.yml`: OpenCode platform configuration
- `.github/workflows/`: GitHub Actions workflows
- `.github/agents/`: Custom agent configurations
- `.github/skills/`: GitHub skills definitions

## Troubleshooting

### Container Build Issues

If the container fails to build:
```bash
# Rebuild without cache
# In VS Code Command Palette: Remote-Containers: Rebuild Container Without Cache
```

### Tool Not Found

If a tool is not in PATH:
```bash
# Reload shell configuration
source ~/.bashrc

# For Node.js
source $NVM_DIR/nvm.sh
nvm use 24

# For Rust
source ~/.cargo/env

# For Conda
conda init bash
source ~/.bashrc
```

### Permission Issues

If you encounter permission errors:
```bash
# Switch to app user (default)
su - app

# Or use sudo
sudo <command>
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request
5. Automated workflows will validate your changes

## License

This project is open source and available under the MIT License.

## Support

For issues and questions:
- Create an issue in the repository
- Check `.github/agents/README.md` for agent documentation
- Check `.github/skills/README.md` for skills documentation

