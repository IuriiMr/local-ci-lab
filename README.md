# 🛠️ Local CI/CD Lab: GitLab + Harbor + Runner

This repo sets up a local GitLab CI/CD lab with:

- 🐳 GitLab CE
- 📦 Harbor (local container registry)
- 🚀 GitLab Runner (Docker executor with DinD)

## ✅ Prerequisites

- Docker & Docker Compose v2

## 📦 Getting Started

```bash
  git clone https://github.com/IuriiMr/local-ci-lab.git
  cd local-ci-lab
  make up
```


## 🧪 First Use

- Visit http://localhost:8080 (GitLab) and set the root password.

If the initial connection leads to the sign-in page, reset the root password and configure it using the CLI.

```bash
  docker exec -it gitlab gitlab-rake gitlab:password:reset
```

- Visit http://localhost:30002 (Harbor) and create a project.

- Register the runner manually:

```bash
  docker exec -it gitlab-runner gitlab-runner register
````
- Push a repo to GitLab with .gitlab-ci.yml that builds and pushes to Harbor.

## 🔁 Commands

```bash
  make up
``` 
start all services

```bash
  make down
```

stop all

```bash
  make reset
```    

full cleanup

```bash
  make logs
```

tail logs