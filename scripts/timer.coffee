# Description
#   A Hubot script that timer
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot alarm in <sec> sec <message> - timer
#
# Author:
#   sharonx
#
module.exports = (robot) ->
  robot.respond /alarm in\s+(\d+)\s+sec(.*)$/i, (res) ->
    sec = res.match[1]
    message = res.match[2]
    setTimeout ->
      res.send message
    , sec * 1000