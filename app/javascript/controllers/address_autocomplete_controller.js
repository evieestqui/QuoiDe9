import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "address",
      language: "en",
      enableGeolocation: true,
      placeholder: "Search for a location",
      countries: "fr",
    })
    this.geocoder.addTo(this.element)

    this.element.querySelectorAll("button").forEach(button => {
      button.setAttribute("type", "button")
    })

    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
    document.getElementById("location").textContent = event.result.context[3].text_en
  }

  #clearInputValue() {
    this.addressTarget.value = ""
    document.getElementById("location").textContent = "My location"
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
