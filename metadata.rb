name             'dfu-util'
maintainer       'Free Beachler'
maintainer_email 'longevitysoft@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures dfu-util from the sf.net repository.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'
depends          'git'
depends          'apt'

source_url 'https://github.com/tenaciousRas/dfu-util'
issues_url 'https://github.com/tenaciousRas/dfu-util/issues'

chef_version '>= 12.1'
