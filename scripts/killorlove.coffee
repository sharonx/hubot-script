module.exports = (robot) ->
  robot.respond /kill/i, (msg) ->
    msg.send 'I was only programmed to love.'

  robot.respond /love/i, (msg) ->
    msg.send '<3'