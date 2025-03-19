def solution(array):
    
    array.sort()
    n = len(array)
    
    if n % 2 == 0:
        answer = (array[n // 2 - 1] + array[n // 2]) / 2
    else: 
        answer = array[n // 2]
    
    return answer