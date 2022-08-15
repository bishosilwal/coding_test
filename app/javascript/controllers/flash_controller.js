import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

  connect() {
    var that = this
    window.setTimeout(
      function() {
        that.element.style.display='none';
      },
      5000
    );
  }
}
