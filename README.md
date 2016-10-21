# dfu-util Cookbook

Installs dfu-util from sources.  Installs dependencies such as libusb (v1.0) for compilation if needed.  Dfu-util sources are obtained from Particle github repo by default.

## Requirements

### Platforms
- Debian/Ubuntu
- Mac OS X

### Chef
- Chef 12.0+

### Cookbooks
- apt -- needed for libusb package(s)
- git -- needed for dfu-util source repo. and other libraries

## Attributes
Customize the attributes to suit site specific conventions and defaults.
- `node['dfu_util']['dir']` - user to use for install.  defaults to /home/[user]/particle.
- `node['dfu_util']['directories']['tmp']` - location of tmp folder to use for cookbook activities.


### dfu-util::default

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| <span style="font-family: monospace;">['dfu_util']['user']</span> | String | User name used for install. The binary package will be given these user permissions and placed under this users home directory. | <span style="font-family: monospace;">vagrant</span> |
| <span style="font-family: monospace;">['dfu_util']['group']</span> | String | Group to use for install. | <span style="font-family: monospace;">vagrant</span> |
| <span style="font-family: monospace;">['dfu_util']['dir']</span> | String | Directory to place dfu_util_embedded downloads/binaries/sources. | <span style="font-family: monospace;">/home/#{node['dfu_util']['user']}/dfu-util</span> |
| <span style="font-family: monospace;">['dfu_util']['directories']['tmp']</span> | String | tmp folder for cookbook-related activities | <span style="font-family: monospace;">#{node['dfu_util']['dir']}/tmp</span> |
| <span style="font-family: monospace;">['dfu_util']['directories']['bin']</span> | String | bin folder for cookbook-related activities | <span style="font-family: monospace;">#{node['dfu_util']['dir']}/bin</span> |
| <span style="font-family: monospace;">['dfu_util']['repo_url']</span> | String | dfu-util source git repository URL | <span style="font-family: monospace;">https://gitorious.org/dfu-util/dfu-util.git</span> |
| <span style="font-family: monospace;">['dfu_util']['repo_ref']</span> | String | dfu-util source repository git-ref | <span style="font-family: monospace;">master</span> |

## Resources
Not currently defined.

## Actions
- `:create`: Downloads dfu-util and installs it by putting it on the user's PATH.

## Providers
- `:create`: Configures and compiles the dfu-util sources with MAKE using a BASH script template.


## Usage

### dfu-util::default

Just include `dfu-util` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dfu-util]"
  ]
}
```

## Examples

Install dfu-util in non-default folder with non-default user.
```ruby
 dfu-util do
   user 'my-user'
   group 'my-group'
   dir 'dfu-util-0.8'
   action :create
 end
```

Install dfu-util in default folder for default user with non-default binary version.
```ruby
 dfu-util do
   repo_url 'https://github.com.foo/my_user/dfu_util_sources.git'
   repo_ref 'master'
   action :create
 end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License & Authors
- Author: Free Beachler, Longevity Software LLC, ([longevitysoft@gmail.com](mailto:longevitysoft@gmail.com))
- Copyright: 2016, Free Beachler

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

