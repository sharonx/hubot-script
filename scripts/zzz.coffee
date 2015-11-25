# Description:
#   In which Tlxbot tells you that it will sleep
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   sharonx

module.exports = (robot) ->
  robot.hear /^what (will you|are you going to) do on (\s*)/i, (msg) ->
    msg.send "I'm going to zzZZ"; 

  robot.respond /what (will you|are you going to) do on (\s*)/i, (msg) ->
    msg.reply "I'm going to sleep all the time.";

