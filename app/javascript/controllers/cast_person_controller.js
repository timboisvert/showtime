import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { castId: Number }

  add(event) {
    event.preventDefault();
    const personId = event.currentTarget.dataset.personId;
    const castId = this.castIdValue;
    fetch(`/casts/${castId}/add_person`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name=csrf-token]').content
      },
      body: JSON.stringify({ person_id: personId })
    })
      .then(r => r.text())
      .then(html => {
        // Replace the cast members list with the new HTML
        const castList = document.getElementById(`cast-members-list-${castId}`);
        if (castList) castList.innerHTML = html;
      });
  }
}
