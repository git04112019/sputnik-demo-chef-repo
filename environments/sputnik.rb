name "sputnik"
description "The developer environment on the Sputnik laptop."

#cookbook versions

#override attributes
override_attributes(
  "authorization" => {
    "sudo" => {
      "groups" => ["admin", "wheel", "sysadmin"],
      "users" => ["mray","ubuntu"],
      "passwordless" => true,
      "include_sudoers_d" => true
    }
  }
  )
