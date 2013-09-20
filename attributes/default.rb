include_attribute "jetty"

expand! unless Chef::Config[:solo]

default[:solr][:version]   = "4.4.0"
default[:solr][:directory] = "/usr/local/src"
default[:solr][:checksum]  = "f188313f89ac53229d0b89e35391facd18774e6f708803151e50ba61bbe18906" #sha265

if solr.version.split('.').first.to_i >= 4
  default[:solr][:link]      = "http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/#{solr.version}/solr-#{solr.version}.tgz"
  default[:solr][:download]  = "#{solr.directory}/solr-#{solr.version}.tgz"
  default[:solr][:extracted] = "#{solr.directory}/solr-#{solr.version}"
  default[:solr][:war]       = "#{solr.extracted}/dist/solr-#{solr.version}.war"
else
  default[:solr][:link]      = "http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/#{solr.version}/apache-solr-#{solr.version}.tgz"
  default[:solr][:download]  = "#{solr.directory}/apache-solr-#{solr.version}.tgz"
  default[:solr][:extracted] = "#{solr.directory}/apache-solr-#{solr.version}"
  default[:solr][:war]       = "#{solr.extracted}/dist/apache-solr-#{solr.version}.war"
end


default[:solr][:context_path]  = 'solr'
default[:solr][:home]          = "/etc/solr"
set[:solr][:config]            = node.solr.home + "/conf"
set[:solr][:lib]               = node.solr.home + "/lib"
default[:solr][:data]          = "#{node.jetty.home}/webapps/#{node.solr.context_path}/data"
default[:solr][:custom_config] = nil
default[:solr][:custom_lib]    = nil
