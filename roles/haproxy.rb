name "haproxy"
description "haproxy application load balancer for the demo-app"
run_list(
  "recipe[haproxy::app_lb]"
  )

override_attributes(
  "haproxy" => {
    "app_server_role" => "demo-app"
  }
  )
