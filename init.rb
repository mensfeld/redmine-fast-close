# frozen_string_literal: true

require_relative "lib/fast_close_hook_listener"

Redmine::Plugin.register :redmine_fast_close do
  name "Redmine Fast Close"
  author "Maciej Mensfeld"
  description 'Adds a one-click "Zamknij" (Close) button next to "Edytuj" on issue views.'
  version "1.0.0"
  url "https://github.com/mensfeld/redmine-fast-close"

  requires_redmine version_or_higher: "5.0"

  project_module :fast_close do
    permission :close_issues, { fast_close: [:close] }, require: :member
  end
end
