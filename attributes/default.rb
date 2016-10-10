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
default['dfu_util']['install_as_root'] = false
default['dfu_util']['user'] = 'vagrant'
default['dfu_util']['group'] = 'vagrant'

# Most directories are relative to this
default['dfu_util']['dir'] = "/home/#{node['dfu_util']['user']}/dfu-util"

default['dfu_util']['repo_url'] = "https://gitorious.org/dfu-util/dfu-util.git"
default['dfu_util']['repo_ref'] = "master"
