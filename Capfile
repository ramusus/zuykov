load 'deploy'

# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

set :default_environment, {
  'LANG' => 'en_US.UTF-8',
  'PATH' => '/usr/kerberos/sbin:/usr/sbin:/sbin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin'
}