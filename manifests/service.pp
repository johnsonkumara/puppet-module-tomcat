class tomcat::service inherits tomcat {
   service { $::tomcat::service_name:
      ensure  => $::tomcat::service_state,
      enable  => true,
      require => Class[ 'tomcat::install' ],
      subscribe => File[$::tomcat::config_path],
   }
}