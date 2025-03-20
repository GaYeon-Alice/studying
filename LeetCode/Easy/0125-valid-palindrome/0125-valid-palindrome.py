import re

class Solution:
    def isPalindrome(self, s: str) -> bool:

        # 영문 대문자를 모두 소문자로 변경
        s = s.lower()

        # 영문 소문자와 숫자 이외의 모든 문자 제거(공백도 제거)
        s = re.sub('[^a-z0-9]', '', s)

        # 팰린드롬이면 true, 아니면 false 반환
        return s == s[::-1]