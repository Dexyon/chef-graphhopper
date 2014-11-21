#
# Cookbook Name:: graphhopper
# Recipe:: default
#
# Copyright 2014, Erik van Seters | Dexyon.com
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'java'

mirror = node['graphhopper']['mirror']
version = node['graphhopper']['version']
graphhopper_home = "#{node['graphhopper']['home']}/graphhopper-#{version}"

# Create OS user
user node['graphhopper']['uid'] do
   comment "Graphhopper service user"
   action :create
   system true
   shell '/sbin/nologin'
   supports :manage_home => true
   home "/home/#{node['graphhopper']['uid']}"
end

# create application directory and extract archive
#unless File.exists?("#{graphhopper_home}/bin/graphhopper")
  directory graphhopper_home do
    recursive true
  end

  directory graphhopper_home do
    owner "#{node['graphhopper']['uid']}"
    group "#{node['graphhopper']['gid']}"
  end

  remote_file "#{graphhopper_home}/graphhopper-web-#{version}-with-dep.jar" do
    source "#{mirror}/#{version}/graphhopper-web-#{version}-with-dep.jar"
    user "#{node['graphhopper']['uid']}"
    group "#{node['graphhopper']['gid']}"
    mode '774'
  end

  #directory graphhopper_home do
  #  owner "#{node['graphhopper']['uid']}"
  #  group "#{node['graphhopper']['gid']}"
  #  recursive true
  #end
#end

directory "#{graphhopper_home}/bin" do
  owner "#{node['graphhopper']['uid']}"
  group "#{node['graphhopper']['gid']}"
  mode '0774'
  action :create
end

# configure init script
template "#{graphhopper_home}/bin/graphhopper.init" do
   source 'graphhopper.init.erb'
   mode '0755'
   notifies :restart, 'service[graphhopper]'
end

# configure the start script
template "#{graphhopper_home}/start.sh" do
   source 'start.sh.erb'
   mode '0755'
end

# Copy the graphhopper config
template "#{graphhopper_home}/config.properties" do
   source 'config.properties.erb'
   mode '0755'
end



link '/etc/init.d/graphhopper' do
    to "#{graphhopper_home}/bin/graphhopper.init"
end

service 'graphhopper' do
  supports :restart => true
  action [:enable]
end
