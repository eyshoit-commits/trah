# Quick Start Guide

## Opening the DevContainer

1. **Clone the repository**:
   ```bash
   git clone https://github.com/eyshoit-commits/trah.git
   cd trah
   ```

2. **Open in VS Code**:
   ```bash
   code .
   ```

3. **Reopen in Container**:
   - Click "Reopen in Container" when prompted
   - Or: Command Palette (F1) → "Dev Containers: Reopen in Container"

4. **Wait for setup** (first time only):
   - Container builds (5-10 minutes)
   - Tools install automatically
   - Scripts configure environment

## Verify Installation

Run these commands in the container terminal:

```bash
# Node.js and package managers
node --version        # v24.x.x
npm --version
pnpm --version

# Python
python --version      # 3.12.x
pip --version

# Rust
rustc --version
cargo --version

# Conda
conda --version

# Docker
docker --version

# Check users
whoami               # Should show: app
id                   # Shows uid=1000(app)
```

## Quick Commands

### Node.js Development
```bash
# Initialize project
npm init -y
# or
pnpm init

# Install packages
npm install express
# or
pnpm add express

# Run dev server
npm run dev
```

### Python Development
```bash
# Create virtual environment
python -m venv .venv
source .venv/bin/activate

# Install packages
pip install flask requests

# Run script
python app.py
```

### Rust Development
```bash
# Create new project
cargo new my-app
cd my-app

# Build and run
cargo run

# Format and lint
cargo fmt
cargo clippy
```

### Conda Package Management
```bash
# Create environment
conda create -n myenv python=3.12

# Activate
conda activate myenv

# Install packages
conda install numpy pandas

# Deactivate
conda deactivate
```

### Docker Commands
```bash
# Build image
docker build -t myapp .

# Run container
docker run -p 3000:3000 myapp

# List containers
docker ps
```

## GitHub Workflows

### Creating a Pull Request

```bash
# Create branch
git checkout -b feature/my-feature

# Make changes
# ... edit files ...

# Commit and push
git add .
git commit -m "Add new feature"
git push origin feature/my-feature
```

The PR validation workflow runs automatically.

### Auto-Merge a PR

Add label `auto-merge` or `automerge` to the PR:
- All checks must pass
- PR will merge automatically
- Uses squash merge

### Auto-Close a PR

Add one of these labels:
- `wont-fix`
- `duplicate`
- `invalid`
- `close`

PR will close automatically and branch will be deleted.

## Using Custom Agents

Custom agents run automatically on:
- Pull requests (code review, security scan)
- Commits (documentation, testing)

Configuration: `.github/agents/`

## File Locations

- **Workspace**: `/workspace`
- **Node.js**: `/home/app/.nvm/versions/node/v24/`
- **Python**: `/usr/bin/python3.12`
- **Rust**: `/home/app/.cargo/`
- **Conda**: `/opt/conda/`
- **OpenAgents**: `/opt/openagents/`

## Environment Variables

Automatically set:
- `$NVM_DIR`: `/home/app/.nvm`
- `$CONDA_DIR`: `/opt/conda`
- `$OPENCODE_HOME`: `/home/app/.config/opencode`
- `$OPENAGENTS_HOME`: `/opt/openagents`

## Switching Users

```bash
# You're 'app' by default
whoami  # app

# Switch to bkg user
su - bkg

# Use sudo (no password required)
sudo apt update
```

## Troubleshooting

### Tool not found
```bash
# Reload environment
source ~/.bashrc

# For Node.js
source $NVM_DIR/nvm.sh
nvm use 24

# For Rust
source ~/.cargo/env
```

### Container won't start
- Check Docker is running
- Try: "Dev Containers: Rebuild Container Without Cache"

### Port already in use
- Stop other containers: `docker ps` then `docker stop <id>`
- Change port in code or `.devcontainer/devcontainer.json`

## Useful Paths

```bash
# Project root
cd /workspace

# DevContainer config
cd /workspace/.devcontainer

# GitHub workflows
cd /workspace/.github/workflows

# Custom agents
cd /workspace/.github/agents
```

## Additional Resources

- **Full Documentation**: See `README.md`
- **Implementation Details**: See `IMPLEMENTATION.md`
- **Agents Documentation**: `.github/agents/README.md`
- **Skills Documentation**: `.github/skills/README.md`

## Getting Help

1. Check the README.md
2. Review IMPLEMENTATION.md for detailed setup info
3. Check workflow files in `.github/workflows/`
4. Create an issue in the repository

## Next Steps

1. ✅ Container is running
2. 📦 Install your project dependencies
3. 💻 Start coding!
4. 🔄 Create PRs and use automated workflows
5. 🤖 Leverage custom agents for automation

Happy coding! 🚀
