import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step"]
  static values = {
    step: { type: Number, default: 0 }
  }

  connect() {
    // Hide all steps except the first one
    this.stepTargets.forEach((step, index) => {
      if (index !== 0) {
        step.classList.add("hidden")
      }
    })
  }

  validateStep(stepIndex) {
    const currentStep = this.stepTargets[stepIndex]
    const inputs = currentStep.querySelectorAll('input, select')
    let isValid = true

    inputs.forEach(input => {
      if (!input.value.trim()) {
        isValid = false
        input.classList.add('border-red-500')
        // Add error message if it doesn't exist
        if (!input.nextElementSibling?.classList.contains('text-red-500')) {
          const errorMessage = document.createElement('p')
          errorMessage.className = 'text-red-500 text-sm mt-1'
          errorMessage.textContent = 'This field is required'
          input.parentNode.insertBefore(errorMessage, input.nextSibling)
        }
      } else {
        input.classList.remove('border-red-500')
        // Remove error message if it exists
        const errorMessage = input.nextElementSibling
        if (errorMessage?.classList.contains('text-red-500')) {
          errorMessage.remove()
        }
      }
    })

    return isValid
  }

  next() {
    if (this.stepValue < this.stepTargets.length - 1) {
      if (this.validateStep(this.stepValue)) {
        this.stepTargets[this.stepValue].classList.add("hidden")
        this.stepValue++
        this.stepTargets[this.stepValue].classList.remove("hidden")
      }
    }
  }

  previous() {
    if (this.stepValue > 0) {
      this.stepTargets[this.stepValue].classList.add("hidden")
      this.stepValue--
      this.stepTargets[this.stepValue].classList.remove("hidden")
    }
  }
}
