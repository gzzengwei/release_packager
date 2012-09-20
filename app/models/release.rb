class Release < ActiveRecord::Base
  attr_accessible :commit_id, :release_tag, :release_message

  before_save :pack_release

  default_scope :order => "created_at DESC"

  def self.last_commit_id
  	Release.last.commit_id
  end

  def self.valid_commits
  	@repo = Grit::Repo.new(REPO_DIR)
  	if Release.count == 0
      @repo.commits
  	else
  	  last_committed_date = @repo.commit(Release.last.commit_id).committed_date
  	  @repo.commits.reject!{|commit| commit.committed_date <= last_committed_date}
  	end
  end

  def pack_release
  	self.release_tag.gsub!(' ', '_')
  	self.package_file_name = "#{self.release_tag}_#{Time.now.strftime('%d_%m_%Y-%I_%M_%p')}.zip"
  	package_file_path = File.join(PACKAGE_DIR, self.package_file_name)
  	`cd #{REPO_DIR} && git checkout #{self.commit_id} && git tag #{self.release_tag} #{self.commit_id}`
  	`zip -r -q #{package_file_path} #{REPO_DIR}`
  end


end
