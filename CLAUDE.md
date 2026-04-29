# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development

```bash
bundle install          # Install Ruby dependencies
bundle exec jekyll serve                        # Serve locally at http://localhost:4000
JEKYLL_ENV=production bundle exec jekyll build -d "_site"  # Production build
```

**Testing HTML/links:**
```bash
bundle exec htmlproofer _site \
  --disable-external=true \
  --ignore-urls "/^http:\/\/127.0.0.1/,/^http:\/\/0.0.0.0/,/^http:\/\/localhost/"
```

Deployment is automatic via GitHub Actions on push to `main`.

## Architecture

This is a [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) (v6.4+) Jekyll blog hosted on GitHub Pages at yangjeep.io. The theme handles all layouts/templates; this repo contains only config, content, and data overrides.

**Key directories:**
- `_posts/` — Blog articles. Filename format: `YYYY-MM-DD-title.md`
- `_tabs/` — Static nav pages (About, Archives, Categories, Tags). Each tab's sidebar order is set by the `order:` front matter field.
- `_data/` — Site data: `authors.yml`, `contact.yml`, `share.yml`, per-locale strings in `locales/`
- `_plugins/posts-lastmod-hook.rb` — Auto-sets `last_modified_at` from git history when a post has >1 commit
- `assets/lib/` — Git submodule (`cotes2020/chirpy-static-assets`); required for the theme to render correctly

## Post Conventions

```yaml
---
title: Post Title
date: 2022-10-29 10:54:00 -0500
author: yangjeep
categories: [top-category, sub-category]
tags: [lowercase, tags, only]
---
```

- Tags must be **lowercase**
- `last_modified_at` is auto-populated by the git plugin (no need to set manually)
- Per-post overrides available: `comments: true/false`, `toc: false`

## Configuration Notes

- `_config.yml` controls theme behavior, social links (`social.links`), and the `tabs` collection sort order
- The `tabs` collection uses `output: true` and is sorted by the `order` field in each tab's front matter
- HTML compression is only active when `JEKYLL_ENV=production`
- `assets/lib/` submodule must be initialized (`git submodule update --init`) for local builds to work
