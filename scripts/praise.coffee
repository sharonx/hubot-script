
module.exports = (robot) ->
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