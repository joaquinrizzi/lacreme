import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["display", "form", "name", "price", "description", "duration"];

  connect() {
    // console.log("Hello from service_edit_controller.js");
  }

  edit(event) {
    console.log("edit");

    event.preventDefault();
    this.displayTargets.forEach(el => el.classList.add("d-none"));
    this.formTarget.classList.remove("d-none");
  }

  save(event) {
    event.preventDefault();
    const url = this.formTarget.querySelector("form").action;
    const formData = new FormData(this.formTarget.querySelector("form"));

    fetch(url, {
      method: 'PATCH',
      body: formData,
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      }
    }).then(response => response.json())
      .then(data => {
        if (data.success) {
          this.nameTarget.textContent = data.service.name;
          this.priceTarget.textContent = `${data.service.price} €`;
          this.descriptionTarget.textContent = data.service.description;
          this.durationTarget.textContent = `${data.service.duration} min`;
          this.displayTargets.forEach(el => el.classList.remove("d-none"));
          this.formTarget.classList.add("d-none");
        }
      });
  }

}
