import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["personForm", 'employmentForm'];

  connect() {
    console.log('connected')
  }

  personCreated(e) {
    if (e.detail.success) {
      this.personFormTarget.checked = false;
      this.employmentFormTarget.checked = true;
    }
  }
}
