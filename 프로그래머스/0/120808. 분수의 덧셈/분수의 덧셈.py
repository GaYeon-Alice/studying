from math import gcd

def solution(numer1, denom1, numer2, denom2):
    
    # 분자 계산: (a/b + c/d)의 분자 = a*d + c*b
    numer = numer1 * denom2 + numer2 * denom1
    
    # 분모 계산: (a/b + c/d)의 분모 = b*d
    denom = denom1 * denom2
    
    # 기약분수로 만들기 위해 최대공약수 계산
    gcd_value = gcd(numer, denom)
    
    # 분자와 분모를 최대공약수로 나누어 기약분수 반환
    return [numer // gcd_value, denom // gcd_value]