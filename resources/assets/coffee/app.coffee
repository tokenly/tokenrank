SwapsListView = require './views/SwapsListView.cjsx'
SwapsFilterView = require './views/SwapsFilterView.cjsx'
SwapStore = require './stores/SwapStore.coffee'
SwapFilterStore = require './stores/SwapFilterStore.coffee'

App = {
    start: (availableSwapsBootstrap=null)->
        # init the swaps
        SwapStore.init(availableSwapsBootstrap)
        SwapFilterStore.init()

        # Swaps Filter
        React.render <SwapsFilterView />, document.getElementById('SwapsFilterView')

        # Swaps List
        React.render <SwapsListView />, document.getElementById('SwapsListView')

        return
}

module.exports = App
