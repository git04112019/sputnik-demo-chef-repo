name "base"
description "Base role."
run_list(
  "recipe[apt::cacher-client]",
  "recipe[chef-client::delete_validation]",
  "recipe[ntp]",
  "recipe[openssh]",
  "recipe[sudo]",
  "recipe[users::sysadmins]"
  )
