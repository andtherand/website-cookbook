case platform
    when "redhat","centos","fedora","suse"
        default[:website][:log_dir] = '/var/log/httpd'

    when "debian","ubuntu"
        default[:website][:log_dir] = '/var/log/apache2/'
end

default[:website][:log_level] = 'warn'
default[:website][:application_env] = 'development'
default[:website][:rewrite_log_level] = 0
default[:website][:docroot] = '/var/www/'
default[:website][:log_dir] = node[:website][:log_dir]