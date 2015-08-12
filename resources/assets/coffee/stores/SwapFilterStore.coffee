EventEmitter = require('events').EventEmitter
assign = require('object-assign');

# compose this object from EventEmitter
exports = assign({}, EventEmitter.prototype)


# out filter state
filterData = {
    tokenIn: ''
    tokenOut: ''
    botName: ''
    username: ''
}


CHANGE_EVENT = 'change'

emitChange = ()->
    exports.emit(CHANGE_EVENT)
    return

# ######################################################

exports.init = ()->
    return

exports.updateFilter = (filterName, newVal)->
    filterData[filterName] = newVal
    emitChange()
    return

exports.getFilterData = ()->
    return filterData


exports.addChangeListener = (callback)->
    this.on(CHANGE_EVENT, callback)
    return

exports.removeChangeListener = (callback)->
    this.removeListener(CHANGE_EVENT, callback)
    return


module.exports = exports
