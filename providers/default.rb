#
# Cookbook Name:: dfu-util
# Provider:: dfu-util_install
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

action :create do
  user_install = new_resource.user_install
  user_home = new_resource.user_home
  chef_dfu_util_user = new_resource.user
  chef_dfu_util_group = new_resource.group
  dfu_util_dir = new_resource.dfu_util_directory

  template node['dfu_util']['dir'] do
    source 'dfu_util_install.sh.erb'
    mode 0755
    cookbook 'dfu-util'
    variables ({
      :dfu_util_dir => dfu_util_directory,
      :user_install => user_install
    })
  end

  script "Installing dfu-util, as #{chef_dfu_util_user}:#{chef_dfu_util_user} from #{dfu_util_dir}" do
    interpreter 'bash'
    user chef_dfu_util_user
    group chef_dfu_util_group
    environment Hash['HOME' => user_home]
    code <<-EOH
      export DFU_UTIL_DIR=#{dfu_util_dir}
      source #{dfu_util_dir}/dfu_util_install.sh
    EOH
  end
end
