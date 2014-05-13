App.controller 'IndexCtrl', [ '$scope', '$resource', ($scope, $resource) ->

  $scope.title = "hello world"

  Entry = $resource( "/api/v1/entries/:id", { id: "@id" }, { update: {method: 'PUT'} } )
  $scope.entries = Entry.query()

  $scope.addEntry = ->
    entry = Entry.save($scope.newEntry)
    $scope.entries.push(entry)
    $scope.newEntry = {}

  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.entries, (entry) ->
      pool.push(entry) if !entry.winner
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.winner = true
      Entry.update(entry)
      $scope.lastWinner = entry

  $scope.deleteEntry = (entry) ->
    index = $scope.entries.indexOf(entry)
    if (index != -1)
      $scope.entries.splice(index, 1)
    entry = Entry.remove(entry._id)

]