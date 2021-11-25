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

setAssetPath(`${location.origin}/_bridgetown/shoelace/assets/icons`)
/* Define icons first: */
customElements.define("sl-icon", SlIcon)
customElements.define("sl-icon-button", SlIconButton)

customElements.define("sl-button", SlButton)
customElements.define("sl-dialog", SlDialog)
customElements.define("sl-form", SlForm)
customElements.define("sl-input", SlInput)
customElements.define("sl-textarea", SlTextarea)

import "index.css"

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

  const form = document.querySelector("sl-dialog sl-form")

  if (form) {
    form.querySelector("step-one sl-button[type=success]").addEventListener("click", () => {
      form.submit()
    })

    form.closest("sl-dialog").querySelector("step-two sl-button[type=primary]").addEventListener("click", () => {
      setTimeout(() => {
        form.closest("sl-dialog").querySelectorAll("step-one, step-two").forEach(el => el.hidden = !el.hidden)
      }, 500);
      form.closest("sl-dialog").hide()
    })

    form.addEventListener("sl-submit", event => {
      const formData = event.detail.formData
      formData.append("form-name", "contact")

      fetch("/", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: new URLSearchParams(formData).toString()
      }).then(() => {
        form.closest("sl-dialog").querySelectorAll("step-one, step-two").forEach(el => el.hidden = !el.hidden)
      })
    })
  }
}) // end of turbo:load

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
