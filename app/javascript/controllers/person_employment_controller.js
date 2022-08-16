import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["personForm", 'employmentForm'];

  connect() {
    console.log('connected')
  }

  personCreated(e) {
    if (e.detail.success) {
      this.element.querySelector('[for="employment"]').classList.remove('btn-disabled')
      this.personFormTarget.checked = false;
      this.employmentFormTarget.checked = true;
    }
  }

  employmentCreated(e) {
    if (e.detail.success) {
      Turbo.visit(e.detail.fetchResponse.response.url)
      e.preventDefault()
      e.stopPropagation()
      return
    }
  }
}
