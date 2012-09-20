module ReleasesHelper
	def commits_collections(commits)
		commits.map{|commit| ["#{formatted_datetime(commit.committed_date)} - #{commit.committer} - #{commit.message}", commit.id]}
	end
end
