SwapFilterStore = require '../stores/SwapFilterStore.coffee'
formatters = require '../util/formatters.coffee'

buildState = ()->
    return {
        filters: SwapFilterStore.getFilterData()
    }
    

SwapsFilterView = React.createClass
    displayName: 'SwapsFilterView'

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

    handleFilterChange: (filterName)->
        return (event)->
            newVal = event.target.value

            # tokenize
            if filterName.substr(0, 5) == 'token'
                newVal = formatters.tokenize(newVal)

            SwapFilterStore.updateFilter(filterName, newVal)
        return

    render: ->
        <form>
            <div className="row">
                <div className="col-md-12"><h4>Find By Tokens</h4></div>
            </div>
            <div className="row">
                <div className="col-sm-4 col-lg-3">
                    <div className="form-group">
                        <label htmlFor="tokenOutFilter">Token to Purchase</label>
                        { this.buildFilterFormInput('tokenOut', 'LTBCOIN') }
                    </div>
                </div>
                <div className="col-sm-4 col-lg-3">
                    <div className="form-group">
                        <label htmlFor="tokenInFilter">Token to Spend</label>
                        { this.buildFilterFormInput('tokenIn', 'BTC') }
                    </div>
                </div>
            </div>

            <div className="row">
                <div className="col-md-12"><h4>Find By Bot</h4></div>
            </div>
            <div className="row">
                <div className="col-sm-4 col-lg-3">
                    <div className="form-group">
                        <label htmlFor="botNameFilter">Bot Name</label>
                        { this.buildFilterFormInput('botName', 'Tokenly') }
                    </div>
                </div>
                <div className="col-sm-4 col-lg-3">
                    <div className="form-group">
                        <label htmlFor="usernameFilter">Seller</label>
                        { this.buildFilterFormInput('username', 'adam') }
                    </div>
                </div>
            </div>
        </form>


    buildFilterFormInput: (filterName, placeholder)->
        # console.log "this.state.filters=",this.state.filters
        return <input type="text" className="form-control" id={filterName+"Filter"} placeholder={placeholder} value={this.state.filters[filterName]} onChange={this.handleFilterChange(filterName)} />


module.exports = SwapsFilterView
