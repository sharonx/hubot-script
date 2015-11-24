# Description:
#   Hubot tells you when the next bus 45 can pick you up
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot when is the bus 45 coming? - Tells you when the bus 45 will be at 3rd and Brannan
#
# Author:
#   sharonx

request   = require 'request'
xml2js    = require 'xml2js'
pluralize = require 'pluralize'

arrivalString = (arrivals) ->
  arrivals = arrivals.map (a) -> a.minutes
  arrivals = arrivals[0...-1].concat(['and ' + arrivals[arrivals.length - 1]]) unless arrivals.length < 2
  arrivals.join(if arrivals.length > 2 then ', ' else ' ')

fetchPredictions = (callback) ->
  hollisStop = 'http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=sf-muni&r=45&s=3114'
  request hollisStop, (err, resp, body) ->
    if err
      console.error 'Error fetching from NextBus:', err
    else
      parser = new xml2js.Parser()
      parser.parseString body, (err, result) ->
        if err
          console.error 'Error parsing response XML:', err
        else
          if result.body.predictions[0].direction
            callback result.body.predictions[0].direction[0].prediction.map (p) -> p['$']
          else
            callback []

apology = ->
  "I'm sorry, there don't seem to be any Bus 45 arrivals coming up. https://www.nextbus.com/#!/sf-muni/45/45___O_F00/3114/3144"

module.exports = (robot) ->
  robot.respond /(when|what time).*(bus 45|45 bus).*\?/i, (msg) ->
    fetchPredictions (arrivals) ->
      if arrivals.length == 0
        msg.send apology()
        return
      
      msg.send 'Bus 45 will arrive at 3rd and Brannan in ' + arrivalString(arrivals) + ' minutes. ' + 'https://www.nextbus.com/#!/sf-muni/45/45___O_F00/3114/3144'