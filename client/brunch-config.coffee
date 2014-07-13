exports.config =  
	conventions:
		assets: /^app\/assets\//
		ignored: /^(bower_components\/bootstrap-less(-themes)?|app\/styles\/overrides)/
	
	modules:
		definition: false
		wrapper: false
	
	paths:
		public: 'public'
		watched: ['app', 'vendor']
	
	files:
		javascripts:
			joinTo:
				'js/app.js': /^app/
				'js/vendor.js': /^(bower_components|vendor)/
			order:
				after: [
					'app/src/*.model.coffee'
					'app/src/*.controller.coffee'
					'app/src/*.view.coffee'
					'app/src/main.coffee'
				]

	stylesheets:
		joinTo:
			'css/app.css': /^(app|bower_components)/

	# Enable or disable minifying of result js / css files.
  	minify: true