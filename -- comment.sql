-- comment
/*
multi line comment

select
    ps.PatientId
    ,ps.Hospital
    ,ps.Ward
    ,ps.AdmittedDate
    ,ps.DischargeDate
    ,ps.Tariff
    ,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) as LenghtOfStay
    ,DATEADD(MONTH,-1,AdmittedDate) as ReminderDate
   FROM PatientStay ps
   WHERE ps. Hospital in ('kingston', 'pruh')
   AND ps. ward LIKE '%surgery%'
  -- and ps.Tariff BETWEEN 3 and 6
  order by 
    ps.AdmittedDate DESC, 
    ps.PatientId DESC

  --  select DATEDIFF(DAY, '2025-03-12', '2025-04-08')


  
  
  
  
  select 
  ps.Hospital
  ,  COUNT(*) AS NumberOfPatients 
  , sum(ps.Tariff) as TotalTariff
   , max(ps.Tariff) as maxTariff
  from PatientStay ps
  GROUP BY 
  ps.Hospital
  HAVING  COUNT(*) <13
  --HAVING SUM(ps.Tariff) < 80
  ORDER BY 
  TotalTariff DESC 

  SELECT * FROM DimHospitalBad
*/

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,dh.HospitalType 
    ,dh.Hospital
    ,ps.Hospital
FROM
    PatientStay ps LEFT JOIN DimHospitalBad dh
    ON ps.Hospital = dh.Hospital
WHERE dh.hospital IS NULL