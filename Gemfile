source 'https://rubygems.org'

 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end

 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.1.2'

 group :production do
   # Use pg as the production database for Active Record
   gem 'pg'
   #This gem will configure your application to serve static assets so that you do not need to do this manually in a config file.
   # so that you dont have to add config.serve_static_assets = true to config/application.rb
   gem 'rails_12factor'
 end


 group :development do
   gem 'better_errors'
   gem 'binding_of_caller'
   # Use pg as the production database for Active Record
   gem 'pg'
   #This gem will configure your application to serve static assets so that you do not need to do this manually in a config file.
   # so that you dont have to add config.serve_static_assets = true to config/application.rb
   gem 'rails_12factor'
   gem 'listen', '~> 3.0.5'
 end

  group :development, :test do
    gem 'rspec-rails'
    gem 'shoulda'
    gem 'factory_girl_rails'
    gem 'simplecov' # used to help track what tests have been covered.
    gem 'pry-rails'
  end

  group :test do
    gem 'stripe-ruby-mock', '~> 2.4.1', :require => 'stripe_mock'
  end

 # Use Puma as the app server
 gem 'puma', '~> 3.0'
 # Use pg as the production database for Active Record
 gem 'pg'
 #This gem will configure your application to serve static assets so that you do not need to do this manually in a config file.
 # so that you dont have to add config.serve_static_assets = true to config/application.rb
 gem 'rails_12factor'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'

 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
 gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'

 gem 'thor', '0.19.1'

 gem 'bootstrap-sass', '3.3.6'

 gem 'bcrypt'

 gem 'devise'
#enables yaml files,
 gem 'figaro'

 gem 'rails-controller-testing'

 gem 'pundit'

 gem 'bootswatch-rails'

 gem 'stripe'

 gem 'redcarpet'

 gem 'faker'
