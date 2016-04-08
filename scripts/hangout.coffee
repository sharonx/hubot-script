# Description:
#   Create hangouts with Hubot.
#
# Commands:
#   hubot hangout me <title> - Creates a Hangout with the given title and returns the URL.
#
# Configuration:
#   HUBOT_GOOGLE_HANGOUTS_DOMAIN: Google Apps domain used as a scope for
#   generating hangout URLs.

hangoutsDomain = process.env.HUBOT_GOOGLE_HANGOUTS_DOMAIN

module.exports = (robot) ->
  robot.hear /start hangout$/i, (msg) ->
    return if missingEnvironment(msg)

    msg.send "I've started a Hangout! Join here: https://plus.google.com/hangouts/_/#{hangoutsDomain}"

  robot.hear /hangout url$/i, (msg) ->
    return if missingEnvironment(msg)
    
    msg.send "Hangout url: https://plus.google.com/hangouts/_/#{hangoutsDomain}"  

  missingEnvironment = (msg) ->
    missingAnything = false
    unless hangoutsDomain?
      msg.send "Hangouts domain is missing: Ensure that HUBOT_GOOGLE_HANGOUTS_DOMAIN is set."
      missingAnything = true

    missingAnything