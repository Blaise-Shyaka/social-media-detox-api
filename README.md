# Social-media-detox-api

This project is an API for a Social-Media-Detox app. The Social-Media-Detox app intends to help its users break the habit of spending too much time on Social Media.

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.0.4

## Live Demo

[Live demo link](https://social-media-detox-api.herokuapp.com/)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby: 2.7.0
- Rails: 6.0.4
- Postgres: >=9.5

### Setup

Clone this repository by running:

```bash
git clone https://github.com/Blaise-Shyaka/social-media-detox-api
```

Install gems with:

```bash
bundle install
```

Install and check dependencies with:

```bash
yarn install --check-files
```

Setup database with:

```ruby
   rails db:create
   rails db:migrate
```

### Routes

```
    POST /signup
    POST /auth/login
    POST /measurements
    GET /measurements
```

### Usage

- To create an account, `POST https://social-media-detox-api.herokuapp.com/signup`. The request of the format is as follows:
```JSON
{
  "first_name": "test first name",
  "last_name": "test last name",
  "email": "test@email.com",
  "password": "test password",
  "confirm_password": "test password"
}
```

- To login, `POST https://social-media-detox-api.herokuapp.com/auth/login`. Format:
```JSON
{
  "email": "test@email.com",
  "password": "test password"
}
```

- To record the time spent on social media, `POST https://social-media-detox-api.herokuapp.com/measurements`. Format:
```JSON
{
  "twitter": 23,
  "instagram": 3,
  "tiktok": 45,
  "other": 12,
}
```

### Run tests

```ruby
    rpsec --format documentation
```

## Authors

👤 **Blaise Pascal SHYAKA**

- GitHub: [@Blaise-Shyaka](https://github.com/Blaise-Shyaka/)
- Twitter: [@blaise_shyaka95](https://twitter.com/blaise_shyaka95)
- LinkedIn: [Blaise Pascal SHYAKA](https://linkedin.com/in/blaise-pascal-shyaka)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Blaise-Shyaka/social-media-detox-api/issues).

## Show your support

Give a ⭐️ if you like this project!

