import "$styles/index.css"

import "@shoelace-style/shoelace/dist/components/dialog/dialog.js"
import "@shoelace-style/shoelace/dist/components/button/button.js"
import "@shoelace-style/shoelace/dist/components/icon/icon.js"
import "@shoelace-style/shoelace/dist/components/icon-button/icon-button.js"
import "@shoelace-style/shoelace/dist/components/input/input.js"
import "@shoelace-style/shoelace/dist/components/radio-button/radio-button.js"
import "@shoelace-style/shoelace/dist/components/radio-group/radio-group.js"
import "@shoelace-style/shoelace/dist/components/select/select.js"
import "@shoelace-style/shoelace/dist/components/option/option.js"
import "@shoelace-style/shoelace/dist/components/textarea/textarea.js"

// Use the public icons folder:
import { setBasePath } from "@shoelace-style/shoelace/dist/utilities/base-path.js"
setBasePath("/shoelace-assets")

// Import all JavaScript & CSS files from src/_components
import components from "$components/**/*.{js,jsx,js.rb,css}"

import { InvocableElement } from "./invocably.js"
class FormErrors extends InvocableElement {
  static { this.define("form-errors") }
}
class CheckoutAction extends InvocableElement {
  static { this.define("checkout-action") }
}
class FormField extends InvocableElement {
  static { this.define("form-field") }
}

/* *** Nav Bar Setup *** */

const navBarQuery = (selector) => document.querySelector(`#nav-bar ${selector}`)

if (navBarQuery("wf-bar").getAttribute("expanded") == "true") {
  navBarQuery("wf-bar").setAttribute("expanded", "false")
  navBarQuery('sl-icon[name="x"]').setAttribute("name", "list")
}

document.querySelectorAll("details").forEach(detail => {
  detail.addEventListener("click", (event) => {
    const state = event.target.open;
    setTimeout(() => {
      if (!state && !event.target.open) {
        event.target.open = true
        event.target.querySelector("summary").focus()
      }
    }, 50)
  })
})

navBarQuery("sl-button[menutoggle]").addEventListener("click", (event) => {
  const toggle = event.target
  const bar = toggle.closest("wf-bar")
  if (bar.getAttribute("expanded") == "false") {
    bar.setAttribute("expanded", "true")
    toggle.querySelector("sl-icon").setAttribute("name", "x")
  } else {
    bar.setAttribute("expanded", "false")
    toggle.querySelector("sl-icon").setAttribute("name", "list")
  }
})
