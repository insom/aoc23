running_total = 0
targets = dict(red=12, green=13, blue=14)
with open('input2', 'r') as f:
    lines = f.readlines()
    for line in lines:
        valid = True
        line = line.strip()
        game, rest = line.split(':', 1)
        hands = rest.split(';')
        for hand in hands:
            handfuls = hand.split(',')
            for handful in handfuls:
                handful = handful.strip()
                number, color = handful.split(' ', 1)
                if targets[color] < int(number):
                    valid = False
        if valid:
            _, num = game.split(' ')
            num = int(num)
            running_total += num
print(running_total)
