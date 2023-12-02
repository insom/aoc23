all_targets = []
with open('input2', 'r') as f:
    lines = f.readlines()
    for line in lines:
        line = line.strip()
        game, rest = line.split(':', 1)
        hands = rest.split(';')
        targets = dict(red=0, green=0, blue=0)
        for hand in hands:
            handfuls = hand.split(',')
            for handful in handfuls:
                handful = handful.strip()
                number, color = handful.split(' ', 1)
                if targets[color] < int(number):
                    targets[color] = int(number)
        all_targets.append(targets)

running_total = 0
for target in all_targets:
    power = target['red'] * target['green'] * target['blue']
    running_total += power
print(running_total)
