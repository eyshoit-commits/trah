# Custom Agents Configuration

This directory contains custom agent configurations for the development environment.

## Overview

Custom agents are specialized tools that help automate development tasks, code reviews, and workflow management.

## Available Agents

### 1. Code Review Agent
Automatically reviews pull requests and provides feedback on code quality, security, and best practices.

### 2. Documentation Agent
Generates and maintains documentation for the project.

### 3. Test Generator Agent
Creates unit tests and integration tests based on code changes.

### 4. Security Scanner Agent
Scans code for security vulnerabilities and compliance issues.

### 5. Workflow Automation Agent
Manages GitHub workflows, pull requests, merges, and releases.

## Configuration

Each agent can be configured through YAML files in this directory. Agents integrate with:
- GitHub Actions
- OpenCode AI platform
- OpenAgents framework

## Usage

Agents are automatically triggered by:
- Pull request events
- Code commits
- Manual workflow dispatches
- Scheduled events

## Integration with OpenCode

OpenCode installation provides:
```bash
curl -fsSL https://opencode.ai/install | bash
```

This sets up the global OpenCode CLI and agent runtime.

## Integration with OpenAgents

The OpenAgents repository (https://github.com/darrenhinde/OpenAgents) provides additional agent templates and capabilities.

## Environment Setup

Agents run in the devcontainer environment with access to:
- Node.js 24
- Python 3.12
- Rust toolchain
- Conda package manager
- Docker-in-Docker
- All development tools

## Adding New Agents

To add a new custom agent:

1. Create a YAML configuration file in this directory
2. Define agent triggers and actions
3. Set up required permissions
4. Test the agent in a pull request

Example agent configuration:
```yaml
name: my-custom-agent
trigger:
  - pull_request
  - push
actions:
  - analyze
  - comment
  - label
permissions:
  contents: read
  pull-requests: write
```
