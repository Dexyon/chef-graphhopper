# Cookbook Name:: grapghhopper
# Recipe:: default
#
# Copyright 2014, Erik van Seters
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

default['graphhopper']['mirror'] = 'https://oss.sonatype.org/content/groups/public/com/graphhopper/graphhopper-web'
default['graphhopper']['version'] = '0.3'
default['graphhopper']['home'] = '/opt'
default['graphhopper']['uid'] = 'graphhopper'
default['graphhopper']['gid'] = 'graphhopper'

default['graphhopper']['osm']['location'] = '/opt/maps'
default['graphhopper']['osm']['file'] = 'planet-latest.osm.pbf'

