class ProfilesController < ApplicationController
  def show
  	@author = Author.find_by_profile_name(params[:id])
  	if @author
  		@articles = @author.articles.order('created_at desc').all
  		render action: :show
  	else
  		render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
