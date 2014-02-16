exports.config =
  server:
    path: 'server/server.coffee'
    port: 3333
    base: '/'
    run: yes

  conventions:
    assets:  /^client\/assets\//
    ignored: /^(bower_components\/bootstrap-less(-themes)?|app\/styles\/overrides)/
  
  modules:
    definition: false
    wrapper: false

  paths:
    public: '_public'
    watched: ['client', 'vendor']

  files:
    javascripts:
      joinTo:
        'js/app.js': /^client/
        'js/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo:
        'css/app.css': /^(client|vendor|bower_components)/

    templates:
      joinTo: 
        'js/dontUseMe' : /^(client|partials) / # dirty hack for Jade compiling.

  plugins:
    jaded:
      staticPatterns: /^client(\/|\\)(.+)\.jade$/

  # Enable or disable minifying of result js / css files.
  minify: true