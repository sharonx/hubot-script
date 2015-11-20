module.exports = (robot) ->

  robot.hear /badger/i, (res) ->
    res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

  robot.respond /open the (.*) doors/i, (res) ->
    doorType = res.match[1]
    if doorType is "talix"
      res.reply "I'm afraid I can't let you do that."
    else
      res.reply "Opening #{doorType} doors"

  robot.respond /say hello to (.*)/i, (res) ->
    user = res.match[1]
    res.send "Hello #{user}!"

  robot.respond /leave/i, (res) ->
    res.send "Good bye! I will see you again"  

  compliments = [
    'when life gives you lemons, you make lemonade. when life gives you tasks, get #{user} on the job!',
    'Great job, #{user}!',
    'I am so proud of you, #{user}.',
    'This is amazing. #{user}, you are the man of the hour'
  ]  

  robot.respond /praise (.*)/i, (res) ->
    user = res.match[1]
    message = res.random compliments
    res.send message.replace('{user}', user)     

  answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  
  robot.respond /what is the answer to the ultimate question of life/, (res) ->
    unless answer?
      res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
      return
    res.send "#{answer}, but what is the question?"

  robot.respond /sleep it off/i, (res) ->
    robot.brain.set 'totalSodas', 0
    res.reply 'zzzzz'
