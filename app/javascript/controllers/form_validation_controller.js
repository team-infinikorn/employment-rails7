import { Controller } from "@hotwired/stimulus"
import IMask from 'imask';

export default class extends Controller {
  static targets = [ "form", "emailField", "errorField", "phoneField" ]

  connect() {
    this.disableFields();
    this.setupPhoneValidation();
  }

  validateEmail() {
    const email = this.emailFieldTarget.value;
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!email || !regex.test(email)) {
      this.showError();
      this.disableFields();
    } else {
      this.hideError();
      this.enableFields();
    }
  }

  showError() {
    this.errorFieldTarget.innerText = "Please enter a valid email address.";
    this.errorFieldTarget.classList.remove("hidden");
  }

  hideError() {
    this.errorFieldTarget.innerText = "";
    this.errorFieldTarget.classList.add("hidden");
  }

  disableFields() {
    const formElements = this.formTarget.elements;

    for (let i = 0; i < formElements.length; i++) {
      const element = formElements[i];
      if (element !== this.emailFieldTarget) {
        element.disabled = true;
      }
    }
  }

  enableFields() {
    const formElements = this.formTarget.elements;

    for (let i = 0; i < formElements.length; i++) {
      const element = formElements[i];
      element.disabled = false;
    }
  }

  setupPhoneValidation() {
    this.phoneFieldTarget.setAttribute("data-parsley-trigger", "change");
    this.phoneFieldTarget.setAttribute("data-parsley-pattern", "[0-9]{3}-[0-9]{3}-[0-9]{4}");

    IMask(this.phoneFieldTarget, {
      mask: "000-000-0000",
    });
  }
}
