<h1 align="center">
      <img alt="LinkeShare" title="LinkeShare" src=".github/logo.png" width="300px" />
</h1>

<h3 align="center">
  LinkeShare
</h3>

<p align="center">Share your articles automatically on linkedin 🔗</p>
<p align="center">Made with Elixir 🚀</p>

<p align="center">
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/Lgdev07/linkeshare?color=%2304D361">

  <img alt="Made by Lgdev07" src="https://img.shields.io/badge/made%20by-Lgdev07-%2304D361">

  <img alt="License" src="https://img.shields.io/badge/license-MIT-%2304D361">

  <a href="https://github.com/Lgdev07/linkeshare/stargazers">
    <img alt="Stargazers" src="https://img.shields.io/github/stars/Lgdev07/linkeshare?style=social">
  </a>
</p>

<p align="center">
  <a href="#-installation-and-execution">Installation and execution</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-how-to-contribute">How to contribute</a>&nbsp;&nbsp;&nbsp;
</p>


## 📖 Blogs Supported

- [x] Dev To


## 🚀 Installation and execution

1. Clone this repository and go to the directory;
2. Get the access token and author ID from Linkedin Api: https://docs.microsoft.com/pt-br/linkedin/shared/authentication/authorization-code-flow
3. Rename sample.env to .env and put the variables form step 2;
4. Deploy the application in your preferable cloud service, I recommend gigalixir.
5. Create a webhook on DevTo with the url from step 4: https://docs.forem.com/api/#operation/createWebhook
6. Create a post on Dev To, this should share the article on linkedin.

## 🔧 Development

1. Run `mix phx.server`;

## 🧪 Tests

1. Run `mix test`;

## 🤔 How to contribute

- Fork this repository;
- Create a branch with your feature: `git checkout -b my-feature`;
- Commit your changes: `git commit -m 'feat: My new feature'`;
- Push to your branch: `git push origin my-feature`.

After the merge of your pull request is done, you can delete your branch.

---
