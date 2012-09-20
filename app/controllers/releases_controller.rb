class ReleasesController < ApplicationController
  def index
  	@commits = Release.valid_commits
  	@releases = Release.all
  	@release = Release.new
  end

  def new
  	@release = Release.new
  	# @commits = Release.valid_commits.map{|commit| ["#{commit.authored_date.to_date} -#{commit.author} - #{commit.message}", commit.id]}
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
