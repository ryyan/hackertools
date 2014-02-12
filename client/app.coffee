angular.module('app', [])

# Controller
.controller('controller', ($scope) ->
	$scope.tools = [
		name: "Mint", 
		description: "Keep track of your finances!",
		tags: ['finance', 'stuff'],
		url: "http://mint.com",
		votes: 3
	,
		name: "Khan Academy", 
		description: "Learn things",
		tags: ['learn', 'stuff'],
		url: "https://www.khanacademy.org/",
		votes: 6
	])