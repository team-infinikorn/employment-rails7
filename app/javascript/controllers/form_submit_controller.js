import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"

export default class extends Controller {
  static targets = ["requiredField", "submitButton"]

  connect() {
    this.disableSubmitButton()
  }

  checkFormValidity() {
    if (this.allRequiredFieldsFilled()) {
      this.enableSubmitButton()
    } else {
      this.disableSubmitButton()
    }
  }

  allRequiredFieldsFilled() {
    return this.requiredFieldTargets.every((field) => field.value.trim() !== "")
  }

  enableSubmitButton() {
    this.submitButtonTarget.disabled = false
    this.submitButtonTarget.classList.add("bg-blue-600")
    this.submitButtonTarget.classList.remove("bg-blue-300")
  }

  disableSubmitButton() {
    this.submitButtonTarget.disabled = true
    this.submitButtonTarget.classList.add("bg-blue-300")
    this.submitButtonTarget.classList.remove("bg-blue-600")
  }

  get submitButtonTarget() {
    return this.targets.find("submitButton")
  }
}
