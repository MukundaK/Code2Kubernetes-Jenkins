# Jenkins Pipeline for Spring PetClinic

This Jenkins Pipeline automates the CI/CD process for the **Spring PetClinic** project hosted on GitHub. The pipeline builds the project, runs SonarQube analysis, creates a Docker image, pushes it to a Docker registry, and deploys the application to a Kubernetes cluster.

##  Pipeline Overview

The pipeline performs the following stages:

1. **SCM (Source Code Management):** Clones the repository from GitHub.
2. **Maven Compile:** Compiles the code while skipping tests for faster builds.
3. **SonarQube Scanner:** Analyzes the code quality using SonarQube.
4. **Maven Install:** Installs the project dependencies and builds the package.
5. **Dockerfile Copy:** Copies the Dockerfile required for building the Docker image.
6. **Docker Build:** Builds the Docker image for the application.
7. **Docker Push:** Pushes the built image to the Docker registry.
8. **Deployment YAML Copy:** Copies the Kubernetes deployment configuration.
9. **Deploy to Kubernetes:** Deploys the Docker image to a Kubernetes cluster.

---

##  Pipeline Configuration

- **GitHub Repository:** [https://github.com/devtester1231/spring-petclinic](https://github.com/devtester1231/spring-petclinic)
- **Docker Image Name:** `devtester1231/jenkins-built-this-petclinic`
- **Docker Tag:** `v2`
- **Kubernetes Namespace:** `default`
- **Deployment Name:** `k8s-pet-clinic`

---

## Prerequisites

- Jenkins with the following plugins installed:
  - **Pipeline**
  - **Git**
  - **Docker Pipeline**
  - **Kubernetes CLI (kubectl)**
  - **SonarQube Scanner**
- Credentials configured:
  - **Docker Credentials:** ID `docker`
  - **Kubernetes Credentials:** ID `kubeconfig`
- A running Kubernetes cluster accessible from Jenkins.

---

## How to Use

1. **Create a new Jenkins Pipeline job** and copy the provided script into the pipeline configuration.
2. **Configure the GitHub webhook** to trigger builds on push events.
3. **Ensure the required credentials** are added in Jenkins (Docker and Kubernetes).
4. **Run the pipeline** to automate the build, test, and deployment process.

---

## Trigger

This pipeline is triggered automatically on every GitHub push event due to the following trigger configuration:

```groovy
triggers {
    githubPush()
}
