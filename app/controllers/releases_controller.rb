class ReleasesController < ApplicationController


  def index
  	if SystemConfig.first.blank?
  	  redirect_to :controller => 'system_configs', :action => 'new'
  	else
	  @commits = Release.valid_commits
	  @releases = Release.all
	  @release = Release.new
  	end	
  end

  def new
  	@release = Release.new
  	@commits = Release.valid_commits
  end

  def create
  	@release = Release.new(params[:release])

  	if @release.save
	  redirect_to :action => 'index'
  	else
      render :action => 'new'
  	end
  end

  def generate
  	release = Release.find(params[:id])
  	release.save
	redirect_to :action => 'index'
  end
 

end
