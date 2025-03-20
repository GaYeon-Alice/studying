import re
from collections import Counter

class Solution:
    def mostCommonWord(self, paragraph: str, banned: List[str]) -> str:

        # 단어 문자(a-z, A-Z, 0-9, _)가 아닌 모든 문자를 공백으로 치환 후 소문자로 변경
        cleaned_text = re.sub(r'\W', ' ', paragraph).lower()

        # 단어 목록 추출
        words = cleaned_text.split()
        
        # 금지된 단어를 제외한 단어 목록 추출
        filtered_words = [word for word in words if word not in banned]

        # 가장 자주 등장하는 단어 출력
        return Counter(filtered_words).most_common(1)[0][0]