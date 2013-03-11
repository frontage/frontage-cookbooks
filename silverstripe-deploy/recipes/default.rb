node[:deploy].each do |application, deploy|

	Chef::Log.debug("deploy::php application #{application} #{deploy}")

	#bash "setup silverstripe assets" do
	#  code <<-EOH
	#  mkdir #{deploy[:deploy_to]}/test_folder
	#  EOH

	#end

	directory "assets" do
		path "/vol/assets/#{application}"
		mode 0777
		action :create
		not_if do
    		::File.exists?("/vol/assets/#{application}")
  		end
	end

	link "assets" do
		target_file "#{deploy[:absolute_document_root]}assets"
		to "/vol/assets/#{application}"
		action :create
		not_if do
    		::File.exists?("#{deploy[:absolute_document_root]}assets")
  		end
	end

	#file "#{deploy[:absolute_document_root]}/.htaccess"

	file "#{deploy[:absolute_document_root]}.htaccess" do
  		replace("SetEnv ENVIRONMENT local", "SetEnv ENVIRONMENT production") if include? "SetEnv ENVIRONMENT"
	end

end