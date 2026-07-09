# Yangjeep Engineering Notes

Source for [**yangjeep.io**](https://yangjeep.io) — my technical blog / engineering notes site.

Technical writing on engineering leadership, SaaS platforms, backend and data systems,
AI-assisted engineering workflows, homelab infrastructure, and product building.

## Related sites

- **Main personal landing page** — [yangjeep.com](https://yangjeep.com)
- **Formal resume / profile** — [jiajianyang.com](https://jiajianyang.com)
- **Photography portfolio** — [photo.yangjeep.io](https://photo.yangjeep.io)

## Stack

A [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) Jekyll site. Content lives in
`_posts/` (articles), `_tabs/` (nav pages), `_data/` (site data), and `_layouts/home.html`
(the homepage). See [`CLAUDE.md`](CLAUDE.md) for conventions.

## Local development

```bash
bundle install                 # install Ruby dependencies
bundle exec jekyll serve       # serve locally at http://localhost:4000
```

The `assets/lib/` submodule must be initialized for the theme to render:

```bash
git submodule update --init
```

## Build

```bash
JEKYLL_ENV=production bundle exec jekyll build -d "_site"
```

Link-check the built site (same check the CI runs):

```bash
bundle exec htmlproofer _site \
  --disable-external=true \
  --ignore-urls "/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/"
```

## Deployment

Hosted on **GitHub Pages**. Deployment is automatic via GitHub Actions
(`.github/workflows/pages-deploy.yml`) on push to `main`.
