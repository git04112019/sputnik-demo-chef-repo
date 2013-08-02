Description
===========
This is the repo for deploying a Sputnik demo. I can make a change!

This repository contains the roles, environments and data bags for deploying an Sputnik laptop demonstration application.

There is also a Spiceweasel (http://bit.ly/spcwsl) manifest documenting all the community cookbooks, roles, data bags and environments required for this demo.

Issues
======
For the cloud provider, you may need development versions of Ohai if running on an OpenStack cloud and the trunk release of knife-rackspace if using Rackspace V2.

The `apt` cookbook is currently from https://github.com/mattray/apt/tree/COOK-1875 but should be released shortly.

Usage
=====
To see the commands necessary to push all of the files to the Chef server, run the following command:

```
spiceweasel infrastructure.yml
```

To actually deploy the repository to your Chef server, run the following command:

```
spiceweasel infrastructure.yml | sh
```

Demo
====
1.  Configure the Sputnik laptop for lxc and apt-cacher-ng with the `sputnik-base` Role.
1.  Launch an `haproxy` node on lxc in the `sputnik` Environment.
1.  Launch 2 `demo-app` nodes on lxc in the `sputnik` Environment.
1.  knife ssh "role:haproxy AND chef_environment:sputnik" "chef-client"
1.  Connect to the `haproxy` node in `sputnik` on port 22002 to see the web UI console.
1.  Connect to the `haproxy` node in `sputnik` on port 80 to see the `demo-app`, refresh a couple of times.
1.  Launch an `haproxy` node in the cloud in the `production` Environment.
1.  Launch 2 `demo-app` nodes in the cloud in the `production` Environment.
1.  knife ssh "role:haproxy AND chef_environment:production" "chef-client"
1.  Connect to the `haproxy` node in `production` on port 22002 to see the web UI console.
1.  Connect to the `haproxy` node in `production` on port 80 to see the `demo-app`, refresh a couple of times.
1.  Bump up the version number of the `demo-app` cookbook in the `metadata.rb`.
1.  Make a change to the `demo-app` cookbook.
1.  knife cookbook upload `demo-app`
1.  knife ssh "recipe:demo-app" "chef-client"
1.  Connect to the `haproxy` node in `production` on port 80 to see the `demo-app`, refresh a couple of times. Nothing happens because we pinned the cookbook version.
1.  Update the `sputnik` environment to use the new version of the `demo-app` cookbook.
1.  knife environment from file sputnik.rb
1.  knife ssh "recipe:demo-app AND chef_environment:sputnik" "chef-client"
1.  Connect to the `haproxy` node in `sputnik` on port 80 to see the new `demo-app`, refresh a couple of times.
1.  Fire up 10 more `demo-app` boxes in the `production` environment.
1.  Update the `sputnik` environment to use the new version of the `demo-app` cookbook.
1.  knife ssh "chef_environment:production" "chef-client"
1.  Connect to the `haproxy` node in `production` on port 22002 to see the web UI console.
1.  Connect to the `haproxy` node in `production` on port 80 to see the `demo-app`, refresh a couple of times.

Environments
============
The environments in this repo lock the versions of the cookbooks and override attributes used to differentiate `sputnik` laptop development environment from the `production` environment.

Roles
=====
base
----
Recipes for every machine deployed. Attempts to use `apt::cacher-client`.

sputnik-base
------------
Sets up the Sputnik laptop with `lxc` and `apt-cacher-ng` (for use by the lxc VMs).

haproxy
-------
The demo application sits behind the software load balancer `haproxy`.

Cookbooks
=========
With the exception of the `demo-app` cookbook, the cookbooks used by this repository are all

demo-app
--------
Trivial html page behind `apache2` that renders the names of the machines to demonstrate the `haproxy` integration.

License
=======
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

