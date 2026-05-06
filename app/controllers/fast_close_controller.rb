# frozen_string_literal: true

# Controller that handles one-click issue closing.
# Finds the target closed status and transitions the issue to it.
# Authorization relies on Redmine's workflow — if the user can transition to a closed status,
# they can use this shortcut.
class FastCloseController < ApplicationController
  before_action :find_issue

  # Closes the issue by transitioning it to the target closed status.
  # Validates that a closed status exists and that the current user is allowed to use it.
  # Redirects back to the issue with a flash message indicating success or failure.
  def close
    closed_status = target_closed_status

    unless closed_status
      flash[:error] = l(:error_no_closed_status)
      redirect_to issue_path(@issue)
      return
    end

    unless @issue.new_statuses_allowed_to(User.current).include?(closed_status)
      flash[:error] = l(:error_status_transition_not_allowed)
      redirect_to issue_path(@issue)
      return
    end

    @issue.init_journal(User.current)
    @issue.status = closed_status

    if @issue.save
      flash[:notice] = l(:notice_issue_closed)
    else
      flash[:error] = @issue.errors.full_messages.join(", ")
    end

    redirect_to issue_path(@issue)
  end

  private

  # Resolves the target closed status from plugin settings.
  # If a specific status is configured, uses that; otherwise falls back to first closed by position.
  def target_closed_status
    configured_id = Setting.plugin_redmine_fast_close["closed_status_id"]

    if configured_id.present?
      IssueStatus.find_by(id: configured_id, is_closed: true)
    else
      IssueStatus.where(is_closed: true).order(:position).first
    end
  end

  # Finds the issue from the URL parameter and sets the project context.
  def find_issue
    @issue = Issue.find(params[:id])
    @project = @issue.project
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
