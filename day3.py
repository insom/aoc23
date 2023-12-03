grid = {}
running_total = 0

def box_around(y, xmin, xmax):
    values = []
    for x in range(xmin - 1, xmax + 2):
        values.append((x, y - 1))
    for x in range(xmin - 1, xmax + 2):
        values.append((x, y + 1))
    values.append((xmin - 1, y))
    values.append((xmax + 1, y))
    return values

with open('input3', 'r') as f:
    lines = f.readlines()
    for idxy, line in enumerate(lines):
        for idxx, char in enumerate(line.strip()):
            grid[idxx,idxy] = char
    for idxy, line in enumerate(lines):
        number_start = None
        number_end = None
        in_number = False
        for idxx, char in enumerate(line.strip() + '.'):
            if char.isnumeric():
                if number_start is None:
                    number_start = idxx;
                number_end = idxx;
            elif not number_end is None:
                # we parsed a whole number, check if it's in the schematic
                value = int(line[number_start:number_end + 1])
                check_values = box_around(idxy, number_start, number_end)
                valid = False
                for coord in check_values:
                    if grid.get(coord, '.') != '.' and not grid.get(coord, '.').isnumeric():
                        valid = True
                if valid:
                    running_total += value
                number_start = number_end = None

print(running_total)
