from decimal import Decimal, getcontext
A, B = map(int, input().split())
getcontext().prec = 32
result = Decimal(A) / Decimal(B)
print(result)