import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["canvas"]

  connect() {
    this.cuisines = [
      { name: 'Italian', color: '#FF6B6B' },
      { name: 'French', color: '#4ECDC4' },
      { name: 'Asian', color: '#45B7D1' },
      { name: 'Mexican', color: '#96CEB4' },
      { name: 'Indian', color: '#FFEEAD' },
    ]

    this.initializeWheel()
  }

  initializeWheel() {
    this.canvas = this.canvasTarget
    this.ctx = this.canvas.getContext('2d')
    this.rotation = 0
    this.isSpinning = false
    this.drawWheel()
  }

  drawWheel() {
    const center = this.canvas.width / 2
    const radius = this.canvas.width / 2 - 10
    const sliceAngle = (2 * Math.PI) / this.cuisines.length

    this.ctx.save()
    this.ctx.translate(center, center)
    this.ctx.rotate(this.rotation)

    this.cuisines.forEach((cuisine, i) => {
      const angle = i * sliceAngle

      // Draw slice
      this.ctx.beginPath()
      this.ctx.moveTo(0, 0)
      this.ctx.arc(0, 0, radius, angle, angle + sliceAngle)
      this.ctx.fillStyle = cuisine.color
      this.ctx.fill()

      // No text is drawn now, as requested
    })
    this.ctx.restore()
  }

  spin() {
    if (this.isSpinning) return

    this.isSpinning = true
    const spinDuration = 5000 // 5 seconds
    const startRotation = this.rotation
    const extraSpins = 5 // Number of full rotations
    const randomAngle = Math.random() * (2 * Math.PI)
    const targetRotation = startRotation + (2 * Math.PI * extraSpins) + randomAngle
    const startTime = performance.now()

    const animate = (currentTime) => {
      const elapsed = currentTime - startTime
      const progress = Math.min(elapsed / spinDuration, 1)

      // Easing function for smooth deceleration
      const easeOut = (t) => 1 - Math.pow(1 - t, 3)

      this.rotation = startRotation + (targetRotation - startRotation) * easeOut(progress)
      this.drawWheel()

      if (progress < 1) {
        requestAnimationFrame(animate)
      } else {
        this.isSpinning = false
        this.announceWinner()
      }
    }
    requestAnimationFrame(animate)
  }

  announceWinner() {
    const sliceAngle = (2 * Math.PI) / this.cuisines.length

    // Fix for correct winner determination
    // We need to reverse the rotation angle since our wheel spins clockwise
    // and modulo to get the current position
    const normalizedRotation = ((2 * Math.PI) - (this.rotation % (2 * Math.PI))) % (2 * Math.PI)

    // The arrow points at the top (0 degrees in standard position)
    // so we need to find which slice is there
    const winningIndex = Math.floor(normalizedRotation / sliceAngle)

    // Get the correct cuisine by making sure index is within bounds
    const effectiveIndex = (winningIndex + this.cuisines.length) % this.cuisines.length

    const resultElement = document.getElementById('result')
    resultElement.textContent = `Tonight's dinner: ${this.cuisines[effectiveIndex].name} cuisine!`

    // For debugging - uncomment to see the values
    console.log(`Rotation: ${this.rotation.toFixed(2)}, Normalized: ${normalizedRotation.toFixed(2)}, Index: ${effectiveIndex}, Winner: ${this.cuisines[effectiveIndex].name}`)
  }
}
