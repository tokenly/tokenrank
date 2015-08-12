SwapStore = require '../stores/SwapStore.coffee'
SwapFilterStore = require '../stores/SwapFilterStore.coffee'
formatters = require '../util/formatters.coffee'

buildState = ()->
    console.log "findWithFilters: ",SwapFilterStore.getFilterData()
    availableSwaps = SwapStore.findWithFilters(SwapFilterStore.getFilterData())
    return {availableSwaps: availableSwaps}
    

SwapsListView = React.createClass
    displayName: 'SwapsListView'

    componentDidMount: ()->
        SwapFilterStore.addChangeListener(this.handleFilterUpdated)
        return

    componentWillUnmount: ()->
        SwapFilterStore.removeChangeListener(this.handleFilterUpdated)
        return

    handleFilterUpdated: ()->
        this.setState(buildState())
        return


    getInitialState: ()->
        return buildState()

    render: ->
        <div className="swapsListContainer">
            <h2>Found {this.state.availableSwaps.length} available swaps</h2>
            <ul className="list-unstyled">

            { for i in [0..this.state.availableSwaps.length] by 2
                this.buildAvailableSwapRow(i)
            }

            </ul>
        </div>

    buildAvailableSwapRow: (index)->
        buildCol = (availableSwap, colIndex)->
            if not availableSwap? then return null

            <div className="col-md-6" key={colIndex}>
                <div className="available-swap clearfix">
                    <div className="logo"><img src={ if availableSwap.bot.logoImage then availableSwap.bot.logoImage else '/images/blank-robot-fade.png' } /></div>
                    <div className="details">
                        <div className="name"><a href={availableSwap.bot.botUrl}>{availableSwap.bot.name}</a></div>
                        <div className="username">From {availableSwap.bot.username}</div>
                        <div className="swap-tokens">
                            Selling 1 <span className="token token-out">{availableSwap.swap.out}</span> for 
                             <span className="cost">{formatters.formatCurrency(availableSwap.swap.cost)}</span> <span className="token token-in">{availableSwap.swap.in}</span>
                        </div>

                    </div>
                </div>
            </div>

        columns = [buildCol(this.state.availableSwaps[index], index), buildCol(this.state.availableSwaps[index+1], index+1)]


        return <li className="swap-row" key={"swap"+index}>
            <div className="row">
                {columns}
            </div>
        </li>


module.exports = SwapsListView
