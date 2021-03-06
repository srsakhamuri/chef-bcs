#
# Author:: Chris Jones <cjones303@bloomberg.net>
# Cookbook Name:: chef-bcs
# Recipe:: ceph-osd
#
# Copyright 2017, Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# NOTE: The entries below are examples of how to use Chef to remove and add devices. The data will need to be added in
# the "osd": section of "ceph": in the given environment file just like "devices": are entered.
# "remove": {
#   "devices": [
#     { "node": "ceph-vm1", "osd": 0, "zap": true, "partition": 1, "data": "/dev/sdb", "journal": "/dev/sdf" }
#   ]
# },
# "add": {
#   "devices": [
#     { "node": "ceph-vm3", "data": "/dev/sde", "type": "hdd", "journal": "/dev/sde" }
#   ]
# }

include_recipe 'chef-bcs::ceph-conf'

if node['chef-bcs']['ceph']['tcmalloc']['enable']
  cookbook_file "/etc/sysconfig/ceph" do
    source "ceph"
    owner 'root'
    group 'root'
    mode 00644
  end
end

include_recipe 'chef-bcs::system-schedulers'
