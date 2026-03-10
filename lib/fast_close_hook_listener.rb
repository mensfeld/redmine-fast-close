# frozen_string_literal: true

# Hook listener that injects the fast-close button partial into the issue detail view.
# Renders the button below the issue details; JavaScript then relocates it into the
# contextual toolbar next to the Edit button.
class FastCloseHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_show_details_bottom,
    partial: "hooks/fast_close_button"
end
