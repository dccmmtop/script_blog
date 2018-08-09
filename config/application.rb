require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ScriptBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app')]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # config.assets.precompile << proc.new do |path| 
    #   if path =~ /\.(css|js |scss|png|jpg|gif|js on)\z/ 
    #     full_path = rails.application.assets.resolve(path).to_path 
    #     app_assets_path1 = rails.root.join('app', 'assets').to_path 
    #     app_assets_path2 = rails.root.join('public', 'assets').to_path 
    #     app_assets_path3 = rails.root.join('vendor', 'assets').to_path 
    #
    #     if full_path.starts_with? app_assets_path1 
    #       true 
    #     elsif full_path.starts_with? app_assets_path2 
    #       true 
    #     elsif full_path.starts_with? app_assets_path3 
    #       true 
    #     else 
    #       false 
    #     end 
    #   end 
    # end 
  end
end
