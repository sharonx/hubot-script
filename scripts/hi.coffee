module.exports = (robot) ->
  robot.hear /^(hi|hello),?\s+tlxbot$/i, (msg) ->
    msg.send "Hello, #{msg.envelope.user.name}.";

  robot.hear /^(goodnight|night)$/i, (msg) ->
    msg.send "Goodnight, #{msg.envelope.user.name}.";

  robot.hear /^(good\s*morning|morning)$/i, (msg) ->
    msg.send "Good morning, #{msg.envelope.user.name}.";

  robot.respond /say hello to (.*)/i, (msg) ->
    user = msg.match[1]
    msg.send "Hello #{user}!"