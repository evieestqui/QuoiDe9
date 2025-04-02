import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dialog"]

  open() {
    console.log("open")
    this.dialogTarget.classList.remove("hidden")
  }

  close() {
    console.log("close")
    this.dialogTarget.classList.add("hidden")
  }
}
