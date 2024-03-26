# puppet manifest to configure an ubuntu machine

package { 'nginx':
  ensure => installed,
}

file_line { 'rewrite nginx':
  ensure => present,
  path    => '/etc/nginx/sites-availbale/default',
  port    => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://intranet.alxswe.com/projects/266 permanent;',
  require => Package['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!',
  require => Package['nginx'],
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
