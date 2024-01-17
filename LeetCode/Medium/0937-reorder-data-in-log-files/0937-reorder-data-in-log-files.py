class Solution:
    def reorderLogFiles(self, logs: List[str]) -> List[str]:
        let, dig = [], []

        for log in logs:
            let.append(log) if log.split()[1].isalpha() else dig.append(log)
        let.sort(key=lambda x: (x.split()[1:], x.split()[0]))
            
        return let + dig