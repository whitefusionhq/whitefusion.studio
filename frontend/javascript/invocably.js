class InvocableElement extends HTMLElement {
  static define(name) {
    customElements.define(name, this)
  }

  handleInvoke(e) {
    const el = e.currentTarget
    const action = e.action || e.detail.action
    if (action === "invocably:functions") {
      const tmpl = el.querySelector(":scope > template[data-functions]")
      const actionElements = tmpl.content.children
      for (const element of [...actionElements]) {
        const invokeName = element.dataset.function
        if (InvocablyFunctions[invokeName]) {
          InvocablyFunctions[invokeName](el, element)
        }
        element.removeAttribute("data-function")
      }
      tmpl.remove()
      el.dispatchEvent(new CustomEvent("invocably:complete", { detail: { elements: actionElements }}))
    }
  }

  connectedCallback() {
    this.addEventListener("invoke", this.handleInvoke)
  }

  disconnectedCallback() {
    this.removeEventListener("invoke", this.handleInvoke)
  }
}

class FormErrors extends InvocableElement {}
class CheckoutAction extends InvocableElement {}
FormErrors.define("form-errors")
CheckoutAction.define("checkout-action")

window.InvocablyFunctions = {
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

window.DispatchInvokeEvent = (el, action) => {
  action = `invocably:${action}`
  if (window.InvokeEvent) {
    el.dispatchEvent(new InvokeEvent("invoke", { action }))
  } else {
    el.dispatchEvent(new CustomEvent("invoke", { detail: { action }}))
  }
}

window.ProcessInvocables = (html, host = document) => {
  const fetchedDocument = new DOMParser().parseFromString(`<body>${html}</body>`, "text/html")
  // Pull out all the functions
  const functionNodes = fetchedDocument.body.querySelectorAll("[data-function]")
  // Loop through the functions
  for (const element of functionNodes) {
    // Determine best selector
    let existingSelector = element.parentElement.localName
    if (element.parentElement.id) existingSelector = `${existingSelector}#${element.parentElement.id}`
    if (element.parentElement.dataset.selector) existingSelector = `${existingSelector}:is(${element.parentElement.dataset.selector})`

    // Find by selector
    const existingNodes = element.parentElement.dataset.selectAll ? host.querySelectorAll(existingSelector) : [host.querySelector(existingSelector)]
    for (const existingNode of existingNodes) {
      const tmpl = document.createElement("template")
      tmpl.dataset.functions = ""
      tmpl.content.replaceChildren(element)
      existingNode.append(tmpl)
      DispatchInvokeEvent(existingNode, "functions")
    }

    if (existingNodes.length === 0) {
      console.warn(`Selector ${existingSelector} couldn't be found in the document.`)
    }
  }
}

class InvocablyFetch extends InvocableElement {
  static {
    customElements.define("iv-fetch", this)
  }
  async connectedCallback() {
    super.connectedCallback()
    const url = this.getAttribute("href")
    const /** @type {RequestInit} */ options = {}
//    options.method = form.method
    options.headers = {"Accept": "text/vnd.invocably.html"}

    try {
      const results = await fetch(url, {...options})
      if (results.status < 500) {
        if (results.redirected) {
          console.warn("Redirected.")
          return
        }
        const html = await results.text()
        ProcessInvocables(html)
      }
    } catch(err) {
      console.warn(err)
    }
  }
}

class InvocablyForm extends HTMLElement {
  static {
    customElements.define("iv-form", this)
  }

  connectedCallback() {
    setTimeout(() => {
      const form = this.querySelector(":scope > form")
      const submitButton = form.querySelector(":is(sl-button, button)[type=submit]")

      form.addEventListener("submit", async (event) => {
        event.preventDefault()
        submitButton.loading = true
        document.querySelectorAll("[data-empty-on-submit]").forEach(item => item.replaceChildren())

        const url = form.action
        const /** @type {RequestInit} */ options = {}
        options.body = new FormData(form)
        options.method = form.method
        options.headers = {"Accept": "text/vnd.invocably.html"}

        try {
          const results = await fetch(url, {...options})
          if (results.status < 500) {
            if (results.redirected) {
              location.href = results.url
              return
            }
            const html = await results.text()
            ProcessInvocables(html)
          }
        } catch(err) {
          console.warn(err)
        }

        submitButton.loading = false
      })
    })
  }
}

class RedirectToElement extends HTMLElement {
  static {
    customElements.define("redirect-to", this)
  }

  connectedCallback() {
    let delay = 0
    if (this.hasAttribute("delay")) delay = Number(this.getAttribute("delay"))
    setTimeout(() => {
      location.href = this.getAttribute("href")
    }, delay)
  }
}