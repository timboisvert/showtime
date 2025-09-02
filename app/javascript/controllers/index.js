// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)


// Copy to Clipboard
const textToCopy = document.getElementById('copyToClipboard').value;
async function copyToClipboard(text) {
    try {
        await navigator.clipboard.writeText(text);
    } catch (err) {
        console.error('Failed to copy text: ', err);
    }
}

// Example usage, triggered by a button click:
document.getElementById('copyToClipboardButton').addEventListener('click', () => {
    copyToClipboard(textToCopy);
});