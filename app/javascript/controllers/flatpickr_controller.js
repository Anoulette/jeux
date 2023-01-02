import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "date" ]
  static values = {
    dates: Array
  }
  connect() {
    flatpickr(this.dateTarget, {
      minDate: "today",
      disable: this.datesValue,
      dateFormat: "Y-m-d",
    });
    flatpickr(this.dateTarget, {
      minDate: "today",
      disable: this.datesValue,
      dateFormat: "Y-m-d",
    });

    this.dateTarget.addEventListener("change", (e) => {
      if (this.dateTarget != "") {
        this.dateTarget.disabled = false
      }
      flatpickr(this.dateTarget, {
        minDate: e.target.value,
        disable: this.datesValue,
        dateFormat: "Y-m-d"
        });
      });
  }
}
