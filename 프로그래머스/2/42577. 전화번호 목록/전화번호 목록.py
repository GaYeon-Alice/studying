def solution(phone_book):
    
    # 전화번호를 사전순으로 정렬
    phone_book.sort()
    
    # 인접한 두 전화번호만 비교하면 됨
    for i in range(len(phone_book) - 1):
    
        # 현재 번호가 다음 번호의 접두어인지 확인
        if phone_book[i + 1].startswith(phone_book[i]):
            return False
    
    # 접두어 관계가 없으면 True 반환
    return True
