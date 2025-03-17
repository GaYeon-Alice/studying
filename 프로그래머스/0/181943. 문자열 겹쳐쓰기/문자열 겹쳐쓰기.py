def solution(my_string, overwrite_string, s):
    head = my_string[:s] 
    tail = my_string[s + len(overwrite_string):]
    answer = head + overwrite_string + tail
    return answer