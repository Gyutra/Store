ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.

  def update
    @category = Category.find(params[:id])

      if @category.update(category_params)
        redirect_to @category
      else
        render 'edit' 
      end			
  end
