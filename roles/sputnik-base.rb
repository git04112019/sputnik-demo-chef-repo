name "sputnik-base"
description "Sputnik laptop base role."
run_list(
  "recipe[apt::cacher-ng]"
  )

# "recpe[lxc]"
