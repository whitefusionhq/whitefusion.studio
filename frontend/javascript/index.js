import "@shoelace-style/shoelace/dist/shoelace/shoelace.css"
import {
  setAssetPath,
  SlButton,
  SlDialog,
  SlForm,
  SlIcon,
  SlIconButton,
  SlInput,
  SlTextarea
} from "@shoelace-style/shoelace"

setAssetPath(`${location.origin}/_bridgetown/static/icons`)
/* Define icons first: */
customElements.define("sl-icon", SlIcon)
customElements.define("sl-icon-button", SlIconButton)

customElements.define("sl-button", SlButton)
customElements.define("sl-dialog", SlDialog)
customElements.define("sl-form", SlForm)
customElements.define("sl-input", SlInput)
customElements.define("sl-textarea", SlTextarea)

import "../styles/index.css"

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
      }, 100)
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
