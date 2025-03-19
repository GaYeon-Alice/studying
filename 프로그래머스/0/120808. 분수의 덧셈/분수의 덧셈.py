# 최대공약수 계산
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

# 최소공배수 계산
def lcm(a, b):
    return a * b // gcd(a, b)

def solution(numer1, denom1, numer2, denom2):
    
    # 분모는 두 분모의 최소공배수
    denom_result = lcm(denom1, denom2)
    
    # 분자는 (각 분수의 분자) * (두 분모의 최소공배수) / (각 분수의 분모)의 합
    numer_result = (numer1 * denom_result // denom1) + (numer2 * denom_result // denom2)
    
    # 분자와 분모의 최대공약수 정의
    gcd_value = gcd(numer_result, denom_result)
    
    # 두 분수의 합이 기약 분수면 그대로 출력
    if gcd_value == 1:
        answer = [numer_result, denom_result]
    
    # 아니면 분자와 분모를 두 수의 최대공약수로 나눈 후 출력
    else:
        answer = [numer_result // gcd_value, denom_result // gcd_value]

    return answer