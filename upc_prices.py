

# Stage 1

# - Trust is calculated by fibonnaci numbers. See main.js:calculateTrust
# - Projects start at 2000 cips

# Stage 2

# harvesterCost = Math.pow((harvesterLevel+1),2.25)*1000000;
# wireDroneCost = Math.pow((wireDroneLevel+1),2.25)*1000000;
def drone_cost(drones):
    acc = 0
    for i in range(0, drones//2):
        cost = (i+1)**2.25 * 1000*1000
        acc += cost
    return acc * 2

# See main.js:makeFactory
def factory_cost(factories):
    acc = 0
    fc = 100000000
    for i in range(0, factories):
        acc += fc

        if i < 8: fcmod = 11 - i
        elif i < 13: fcmod = 2
        elif i < 20: fcmod = 1.5
        elif i < 39: fcmod = 1.25
        elif i < 79: fcmod = 1.15
        elif i < 99: fcmod = 1.10
        elif i < 199: fcmod = 1.10
        else: fcmod = 1.10

        fc *= fcmod
    return acc

# farmCost = Math.pow(farmLevel+1,2.78)*100000000; 
def farm_cost(farms):
    acc = 0
    for i in range(0, farms):
        cost = (i+1)**2.78 * 100000000
        acc += cost
    return acc

stage2_qtys = {
        "drones": [drone_cost, 200, 500, 5000, 50*1000],
        "factories": [factory_cost, 10, 20, 50],
        "solar farms": [farm_cost, 30],
        }

stage2_targets = {
        "project102": (1, "sextillion"),    # Self-correcting supply chain
        "project46": (5, "octillion"),      # Space exploration
        }

# Display

illions = [
        "",
        "thousand",
        "million",
        "billion",
        "trillion",
        "quadrillion",
        "quintillion",
        "sextillion",
        "septillion",
        "octillion"
        ]

def pretty_exp(x):
    magnitude = 0
    x = float(x)
    while x >= 1000:
        magnitude += 1
        x = x / 1000

    s = "{:.1f} {}".format(x, illions[magnitude])
    s = s.replace(".0 ", " ")
    return s

def exp_to_int(f, illion):
    magnitude = illions.index(illion)
    return int(f * 1000**magnitude)

def print_stage2_graphviz():
    by_price = []

    for piece, (cost_fn, *qtys) in stage2_qtys.items():
        for qty in qtys:
            price = cost_fn(qty)
            target = "\"{qty:,} {piece}\"".format(**locals())
            by_price.append((price, target))

    for target, (f, illion) in stage2_targets.items():
        price = exp_to_int(f, illion)
        by_price.append((price, target))

    by_price.sort()
    by_price_fmt = [("\"{} clips\"".format(pretty_exp(price)), target) for price,target in by_price]

    indent = " "*4*3

    for price, target in by_price_fmt:
        print(indent + "{price} -> {target}".format(**locals()))

    print(indent + "//")
    print(indent + "project45 ->")
    fmtprices = [indent + price for price,_ in by_price_fmt]
    print(" ->\n".join(fmtprices))

if __name__=="__main__":
    print_stage2_graphviz()
