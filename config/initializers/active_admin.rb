ActiveAdmin.setup do |config|
  config.site_title = "Core Music"
  config.site_title_link = "/"
  # config.site_title_image = "logo.png"
  # config.default_namespace = :admin

  config.authentication_method = :authenticate_admin_user!
  # config.authorization_adapter = ActiveAdmin::CanCanAdapter
  # config.on_unauthorized_access = :access_denied

  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  # config.logout_link_method = :get
  # config.root_to = 'dashboard#index'

  config.allow_comments = false
  # config.show_comments_in_menu = false
  # config.comments_registration_name = 'AdminComment'

  config.batch_actions = true
  # config.before_filter :do_something_awesome
  # config.favicon = '/assets/favicon.ico'
  # config.breadcrumb = false

  # config.register_stylesheet 'my_stylesheet.css'
  # config.register_javascript 'my_javascript.js'

  # config.default_per_page = 30
  # config.filters = true
end
