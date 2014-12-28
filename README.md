Graphhopper Cookbook
====================

This cookbook downloads and install the Graphhopper routing library.

Requirements
------------

#### packages
- `java` - Installs a Java. Uses OpenJDK by default but supports installation of Oracle's JDK.

Attributes
----------

#### graphhopper::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['graphhopper']['mirror']</tt></td>
    <td>String</td>
    <td>The location where to graphhopper is downloaded from.</td>
    <td><tt>https://oss.sonatype.org/content/groups/public/com/graphhopper/graphhopper-web</tt></td>
  </tr>
  <tr>
    <td><tt>['graphhopper']['version']</tt></td>
    <td>Integer</td>
    <td>The version of graphhopper to download</td>
    <td><tt>0.3</tt></td>
  </tr>
  <tr>
    <td><tt>['graphhopper']['home']</tt></td>
    <td>String</td>
    <td>The location where to install graphhopper</td>
    <td><tt>/opt</tt></td>
  </tr>
  <tr>
    <td><tt>['graphhopper']['uid']</tt></td>
    <td>String</td>
    <td>The user which runs the graphhopper instance</td>
    <td><tt>graphhopper</tt></td>
  </tr>
  <tr>
    <td><tt>['graphhopper']['gid']</tt></td>
    <td>String</td>
    <td>The group which runs the graphhopper instance</td>
    <td><tt>graphhopper</tt></td>
  </tr>
  <tr/>
  <tr>
    <td><tt>['osm']['location']</tt></td>
    <td>String</td>
    <td>The folder location of the OSM maps</td>
    <td><tt>/opt/osm-maps</tt></td>
  </tr>
  <tr>
    <td><tt>['osm']['file']</tt></td>
    <td>String</td>
    <td>The name of the OSM maps file</td>
    <td><tt>current_map.osm.pbf</tt></td>
  </tr>
</table>

Usage
-----
#### graphhopper::default

Just include `graphhopper` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[graphhopper]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Erik van Seters | Dexyon.com
