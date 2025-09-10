import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "results"]
    static values = { url: String, resultPartial: String }

    connect() {
        this.timeout = null;
    }

    search() {
        clearTimeout(this.timeout);
        this.timeout = setTimeout(() => {
            this.performSearch();
        }, 250);
    }

    performSearch() {
        const query = this.inputTarget.value.trim();
        if (query.length === 0) {
            this.resultsTarget.innerHTML = "";
            return;
        }
        let url = `${this.urlValue}?q=${encodeURIComponent(query)}`;
        if (this.hasResultPartialValue && this.resultPartialValue) {
            url += `&result_partial=${encodeURIComponent(this.resultPartialValue)}`;
        }
        fetch(url)
            .then(r => r.text())
            .then(html => {
                this.resultsTarget.innerHTML = html;
            });
    }
}
