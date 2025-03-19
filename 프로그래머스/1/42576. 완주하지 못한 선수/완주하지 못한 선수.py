def solution(participant, completion):
    
    # 두 리스트 정렬
    participant.sort()
    completion.sort()
    
    # 완주자 리스트와 하나씩 비교
    for i in range(len(completion)):
        if participant[i] != completion[i]:
            return participant[i]
    
    # 모든 완주자가 일치한다면 마지막 참가자가 완주하지 못한 선수
    return participant[-1]