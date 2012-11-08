name "production"
description "The production environment in the Cloud."

#cookbook versions

#override attributes
override_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel", "sysadmin"],
      "users" => ["ubuntu"],
      "passwordless" => true,
      "include_sudoers_d" => true
    }
  }
  )

