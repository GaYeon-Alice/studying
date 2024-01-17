class Solution:
    def mostCommonWord(self, paragraph: str, banned: List[str]) -> str:
        paragraph = re.sub('\W', ' ', paragraph).lower()
        word_list = [word for word in paragraph.split() if word not in banned]
        
        return Counter(word_list).most_common(1)[0][0]