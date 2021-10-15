---
name: 'IssueOps: GitHub Demo'
about: This is a template to initiate workflows via Actions
title: <Add your test title here>
labels: 'github-demo'
assignees: ''

---

# GitHub Demo

## Test Configuration
  
Please fill out the table below in order to run an automated demo

### General Settings
<!-- Main Settings Start -->
| Setting | Value | Description |
| :---: | :---: | --- |
| Environment | demo | Will this be production, development, qa, demo? |
| Region | us-east-2 | Which region should these instances live? |
| Instance count | 1 | How many instances should we build? |
| OS Version | ubuntu | Which OS will we deploy to AWS? |
<!-- Main Settings End -->
  
## Testing Commands
To help you get started, here are some of the supported IssueOps commands. 

- `/deploy` - Deploy our application
  - `--env` - Override the default environment
  - `--os` - Override the default OS
  - `--region` - Override the default region
  - `--count` - Override the instance count
