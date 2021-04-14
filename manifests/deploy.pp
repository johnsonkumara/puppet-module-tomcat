define tomcat::deploy(
 $deploy_path = $::tomcat::deploy_path,
 $deploy_url
) {
   file{"${deploy_path}/${name}.war":
      source     => "${deploy_url}",
      owner      => $::tomcat::user,
      group      => $::tomcat::group,
      notify     => Exec['purge_context'],
   }
  exec{"purge_context":
    command => "rm -rf ${deploy_path}/${name}",
    path    => ['/sbin','/usr/sbin','/bin','/usr/bin'],
    refreshonly => true,
    notify      => Service[$::tomcat::service_name],
  }
}