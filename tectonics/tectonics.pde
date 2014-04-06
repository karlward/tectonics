/**
 * Displays countries of the world as simple polygons.
 * 
 * Reads from a GeoJSON file, and uses default marker creation. Features are polygons.
 * 
 * Press SPACE to toggle visibility of the polygons.
 */

import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import java.util.List;

UnfoldingMap map;
//ExtrusionDistorter dist = new ExtrusionDistorter();

void setup() {
  size(800, 600, P3D);
  smooth();

  map = new UnfoldingMap(this);
  map.zoomToLevel(3);
  MapUtils.createDefaultEventDispatcher(this, map);

  List<Feature> districts = GeoJSONReader.loadData(this, "Texas_99_to_102.geojson");
  List<Marker> districtMarkers = MapUtils.createSimpleMarkers(districts);
  map.addMarkers(districtMarkers);
  map.zoomAndPanTo(new Location(31.5f, -99.2f), 6);
}

void draw() {
  //dist.distort(new PVector(mouseX, mouseY, 0), new PVector(mouseX, mouseY, 0), 1000);
  map.draw();
  Location location = map.getLocation(mouseX, mouseY);
  fill(0);
  text(location.getLat() + ", " + location.getLon(), mouseX, mouseY);
}

void keyPressed() {
  if (key == ' ') {
    map.getDefaultMarkerManager().toggleDrawing();
  }
}

