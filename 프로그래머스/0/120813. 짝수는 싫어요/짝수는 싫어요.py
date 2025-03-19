def solution(n):
    
    answer = []
    
    for i in range(1, 100, 2):
        if i <= n:
            answer.append(i)
    
    return answer