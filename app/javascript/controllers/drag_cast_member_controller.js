import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["person"];

  connect() {
    this.personTargets.forEach(person => {
      person.addEventListener("dragstart", this.handleDragStart);
    });
  }

  handleDragStart(event) {
    event.dataTransfer.setData("text/plain", event.currentTarget.dataset.personId);
  }
}
