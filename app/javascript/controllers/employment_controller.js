import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
  }

  validate(e) {
    if (this.element.checkValidity()) {
      this.element.querySelector('[type="submit"]').classList.remove('btn-disabled')
    } else {
      this.element
        .querySelector('[type="submit"]')
        .classList.add("btn-disabled");
    }
  }
}
