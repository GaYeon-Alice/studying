class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        
        nums_map = dict()

        for index, num in enumerate(nums):
            nums_map[num] = index
        
        for index, num in enumerate(nums):
            if target - num in nums_map and index != nums_map[target - num]:
                return [index, nums_map[target - num]]