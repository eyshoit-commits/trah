# GitHub Skills

This directory contains GitHub skills configurations and learning paths.

## Overview

GitHub Skills help automate and improve development workflows through structured learning and automation patterns.

## Available Skills

### 1. Pull Request Management
- Creating effective pull requests
- Code review best practices
- Automated PR labeling and assignment
- Merge conflict resolution

### 2. Code Quality
- Linting and formatting
- Static analysis
- Security scanning
- Dependency management

### 3. CI/CD Workflows
- Automated testing
- Build automation
- Deployment pipelines
- Release management

### 4. Collaboration
- Issue management
- Project boards
- Team communication
- Documentation

## Workflow Integration

Skills are integrated with GitHub Actions workflows:
- `.github/workflows/pull-request.yml` - PR validation
- `.github/workflows/auto-merge.yml` - Automatic merging
- `.github/workflows/close-pr.yml` - PR cleanup

## Skill Development

### For Contributors

Learn these skills to contribute effectively:

1. **Fork and Clone**
   ```bash
   git clone https://github.com/eyshoit-commits/trah.git
   cd trah
   ```

2. **Create a Branch**
   ```bash
   git checkout -b feature/my-feature
   ```

3. **Make Changes**
   - Follow coding standards
   - Write tests
   - Update documentation

4. **Submit PR**
   ```bash
   git add .
   git commit -m "Description of changes"
   git push origin feature/my-feature
   ```

### For Reviewers

Skills for effective code review:

1. **Review Checklist**
   - Code quality and style
   - Test coverage
   - Documentation updates
   - Security considerations

2. **Provide Feedback**
   - Be constructive
   - Suggest improvements
   - Approve or request changes

3. **Merge Process**
   - Ensure CI passes
   - Resolve conflicts
   - Use appropriate merge strategy

## Automation Features

### Auto-labeling
PRs are automatically labeled based on:
- File changes
- PR size
- Author
- Target branch

### Auto-assignment
PRs are assigned to reviewers based on:
- Code ownership
- Expertise areas
- Availability

### Auto-merge
PRs with `auto-merge` label are automatically merged when:
- All checks pass
- Required reviews approved
- No conflicts

### Auto-close
PRs with certain labels (`wont-fix`, `duplicate`, `invalid`) are automatically closed.

## Custom Skills

Add custom skills by:

1. Creating skill definition YAML
2. Implementing skill logic
3. Integrating with workflows
4. Testing and documenting

Example skill:
```yaml
skill: code-formatter
description: Automatically format code on commit
trigger: push
actions:
  - run: npm run format
  - commit: "Auto-format code"
```

## Resources

- [GitHub Skills](https://skills.github.com/)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [OpenCode AI](https://opencode.ai/)
- [OpenAgents](https://github.com/darrenhinde/OpenAgents)
