import "@shoelace-style/shoelace/dist/shoelace/shoelace.css"
import {
  setAssetPath,
  SlButton,
  SlDialog,
  SlForm,
  SlIcon,
  SlIconButton,
  SlInput,
} from "@shoelace-style/shoelace"

setAssetPath(`${location.origin}/_bridgetown/static/icons`)
/* Define icons first: */
customElements.define("sl-icon", SlIcon)
customElements.define("sl-icon-button", SlIconButton)

customElements.define("sl-button", SlButton)
customElements.define("sl-dialog", SlDialog)
customElements.define("sl-form", SlForm)
customElements.define("sl-input", SlInput)

import "../styles/index.css"
