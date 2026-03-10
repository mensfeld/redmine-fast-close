# frozen_string_literal: true

post "issues/:id/fast_close", to: "fast_close#close", as: "fast_close_issue"
