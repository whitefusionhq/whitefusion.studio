module.exports = {  
  plugins: {
    'postcss-flexbugs-fixes': {},
    'postcss-color-adjustment': {},
    'postcss-preset-env': {
      autoprefixer: {
        flexbox: 'no-2009'
      },
      importFrom: 'frontend/styles/breakpoints.css',
      stage: 4,
      features: {
        'nesting-rules': true,
        'custom-media-queries': true
      }
    }
  }
}
