require 'spec_helper'

describe Release do
  before(:all) do
	SystemConfig.create(
			:repo_name => 'Test Repo',
			:repo_dir => 'repo_dir',
			:repo_branch => 'master',
			:package_dir => 'package_dir'
	)	
  end 

  describe "set_attrs" do

  	it "should replace space with underscore for release_tag" do
	  release = Release.new(
	  		:commit_id => 'test commit',
	  		:release_tag => 'release tag',
	  		:release_message => 'test message'
	  		)
	  release.set_attrs
	  assert_equal release.release_tag, 'release_tag'
  	end

  	it "should generate package file name and path" do
  	  t = Time.new(2012,9,21, 13,30,0, "+10:00")
	  release = Release.new(
	  		:commit_id => 'test commit',
	  		:release_tag => 'release_tag',
	  		:release_message => 'test message'
	  		)
	  Time.stub!(:now).and_return(t)
	  release.set_attrs
	  assert_equal release.package_file_name, "release_tag_21_09_2012-01_30_PM.zip"
	  assert_equal release.package_file_path, "package_dir/release_tag_21_09_2012-01_30_PM.zip"
  	end

  end

end
