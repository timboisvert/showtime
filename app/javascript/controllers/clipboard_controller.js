import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {

  static targets = ["textField"]

  copy() {

    const text = this.textFieldTarget.value
    navigator.clipboard.writeText(text)
      .then(() => {
        console.log("=== CLIPBOARD COPY SUCCESS ===")
      })
      .catch((error) => {
        console.error("=== CLIPBOARD COPY FAILED ===", error)
      });

  }
}
