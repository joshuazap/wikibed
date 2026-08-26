# Wikibed

**Status: archive / demonstration only (2016).** Not a production product. Historical Heroku URLs are retired.

A Rails wiki: public and private pages, collaborators, Devise confirmable, and a Stripe premium upgrade. Built for GitHub / LinkedIn review of full-stack Rails craft — not as a live SaaS.

**Author:** [Joshua Zapata](https://zapatas.org) · [Zapatas](https://www.linkedin.com/company/zapatas-org)


## What this demonstrates

- Rails CRUD with Devise + Pundit scoped records
- Collaborator membership on private pages
- Stripe subscription upgrade (standard / premium / admin)
- Infinite-scroll index (jQuery / AJAX)
- TDD with RSpec (era-typical Bloc stack)

## Stack (frozen)

- Ruby 2.2–2.3 · Rails 4.2.5 · PostgreSQL in production, SQLite in development
- Bootstrap 3 · jQuery · SendGrid (historical)

## Local demonstration

```bash
git clone https://github.com/joshuazap/wikibed.git
cd wikibed
bundle install --without production
rake db:create db:migrate
rspec spec
```

Ruby / Rails versions in the Gemfile are historical. Use a version manager if the app still boots; otherwise read the code as a 2016 snapshot.

## License

Demonstration source for portfolio review. See the repository on GitHub: [joshuazap/wikibed](https://github.com/joshuazap/wikibed).
