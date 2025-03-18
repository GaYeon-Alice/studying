from collections import deque

def solution(begin, target, words):
    
    answer = 0
    
    # target이 words에 없으면 변환 불가능
    if target not in words:
        return answer
    
    queue = deque([(begin, 0)])  # (현재 단어, 변환 단계)
    visited = set()  # 방문한 단어 저장
    
    while queue:
        current_word, steps = queue.popleft()
        
        # 현재 단어가 target과 같으면 단계 수 반환
        if current_word == target:
            answer = steps
            return answer
        
        # 현재 단어와 한 글자만 다른 모든 단어를 큐에 추가
        for word in words:
            # 이미 방문한 단어는 건너뛰기
            if word in visited:
                continue
            
            # 한 글자만 다른지 확인
            diff_count = 0
            for i in range(len(word)):
                if current_word[i] != word[i]:
                    diff_count += 1
                
                # 두 글자 이상 다르면 더 이상 확인할 필요 없음
                if diff_count > 1:
                    break
            
            # 한 글자만 다르면 큐에 추가
            if diff_count == 1:
                visited.add(word)
                queue.append((word, steps + 1))
        
    # 변환할 수 없는 경우
    return answer