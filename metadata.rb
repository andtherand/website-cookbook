name		  	  "website"
maintainer        "mychiara"
maintainer_email  "mychiara+cookbooks@gmail.com"
license           "Apache 2.0"
description       "enables a different site.conf for apache"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.2"
recipe            "website", "installs the website cookbook for a customized site.conf file"

%w{ debian ubuntu }.each do |os|
  supports os
end

%w{ apache2 php git database}.each do | cookbook |
	depends cookbook
end

