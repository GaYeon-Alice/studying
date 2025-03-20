x, y = [], []

for i in range(3):
    a, b = map(int, input().split())
    x.append(a)
    y.append(b)

print(x[0]^x[1]^x[2], y[0]^y[1]^y[2])