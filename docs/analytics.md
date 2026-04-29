# GA4 Analytics Setup

This site uses Google Analytics 4 (GA4) via the Chirpy theme's built-in support.
GA tracking only loads in production builds (`JEKYLL_ENV=production`), so local development is clean.

## First-time setup

1. Go to [Google Analytics](https://analytics.google.com) and sign in.
2. Create a new **GA4 property** (click **Admin → Create property**).
3. Under the property, create a **Web data stream** for `https://yangjeep.io`.
4. Copy the **Measurement ID** — it looks like `G-XXXXXXXXXX`.
5. Open `_config.yml` and replace the placeholder:

   ```yaml
   google_analytics:
     id: G-XXXXXXXXXX    # ← paste your real ID here
   ```

6. Commit and push. GitHub Actions will build with `JEKYLL_ENV=production` and the
   gtag.js snippet will be injected automatically.
7. Verify in the GA4 **Realtime** report — open the live site and confirm events appear.

## Outbound link tracking

The home page (`_layouts/home.html`) includes a small script that fires `gtag` click
events for the following external links:

| `data-outbound` label | Destination |
|---|---|
| `leaselab` | https://github.com/yangjeep/leaselab |
| `photography` | https://photo.yangjeep.io |
| `github` | https://github.com/yangjeep |
| `linkedin` | https://www.linkedin.com/in/yangjeep |

The script only runs when:
- `JEKYLL_ENV` is `production`
- `google_analytics.id` in `_config.yml` is set to a real ID (not the placeholder `G-XXXXXXXXXX`)

In GA4 you can find these events under **Events → click** filtered by `event_category = outbound`.

## Notes

- No cookie banner is required for basic GA4 usage — GA4 uses cookieless measurement by default.
- If you later need GDPR/CCPA consent mode, add the `consent` command before `gtag('config', ...)`.
  The Chirpy theme's analytics include can be overridden via `_includes/analytics.html` if needed.
- The `pv` (pageview proxy) fields under `google_analytics` in `_config.yml` are for a legacy
  App Engine proxy and can be left blank.
