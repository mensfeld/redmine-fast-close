# frozen_string_literal: true

require_relative "lib/fast_close_hook_listener"
require_relative "lib/fast_close_status_resolver"

Redmine::Plugin.register :redmine_fast_close do
  name "Redmine Fast Close"
  author "Maciej Mensfeld"
  description 'Adds a one-click "Zamknij" (Close) button next to "Edytuj" on issue views.'
  version "1.1.0"
  url "https://github.com/mensfeld/redmine-fast-close"

  requires_redmine version_or_higher: "5.0"

  settings default: { "closed_status_id" => "" },
    partial: "settings/fast_close_settings"
end
