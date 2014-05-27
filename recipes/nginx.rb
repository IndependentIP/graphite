include_recipe 'nginx'

template "#{node['nginx']['dir']}/sites-available/graphite" do
  source 'graphite-nginx.conf.erb'
  notifies :reload, 'service[nginx]'
end

nginx_site 'graphite' do
  enable true
end

nginx_site '000-default' do
  enable false
end
