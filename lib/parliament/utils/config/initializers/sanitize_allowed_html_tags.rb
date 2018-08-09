# Be sure to restart your server when you modify this file.

# Allow HTML tags that aren't allowed by default in the SanitizeHelper

# Don't change this
default_sanitize_tags = ActionView::Base.sanitized_allowed_tags
default_sanitize_attributes = ActionView::Base.sanitized_allowed_attributes

# Add your desired HTML tags in here
desired_sanitize_tags = %w[table tbody td tfoot th thead tr]
desired_sanitize_attributes = %w[colspan]

# Merge default_sanitize_tags with desired_sanitize_tags
Rails.application.config.action_view.sanitized_allowed_tags = default_sanitize_tags.merge(desired_sanitize_tags).to_a
Rails.application.config.action_view.sanitized_allowed_attributes = default_sanitize_attributes.merge(desired_sanitize_attributes).to_a
