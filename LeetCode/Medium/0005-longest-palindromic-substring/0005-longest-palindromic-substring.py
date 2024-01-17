class Solution:
    def longestPalindrome(self, s: str) -> str:

        def expand_from_center(left, right):
            while left >= 0 and right <= len(s) - 1 and s[left] == s[right]:
                left -= 1
                right += 1
            
            return s[left + 1:right]
        
        if s == s[::-1]:
            return s

        max_str = ''

        for i in range(len(s) - 1):
            odd = expand_from_center(i, i)
            even = expand_from_center(i, i + 1)

            if len(odd) > len(max_str):
                max_str = odd
            if len(even) > len(max_str):
                max_str = even
            
        return max_str