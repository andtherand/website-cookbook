if node.has_key?(:website)

    website = node[:website]

    directory website[:log_dir] do
      owner "root"
      group "root"
      mode "0755"
      action :create
      not_if "test #{website[:log_dir]}"
    end

    web_app website[:server_name] do
      template "site.conf.erb"
      server_name website[:server_name]
      server_aliases website[:aliases]
      docroot website[:docroot]
      application_env website[:application_env]
      log_level website[:log_level]
      rewrite_log_level website[:rewrite_log_level]
      log_dir website[:log_dir]
    end

    apache_site "default" do
        enable false
    end

    template "#{website[:docroot]}/robots.txt" do
      owner "root"
      group "root"
      source "robots.txt.erb"
      mode "0644"
    end

end
