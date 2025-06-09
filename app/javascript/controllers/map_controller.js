import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    // Add zoom controls
    // Disable scroll zoom to prevent zooming with mousepad/mouse wheel
    // this.map.scrollZoom.disable()
    // Disable double click zoom
    // this.map.doubleClickZoom.disable()
    // Disable touch zoom for mobile devices
    // this.map.touchZoomRotate.disable()
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(marker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

   #fitMapToMarkers() {
     const bounds = new mapboxgl.LngLatBounds()
     this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
     this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
