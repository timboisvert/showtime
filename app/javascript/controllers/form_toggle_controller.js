import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-toggle"
export default class extends Controller {
  static targets = ["select", "section"]

  connect() {
    this.toggle()
  }

  toggle() {
    const selectedValue = this.selectTarget.value

    this.sectionTargets.forEach((section) => {
      if (selectedValue.includes(section.dataset.toggleValue)) {
        section.classList.remove("hidden")
      } else {
        section.classList.add("hidden")
      }
    })
  }
}
