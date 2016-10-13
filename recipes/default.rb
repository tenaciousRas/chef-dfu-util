#
# Cookbook Name:: dfu-util
# Recipe:: default
#
# Copyright 2016, Free Beachler, Longevity Software LLC
#
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
###
# installs dfu-util via particle github repo

# git clone https://gitorious.org/dfu-util/dfu-util.git $HOME/dfu-util
# sudo apt-get libusb-1.0
# cd $HOME/dfu-util
# ./autogen.sh
# ./configure
# make
# sudo make install

#directory node['dfu_util']['dir'] do
#  user node['dfu_util']['user']
#  group node['dfu_util']['group']
#  action :create
#end

include_recipe 'apt'
include_recipe 'git'

git node['dfu_util']['dir'] do
  user node['dfu_util']['user']
  group node['dfu_util']['group']
  repository node['dfu_util']['repo_url']
  reference node['dfu_util']['repo_ref']
  timeout 5
  retries 2
  retry_delay 2
  action :sync
  not_if { ::File.directory?("#{node['dfu_util']['dir']}/.git") }
end

package 'Install DFU-UTIL Make Dependencies' do
  case node[:platform]
  when 'redhat', 'centos', 'debian'
  when 'ubuntu'
    package_name 'libusb-1.0'
  end
end

script 'Build dfu-util from Sources and Install' do
  interpreter "bash"
  cwd node['dfu_util']['dir']
  code <<-EOH
    ./autogen.sh
    ./configure
    make
    sudo make install
    sudo ln -s /usr/local/bin/dfu-util /usr/bin/dfu-util
    EOH
  not_if { ::File.exists?("/usr/local/bin/dfu-util") && ::File.exists?("/usr/bin/dfu-util") }
end
