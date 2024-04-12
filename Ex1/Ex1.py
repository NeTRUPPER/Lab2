import random

def min_changes(s):
    count = 0
    i = 0
    while i < len(s) - 2:
        if s[i] == s[i + 1] == s[i + 2]:
            count += 1
            i += 2  # Пропускаем следующие два символа, так как они уже подходят
        i += 1
    return count


s = input("Example: str = ")

changes = min_changes(s)

i = 0
while i < len(s) - 2:
    if s[i] == s[i + 1] == s[i + 2]:
        new_symbol = chr(random.randint(ord('a'), ord('z')))
        s = s[:i + 2] + new_symbol + s[i + 2:]  # Добавляем символ после трех одинаковых
        i += 1  # Пропускаем добавленный символ
    i += 1

print(f"Result: {changes} = {s}")