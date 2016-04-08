# Description:
#   Create hangouts with Hubot.
#
# Commands:
#   start hangout - Creates a Hangout with the given title and returns the URL.
#   hangout url - returns the url of google hangout


hangoutsDomain = '4avnnnj2qfcr5azngjbepdbvkqe'

module.exports = (robot) ->
  robot.hear /start hangout$/i, (msg) ->

    msg.send "I've started a Hangout! Join here: https://plus.google.com/hangouts/_/#{hangoutsDomain}"

  robot.hear /hangout url$/i, (msg) ->
    
    msg.send "Hangout url: https://plus.google.com/hangouts/_/#{hangoutsDomain}"  
