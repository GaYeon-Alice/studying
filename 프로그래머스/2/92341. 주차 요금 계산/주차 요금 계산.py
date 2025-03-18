import math

def time_to_minutes(time_str):
    hours, minutes = map(int, time_str.split(':'))
    return hours * 60 + minutes

def calculate_fee(minutes, fees):
    basic_time, basic_fee, unit_time, unit_fee = fees
    if minutes <= basic_time:
        return basic_fee
    else:
        excess_time = minutes - basic_time
        excess_units = math.ceil(excess_time / unit_time)  # 올림 처리
        return basic_fee + excess_units * unit_fee

def solution(fees, records):
    car_records = {}
    
    # 차량별 입/출차 기록 정리
    for record in records:
        time, car_number, status = record.split()
        if car_number not in car_records:
            car_records[car_number] = []
        car_records[car_number].append((time, status))
    
    # 누적 주차 시간 계산
    parking_times = {}
    for car_number, records in car_records.items():
        total_time = 0
        in_time = None
        
        for time, status in records:
            minutes = time_to_minutes(time)
            
            if status == "IN":
                in_time = minutes
            elif status == "OUT" and in_time is not None:
                total_time += minutes - in_time
                in_time = None
        
        # 출차 기록이 없는 경우 23:59에 출차한 것으로 간주
        if in_time is not None:
            total_time += time_to_minutes("23:59") - in_time
            
        parking_times[car_number] = total_time
        
    # 요금 계산 (차량 번호 순으로 정렬)
    result = []
    for car_number in sorted(parking_times.keys()):
        fee = calculate_fee(parking_times[car_number], fees)
        result.append(fee)
    
    return result