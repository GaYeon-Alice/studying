import re

class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = re.sub('[^a-zA-Z0-9]', '', s).lower()
        reversed_s = ''.join(reversed(s))
        return s == reversed_s