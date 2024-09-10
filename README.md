# Airflow Git Sync

🎉 What if you could instantly sync DAG changes from **Git** to **Airflow**? Well now you can!

<p align=center>
    <img src="images/git_sync.jpg" width="450" height="200" alt="airflow git sync"/>
</p>

<p align=center>
    <a href="https://github.com/data-burst/airflow-git-sync/graphs/contributors">
    <img src="https://img.shields.io/github/contributors-anon/data-burst/airflow-git-sync?color=yellow&style=flat-square" alt="contributors">
    </a>
    <a href="https://github.com/data-burst/airflow-git-sync/LICENSE"> 
    <img src="https://img.shields.io/badge/MIT-blue.svg?style=flat-square&label=license" alt="license">
</a>
</p>

## Table of Contents 🏗️

- [Airflow Git Sync](#airflow-git-sync)
  - [Table of Contents 🏗️](#table-of-contents-️)
  - [Project Description 🌱](#project-description-)
  - [Project Usage 🧑‍💻](#project-usage-)
    - [Setting Up Your SSH Key](#setting-up-your-ssh-key)
    - [Using Airflow Git Sync](#using-airflow-git-sync)
  - [FAQ ❓](#faq-)
  - [Contributing 👥](#contributing-)
  - [License 📄](#license-)

## Project Description 🌱

Airflow Git Sync provides automated DAG deployments from Git for Airflow environments. It syncs your pipeline code from a Git repository into the Airflow DAG folder.

Keeping DAGs directly in Airflow servers makes management challenging. Code changes require manual syncing to containers. There is no version control or history.
If you have ever worked with Airflow on Kubernetes, it gives you the ability to sync the DAGs with your repository (as an GitOps solution) using [git-sync sidecar contanier](https://github.com/kubernetes/git-sync). If you don't have Kubernetes, it is hard to keep the DAGs directory of Airflow (which is placed at `/opt/airflow/dags/`) synced with the changes you applied to your DAGs and in some cases it is required to restart the Airflow service or container.

The project introduces `git-sync` application alongside Airflow. This handles cloning your configured DAG Git repository and syncing contents over to Airflow's DAG directory.

The syncing is achieved via a lightweight Docker container that runs periodically using inotify wait to detect file changes. The container can be deployed using docker-compose alongside Airflow. Here is a bit of the docker-compose file:

```bash
  airflow-webserver:
    # Airflow container

  airflow-scheduler:
    # Airflow container  
    
  git-sync:
    # Git-sync container
    image: databurst/git-sync:latest  
    environment:
      REPO_URL: <dags_git_repo_url>.git
      #...other config
```

The git-sync container will keep DAGs in Airflow containers continually synced from files committed to the Git repository.

The end result is Airflow DAGs can be managed via Git best practices. Changes are automatically reflected in your pipeline deployment. No need for complex Kubernetes just to get basic Git sync!

<p align=center>
    <img src="images/architecture.jpg" alt="airflow git sync diagram"/>
</p>

## Project Usage 🧑‍💻

**Important Tip**:

Before you can use the project, based on [Airflow's documentation](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html#setting-the-right-airflow-user), you need to ensure that Airflow has the correct permissions for the required directories. To do this, execute the following commands in the directory where your `docker-compose.yaml` file is located:

```bash
mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

### Setting Up Your SSH Key

1. **Generate an SSH Key**: If you don't already have an SSH key, you can generate one using the following steps:

   - Open a Terminal: Open your terminal or command prompt.

   - Generate SSH Key: Run the following command to generate a new SSH key:

     ```bash
     ssh-keygen -t <key-type>
     # example
     # ssh-keygen -t id_ed25519 
     ```

     Replace `<key-type>` with the desired key type (e.g., `ed25519`, `rsa`).

   - Follow Prompts: You'll be prompted to choose a location for your SSH key. Press Enter to accept the default location (usually `~/.ssh/id_<key-type>`) or specify a different one.

2. **Adding SSH Key to Your Git Account**: To use your SSH key with Git, you need to add your public key to your Git account. Here's how:

   - Go to your Git account settings on the web (e.g., GitHub, GitLab).

   - Navigate to "SSH and GPG keys" or a similar section.

   - Click "New SSH key" or equivalent.

   - Paste your public key into the provided field and give it a meaningful title.

3. **Updating Docker Compose**: To ensure that your SSH key is correctly mounted in the `git-sync` container, modify the relevant line in your `docker-compose.yaml` file as follows:

   ```yaml
   - ${GIT_SSH_KEY:-~/.ssh/<ssh_private_key_file_name>}:/root/.ssh/<ssh_private_key_file_name>

### Using Airflow Git Sync

Using Airflow Git Sync is simple:

1. Clone the repository.
2. Configure git-sync via environment variables in `docker-compose.yaml` file:

    | Variable | Description | Default Value |
    | --- | --- | --- |
    | `REPO_URL` | The URL of the Git repository to sync | `git@github.com:data-burst/airflow_git_sync.git` (required) |
    | `SUBFOLDER_PATH` | The repository sub-folder to sync. Leaving empty copies the entire repo | `N/A` (optional) |
    | `GIT_BRANCH` | The Git branch to sync | `main` (optional) |
    | `DIRECTORY_NAME` | The name of the directory to clone the repository into | `project` (optional) |
    | `DESTINATION_PATH` | The path to sync the repository to | `/app/sync` (optional) |
    | `INTERVAL` | The interval (in seconds) to sync the repository | `10` (optional)|
    | `GIT_PULL_REBASE` | Determines the Git pull strategy. If set to `true`, it configures `git config pull.rebase` to use `rebase` during pulls. If `false`, it defaults to `merge`. | `false` (optional)|

3. In order to deploy the Airflow with the configured Git-sync, simply run the ‍`docker compose up -d‍` command.
4. Enjoy!

## FAQ ❓

In this section you can find and resolve your common issues that faced to.

<details>
<summary>
Internet Connection Issue
</summary>

If you've seen the following error using `docker logs -f <container-name>` command, the probable root cause may be is that you are connected to VPN!

> getaddrinfo github.com: Try again
ssh: Could not resolve hostname github.com: Try again
fatal: Could not read from remote repository.

For more information, checkout [this](https://stackoverflow.com/questions/20430371/my-docker-container-has-no-internet) link.
</details>

## Contributing 👥

We welcome contributions to this repository! If you’re interested in contributing, please take a look at our [CONTIRIBUTION.md](CONTRIBUTING.md) file for more information on how to get started. We look forward to collaborating with you!

## License 📄

This repository is licensed under the MIT License, which is a permissive open-source license that allows for reuse and modification of the code with few restrictions. You can find the full text of the license in [this](LICENSE) file.
