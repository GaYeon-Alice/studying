def solution(a, b):
    
    answer = 0
    
    ab = int(str(a) + str(b))
    mult_2ab = 2 * a * b
    
    answer = max(ab, mult_2ab)
    
    return answer