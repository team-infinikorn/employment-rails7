import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    modal: String
  }

  get modal() {
    return document.querySelector(this.modalValue)
  }

  open() {
    this.modal.classList.remove('hidden')
  }

  close() {
    this.modal.classList.add('hidden')
  }
}