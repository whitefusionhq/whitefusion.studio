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

import "@hotwired/turbo"
import "turbo-shadow"

class RedirectToElement extends HTMLElement {
  static {
    customElements.define("redirect-to", this)
  }

  connectedCallback() {
    console.log("I'm here", this.parentElement.parentElement.innerHTML)
    let delay = 0
    if (this.hasAttribute("delay")) delay = Number(this.getAttribute("delay"))
    setTimeout(() => {
      location.href = this.getAttribute("href")
    }, delay)
  }
}

// Import all JavaScript & CSS files from src/_components
import components from "$components/**/*.{js,jsx,js.rb,css}"

window.InvokingFunctions = {
  append(host, element) {
    host.append(element)
  },
  prepend(host, element) {
    host.prepend(element)
  },
  replaceChildren(host, element) {
    host.replaceChildren(element)
  }
}

window.SetupInvokeHandler = (el) => {
  el.addEventListener("invoke", (e) => {
    console.log("I'm invoked!", e.constructor)
    const action = e.action || e.detail.action
    if (action === "invoking:functions") {
      const tmpl = el.querySelector(":scope > template[data-functions]")
      const actionElements = tmpl.content.children
      for (const element of [...actionElements]) {
        const invokeName = element.dataset.function
        if (InvokingFunctions[invokeName]) {
          InvokingFunctions[invokeName](el, element)
        }
        element.removeAttribute("data-function")
      }
      tmpl.remove()
      el.dispatchEvent(new CustomEvent("invoking:complete", { detail: { elements: actionElements }}))
    }
  })
  
  // el.addEventListener("invoking:complete", (e) => {
  //   console.log("All done!", e.detail.elements)
  // })
}

window.DispatchInvokeEvent = (el, action) => {
  action = `invoking:${action}`
  if (window.InvokeEvent) {
    el.dispatchEvent(new InvokeEvent("invoke", { action }))
  } else {
    el.dispatchEvent(new CustomEvent("invoke", { detail: { action }}))
  }
}

/* *** Nav Bar Setup *** */

const navBarQuery = (selector) => document.querySelector(`#nav-bar ${selector}`)

document.addEventListener("turbo:load", () => {
  if (navBarQuery("sl-bar").getAttribute("expanded") == "true") {
    navBarQuery("sl-bar").setAttribute("expanded", "false")
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
})

window.addEventListener("DOMContentLoaded", () => {
  navBarQuery("sl-button[menutoggle]").addEventListener("click", (event) => {
    const toggle = event.target
    const bar = toggle.closest("sl-bar")
    if (bar.getAttribute("expanded") == "false") {
      bar.setAttribute("expanded", "true")
      toggle.querySelector("sl-icon").setAttribute("name", "x")
    } else {
      bar.setAttribute("expanded", "false")
      toggle.querySelector("sl-icon").setAttribute("name", "list")
    }
  })
})
