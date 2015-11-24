# Description:
#   In which Tlxbot plays a game of roshambo with you
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   tlxbot roshambo @user
#
# Author:
#   sschafer

module.exports = (robot) ->

  roshambo = (userSign, res) ->
    signs = [
      'rock'
      'paper'
      'scissors'
    ]
    tlxSign = res.random(signs)
    result = undefined
    if userSign == tlxSign
      result = 'TIE'
    else if userSign == 'rock' and tlxSign == 'scissors' or userSign == 'paper' and tlxSign == 'rock' or userSign == 'scissors' and tlxSign == 'paper'
      result = 'YOU WIN!'
    else
      result = 'I WIN!'
    res.send '1, 2, 3....Roshambo!\n' + userSign + ' vs ' + tlxSign + '...' + result;

  robot.hear /rock/i, (res) ->
    roshambo('rock', res)
    return;

  robot.hear /paper/i, (res) ->
    roshambo('paper', res)
    return;

  robot.hear /scissors/i, (res) ->
    roshambo('scissors',res)
    return;
