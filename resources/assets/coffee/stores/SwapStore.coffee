swapsData = {}


matchesFilters = (swapData, filters)->
    if filters.tokenIn.length > 0
        if swapData.swap.in.indexOf(filters.tokenIn) < 0
            return false

    if filters.tokenOut.length > 0
        if swapData.swap.out.indexOf(filters.tokenOut) < 0
            return false

    if filters.botName.length > 0
        if swapData.bot.name.toUpperCase().indexOf(filters.botName.toUpperCase()) < 0
            return false

    if filters.username.length > 0
        if swapData.bot.username.indexOf(filters.username) < 0
            return false

    return true

# ################################################

exports = {}

exports.init = (initialSwapsData)->
    if initialSwapsData?
        swapsData = initialSwapsData
    return

exports.findWithFilters = (filters)->
    filteredSwapsData = []
    for swapData in swapsData
        if matchesFilters(swapData, filters)
            filteredSwapsData.push(swapData)
    
    return filteredSwapsData

exports.findAll = ()->
    return swapsData


module.exports = exports
