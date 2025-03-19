from statistics import multimode

def solution(array):
    if len(multimode(array)) == 1:
        return multimode(array)[0]
    else:
        return -1