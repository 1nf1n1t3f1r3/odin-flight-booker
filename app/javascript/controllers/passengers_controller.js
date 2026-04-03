import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container", "template"];

  connect() {
    this.index = this.containerTarget.children.length;
  }

  add() {
    let content = this.templateTarget.innerHTML.replace(
      /NEW_INDEX/g,
      this.index,
    );
    this.containerTarget.insertAdjacentHTML("beforeend", content);
    this.index++;
  }

  remove(event) {
    const passengers = this.containerTarget.children;

    if (passengers.length <= 1) return;

    event.target.closest(".passenger").remove();
  }
}
