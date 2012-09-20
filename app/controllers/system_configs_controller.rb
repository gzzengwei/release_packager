class SystemConfigsController < ApplicationController
  def new
  	if SystemConfig.first.blank?
  	  @system_config = SystemConfig.new  	
  	else
  	  redirect_to :controller => 'releases', :action => 'index'		
  	end  
  end

  def create
  	@system_config = SystemConfig.new(params[:system_config])
  	@system_config.save
  	if @system_config.save
	  redirect_to :controller => 'releases', :action => 'index'
  	else
      render :action => 'new'
  	end  	
  end

  def index  	
  	@system_config = SystemConfig.first
  	render :action => 'edit'
  end

  def edit
  	@system_config = SystemConfig.first
  end

  def update
  	@system_config = SystemConfig.first
  	if @system_config.update_attributes(params[:system_config])  	
  	  redirect_to :controller => 'releases', :action => 'index'
  	else
  	  render :action => 'edit'		
  	end
  end
end
