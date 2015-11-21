# Description:
#   In which you tell Tlxbot to kill
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   tlxbot kill - Tells tlxbot to kill
#
# Author:
#   sharonx

module.exports = (robot) ->
  robot.respond /kill/i, (msg) ->
    msg.send 'I was only programmed to love.'

  robot.respond /love/i, (msg) ->
    msg.send '<3'  