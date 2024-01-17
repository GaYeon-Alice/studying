class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        anagrams = defaultdict(list)

        for string in strs:    
            anagrams[''.join(sorted(string))].append(string)

        return list(anagrams.values())