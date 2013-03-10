node[:deploy].each do |application, deploy|

	Chef::Log.debug("deploy::php application #{application} #{deploy}")

	bash "setup silverstripe assets" do
	  code <<-EOH
	  mkdir #{deploy[:deploy_to]}/test_folder
	  EOH

	end

	directory "assets" do
		path "/vol/assets/#{application}"
		mode 0777
		action :create
	end

	link "assets" do
		target_file "#{deploy[:deploy_to]}/current/assets"
		to "/vol/assets/#{application}"
		action :create
	end

end