
window.App = angular.module('rails-angularjs-twb', ['ngRoute', 'ngResource'])

App.config ["$httpProvider", ($httpProvider) ->
  token = $('meta[name=csrf-token]').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = token
]

