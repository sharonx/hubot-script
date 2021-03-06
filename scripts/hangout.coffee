# Description:
#   Create hangouts with Hubot.
#
# Commands:
#   start hangout at <hour>:<time>- Creates a Hangout with the given title and returns the URL.
#   hangout url - returns the url of google hangout


hangoutsDomain = '4avnnnj2qfcr5azngjbepdbvkqe'
id=''

module.exports = (robot) ->
  robot.respond /start hangout at (\d+):(\d+)$/i, (msg) ->
    startHour = parseInt(msg.match[1])
    startMinute = parseInt(msg.match[2])
    console.log 'hour', startHour
    console.log 'minute', startMinute
    msg.send "hangout will start everday from Mon-Fri, at " + startHour + ":" + startMinute
    id = setInterval (-> 
      day = new Date().getDay()
      if (day == 6 || day == 7) 
        return
      hour = new Date().getHours()
      if(hour != startHour)
        return
      minute = new Date().getMinutes()
      if (minute != startMinute)
        return
      msg.send "I've started a Hangout! Join here: https://plus.google.com/hangouts/_/#{hangoutsDomain}"
    ), 60000

  robot.respond /stop hangout/i, (msg) -> 
    clearInterval(id)
    msg.send "No more hangout will be created"

  robot.hear /hangout url$/i, (msg) ->
    
    msg.send "Hangout url: https://plus.google.com/hangouts/_/#{hangoutsDomain}"  
