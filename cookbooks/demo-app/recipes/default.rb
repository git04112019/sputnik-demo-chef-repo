#
# Cookbook Name:: demo-app
# Recipe:: default
#
# Copyright 2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apache2"

#put the images in the apache directory
%w{dell.png opscode.png sputnik.png chef.png}.each do |image|
  cookbook_file "/var/www/#{image}" do
    source image
    mode '0644'
  end
end

#write out the webpage
template '/var/www/index.html' do
  source 'index.html.erb'
  mode '0644'
end
