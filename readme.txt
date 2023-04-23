To add more to it just add another case to the switch statement and increase the rounding digits.

Ex:

case 1000000000..<1000000000000:
  return smartRound(n, to: 9) + "B"
