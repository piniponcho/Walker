import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["We walk the walk", "And bark the bark"],
      typeSpeed: 100,
      loop: true
    })
  }
}
