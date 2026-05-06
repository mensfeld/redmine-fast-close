# frozen_string_literal: true

# Resolves the target closed status from plugin settings.
# If a specific status is configured and valid, uses that;
# otherwise falls back to the first closed status by position.
module FastCloseStatusResolver
  def self.call
    configured_id = Setting.plugin_redmine_fast_close["closed_status_id"]

    status = IssueStatus.find_by(id: configured_id, is_closed: true) if configured_id.present?
    status || IssueStatus.where(is_closed: true).order(:position).first
  end
end
