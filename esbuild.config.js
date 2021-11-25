const build = require("./config/esbuild.defaults.js")

// Update this if you need to configure a destination folder other than `output`
const outputFolder = "output"

const esbuildCopy = require('esbuild-plugin-copy').default
const path = require("path")
const fs = require("fs")
const shoelaceOutputPath = path.resolve(__dirname, 'output/_bridgetown/shoelace/assets')
fs.mkdirSync(shoelaceOutputPath, { recursive: true })

const esbuildOptions = {
  plugins: [
    esbuildCopy({
      assets: {
        from: [path.resolve(__dirname, 'node_modules/@shoelace-style/shoelace/dist/assets/icons/*')],
        to: [path.join(shoelaceOutputPath, "icons")],
      },
      verbose: false
    }),
  ]
}

build(outputFolder, esbuildOptions)
