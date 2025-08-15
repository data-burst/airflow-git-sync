# CHANGELOG


## v1.0.0 (2025-08-15)

### Features

- Migrate docker compose and examples to the airflow 3 (#31)
  ([#31](https://github.com/data-burst/airflow-git-sync/pull/31),
  [`5155aec`](https://github.com/data-burst/airflow-git-sync/commit/5155aecf2d11ba1d5a2aba574a79b6a8a1bbe550))


## v0.1.0 (2025-08-15)

### Bug Fixes

- Resolve the default repository address in the docker-compose file (#17)
  ([#17](https://github.com/data-burst/airflow-git-sync/pull/17),
  [`3078463`](https://github.com/data-burst/airflow-git-sync/commit/3078463686c472f11c6ee3e3fb46318921ff1af6))

- Resolve the git-sync image in the documentation and reformat the docker-compose file to yaml (#16)
  ([#16](https://github.com/data-burst/airflow-git-sync/pull/16),
  [`a75681c`](https://github.com/data-burst/airflow-git-sync/commit/a75681cf60bd5822cf5560bf292211f6382720f5))

- **entrypoint**: Resolve git clean issue and use global variable for the project directory (#1)
  ([#1](https://github.com/data-burst/airflow-git-sync/pull/1),
  [`3340a7e`](https://github.com/data-burst/airflow-git-sync/commit/3340a7eec83b288477138068bfad954551bfff22))

- **github-action**: Add the working CI for pushing the latest tag to the Dockerhub
  ([`4a0ed1e`](https://github.com/data-burst/airflow-git-sync/commit/4a0ed1ed04d42b8a623e6ec249078723fa911f3c))

### Chores

- Add .gitignore file to the repository
  ([`3ca7b66`](https://github.com/data-burst/airflow-git-sync/commit/3ca7b66085ced31ccfa025b8374361199fbbd764))

- **docker**: Change the maintainer email in Dockerfile of Git sync
  ([`4ecbf9b`](https://github.com/data-burst/airflow-git-sync/commit/4ecbf9bb4220d5ac56762ec1f9f20f9e773b31d4))

- **license**: Add MIT license file
  ([`00c6d58`](https://github.com/data-burst/airflow-git-sync/commit/00c6d58684652b7b86f323784aac8e54250368ea))

### Documentation

- Add FAQ collapsible section to README (#21)
  ([#21](https://github.com/data-burst/airflow-git-sync/pull/21),
  [`0ed1461`](https://github.com/data-burst/airflow-git-sync/commit/0ed1461e22be1a8a82dfdab729fa32efb6dc5d49))

- Add GIT_PULL_REBASE parameter explanation to the documentation and set the required/optional
  fields (#24) ([#24](https://github.com/data-burst/airflow-git-sync/pull/24),
  [`146b055`](https://github.com/data-burst/airflow-git-sync/commit/146b05599861f2a3e04d346afb1e66d5adda748c))

- Add instruction for setting right Airflow user and create directories (#2) (#4)
  ([#4](https://github.com/data-burst/airflow-git-sync/pull/4),
  [`2e690b5`](https://github.com/data-burst/airflow-git-sync/commit/2e690b5494531a076147337318e9eef18006427c))

- **contribution**: Add contribution guide
  ([`038d5f1`](https://github.com/data-burst/airflow-git-sync/commit/038d5f1332452e443e6e0c2ac0908bec106d4ebb))

- **emoji**: Resolve the space between character and emoji
  ([`2b4bc8b`](https://github.com/data-burst/airflow-git-sync/commit/2b4bc8b2789cc3898684ec52392f78b31b32447b))

- **git-sync**: Add Kubernetes Git Sync sidecar container link to its repository in the
  documentation
  ([`859d3db`](https://github.com/data-burst/airflow-git-sync/commit/859d3dbf7b93e0303badc30a30a54f63f9d361fd))

- **links**: Fix contribution link and license link
  ([`42122ac`](https://github.com/data-burst/airflow-git-sync/commit/42122ac734baabe8e0fe1e2d726f4d365b52ec2c))

- **readme**: Add a part in project usage about how to add ssh key and handle it on github (#3) (#8)
  ([#8](https://github.com/data-burst/airflow-git-sync/pull/8),
  [`99a933c`](https://github.com/data-burst/airflow-git-sync/commit/99a933c16b9fab966cf55cfbdeebda748871e944))

- **readme-project-usage**: Fix project usage part by removing extra lines
  ([`cc553f6`](https://github.com/data-burst/airflow-git-sync/commit/cc553f6c44c144e6f4e8aed25c149de8214ccfa8))

- **README.md**: Improve documentation to make its usage more sensible (#9)
  ([#9](https://github.com/data-burst/airflow-git-sync/pull/9),
  [`4ec528e`](https://github.com/data-burst/airflow-git-sync/commit/4ec528e41638fc4625020feab2812594b8d05938))

### Features

- Add semantic versioning workflow (#30)
  ([#30](https://github.com/data-burst/airflow-git-sync/pull/30),
  [`156326a`](https://github.com/data-burst/airflow-git-sync/commit/156326a21d31bfd8196382021e6858f93a0c8c06))

- Remove unused GIT_URL variable from Docker Compose file and README (#7)
  ([#7](https://github.com/data-burst/airflow-git-sync/pull/7),
  [`4ed3a18`](https://github.com/data-burst/airflow-git-sync/commit/4ed3a181b25de86007561a25e2d4172567b91528))

- **compose**: Add docker-compose file in order to setup Airflow and Git-sync
  ([`ba357d6`](https://github.com/data-burst/airflow-git-sync/commit/ba357d66d0544c66dce3769640878ecda68c9502))

- **compose**: Add image instead of context in order to prevent from building the image from scratch
  ([`5959b90`](https://github.com/data-burst/airflow-git-sync/commit/5959b9053681c4a6dbaf256d948f8d4a350bcbfe))

- **docker**: Add Dockerfile for Git-Sync image
  ([`d103906`](https://github.com/data-burst/airflow-git-sync/commit/d103906e603e8679ea06ef3303b3121d8fedea23))

- **document**: Add README.md file and images
  ([`285781f`](https://github.com/data-burst/airflow-git-sync/commit/285781f43e37782d7afe573943a327ebc9ee60ef))

- **examples**: Add example DAGs directory for BashOperator and DockerOperator
  ([`5433e78`](https://github.com/data-burst/airflow-git-sync/commit/5433e78d8e62f48d5819dadaf598fb2b9e137bbd))

- **github-actions**: Add CI for building and pushing Docker image to Dockerhub
  ([`d54827d`](https://github.com/data-burst/airflow-git-sync/commit/d54827d1a13802bd9c9278d5a9e71345eb250a45))

- **script**: Add entrypoint script for building Docker image
  ([`18d9733`](https://github.com/data-burst/airflow-git-sync/commit/18d973340dd704c4b4ddd67a9b80cd75fe723895))

### Refactoring

- Change the default value of REPO_URL in docker-compose file and change it in README file (#13)
  ([#13](https://github.com/data-burst/airflow-git-sync/pull/13),
  [`891e84b`](https://github.com/data-burst/airflow-git-sync/commit/891e84be0b6d76dfab44d987b3dd9d8001f0ca0f))

- Separate git-sync and airflow-git-sync repositories (#19)
  ([#19](https://github.com/data-burst/airflow-git-sync/pull/19),
  [`45c55ec`](https://github.com/data-burst/airflow-git-sync/commit/45c55ec348e9af37ac0bc9332a7a0d2cc92c3788))
