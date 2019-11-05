# Init class for the sudo module
class sudo (
  Hash $rules = {},
  Boolean $purge = true,
) {
  if $rules {
    file { 'Purging of sudoers.d directory':
      ensure  => directory,
      path    => '/etc/sudoers.d',
      owner   => 'root',
      group   => 'root',
      mode    => '0750',
      purge   => $purge,
      recurse => true,
      force   => true,
    }->
    file { 'Sudo rule definitions':
      ensure  => file,
      path    => '/etc/sudoers.d/rules',
      owner   => 'root',
      group   => 'root',
      mode    => '0750',
      content => template('sudo/rules.erb')
    }
  }
}
