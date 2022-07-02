const build = require("./config/esbuild.defaults.js")

// Update this if you need to configure a destination folder other than `output`
const outputFolder = "output"

const esbuildOptions = {}

build(outputFolder, esbuildOptions)
