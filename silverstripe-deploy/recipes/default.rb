bash "really awesome way to create a mysql database from chef using the bash method" do
	# a heredoc of the code to execute, note the node hash is created from the JSON file
  code <<-EOH
  mkdir {deploy[:deploy_to]}/test_folder
  EOH

end