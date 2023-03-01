import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  static targets = [ "links", "template" ]
  static values = { index: String }

  connect() {
    this.wrapperClass = this.data.get("wrapperClass") || "nested-fields";
  }

  add_association(event) {
    event.preventDefault();
    var content = this.templateTarget.innerHTML.replace(new RegExp(this.indexValue, 'g'), new Date().getTime())

    this.linksTarget.insertAdjacentHTML('beforebegin', content)

    this.fireNestedFormEvent("add");
  }

  remove_association(event) {
    if(event) { event.preventDefault(); }

    let wrapper = event.target.closest("." + this.wrapperClass)

    if (wrapper.dataset.newRecord == "true") {
      wrapper.remove()
    } else {
      event.currentTarget.querySelector("input[name*='_destroy']").value = 1
      wrapper.style.display = 'none'
    }

    this.fireNestedFormEvent("remove");
  }

  fireNestedFormEvent(eventType) {
    const e = new CustomEvent(`nested-form.${eventType}`, { detail: this });
    window.dispatchEvent(e);
  }
}
