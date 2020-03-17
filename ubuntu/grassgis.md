# Compile GrassGIS 7.8.2 with LibLAS and PDAL support
- LibLAS [PDAL](https://github.com/PDAL/PDAL) are used to read point-cloud data in GrassGIS. As mentioned in the [official doc](https://grasswiki.osgeo.org/wiki/Compile_and_Install_Ubuntu), they can be installed with `apt-get` with other GIS packages by adding the following repo:

```
sudo add-apt-repository ppa:ubuntugis/ppa
```
- GrassGIS source-code can be downloaded from [its github repo](https://github.com/OSGeo/grass/releases).
- Install all the dependencies including liblas-config and pdal-config: `sudo apt install liblas-c-dev libpdal-dev`
- Configuration: `./configure --with-pdal --with-liblas --with-freetype-includes=/usr/include/freetype2`
- Compilation: `make`
- Installation: `sudo make install`
- Install Wx-Python: `sudo apt install python3-wxgtk4.0`