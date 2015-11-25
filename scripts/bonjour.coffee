# Description:
#   In which Tlxbot says bonjour and speaks more French
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
#   paulclip

module.exports = (robot) ->
  robot.hear /^(bonjour),?\s+tlxbot$/i, (msg) ->
    msg.send "Bonjour #{msg.envelope.user.name}"; 

  robot.hear /^(salut),?\s+tlxbot$/i, (msg) ->
    msg.send "Salut #{msg.envelope.user.name}"; 

  robot.hear /^(bonsoir),?\s+tlxbot$/i, (msg) ->
    msg.send "Bonsoir, #{msg.envelope.user.name}";

  robot.hear /^(ca va),?\s+tlxbot\??$/i, (msg) ->
    msg.send "Très bien, merci #{msg.envelope.user.name}, et toi?";

  robot.hear /tlxbot traduit (.*)/i, (msg) ->
    word = msg.match[1]
    msg.send "Le #{word}!"
