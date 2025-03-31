# manage-articles-template

the template repo to manage tech blog articles for Qiita and Zenn.

## Overview

- Based on the structure of Zenn
  - Qiita is additional directory
  - You can create only a Zenn article which is converted to Qiita article
- Qiita articles are posted using GitHub Actions

## Directory Structure

the directory structure is as follows.

```sh
├── README.md
├── articles
├── books
├── create_qiita_article.sh
└── qiita
```

## Prerequisites

- Node.js
  - Ver 18.0.0 or above

### Install Zenn CLI

Follow this link and install Zenn CLI. Corroboration between the Zenn and a GitHub repository is required.

https://zenn.dev/zenn/articles/install-zenn-cli

After installation, initialize the repository with the following command. The `articles` and `books` directories will be created.

```sh
npx zenn init
```

### Install Qiita CLI

**This step must be done in the `qiita` directory.**

Follow this link to install Qiita CLI.

https://qiita.com/Qiita/items/666e190490d0af90a92b

After installation, initialize the qiita directory with the following command.

```sh
cd qiita # Do this in the qiita directory
npx qiita init
```

### Set Qiita Access Token

To post articles to Qiita using the Qiita CLI, you need to obtain a Qiita access token in advance. Please refer to the link above for instructions.  
Add the token to your repo as `QIITA_TOKEN` in the GitHub Secrets.

## Create Article

You can create an article using the following command.

```sh
npx zenn new:article
```

This will create a new article in the `articles` directory.  
you must specify the bellow,

- `title`: the title of the article.
- `topics`: the topics of the article.
- `published`: whether the article is published or not.

also, the content of the article is required.

write the article for the Zenn, create a PR and merge it to the `main` branch.  
the article for the Qiita will be created automatically in the GitHub Actions and published to the Qiita.

## Notes

- when deleting the article, you must delete the article from the WEB UI and remove the article here

## References

- https://zenn.dev/zenn/articles/install-zenn-cli
- https://github.com/increments/qiita-cli/tree/v1