import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.updateIcon()
  }

  toggle() {
    const html = document.documentElement
    html.classList.toggle('dark')
    localStorage.setItem('theme', html.classList.contains('dark') ? 'dark' : 'light')
    this.updateIcon()
  }

  updateIcon() {
    const isDark = document.documentElement.classList.contains('dark')
    const sunIcon = this.element.querySelector('[data-theme-icon="sun"]')
    const moonIcon = this.element.querySelector('[data-theme-icon="moon"]')
    if (sunIcon && moonIcon) {
      sunIcon.classList.toggle('hidden', !isDark)
      moonIcon.classList.toggle('hidden', isDark)
    }
  }
}
