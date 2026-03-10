# Redmine Fast Close

One-click issue closing for Redmine. Adds a **"Zamknij"** / **"Close"** button directly in the issue toolbar, next to the Edit button.

## Why?

Closing an issue in Redmine requires: Edit → change status → Save. This plugin reduces that to a single click.

## Features

- One-click close button on the issue detail view
- Respects Redmine workflow — button only appears when the user is allowed to transition to a closed status
- Proper journal entry is created for the status change
- Confirmation dialog before closing
- Localized in English and Polish (falls back to English for other languages)

## Requirements

- Redmine 5.0+
- Ruby 3.2+

## Installation

```bash
cd /path/to/redmine
git clone https://github.com/mensfeld/redmine-fast-close.git plugins/redmine_fast_close
# Restart Redmine
```

No migrations required — this plugin only adds a UI feature.

## Configuration

1. Go to **Administration → Roles and permissions**
2. Enable **"Close issues (fast close)"** for the roles that should see the button
3. In each project, go to **Settings → Modules** and enable **Fast close**

## License

MIT License. See [LICENSE](LICENSE) for details.
