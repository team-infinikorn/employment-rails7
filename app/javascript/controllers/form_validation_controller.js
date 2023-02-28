import { Controller } from "@hotwired/stimulus"
import IMask from 'imask';

export default class extends Controller {
  static targets = [ "form", "emailField", "errorField", "phoneField" ]

  connect() {
    this.validateEmail();
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
    if(!this.emailFieldTarget.value) { return }

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
    IMask(this.phoneFieldTarget, {
      mask: "000-000-0000",
    });
  }
}
