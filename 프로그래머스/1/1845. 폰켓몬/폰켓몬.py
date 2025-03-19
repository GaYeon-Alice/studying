def solution(nums):
    
    # 선택 가능한 폰켓몬의 수
    max_cnt = len(nums) // 2
    
    # 폰켓몬의 총 종류 수 계산
    unique_cnt = len(set(nums))

    # 두 값 중 더 작은 값이 최대로 선택 가능한 폰켓몬의 종류 수
    return min(max_cnt, unique_cnt)