class Release < ActiveRecord::Base
  attr_accessible :commit_id, :release_tag, :release_message

  before_save :set_attrs, :pack_release

  default_scope :order => "created_at DESC"

  def self.valid_commits
  	@repo = Grit::Repo.new(SystemConfig.first.repo_dir)
  	if Release.count == 0
      @repo.commits
  	else
  	  last_committed_date = @repo.commit(Release.last.commit_id).committed_date
  	  @repo.commits.reject!{|commit| commit.committed_date <= last_committed_date}
  	end
  end

  def set_attrs
  	self.release_tag.gsub!(' ', '_')
  	self.package_file_name = "#{self.release_tag}_#{Time.now.strftime('%d_%m_%Y-%I_%M_%p')}.zip"
  	self.package_file_path = File.join(SystemConfig.first.package_dir, self.package_file_name)
  end

  def pack_release
  	`cd #{SystemConfig.first.repo_dir} && git checkout #{SystemConfig.first.repo_branch} && git checkout #{self.commit_id} && git tag #{self.release_tag} #{self.commit_id}`
  	`zip -r -q #{self.package_file_path} #{SystemConfig.first.repo_dir}`
  end


end
