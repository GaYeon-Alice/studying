-- 코드를 입력하세요
SELECT a.apnt_no
     , p.pt_name
     , p.pt_no
     , a.mcdp_cd
     , d.dr_name
     , a.apnt_ymd
FROM appointment AS a
JOIN patient AS p ON a.pt_no = p.pt_no
JOIN doctor AS d ON a.mddr_id = d.dr_id
WHERE DATE_FORMAT(a.apnt_ymd, '%Y-%m-%d') = '2022-04-13'
  AND a.apnt_cncl_yn = 'N'
  AND a.mcdp_cd = 'CS'
ORDER BY a.apnt_ymd;