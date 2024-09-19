// app/javascript/controllers/carousel_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slide"];

  connect() {
    console.log("Carousel connected");

    this.currentIndex = 0;
    this.showCurrentSlide();
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.slideTargets.length;
    this.showCurrentSlide();
  }

  previous() {
    this.currentIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length;
    this.showCurrentSlide();
  }

  showCurrentSlide() {
    this.slideTargets.forEach((slide, index) => {
      slide.classList.toggle("active", index === this.currentIndex);
    });
  }
}
