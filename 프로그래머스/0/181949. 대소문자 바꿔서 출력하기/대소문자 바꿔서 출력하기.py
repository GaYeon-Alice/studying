str = input()
result = ""
for char in str:
    if char.isupper():
        result += char.lower()
    else:
        result += char.upper()
print(result)