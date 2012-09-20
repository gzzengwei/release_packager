class SystemConfig < ActiveRecord::Base
  attr_accessible :repo_name, :repo_dir, :package_dir, :repo_branch
end
