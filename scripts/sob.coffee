# Description:
#   sob sob sob
#
# Dependencies:
#   None
#
# Commands:
#   tlxbot sob - sob sob sob
#
# Author:
#   sharonx

module.exports = (robot) ->
  robot.respond /sob/i, (msg) ->
    msg.send 'sob sob sob'
