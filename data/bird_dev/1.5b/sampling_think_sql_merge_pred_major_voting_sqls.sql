SELECT MAX(CAST(frm.`Free Meal Count (K-12)` AS REAL) / frm.`Enrollment (K-12)`) AS max_eligible_free_rate FROM frpm AS frm INNER JOIN schools AS sch ON frm.CDSCode = sch.CDSCode WHERE sch.County = 'Alameda'
SELECT      T2.`Free Meal Count (Ages 5-17)`,     T2.`Enrollment (Ages 5-17)` FROM      frpm AS T2 INNER JOIN      schools AS T1 ON      T2.CDSCode = T1.CDSCode WHERE      T1.`StatusType` = 'Continuation' ORDER BY      T2.`Free Meal Count (Ages 5-17)` / T2.`Enrollment (Ages 5-17)` ASC LIMIT 3
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`District Name` = "Fresno County Office of Education"
SELECT      schools.MailStreet FROM      frpm INNER JOIN      schools ON      frpm.CDSCode = schools.CDSCode ORDER BY      frpm.`FRPM Count (K-12)` DESC LIMIT 1
SELECT s.Phone FROM frpm AS f INNER JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.OpenDate > '2000-01-01'
SELECT COUNT(*) AS num_schools FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F'   AND T2.AvgScrMath > 400
SELECT schools.School FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.NumTstTakr > 500 AND schools.Magnet = 1
SELECT s.Phone FROM schools AS s INNER JOIN satscores AS sa ON s.CDSCode = sa.cds WHERE sa.NumGE1500 > 0 ORDER BY sa.NumGE1500 DESC LIMIT 1
SELECT      s.NumTstTakr  FROM      satscores AS s INNER JOIN      frpm AS f  ON      s.cds = f.CDSCode ORDER BY      f.`FRPM Count (K-12)` DESC LIMIT 1
SELECT COUNT(T2.CDSCode) AS filtered_school_count FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.FundingType = 'Directly funded'
SELECT frpm.`FRPM Count (Ages 5-17)` FROM satscores INNER JOIN frpm ON satscores.cds = frpm.CDSCode ORDER BY satscores.AvgScrRead DESC LIMIT 1
SELECT      CDSCode FROM      frpm GROUP BY      CDSCode HAVING      SUM(`Enrollment (K-12)`) + SUM(`Enrollment (Ages 5-17)`) > 500
SELECT      MAX(T2.`Free Meal Count (Ages 5-17)`) AS HighestEligibleFreeRate FROM      satscores AS T1 INNER JOIN      frpm AS T2 ON      T1.cds = T2.CDSCode WHERE      T1.NumGE1500 * 1.0 / T1.NumTstTakr > 0.3
SELECT s.Phone FROM satscores AS sa INNER JOIN schools AS s ON sa.cds = s.CDSCode ORDER BY sa.NumGE1500 / sa.NumTstTakr DESC LIMIT 3
SELECT      s.NCESSchool FROM      frpm AS f INNER JOIN      schools AS s ON      f.CDSCode = s.CDSCode ORDER BY      f.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT s.District FROM schools s INNER JOIN satscores sa ON s.CDSCode = sa.cds WHERE s.StatusType = 'Active' GROUP BY s.District ORDER BY AVG(sa.AvgScrRead) DESC LIMIT 1
SELECT COUNT(s.CDSCode) FROM schools s JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.StatusType = 'Merged' AND sc.NumTstTakr < 100
SELECT DISTINCT s.`CharterNum` FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode INNER JOIN satscores sa ON s.CDSCode = sa.cds WHERE sa.`AvgScrWrite` > 499 AND s.`CharterNum` IS NOT NULL ORDER BY sa.`AvgScrWrite` DESC
SELECT COUNT(*) FROM schools AS S JOIN satscores AS SS ON S.CDSCode = SS.cds WHERE S.FundingType = 'Directly funded' AND S.County = 'Fresno' AND SS.NumTstTakr <= 250
SELECT      s.Phone FROM      satscores AS T1 INNER JOIN      schools AS s ON      T1.cds = s.CDSCode ORDER BY      T1.AvgScrMath DESC LIMIT 1
SELECT COUNT(*) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12'
SELECT COUNT(*) AS Count FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Los Angeles' AND T1.`Free Meal Count (K-12)` > 500 AND T1.`Free Meal Count (K-12)` < 700
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY NumTstTakr DESC LIMIT 1
SELECT s.`School`, s.Street FROM frpm AS frpm INNER JOIN schools AS s ON frpm.CDSCode = s.CDSCode WHERE frpm.`Enrollment (K-12)` - frpm.`Enrollment (Ages 5-17)` > 30
SELECT frpm.`School Name` FROM frpm INNER JOIN satscores ON frpm.CDSCode = satscores.cds WHERE frpm.`Percent (%) Eligible Free (K-12)` > 0.1 AND satscores.NumGE1500 > 0
SELECT      s.FundingType FROM      schools s INNER JOIN      satscores sc ON      s.CDSCode = sc.cds WHERE      s.County = 'Riverside' GROUP BY      s.CDSCode, s.FundingType HAVING      AVG(sc.AvgScrMath) > 400
SELECT      T1.School,      T1.Street,      T1.City,      T1.State,      T1.Zip FROM      schools AS T1 INNER JOIN      frpm AS T2 ON      T1.CDSCode = T2.CDSCode WHERE      T1.SOCType = 'High Schools (Public)'     AND T2.`Free Meal Count (Ages 5-17)` > 800     AND T1.County = 'Monterey'
SELECT      s.School,      AVG(sc.AvgScrWrite) AS AvgScrWrite,      s.Phone FROM      schools s INNER JOIN      satscores sc ON      s.CDSCode = sc.cds WHERE      s.OpenDate > '1991-12-31'      AND (s.ClosedDate IS NULL OR s.ClosedDate < '2000-12-31') GROUP BY      s.School, s.Phone
SELECT s.School, s.DOCType FROM frpm AS fr INNER JOIN schools AS s ON fr.CDSCode = s.CDSCode WHERE s.FundingType = 'Locally funded' GROUP BY s.School, s.DOCType HAVING AVG(fr.`Enrollment (K-12)` - fr.`Enrollment (Ages 5-17)`) > (SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) FROM frpm)
SELECT s.OpenDate FROM schools AS s INNER JOIN frpm AS f ON s.CDSCode = f.CDSCode WHERE f.`Enrollment (K-12)` IS NOT NULL ORDER BY f.`Enrollment (K-12)` DESC LIMIT 1
SELECT      s.City FROM      frpm AS f INNER JOIN      schools AS s ON      f.CDSCode = s.CDSCode ORDER BY      f.`Enrollment (Ages 5-17)` ASC LIMIT 5
SELECT      frpm.`Free Meal Count (K-12)`,     frpm.`Enrollment (K-12)` FROM      frpm INNER JOIN      schools  ON      frpm.CDSCode = schools.CDSCode WHERE      frpm.`School Type` IN ('High Schools (Public)', 'K-12 Schools (Public)') ORDER BY      frpm.`Enrollment (K-12)` DESC LIMIT 2
SELECT      T1.`FRPM Count (K-12)` / T1.`Enrollment (K-12)` AS eligible_free_meal_rate FROM      frpm AS T1 INNER JOIN      schools AS T2 ON      T1.CDSCode = T2.CDSCode WHERE      T2.SOC = '66' ORDER BY      T1.`FRPM Count (K-12)` / T1.`Enrollment (K-12)` DESC LIMIT 5
SELECT      schools.Website,      frpm.`School Name`  FROM      frpm  INNER JOIN      schools  ON      frpm.CDSCode = schools.CDSCode  WHERE      frpm.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT CAST(f.`Free Meal Count (Ages 5-17)` AS REAL) / f.`Enrollment (Ages 5-17)` AS FreeRate FROM frpm f INNER JOIN schools s ON f.CDSCode = s.CDSCode WHERE s.AdmFName1 = 'Kacey' AND s.AdmLName1 = 'Gibson'
SELECT schools.AdmEmail1 FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Charter School (Y/N)` = 1 ORDER BY frpm.`Enrollment (K-12)` ASC LIMIT 1
SELECT s.AdmFName1, s.AdmLName1 FROM schools AS s INNER JOIN satscores AS s ON s.CDSCode = s.cds WHERE s.NumGE1500 >= 1500 ORDER BY s.NumGE1500 DESC LIMIT 1
SELECT s.Street, s.City, s.Zip, s.State FROM satscores AS sc INNER JOIN schools AS s ON sc.cds = s.CDSCode ORDER BY CAST(sc.NumGE1500 AS REAL) / sc.NumTstTakr ASC LIMIT 1
SELECT schools.Website FROM schools JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Los Angeles' AND satscores.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(s.NumTstTakr) AS AvgNumTstTakers FROM satscores s INNER JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.County = 'Fresno' AND strftime('%Y', sc.OpenDate) = '1980'
SELECT      s.Phone   FROM      schools AS s   INNER JOIN      satscores AS sc   ON      s.CDSCode = sc.cds   WHERE      s.District = 'Fresno Unified'   ORDER BY      sc.AvgScrRead ASC   LIMIT 1
SELECT s.School FROM schools s INNER JOIN satscores ss ON s.CDSCode = ss.cds WHERE s.Virtual = 'F' ORDER BY ss.AvgScrRead DESC LIMIT 5
SELECT      schools.SOCType FROM      schools JOIN      satscores  ON      schools.CDSCode = satscores.cds ORDER BY      satscores.AvgScrMath DESC LIMIT 1
SELECT      s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite AS avg_all_subjects,                     frpm.`County Name` FROM      satscores s  INNER JOIN      frpm ON s.cds = frpm.CDSCode  ORDER BY      s.AvgScrMath + s.AvgScrRead + s.AvgScrWrite ASC  LIMIT 1
SELECT T2.AvgScrWrite, T1.City FROM satscores AS T2 INNER JOIN schools AS T1 ON T2.cds = T1.CDSCode WHERE T2.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores)
SELECT s.School, AVG(sc.AvgScrWrite) AS AvgScrWrite FROM schools s INNER JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.AdmFName1 = 'Ricci' AND s.AdmLName1 = 'Ulrich' GROUP BY s.School
SELECT      s.School FROM      schools s INNER JOIN      frpm f ON s.CDSCode = f.CDSCode WHERE      s.DOC = 31 AND f.`School Type` = 'State Special Schools' GROUP BY      s.CDSCode, s.School ORDER BY      SUM(f.`Enrollment (K-12)`) DESC LIMIT 1
SELECT CAST(COUNT(*) AS REAL) / 12 AS MonthlySchoolsOpened FROM schools WHERE DOC = '52' AND County = 'Alameda' AND OpenDate LIKE '1980%'
SELECT CAST(COUNT(CASE WHEN s.DOC = 54 THEN 1 END) AS REAL) / COUNT(CASE WHEN s.DOC = 52 THEN 1 END) AS ratio FROM schools s WHERE s.County = 'Orange'
SELECT      s.County,      s.School,      s.ClosedDate FROM      schools s WHERE      s.StatusType = 'Closed' GROUP BY      s.County, s.School, s.ClosedDate ORDER BY      COUNT(*) DESC LIMIT 1
SELECT      s.MailStreet,      s.School FROM      satscores AS scr INNER JOIN      schools AS s ON      scr.cds = s.CDSCode ORDER BY      scr.AvgScrMath DESC LIMIT 1
SELECT      schools.MailStreet,      schools.School FROM      satscores INNER JOIN      schools  ON      satscores.cds = schools.CDSCode ORDER BY      satscores.AvgScrRead ASC LIMIT 1
SELECT COUNT(*) AS total_schools FROM satscores AS sat INNER JOIN schools AS sch ON sat.cds = sch.CDSCode WHERE sat.AvgScrRead + sat.AvgScrMath + sat.AvgScrWrite >= 1500 AND sch.MailCity = 'Lakeport'
SELECT SUM(s.NumTstTakr) AS TotalNumTstTakers FROM satscores s INNER JOIN schools sc ON s.cds = sc.CDSCode WHERE sc.MailCity = 'Fresno'
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'
SELECT      CAST(SUM(CASE WHEN s.County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) /      SUM(CASE WHEN s.County = 'Humboldt' THEN 1 ELSE 0 END) AS ratio FROM      schools s WHERE      s.State = 'CA'
SELECT COUNT(*) AS active_schools FROM schools WHERE MailState = 'CA' AND MailCity = 'San Joaquin' AND StatusType = 'Active'
SELECT s.Phone, s.Ext FROM schools s JOIN satscores sa ON s.CDSCode = sa.cds ORDER BY sa.AvgScrWrite DESC LIMIT 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'
SELECT COUNT(*) FROM schools WHERE DOC = 52 AND Charter = 1 AND City = 'Hickman'
SELECT COUNT(*) AS total_non_chartered_schools FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Charter = 0 AND f.`County Name` = 'Los Angeles' AND (f.`Free Meal Count (K-12)` * 100.0 / f.`Enrollment (K-12)`) < 0.18
SELECT      AdmFName1,      AdmLName1,      School,      City FROM      schools WHERE      Charter = 1      AND CharterNum = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'
SELECT CAST(SUM(CASE WHEN s.FundingType = 'Locally funded' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS lcf_percentage FROM schools s WHERE s.County = 'Santa Clara'
SELECT COUNT(*)  FROM schools  WHERE FundingType = 'Directly Funded'    AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'    AND County = 'Stanislaus'
SELECT COUNT(CDSCode) AS total_ccd_closure FROM schools WHERE strftime('%Y', ClosedDate) = '1989' AND City = 'San Francisco'
SELECT County FROM schools WHERE SOC = '11' AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY COUNT(*) DESC LIMIT 1
SELECT NCESDist FROM schools WHERE SOC = '31'
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND SocType = 'District Community Day Schools' AND StatusType IN ('Active', 'Closed')
SELECT `District` AS district_code FROM schools WHERE `Magnet` = 0 AND `City` = 'Fresno'
SELECT frpm.`Enrollment (Ages 5-17)` FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.`EdOpsCode` = 'SSS' AND schools.`City` = 'Fremont' AND frpm.`Academic Year` = '2014-2015'
SELECT frpm.`Free Meal Count (Ages 5-17)` FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.`MailStreet` = 'PO Box 1040' AND frpm.`Educational Option Type` = 'Youth Authority School'
SELECT f.`Low Grade` FROM frpm AS f INNER JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE s.NCESDist = '0613360' AND s.EdOpsCode = 'SPECON' ORDER BY f.`Low Grade` ASC LIMIT 1
SELECT      schools.EILName FROM      frpm INNER JOIN      schools ON      frpm.CDSCode = schools.CDSCode WHERE      frpm.`County Code` = '37'      AND frpm.`NSLP Provision Status` = 'Breakfast Provision 2'
SELECT s.City FROM frpm AS f INNER JOIN schools AS s ON f.CDSCode = s.CDSCode WHERE f.`County Name` = 'Merced' AND f.`NSLP Provision Status` = 'Lunch Provision 2' AND f.`Low Grade` = '9' AND f.`High Grade` = '12'
SELECT      T1.`County Name`,      (T1.`FRPM Count (Ages 5-17)`) * 100.0 / T1.`Enrollment (Ages 5-17)` AS `Percent Eligible FRPM (Ages 5-17)` FROM      frpm AS T1 INNER JOIN      schools AS T2 ON      T1.`County Name` = T2.County WHERE      T1.`County Name` = 'Los Angeles'
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(*) DESC LIMIT 1
SELECT County, COUNT(*) AS COUNT_SCHOOLS FROM schools WHERE County IN ('San Diego', 'Santa Barbara') AND Virtual = 'F' GROUP BY County ORDER BY COUNT_SCHOOLS DESC LIMIT 1
SELECT School, Latitude FROM schools ORDER BY Latitude DESC LIMIT 1
SELECT s.City, s.School, frpm.`Low Grade` FROM schools s INNER JOIN frpm ON s.CDSCode = frpm.CDSCode WHERE s.State = 'CA' ORDER BY s.Latitude ASC LIMIT 1
SELECT GSoffered FROM schools ORDER BY ABS(Longitude) DESC LIMIT 1
SELECT COUNT(*) AS TotalSchools, COUNT(T1.CDSCode) AS SchoolsWithMultipleProviding FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.Magnet = 1 AND T2.`NSLP Provision Status` = 'Multiple Provision Types' AND T1.GSoffered = 'K-8'
SELECT AdmFName1 AS First_Name, District FROM schools GROUP BY AdmFName1, District ORDER BY COUNT(*) DESC LIMIT 2
SELECT frpm.`Percent (%) Eligible Free (K-12)`, schools.`District` FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE schools.AdmFName1 = 'Alusine'
SELECT      s.AdmLName1,      f.`District Name`,      f.`County Name`,      f.`School Name` FROM      schools s INNER JOIN      frpm f ON      s.CDSCode = f.CDSCode WHERE      f.`Charter School Number` = '40'
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND City = 'San Bernardino' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND SOC = 62 AND DOC = 54
SELECT      schools.AdmEmail1,      schools.School FROM      satscores INNER JOIN      schools  ON      satscores.cds = schools.CDSCode WHERE      satscores.NumGE1500 > 0 ORDER BY      satscores.NumGE1500 DESC LIMIT 1
SELECT COUNT(*) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.A3 = 'east Bohemia'
SELECT COUNT(*) FROM account AS a INNER JOIN district AS d ON a.district_id = d.district_id INNER JOIN loan AS l ON a.account_id = l.account_id WHERE d.A3 = 'Prague'
SELECT      CASE          WHEN AVG(A12) > AVG(A13) THEN '1995'         ELSE '1996'     END AS higher_unemployment_rate FROM      district
SELECT COUNT(*) AS total_districts FROM district WHERE A11 > 6000 AND A11 < 10000
SELECT COUNT(*) AS count FROM client AS c  INNER JOIN district AS d ON c.district_id = d.district_id  WHERE c.gender = 'M'  AND d.A3 = 'north Bohemia'  AND d.A11 > 8000
SELECT MIN(d.A11) - MAX(d.A11) AS salary_gap FROM client c INNER JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F' ORDER BY c.birth_date DESC LIMIT 1
SELECT c.client_id FROM client c INNER JOIN district d ON c.district_id = d.district_id WHERE c.birth_date = (SELECT MIN(birth_date) FROM client) ORDER BY d.A11 DESC LIMIT 1
SELECT COUNT(*) AS customer_count FROM account AS a INNER JOIN disp AS d ON a.account_id = d.account_id WHERE a.frequency = 'POPLATEK TYDNE' AND d.type = 'OWNER'
SELECT disp.client_id FROM disp INNER JOIN account ON disp.account_id = account.account_id WHERE disp.type = 'DISPONENT' AND account.frequency = 'POPLATEK PO OBRATU'
SELECT a.account_id FROM loan AS l INNER JOIN account AS a ON l.account_id = a.account_id WHERE STRFTIME('%Y', l.date) = '1997' AND a.frequency = 'POPLATEK TYDNE' ORDER BY l.amount ASC LIMIT 1
SELECT      loan.account_id FROM      loan INNER JOIN      account ON      loan.account_id = account.account_id WHERE      loan.duration > 12     AND account.date LIKE '1993%'     AND loan.amount > 0 ORDER BY      loan.amount DESC LIMIT 1
SELECT COUNT(*) AS num_customers FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.A2 = 'Sokolov'
SELECT t.account_id FROM trans t WHERE t.date LIKE '1995-%' ORDER BY t.date ASC LIMIT 1
SELECT DISTINCT account.account_id FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE account.date < '1997-01-01' AND trans.amount > 3000
SELECT disp.client_id FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE strftime('%Y', card.issued) = '1994' AND strftime('%m', card.issued) = '03'
SELECT account.date FROM trans INNER JOIN account ON trans.account_id = account.account_id WHERE trans.amount = 840 AND trans.date = '1998-10-14' ORDER BY account.date ASC
SELECT      a.district_id FROM      loan AS l INNER JOIN      account AS a ON      l.account_id = a.account_id WHERE      l.date = '1994-08-25'
SELECT MAX(trans.amount) AS max_transaction_amount FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN account ON disp.account_id = account.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE card.issued = '1996-10-21'
SELECT client.gender FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN district ON account.district_id = district.district_id WHERE district.A11 = (SELECT MAX(A11) FROM district) ORDER BY client.birth_date DESC LIMIT 1
SELECT trans.amount AS first_transaction_amount  FROM loan  INNER JOIN account ON loan.account_id = account.account_id  INNER JOIN trans ON account.account_id = trans.account_id  WHERE loan.amount = (SELECT MAX(amount) FROM loan)  ORDER BY trans.date ASC  LIMIT 1
SELECT COUNT(client.client_id) FROM district INNER JOIN client ON district.district_id = client.district_id WHERE district.A2 = 'Jesenik' AND client.gender = 'F'
SELECT disp.disp_id FROM trans INNER JOIN disp ON trans.account_id = disp.account_id WHERE trans.amount = 5100 AND trans.date = '1998-09-02'
SELECT COUNT(*) FROM district AS D INNER JOIN account AS A ON D.district_id = A.district_id WHERE D.A2 = 'Litomerice' AND A.date LIKE '1996%'
SELECT district.A2 FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date = '1976-01-29'
SELECT client.birth_date FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN client ON account.district_id = client.district_id WHERE loan.amount = 98832 AND loan.date BETWEEN '1996-01-01' AND '1996-12-31'
SELECT account.account_id FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague' ORDER BY district.A3 ASC LIMIT 1
SELECT CAST(COUNT(CASE WHEN client.gender = 'M' THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS male_percentage FROM client JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'south Bohemia' ORDER BY district.A4 DESC LIMIT 1
SELECT      ((t1.balance - t2.balance) * 100.0) / t2.balance AS increase_rate FROM      trans AS t1 INNER JOIN      loan AS l ON      t1.account_id = l.account_id INNER JOIN      trans AS t2 ON      t1.account_id = t2.account_id WHERE      l.date = '1993-07-05'     AND t1.date = '1993-03-22'     AND t2.date = '1998-12-27'
SELECT CAST(SUM(CASE WHEN L.status = 'A' THEN L.amount ELSE 0 END) AS REAL) * 100.0 / SUM(L.amount) AS percentage_paid_with_no_issue FROM loan L
SELECT CAST(SUM(IIF(loan.amount < 100000, 1, 0)) AS REAL) * 100 / SUM(CASE WHEN loan.status = 'C' THEN 1 ELSE 0 END) AS percentage FROM loan WHERE loan.status = 'C'
SELECT account.account_id, district.A2, district.A3  FROM account  INNER JOIN district ON account.district_id = district.district_id  WHERE STRFTIME('%Y', account.date) = '1993'  AND account.frequency = 'POPLATEK PO OBRATU'
SELECT      account.account_id,      account.frequency FROM      account INNER JOIN      district  ON      account.district_id = district.district_id WHERE      district.A3 = 'east Bohemia'     AND account.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT      account.account_id,      account.date FROM      account INNER JOIN      district ON      account.district_id = district.district_id WHERE      district.A2 = 'Prachatice'
SELECT district.A2, district.A3 FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.loan_id = 4990
SELECT      loan.account_id,      district.A2,      district.A3 FROM      loan INNER JOIN      account ON loan.account_id = account.account_id INNER JOIN      district ON account.district_id = district.district_id WHERE      loan.amount > 300000
SELECT      loan.loan_id,      district.A3,      district.A11  FROM      loan  INNER JOIN      account  ON      loan.account_id = account.account_id  INNER JOIN      district  ON      account.district_id = district.district_id  WHERE      loan.duration = 60
SELECT      d.district_id,      (CAST(d.A13 AS real) - CAST(d.A12 AS real)) * 100.0 / CAST(d.A12 AS real) AS unemployment_rate_increment FROM      loan AS l INNER JOIN      account AS a ON l.account_id = a.account_id INNER JOIN      district AS d ON a.district_id = d.district_id WHERE      l.status = 'D'
SELECT CAST(SUM(CASE WHEN A.A2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM district A  JOIN account B ON A.district_id = B.district_id  WHERE B.date LIKE '1993%'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT district.A2 AS district_name, COUNT(*) AS female_clients_count FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' GROUP BY district.A2 ORDER BY female_clients_count DESC LIMIT 9
SELECT      d.A2 FROM      trans AS t INNER JOIN      account AS a ON t.account_id = a.account_id INNER JOIN      district AS d ON a.district_id = d.district_id WHERE      t.date LIKE '1996-01%'      AND t.type = 'VYDAJ' ORDER BY      t.amount DESC LIMIT 10
SELECT COUNT(DISTINCT client.client_id) AS num_accounts_without_cards FROM client INNER JOIN district ON client.district_id = district.district_id LEFT JOIN card ON client.client_id = card.disp_id WHERE district.A3 = 'south Bohemia' AND card.disp_id IS NULL
SELECT      d.A3 AS district_name FROM      loan AS l INNER JOIN      account AS a ON l.account_id = a.account_id INNER JOIN      district AS d ON a.district_id = d.district_id WHERE      l.status IN ('C', 'D') GROUP BY      d.A3 ORDER BY      COUNT(l.loan_id) DESC LIMIT 1
SELECT AVG(loan.amount) AS average_loan_amount FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN client ON account.district_id = client.district_id WHERE client.gender = 'M'
SELECT A2 AS district_name, A13 AS unemployment_rate FROM district ORDER BY A13 DESC LIMIT 1
SELECT COUNT(*) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY A16 DESC LIMIT 1)
SELECT COUNT(*) AS negative_balance_accounts FROM trans AS T INNER JOIN account AS A ON T.account_id = A.account_id WHERE T.operation = 'VYBER KARTOU' AND A.frequency = 'POPLATEK MESICNE' AND T.balance < 0
SELECT COUNT(loan.loan_id) FROM loan INNER JOIN account ON loan.account_id = account.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.status = 'A' AND loan.amount >= 250000 AND loan.date BETWEEN '1995-01-01' AND '1997-12-31'
SELECT COUNT(T1.account_id) AS num_accounts FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'C' AND T2.district_id = 1
SELECT COUNT(*) FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A15 IN (SELECT A15 FROM district ORDER BY A15 DESC LIMIT 1 OFFSET 1)
SELECT COUNT(*)  FROM card  INNER JOIN disp ON card.disp_id = disp.disp_id  WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT COUNT(*)  FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Pisek'
SELECT      T1.A2 AS district_name FROM      district T1 INNER JOIN      account T2 ON T1.district_id = T2.district_id INNER JOIN      trans T3 ON T2.account_id = T3.account_id WHERE      T3.date BETWEEN '1997-01-01' AND '1997-12-31' GROUP BY      T1.A2 HAVING      SUM(T3.amount) > 10000
SELECT DISTINCT T2.account_id FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.k_symbol = 'SIPO' AND T3.A2 = 'Pisek'
SELECT DISTINCT T2.account_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold'
SELECT STRFTIME('%Y-%m', trans.date) AS `date`, AVG(trans.amount) AS avg_amount FROM trans WHERE trans.operation = 'VYBER KARTOU' AND STRFTIME('%Y', trans.date) = '2021' GROUP BY STRFTIME('%Y-%m', trans.date)
SELECT      t.account_id FROM      trans AS t INNER JOIN      account AS a ON      t.account_id = a.account_id WHERE      t.operation = 'VYBER KARTOU'      AND t.date BETWEEN '1998-01-01' AND '1998-12-31'     AND t.amount < (SELECT AVG(amount)      FROM trans      WHERE date BETWEEN '1998-01-01' AND '1998-12-31')
SELECT DISTINCT client.client_id FROM client INNER JOIN card ON client.client_id = card.disp_id INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'F'
SELECT COUNT(*) AS client_count FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' AND district.A3 LIKE '%south Bohemia%'
SELECT DISTINCT T1.account_id FROM district AS T2 INNER JOIN account AS T1 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T2.A2 = 'Tabor' AND T3.type = 'OWNER'
SELECT DISTINCT account.frequency FROM account INNER JOIN disp ON account.district_id = disp.client_id INNER JOIN district ON disp.client_id = district.district_id WHERE account.frequency = 'POPLATEK MESICNE'   AND disp.type = 'OWNER'   AND district.A11 BETWEEN 8000 AND 9000
SELECT COUNT(a.account_id) AS num_accounts FROM district AS d INNER JOIN account AS a ON d.district_id = a.district_id INNER JOIN trans AS t ON a.account_id = t.account_id WHERE d.A3 LIKE '%North Bohemia%' AND t.bank = 'AB'
SELECT DISTINCT district.A2 FROM trans JOIN account ON trans.account_id = account.account_id JOIN district ON account.district_id = district.district_id WHERE trans.type = 'VYDAJ'
SELECT AVG(d.A15) AS avg_crimes FROM district d JOIN account a ON d.district_id = a.district_id WHERE d.A15 > 4000 AND a.date >= '1997-01-01'
SELECT COUNT(*) AS count FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN loan ON disp.account_id = loan.account_id WHERE card.type = 'classic'
SELECT COUNT(*) AS male_clients_count FROM client AS T1 JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Hl.m. Praha' AND T1.gender = 'M'
SELECT CAST(COUNT(CASE WHEN T1.type = 'gold' AND T1.issued < '1998-01-01' THEN T1.card_id END) AS real) * 100.0 / COUNT(T1.card_id) FROM card T1
SELECT T3.client_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id ORDER BY T1.amount DESC LIMIT 1
SELECT district.A15 FROM district INNER JOIN account ON district.district_id = account.district_id WHERE account.account_id = 532
SELECT T2.district_id FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333
SELECT trans.trans_id FROM trans INNER JOIN account ON trans.account_id = account.account_id INNER JOIN client ON account.district_id = client.district_id WHERE client.client_id = 3356 AND trans.operation = 'VYBER'
SELECT COUNT(*) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 13539
SELECT district.A3 FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.client_id = 3541
SELECT      d.A2 AS district_name FROM      loan AS l INNER JOIN      account AS a ON l.account_id = a.account_id INNER JOIN      district AS d ON a.district_id = d.district_id WHERE      l.status = 'A' GROUP BY      d.A2 ORDER BY      COUNT(a.account_id) DESC LIMIT 1
SELECT client.client_id FROM `order` INNER JOIN account ON `order`.account_id = account.account_id INNER JOIN client ON account.district_id = client.district_id WHERE `order`.order_id = 32423
SELECT t.trans_id FROM account AS a JOIN trans AS t ON a.account_id = t.account_id WHERE a.district_id = 5
SELECT COUNT(account.account_id) FROM district INNER JOIN account ON district.district_id = account.district_id WHERE district.A2 = 'Jesenik'
SELECT DISTINCT c.client_id FROM card AS card INNER JOIN disp AS disp ON card.disp_id = disp.disp_id INNER JOIN client AS c ON disp.client_id = c.client_id WHERE card.type = 'junior' AND card.issued >= '1997-01-01'
SELECT      CAST(COUNT(CASE WHEN T1.gender = 'F' THEN 1 END) AS REAL) * 100.0 / COUNT(T1.client_id) AS percentage FROM      client T1 INNER JOIN      district T2 ON      T1.district_id = T2.district_id WHERE      T2.A11 > 10000
SELECT CAST(SUM(CASE WHEN l.date LIKE '1997%' THEN l.amount ELSE 0 END) - SUM(CASE WHEN l.date LIKE '1996%' THEN l.amount ELSE 0 END) AS REAL) * 100.0 / SUM(CASE WHEN l.date LIKE '1996%' THEN l.amount ELSE 0 END) AS growth_rate  FROM loan l  INNER JOIN account a ON l.account_id = a.account_id  INNER JOIN client c ON a.district_id = c.district_id  WHERE c.gender = 'M'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01'
SELECT SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) -         SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) AS crime_difference  FROM district
SELECT COUNT(*)  FROM disp  WHERE account_id BETWEEN 1 AND 10    AND type IN ('DISPONENT', 'OWNER')
SELECT      COUNT(*) AS total_requests,     SUM(amount) AS total_debit_amount FROM      trans JOIN      account ON      trans.account_id = account.account_id WHERE      trans.account_id = 3     AND trans.k_symbol = 'SVAT'
SELECT SUBSTR(birth_date, 1, 4) AS birth_year FROM client WHERE client_id = 130
SELECT COUNT(T1.disp_id) AS count FROM disp AS T1 INNER JOIN account AS T2 ON T1.disp_id = T2.district_id WHERE T1.type = 'OWNER' AND T2.frequency = 'POPLATEK PO OBRATU'
SELECT loan.amount, loan.status FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN client ON account.district_id = client.district_id WHERE client.client_id = 992
SELECT      SUM(trans.amount) AS total_transaction_amount,     client.gender FROM      client INNER JOIN      account ON client.district_id = account.district_id INNER JOIN      trans ON account.account_id = trans.account_id WHERE      client.client_id = 4 AND      trans.trans_id = 851
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE disp.client_id = 9
SELECT SUM(t.amount) AS total_amount FROM client AS c INNER JOIN account AS a ON c.district_id = a.district_id INNER JOIN trans AS t ON a.account_id = t.account_id WHERE c.client_id = 617 AND t.date LIKE '1998%'
SELECT client.client_id FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN district ON account.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.A3 LIKE 'east bohemia%'
SELECT client.client_id FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'F' ORDER BY loan.amount DESC LIMIT 3
SELECT COUNT(T1.client_id) FROM client AS T1 JOIN trans AS T2 ON T1.client_id = T2.account_id WHERE T1.gender = 'M' AND T1.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND T2.k_symbol = 'SIPO' AND T2.amount > 4000
SELECT COUNT(*) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Beroun' AND strftime('%Y', T2.date) > '1996'
SELECT COUNT(*) FROM client INNER JOIN card ON client.client_id = card.disp_id WHERE client.gender = 'F' AND card.type = 'junior'
SELECT CAST(SUM(CASE WHEN client.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) FROM client JOIN district ON client.district_id = district.district_id WHERE district.A3 = 'Prague'
SELECT CAST(SUM(CASE WHEN client.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(client.client_id) FROM client JOIN account ON client.district_id = account.district_id WHERE account.frequency = 'POPLATEK TYDNE'
SELECT COUNT(client.client_id) FROM account INNER JOIN disp ON account.account_id = disp.account_id INNER JOIN client ON disp.client_id = client.client_id WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER'
SELECT      a.account_id FROM      loan AS l INNER JOIN      account AS a ON l.account_id = a.account_id WHERE      l.duration > 24     AND a.date < '1997-01-01' ORDER BY      l.amount ASC LIMIT 1
SELECT client.client_id AS account_number FROM client JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' ORDER BY client.birth_date DESC, district.A11 ASC LIMIT 1
SELECT COUNT(client.client_id) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.birth_date LIKE '1920-%' AND district.A3 = 'east Bohemia'
SELECT COUNT(*) FROM loan INNER JOIN account ON loan.account_id = account.account_id WHERE loan.duration = 24 AND account.frequency = 'POPLATEK TYDNE'
SELECT AVG(l.amount) AS average_loan_amount  FROM loan l  INNER JOIN account a ON l.account_id = a.account_id  WHERE l.status = 'C' AND a.frequency = 'POPLATEK PO OBRATU'
SELECT      c.client_id,      d.district_id FROM      disp AS disp1 JOIN      client AS c ON      disp1.client_id = c.client_id JOIN      district AS d ON      c.district_id = d.district_id WHERE      disp1.type = 'OWNER'
SELECT client.client_id, client.birth_date FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON disp.client_id = client.client_id WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM molecule AS m INNER JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl'
SELECT AVG(atom_count) AS avg_oxygen_count FROM (     SELECT COUNT(a.atom_id) AS atom_count     FROM bond b     INNER JOIN atom a ON b.molecule_id = a.molecule_id     WHERE b.bond_type = '-' AND a.element = 'o'     GROUP BY b.molecule_id )
SELECT      AVG(bond_count) AS average_bond_count FROM (     SELECT          m.molecule_id,         COUNT(*) AS bond_count     FROM          molecule m     INNER JOIN          bond b     ON          m.molecule_id = b.molecule_id     WHERE          m.label = '+'         AND b.bond_type = '-'     GROUP BY          m.molecule_id )
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-' AND atom.element = 'na'
SELECT DISTINCT m.molecule_id FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+' AND b.bond_type = '#'
SELECT CAST(SUM(CASE WHEN a.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(c.atom_id) AS percentage FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN connected c ON b.bond_id = c.bond_id WHERE b.bond_type = '='
SELECT COUNT(*)  FROM bond  WHERE bond_type = '#'
SELECT COUNT(*) AS count FROM atom WHERE element != 'br'
SELECT COUNT(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'c'
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR004_8_9') UNION SELECT element FROM atom WHERE atom_id IN (SELECT atom_id2 FROM connected WHERE bond_id = 'TR004_8_9')
SELECT T2.element FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '='
SELECT molecule.label FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'h' GROUP BY molecule.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT bond.bond_type FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'cl'
SELECT atom.atom_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '-'
SELECT DISTINCT T2.atom_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T1.label = '-'
SELECT      a.element FROM      atom a INNER JOIN      molecule m ON a.molecule_id = m.molecule_id WHERE      m.label = '-' GROUP BY      a.element ORDER BY      COUNT(a.element) ASC LIMIT 1
SELECT b.bond_type FROM connected AS c INNER JOIN bond AS b ON c.bond_id = b.bond_id WHERE (c.atom_id = 'TR004_8' AND c.atom_id2 = 'TR004_20')    OR (c.atom_id = 'TR004_20' AND c.atom_id2 = 'TR004_8')
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element != 'sn'
SELECT COUNT(DISTINCT a.atom_id) AS atom_count FROM atom AS a INNER JOIN bond AS b ON a.molecule_id = b.molecule_id WHERE a.element IN ('i', 's') AND b.bond_type = '-'
SELECT connected.atom_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#'
SELECT DISTINCT connected.atom_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE molecule.molecule_id = 'TR181'
SELECT CAST(COUNT(CASE WHEN a.element = 'f' THEN 1 END) AS REAL) * 100.0 / COUNT(m.molecule_id) AS percentage_with_f FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  WHERE m.label = '+'
SELECT CAST(COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) AS REAL) * 100.0 / COUNT(b.bond_id)  FROM bond b INNER JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3
SELECT DISTINCT connected.atom_id FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.molecule_id = 'TR001' AND bond.bond_id = 'TR001_2_6'
SELECT      SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) -      SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END) AS difference FROM      molecule
SELECT connected.atom_id FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR000_2_5'
SELECT bond.bond_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id2 = 'TR000_2'
SELECT      molecule.label FROM      bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE      bond.bond_type = '=' ORDER BY      molecule.label LIMIT 5
SELECT CAST(COUNT(CASE WHEN bond.bond_type = '=' THEN 1 ELSE NULL END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM bond WHERE bond.molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percent FROM molecule
SELECT CAST(SUM(CASE WHEN a.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(a.atom_id) AS percentage FROM atom a WHERE a.molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT      atom.element,      molecule.label FROM      molecule INNER JOIN      atom ON molecule.molecule_id = atom.molecule_id WHERE      molecule.molecule_id = 'TR060'
SELECT      b.bond_type,      m.label FROM      bond AS b INNER JOIN      molecule AS m  ON      b.molecule_id = m.molecule_id WHERE      b.molecule_id = 'TR010' GROUP BY      b.bond_type, m.label ORDER BY      COUNT(b.bond_type) DESC LIMIT 1
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-' ORDER BY molecule.molecule_id ASC LIMIT 3
SELECT bond.bond_id FROM bond WHERE bond.molecule_id = 'TR006' ORDER BY bond.bond_id ASC LIMIT 2
SELECT COUNT(*) FROM connected AS cn JOIN bond AS b ON cn.bond_id = b.bond_id JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR009' AND (cn.atom_id = 'TR009_12' OR cn.atom_id2 = 'TR009_12')
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'br'
SELECT      b.bond_type,      c.atom_id AS atom1,      c.atom_id2 AS atom2 FROM      bond b INNER JOIN      connected c ON      b.bond_id = c.bond_id WHERE      b.bond_id = 'TR001_6_9'
SELECT m.label FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10'
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(connected.bond_id) AS num_connections FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id LIKE 'TR%_19'
SELECT atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR004'
SELECT COUNT(*) AS count FROM molecule WHERE label = '-'
SELECT DISTINCT T2.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25' AND T2.label = '+'
SELECT bond.bond_id FROM atom AS atom1 INNER JOIN connected AS connected1 ON atom1.atom_id = connected1.atom_id INNER JOIN bond ON connected1.bond_id = bond.bond_id WHERE atom1.element = 'p' AND connected1.atom_id2 IN (SELECT atom2.atom_id FROM atom AS atom2 WHERE atom2.element = 'n')
SELECT      m.label FROM      molecule m INNER JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      b.bond_type = '=' GROUP BY      m.molecule_id, m.label ORDER BY      COUNT(*) DESC LIMIT 1
SELECT CAST(COUNT(b.bond_id) AS REAL) / COUNT(DISTINCT a.atom_id) AS average_bonds_per_atom  FROM atom a  INNER JOIN connected c ON a.atom_id = c.atom_id  INNER JOIN bond b ON c.bond_id = b.bond_id  WHERE a.element = 'i'
SELECT bond.bond_type, connected.bond_id FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE SUBSTR(connected.atom_id, 7, 2) + 0 = 45
SELECT      a.element FROM      atom AS a LEFT JOIN      connected AS c ON      a.atom_id = c.atom_id WHERE      c.atom_id IS NULL
SELECT connected.atom_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE molecule.molecule_id = 'TR041' AND bond.bond_type = '#'
SELECT atom.element FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR144_8_19'
SELECT m.label FROM molecule m INNER JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.label ORDER BY COUNT(b.bond_id) DESC LIMIT 1
SELECT atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' GROUP BY atom.element ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT con.atom_id FROM connected con INNER JOIN bond b ON con.bond_id = b.bond_id INNER JOIN atom at ON con.atom_id2 = at.atom_id WHERE at.element = 'pb'
SELECT a.element FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id JOIN atom AS a ON c.atom_id = a.atom_id WHERE b.bond_type = '#'
SELECT (COUNT(CASE WHEN a.element = (SELECT element FROM atom GROUP BY element ORDER BY COUNT(atom_id) DESC LIMIT 1) THEN 1 ELSE NULL END) * 100.0 / COUNT(b.bond_id)) AS percentage FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id
SELECT CAST(SUM(CASE WHEN M.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(B.bond_id) FROM bond AS B INNER JOIN molecule AS M ON B.molecule_id = M.molecule_id WHERE B.bond_type = '-'
SELECT COUNT(*) AS total_atoms FROM atom WHERE element IN ('c', 'h')
SELECT connected.atom_id2 FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 's'
SELECT bond.bond_type FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'sn'
SELECT COUNT(DISTINCT atom.element) AS element_count FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '-'
SELECT COUNT(DISTINCT T1.atom_id) AS total_atoms FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN molecule AS T3 ON T2.molecule_id = T3.molecule_id WHERE T1.element IN ('p', 'br') AND T2.bond_type = '#'
SELECT bond.bond_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+'
SELECT DISTINCT m.molecule_id FROM molecule AS m INNER JOIN bond AS b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-'
SELECT      (SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage  FROM      atom  INNER JOIN      bond ON      atom.molecule_id = bond.molecule_id  WHERE      bond.bond_type = '-'
SELECT label  FROM molecule  WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) AS total_carcinogenic_molecules FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030'
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050' AND bond_type = '-' UNION SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050' AND bond_type = ' - ' UNION SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050' AND bond_type = '#'
SELECT atom.element FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR001_10_11'
SELECT COUNT(b.bond_id) FROM bond AS b JOIN atom AS a ON b.molecule_id = a.molecule_id WHERE a.element = 'i'
SELECT MAX(label) AS most_common_label FROM (      SELECT label      FROM atom      JOIN molecule ON atom.molecule_id = molecule.molecule_id      WHERE element = 'ca'      GROUP BY label  ) AS subquery
SELECT bond.bond_id FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR001_1_8' AND atom.element = 'cl' UNION SELECT bond.bond_id FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR001_1_8' AND atom.element = 'c'
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 'c' AND bond.bond_type = '#' AND molecule.label = '-' LIMIT 2
SELECT CAST(COUNT(CASE WHEN atom.element = 'cl' THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS percentage  FROM molecule  INNER JOIN atom ON molecule.molecule_id = atom.molecule_id  WHERE molecule.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT bond.molecule_id FROM bond WHERE bond.bond_type = ' = '
SELECT connected.atom_id AS first_atom_id, connected.atom_id2 AS second_atom_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#'
SELECT DISTINCT atom.element FROM bond JOIN connected ON bond.bond_id = connected.bond_id JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR000_1_2'
SELECT COUNT(T2.molecule_id) AS single_bond_count FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'
SELECT molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_id = 'TR001_10_11'
SELECT bond.bond_id, molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND (molecule.label = '+' OR molecule.label = '-')
SELECT COUNT(*) AS atom_count FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND SUBSTR(T2.atom_id, 7, 1) = '4'
SELECT      COUNT(CASE WHEN a.element = 'h' THEN 1 ELSE NULL END) * 1.0 / COUNT(*) AS hydrogen_ratio,      m.label FROM      molecule m INNER JOIN      atom a ON      m.molecule_id = a.molecule_id WHERE      m.molecule_id = 'TR006' GROUP BY      m.label
SELECT m.label FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.element = 'ca'
SELECT bond.bond_type FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'c'
SELECT DISTINCT atom.element FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR001_10_11'
SELECT CAST(COUNT(CASE WHEN b.bond_type = '#' THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM molecule m LEFT JOIN bond b ON m.molecule_id = b.molecule_id
SELECT CAST(SUM(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(bond.bond_id) AS percent_double_bonds FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR047'
SELECT m.label FROM atom AS a INNER JOIN molecule AS m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_1'
SELECT label FROM molecule WHERE molecule_id = 'TR151'
SELECT element FROM atom WHERE molecule_id = 'TR151' AND element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT T2.atom_id FROM atom AS T2 JOIN molecule AS T1 ON T2.molecule_id = T1.molecule_id WHERE T1.molecule_id BETWEEN 'TR010' AND 'TR050' AND T2.element = 'c'
SELECT COUNT(atom.atom_id) AS count_of_atoms FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '='
SELECT COUNT(*) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'h'
SELECT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_id = 'TR000_1_2' AND T3.atom_id = 'TR000_1'
SELECT atom.atom_id FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.label = '-'
SELECT CAST(SUM(CASE WHEN T2.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT label FROM molecule WHERE molecule_id = 'TR124'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT a.element FROM connected AS c INNER JOIN atom AS a ON c.atom_id = a.atom_id WHERE c.bond_id = 'TR001_2_4'
SELECT COUNT(b.bond_id) AS double_bond_count, m.label AS molecule_label FROM bond b JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' AND m.molecule_id = 'TR006' GROUP BY m.label
SELECT      m.label,      a.element FROM      molecule AS m INNER JOIN      atom AS a ON      m.molecule_id = a.molecule_id WHERE      m.label = '+'
SELECT bond.bond_id, connected.atom_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-'
SELECT DISTINCT a.element FROM bond b INNER JOIN atom a ON b.molecule_id = a.molecule_id WHERE b.bond_type = '#'
SELECT DISTINCT T1.element FROM atom AS T1 JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.bond_id = 'TR000_2_3'
SELECT COUNT(T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'cl'
SELECT      atom.atom_id,      COUNT(DISTINCT bond.bond_type) AS bond_count FROM      bond INNER JOIN      atom  ON      bond.molecule_id = atom.molecule_id WHERE      bond.molecule_id = 'TR346' GROUP BY      atom.atom_id
SELECT COUNT(*) AS total_molecules_with_double_bond FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.label = '+'
SELECT COUNT(*) AS result FROM atom AS a INNER JOIN bond AS b ON a.molecule_id = b.molecule_id WHERE a.element != 's' AND b.bond_type != ' = '
SELECT molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_id = 'TR001_2_4'
SELECT COUNT(*)  FROM atom  WHERE molecule_id = 'TR001'
SELECT COUNT(*) AS single_bond_count FROM bond WHERE bond_type = '-'
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'cl' AND molecule.label = '+'
SELECT DISTINCT T2.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T1.label = '+' AND T2.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.molecule_id) AS percentage FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT molecule_id  FROM bond  WHERE bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT a.element) AS num_elements FROM bond AS b INNER JOIN connected AS c ON b.bond_id = c.bond_id INNER JOIN atom AS a ON c.atom_id = a.atom_id WHERE b.bond_id = 'TR001_3_4'
SELECT bond.bond_type FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2'
SELECT      atom.molecule_id  FROM      atom INNER JOIN      connected  ON      atom.atom_id = connected.atom_id INNER JOIN      bond  ON      connected.bond_id = bond.bond_id WHERE      atom.atom_id = 'TR000_2'      AND connected.atom_id2 = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT CAST(SUM(CASE WHEN b.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM bond AS b INNER JOIN connected AS c ON b.bond_id = c.bond_id INNER JOIN atom AS a ON c.atom_id = a.atom_id
SELECT COUNT(*) AS count FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'n' AND molecule.label = '+'
SELECT DISTINCT T4.molecule_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id INNER JOIN molecule AS T4 ON T3.molecule_id = T4.molecule_id WHERE T1.element = 's' AND T3.bond_type = '='
SELECT m.molecule_id FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(a.atom_id) > 5
SELECT DISTINCT a.element FROM bond AS b INNER JOIN atom AS a ON b.molecule_id = a.molecule_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024'
SELECT      m.molecule_id FROM      molecule m INNER JOIN      atom a ON      m.molecule_id = a.molecule_id WHERE      m.label = '+' GROUP BY      m.molecule_id ORDER BY      COUNT(a.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN m.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(m.molecule_id)  FROM molecule m  JOIN atom a ON m.molecule_id = a.molecule_id  JOIN bond b ON a.molecule_id = b.molecule_id  WHERE a.element = 'h'  AND b.bond_type = '#'
SELECT COUNT(molecule_id) AS num_carcinogenic_molecules FROM molecule WHERE label = '+'
SELECT COUNT(*) AS count FROM bond AS b INNER JOIN molecule AS m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '-' AND m.molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.molecule_id = 'TR008'
SELECT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-'
SELECT COUNT(DISTINCT a.molecule_id) AS total_molecules FROM atom AS a INNER JOIN bond AS b ON a.molecule_id = b.molecule_id WHERE a.element = 'o' AND b.bond_type = '='
SELECT COUNT(m.molecule_id) FROM molecule m INNER JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '#'
SELECT atom.element, bond.bond_type FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR002'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id WHERE T1.element = 'c' AND T2.bond_type = '=' AND T2.molecule_id = 'TR012'
SELECT atom.atom_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT asciiName FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL AND cardKingdomFoilId != cardKingdomId
SELECT name FROM cards WHERE faceConvertedManaCost = ( SELECT MAX(faceConvertedManaCost) FROM cards )
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100
SELECT      cards.name FROM      cards INNER JOIN      legalities  ON      cards.uuid = legalities.uuid WHERE      cards.rarity = 'mythic'     AND legalities.format = 'gladiator'     AND legalities.status = 'Banned'
SELECT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage'
SELECT      cards.id,      cards.artist FROM      cards INNER JOIN      legalities  ON      cards.uuid = legalities.uuid WHERE      (cards.power = '*' OR cards.power IS NULL)     AND legalities.format = 'commander'     AND legalities.status = 'Legal'
SELECT cards.id, rulings.text AS ruling_text, cards.hasContentWarning AS has_content_warning FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.artist = 'Stephen Daniele'
SELECT r.text FROM cards AS c JOIN rulings AS r ON c.uuid = r.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'
SELECT      c.name,      c.artist,      c.isPromo FROM      cards c INNER JOIN      rulings r  ON      c.uuid = r.uuid WHERE      c.isPromo = 1 GROUP BY      c.id, c.artist, c.isPromo ORDER BY      COUNT(r.id) DESC LIMIT 1
SELECT foreign_data.`language` FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Annul' AND cards.number = '29'
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN st.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM set_translations st INNER JOIN sets s ON st.setCode = s.code
SELECT s.code AS setCode, s.totalSetSize FROM set_translations st INNER JOIN sets s ON st.setCode = s.code WHERE st.language = 'Italian'
SELECT COUNT(DISTINCT type)  FROM cards  WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(id) FROM cards WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT T2.language FROM cards AS T1 INNER JOIN sets AS T3 ON T1.setCode = T3.code INNER JOIN set_translations AS T2 ON T3.code = T2.setCode WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(*) AS count FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Restricted' AND T2.isTextless = 0
SELECT rulings.text FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Condemn'
SELECT COUNT(*) AS card_count FROM legalities AS L INNER JOIN cards AS C ON L.uuid = C.uuid WHERE L.status = 'Restricted' AND C.isStarter = 1
SELECT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Benalish Knight'
SELECT cards.artist FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Phyrexian'
SELECT CAST(SUM(CASE WHEN c.borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage_borderless_cards  FROM cards c
SELECT COUNT(*) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isReprint = 1 AND T2.language = 'German'
SELECT COUNT(*) AS total_borderless_cards FROM cards AS c INNER JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.borderColor = 'borderless' AND fd.language = 'Russian'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.id) AS percentage FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1
SELECT COUNT(*)  FROM cards  WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0
SELECT layout FROM cards WHERE keywords LIKE '%flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id  FROM cards  WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'
SELECT T1.artist FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T2.uuid = T1.uuid WHERE T2.language = 'Chinese Simplified'
SELECT      cards.name FROM      cards INNER JOIN      foreign_data  ON      cards.uuid = foreign_data.uuid WHERE      cards.availability = 'paper'      AND foreign_data.language = 'Japanese'
SELECT COUNT(*) AS count FROM legalities AS l INNER JOIN cards AS c ON l.uuid = c.uuid WHERE l.status = 'Banned' AND c.borderColor = 'white'
SELECT T2.uuid, T3.language FROM legalities AS T2 INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T2.format = 'legacy'
SELECT rulings.text FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Beacon of Immortality'
SELECT      COUNT(c.id) AS card_count,     l.status FROM      cards c INNER JOIN      legalities l ON      c.uuid = l.uuid WHERE      c.frameVersion = 'future' GROUP BY      l.status
SELECT T2.asciiName, T2.borderColor FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.code = 'OGW'
SELECT      st.translation AS translation,      st.language AS language FROM      cards c INNER JOIN      sets s ON c.setCode = s.code INNER JOIN      set_translations st ON s.code = st.setCode WHERE      c.convertedManaCost = 5      AND s.code = '10E' ORDER BY      st.translation ASC
SELECT cards.name, rulings.date FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf'
SELECT      c.colors,      l.format FROM      cards c INNER JOIN      legalities l  ON      c.uuid = l.uuid WHERE      c.id BETWEEN 1 AND 20
SELECT      c.name AS artwork_name FROM      cards c INNER JOIN      foreign_data fd  ON      c.uuid = fd.uuid WHERE      c.originalType = 'Artifact'     AND c.colors = 'B'     AND fd.language IS NOT NULL
SELECT cards.name FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'uncommon' ORDER BY rulings.date ASC LIMIT 3
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) AS count FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1
SELECT COUNT(*)  FROM cards  WHERE hasContentWarning = 1    AND availability = 'paper'    AND frameVersion = '1993'
SELECT manaCost FROM cards WHERE frameVersion = '2003' AND borderColor = 'black' AND availability = 'mtgo,paper' AND layout = 'normal'
SELECT SUM(convertedManaCost) FROM cards WHERE artist = 'Rob Alexander'
SELECT subtypes, supertypes FROM cards WHERE availability = 'arena'
SELECT setCode FROM set_translations WHERE language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN c.isStorySpotlight = 1 AND c.isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100.0 / SUM(c.isStorySpotlight) AS percentage FROM cards c
SELECT      SUM(CASE WHEN T1.language = 'Spanish' THEN 1 ELSE 0 END) * 100.0 / COUNT(T1.id) AS percentage  FROM      set_translations AS T1  JOIN      cards AS T2 ON T1.setCode = T2.setCode  GROUP BY      T2.name
SELECT set_translations.`language` FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.baseSetSize = 309
SELECT COUNT(*)  FROM set_translations AS s INNER JOIN sets AS t ON s.setCode = t.code WHERE s.language = 'Portuguese (Brasil)'    AND t.block = 'Commander'
SELECT      cards.id FROM      cards INNER JOIN      legalities ON      cards.uuid = legalities.uuid WHERE      cards.type = 'Creature'     AND legalities.status = 'Legal'
SELECT cards.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL
SELECT COUNT(*) AS count FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE (cards.power IS NULL OR cards.power = '*') AND rulings.text LIKE '%triggered ability%'
SELECT COUNT(*) FROM cards AS c INNER JOIN legalities AS l ON c.uuid = l.uuid INNER JOIN rulings AS r ON c.uuid = r.uuid WHERE l.format = 'premodern'   AND r.text = 'This is a triggered mana ability.'   AND c.side IS NULL
SELECT      cards.id FROM      cards INNER JOIN      legalities ON      cards.uuid = legalities.uuid WHERE      cards.artist = 'Erica Yang'     AND cards.availability = 'paper'     AND legalities.format = 'pauper'
SELECT c.artist FROM cards c INNER JOIN foreign_data f ON c.uuid = f.uuid WHERE f.flavorText LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'
SELECT foreign_data.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Matthew D. Wilson' AND cards.borderColor = 'black' AND cards.layout = 'normal' AND foreign_data.language = 'French'
SELECT COUNT(*) FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.rarity = 'rare' AND rulings.date = '2007-02-01'
SELECT set_translations.language  FROM sets  INNER JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.baseSetSize = 180 AND sets.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN T2.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'commander' AND T1.status = 'Legal'
SELECT CAST(SUM(CASE WHEN f.language = 'French' AND (c.power IS NULL OR c.power = '*') THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM cards c INNER JOIN foreign_data f ON c.uuid = f.uuid WHERE f.language = 'French'
SELECT      (COUNT(CASE WHEN st.language = 'Japanese' THEN 1 END) * 100.0) / COUNT(*) AS percentage  FROM      set_translations st  INNER JOIN      sets s ON      st.setCode = s.code  WHERE      s.type = 'expansion'
SELECT availability  FROM cards  WHERE artist = 'Daren Bader'
SELECT COUNT(*)  FROM cards  WHERE borderColor = 'borderless'    AND edhrecRank > 12000
SELECT COUNT(*) AS count_of_cards FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE (power IS NULL OR power = '*') AND promoTypes = 'arenaleague' ORDER BY name ASC LIMIT 3
SELECT `language` FROM foreign_data WHERE `multiverseid` = 149934
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3
SELECT      CAST(COUNT(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS proportion FROM      cards
SELECT number FROM cards WHERE faceName IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3
SELECT st.`language` FROM sets AS s INNER JOIN set_translations AS st ON s.code = st.setCode WHERE s.mcmName = 'Archenemy' AND s.code = 'ARC'
SELECT s.name, COALESCE(st.translation, '') AS translation FROM sets s LEFT JOIN set_translations st ON s.code = st.setCode WHERE s.id = 5
SELECT      s_t.`language`,      s.type  FROM      set_translations AS s_t  INNER JOIN      sets AS s  ON      s.code = s_t.setCode  WHERE      s_t.id = 206
SELECT s.id, s.code FROM set_translations AS t INNER JOIN sets AS s ON t.setCode = s.code WHERE t.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.code ASC LIMIT 2
SELECT T1.id FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.isFoilOnly = 1 AND T2.language = 'Japanese'
SELECT T2.code FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Russian' ORDER BY T2.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 AND T2.`language` = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN set_translations AS T3 ON T1.setCode = T3.setCode WHERE T3.`language` = 'Chinese Simplified'
SELECT COUNT(set_translations.id) FROM set_translations INNER JOIN sets ON set_translations.setCode = sets.code WHERE (set_translations.language = 'Japanese') AND (sets.mtgoCode IS NULL OR sets.mtgoCode = '')
SELECT COUNT(*) FROM cards WHERE borderColor = 'black'
SELECT COUNT(*) FROM cards WHERE frameEffects = 'extendedart'
SELECT asciiName FROM cards WHERE borderColor = 'black' AND isFullArt = 1
SELECT `language`  FROM set_translations  WHERE id = 174
SELECT name FROM sets WHERE code = 'ALL'
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT code  FROM sets  WHERE type = 'expansion'
SELECT name, type FROM cards WHERE watermark = 'boros'
SELECT      foreign_data.`language`,      foreign_data.flavorText,      cards.type FROM      foreign_data INNER JOIN      cards  ON      foreign_data.uuid = cards.uuid WHERE      cards.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN convertedManaCost = 16 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*)  FROM cards WHERE name = 'Abyssal Horror'
SELECT code FROM sets WHERE type = 'commander'
SELECT      cards.name,      cards.type  FROM      cards  INNER JOIN      sets  ON      cards.setCode = sets.code  WHERE      cards.watermark = 'abzan'
SELECT DISTINCT fd.language, c.type FROM cards AS c INNER JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.watermark = 'azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) AS total FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT DISTINCT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE availability LIKE '%arena,mtgo%' AND borderColor = 'black'
SELECT CASE WHEN (SELECT convertedManaCost FROM cards WHERE name = 'Serra Angel') > (SELECT convertedManaCost FROM cards WHERE name = 'Shrine Keeper') THEN 'Serra Angel' ELSE 'Shrine Keeper' END AS HigherManaCost FROM cards
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT      st.translation AS Italian_name_of_set FROM      cards AS c INNER JOIN      set_translations AS st ON      c.setCode = st.setCode WHERE      c.name = 'Ancestor''s Chosen'     AND st.language = 'Italian'
SELECT COUNT(*) FROM set_translations INNER JOIN cards ON set_translations.setCode = cards.setCode WHERE cards.name = 'Angel of Mercy'
SELECT cards.name FROM set_translations INNER JOIN sets ON set_translations.setCode = sets.code INNER JOIN cards ON sets.code = cards.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition'
SELECT EXISTS (     SELECT 1     FROM set_translations AS st     JOIN cards AS c     ON st.setCode = c.setCode     WHERE c.name LIKE '%Ancestor''s Chosen%' AND st.language = 'Korean' ) AS has_korean_translation
SELECT COUNT(*) AS card_count FROM set_translations AS ST  INNER JOIN sets AS S ON ST.setCode = S.code  INNER JOIN cards AS C ON S.code = C.setCode  WHERE ST.translation = 'Hauptset Zehnte Edition'     AND C.artist = 'Adam Rex'
SELECT sets.baseSetSize FROM set_translations INNER JOIN sets ON set_translations.setCode = sets.code WHERE set_translations.translation = 'Hauptset Zehnte Edition'
SELECT      set_translations.translation  FROM      sets INNER JOIN      set_translations  ON      sets.code = set_translations.setCode WHERE      sets.name = 'Eighth Edition'     AND set_translations.language = 'Chinese Simplified'
SELECT CAST(s.mtgoCode IS NOT NULL AS integer)  FROM cards AS c  INNER JOIN sets AS s  ON c.setCode = s.code  WHERE c.name = 'Angel of Mercy'
SELECT sets.releaseDate FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Ancestor''s Chosen'
SELECT sets.type FROM set_translations INNER JOIN sets ON set_translations.setCode = sets.code WHERE set_translations.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) AS count FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Ice Age' AND st.language = 'Italian' AND st.translation IS NOT NULL
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'
SELECT COUNT(s.id) FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian' AND s.baseSetSize < 100
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.borderColor = 'black'
SELECT      cards.name FROM      sets INNER JOIN      cards ON      sets.code = cards.setCode WHERE      sets.name = 'Coldsnap' ORDER BY      cards.convertedManaCost DESC LIMIT 1
SELECT DISTINCT cards.artist FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Coldsnap' AND (cards.artist = 'Jeremy Jarvis' OR cards.artist = 'Aaron Miller' OR cards.artist = 'Chippy')
SELECT      cards.number FROM      cards  INNER JOIN      sets  ON      cards.setCode = sets.code  WHERE      sets.name = 'Coldsnap'      AND cards.number = 4
SELECT COUNT(T1.id) FROM cards AS T1 JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT foreign_data.flavorText FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Italian'
SELECT DISTINCT fd.`language` FROM cards AS c INNER JOIN foreign_data AS fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.flavorText IS NOT NULL
SELECT type FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT      rulings.text FROM      sets INNER JOIN      set_translations ON sets.code = set_translations.setCode INNER JOIN      cards ON sets.code = cards.setCode INNER JOIN      rulings ON cards.uuid = rulings.uuid WHERE      sets.name = 'Coldsnap'      AND set_translations.language = 'Italian'
SELECT T3.name AS ItalianTranslatedName FROM cards AS T3 INNER JOIN set_translations AS T4 ON T3.setCode = T4.setCode INNER JOIN sets AS T2 ON T2.code = T4.setCode WHERE T2.name = 'Coldsnap' AND T4.language = 'Italian' ORDER BY T3.convertedManaCost DESC LIMIT 1
SELECT rulings.date FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Reminisce'
SELECT      CAST(SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM      cards INNER JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap'
SELECT      (SUM(CASE WHEN c.cardKingdomFoilId IS NOT NULL AND c.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM      sets AS s INNER JOIN      cards AS c ON s.code = c.setCode WHERE      s.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT mcmName FROM sets WHERE releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name LIKE 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT      rulings.text,      cards.hasContentWarning FROM      cards INNER JOIN      rulings ON      cards.uuid = rulings.uuid WHERE      cards.artist = 'Jim Pavelec'
SELECT sets.releaseDate FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Evacuation'
SELECT sets.baseSetSize FROM set_translations INNER JOIN sets ON set_translations.setCode = sets.code WHERE set_translations.translation = 'Rinascita di Alara'
SELECT sets.type FROM set_translations INNER JOIN sets ON set_translations.setCode = sets.code WHERE set_translations.translation = 'Huitième édition'
SELECT st.translation FROM cards AS c INNER JOIN set_translations AS st ON c.setCode = st.setCode WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French'
SELECT COUNT(*) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.name = 'Tenth Edition' AND set_translations.translation IS NOT NULL
SELECT set_translations.translation AS Japanese_name  FROM cards  INNER JOIN set_translations  ON cards.setCode = set_translations.setCode  WHERE cards.name = 'Fellwar Stone'    AND set_translations.language = 'Japanese'
SELECT cards.name FROM sets INNER JOIN cards ON sets.code = cards.setCode WHERE sets.name = 'Journey into Nyx Hero''s Path' ORDER BY cards.convertedManaCost DESC LIMIT 1
SELECT sets.releaseDate FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Ola de frío'
SELECT s.type FROM sets AS s INNER JOIN cards AS c ON s.code = c.setCode WHERE c.name = 'Samite Pilgrim'
SELECT COUNT(*) AS card_count FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = 3
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'
SELECT (SUM(CASE WHEN sets.isNonFoilOnly = 1 THEN 1 ELSE 0 END)) * 100.0 / COUNT(*) FROM set_translations INNER JOIN sets ON set_translations.setCode = sets.code WHERE set_translations.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN s.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(s.code) AS percentage_online_only FROM set_translations st INNER JOIN sets s ON st.setCode = s.code WHERE st.language = 'Portuguese (Brazil)'
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(frameEffects) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT      c.name FROM      cards c INNER JOIN      legalities l ON      c.uuid = l.uuid WHERE      l.format = 'duel' ORDER BY      c.manaCost DESC LIMIT 10
SELECT      c.originalReleaseDate,      l.format FROM      cards c INNER JOIN      legalities l ON      c.uuid = l.uuid WHERE      c.rarity = 'mythic' ORDER BY      c.originalReleaseDate ASC LIMIT 1
SELECT COUNT(*) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.artist = 'Volkan Baǵa' AND foreign_data.language = 'French'
SELECT COUNT(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'rare' AND cards.types = 'Enchantment' AND cards.name = 'Abundance' AND legalities.status = 'Legal'
SELECT      legalities.format,      cards.name FROM      legalities INNER JOIN      cards  ON      legalities.uuid = cards.uuid WHERE      legalities.status = 'Banned' GROUP BY      legalities.format ORDER BY      COUNT(legalities.status) DESC LIMIT 1
SELECT st.`language` FROM sets AS s INNER JOIN set_translations AS st ON s.code = st.setCode WHERE s.name = 'Battlebond'
SELECT      cards.artist,      legalities.format  FROM      cards  INNER JOIN      legalities  ON      cards.uuid = legalities.uuid  GROUP BY      cards.artist  ORDER BY      COUNT(cards.id) ASC  LIMIT 1
SELECT      legalities.status FROM      cards INNER JOIN      legalities ON      cards.uuid = legalities.uuid WHERE      cards.frameVersion = '1997'     AND cards.artist = 'D. Alexander Gregory'     AND cards.hasContentWarning = 1     AND legalities.format = 'legacy'     AND legalities.status != 'Legal'
SELECT      cards.name,      legalities.format  FROM      cards  INNER JOIN      legalities  ON      cards.uuid = legalities.uuid  WHERE      cards.edhrecRank = 1  AND      legalities.status = 'Banned'
SELECT AVG(sets.id) AS average_sets, MAX(set_translations.language) AS common_language  FROM sets  INNER JOIN set_translations ON sets.code = set_translations.setCode  WHERE sets.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'
SELECT l.uuid FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.format = 'oldschool' AND (l.status = 'Banned' OR l.status = 'Restricted')
SELECT COUNT(*) AS count FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT      rulings.text FROM      cards INNER JOIN      rulings ON      cards.uuid = rulings.uuid WHERE      cards.artist = 'Kev Walker' ORDER BY      rulings.date DESC
SELECT c.name AS card_name, l.format AS legal_format FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid INNER JOIN sets s ON c.setCode = s.code WHERE s.name = 'Hour of Devastation' AND l.status = 'Legal'
SELECT      sets.name FROM      sets INNER JOIN      set_translations ON sets.code = set_translations.setCode WHERE      set_translations.language = 'Korean'     AND set_translations.language NOT LIKE '%Japanese%'
SELECT frameVersion FROM cards WHERE artist = 'Allen Williams' UNION SELECT l.format FROM legalities l INNER JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned'
SELECT      CASE          WHEN u1.Reputation > u2.Reputation THEN 'Harlan'         ELSE 'Jarrod Dixon'     END AS UserWithHigherReputation FROM      users u1 CROSS JOIN      users u2 WHERE      u1.DisplayName = 'Harlan'      AND u2.DisplayName = 'Jarrod Dixon' ORDER BY      u1.Reputation DESC LIMIT 1
SELECT      DisplayName  FROM      users  WHERE      strftime('%Y', CreationDate) = '2011'
SELECT COUNT(*) AS user_count FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE UpVotes > 100 AND DownVotes > 1
SELECT COUNT(*) AS count FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'
SELECT COUNT(*)  FROM posts AS P INNER JOIN users AS U ON P.OwnerUserId = U.Id WHERE U.DisplayName = 'csgillespie'
SELECT p.Title FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT u.DisplayName FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title LIKE 'Eliciting priors from experts%'
SELECT p.Title FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1
SELECT      users.DisplayName  FROM      posts INNER JOIN users ON posts.OwnerUserId = users.Id ORDER BY      posts.FavoriteCount DESC LIMIT 1
SELECT SUM(posts.CommentCount) AS TotalComments FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'
SELECT p.AnswerCount FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1
SELECT      users.DisplayName FROM      posts INNER JOIN      users ON      posts.LastEditorUserId = users.Id WHERE      posts.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) AS root_post_count FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId WHERE p.ParentId IS NULL AND u.DisplayName = 'csgillespie'
SELECT users.DisplayName FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.ClosedDate IS NOT NULL
SELECT COUNT(p.Id) FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.Age > 65 AND p.Score >= 20
SELECT      users.Location FROM      posts INNER JOIN      users ON      posts.OwnerUserId = users.Id WHERE      posts.Title = 'Eliciting priors from experts'
SELECT posts.Body FROM tags INNER JOIN posts ON tags.ExcerptPostId = posts.Id WHERE tags.TagName = 'bayesian'
SELECT Body FROM posts WHERE Id = (     SELECT ExcerptPostId     FROM tags     WHERE `Count` = (         SELECT MAX(`Count`)         FROM tags     ) )
SELECT COUNT(*) AS TotalBadges FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'csgillespie'
SELECT COUNT(b.Id) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie' AND strftime('%Y', b.Date) = '2011'
SELECT      users.DisplayName FROM      badges JOIN      users ON badges.UserId = users.Id GROUP BY      badges.UserId ORDER BY      COUNT(badges.Id) DESC LIMIT 1
SELECT AVG(p.Score) AS average_score FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT AVG(badge_count) AS average_badges_per_user FROM ( SELECT T1.Id, COUNT(T2.Id) AS badge_count FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Views > 200 GROUP BY T1.Id ) AS subquery
SELECT CAST(SUM(CASE WHEN users.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(posts.Id) AS Percentage FROM posts  INNER JOIN users ON posts.OwnerUserId = users.Id  WHERE posts.Score > 5
SELECT COUNT(*) AS VoteCount FROM Votes WHERE UserId = 58 AND CreationDate BETWEEN '2010-07-19' AND '2010-07-19'
SELECT CreationDate FROM votes GROUP BY PostId ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(*)  FROM badges  WHERE Name = 'Revival'
SELECT      posts.Title FROM      posts INNER JOIN      comments ON posts.Id = comments.PostId ORDER BY      comments.Score DESC LIMIT 1
SELECT COUNT(c.Id) AS CommentCount FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount = 1910
SELECT p.FavoriteCount FROM comments AS c INNER JOIN posts AS p ON c.PostId = p.Id WHERE c.CreationDate = '2014-04-23 20:29:39.0' AND c.UserId = 3025
SELECT comments.Text FROM posts JOIN comments ON posts.Id = comments.PostId WHERE posts.ParentId = 107829 GROUP BY comments.PostId HAVING COUNT(comments.Id) = 1
SELECT CASE WHEN posts.ClosedDate IS NULL THEN 'Yes' ELSE 'No' END AS is_well_finished FROM comments INNER JOIN posts ON comments.PostId = posts.Id WHERE comments.UserId = 23853 AND comments.CreationDate = '2013-07-12 09:08:18.0'
SELECT users.Reputation FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Id = 65041
SELECT COUNT(posts.Id) AS PostCount FROM users JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Tiago Pasqualini'
SELECT users.DisplayName FROM users INNER JOIN votes ON users.Id = votes.UserId WHERE votes.Id = 6347
SELECT COUNT(votes.Id) AS NumberOfVotes FROM posts INNER JOIN votes ON posts.Id = votes.PostId WHERE posts.Title LIKE '%data visualization%'
SELECT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT (COUNT(p.Id) * 1.0) / COUNT(v.Id) AS TimesOfPostThanVotes FROM posts p LEFT JOIN votes v ON p.Id = v.PostId WHERE p.OwnerUserId = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'SilentGhost'
SELECT users.DisplayName FROM comments INNER JOIN users ON comments.UserId = users.Id WHERE comments.Text = 'thank you user93!'
SELECT      comments.Text FROM      users INNER JOIN      comments ON      users.Id = comments.UserId WHERE      users.DisplayName = 'A Lion'
SELECT      users.DisplayName,      users.Reputation FROM      posts INNER JOIN      users ON      posts.OwnerUserId = users.Id WHERE      posts.Title = 'Understanding what Dassault iSight is doing?'
SELECT Text  FROM comments  WHERE PostId = (SELECT Id FROM posts WHERE Title = 'How does gentle boosting differ from AdaBoost?')
SELECT      u.DisplayName FROM      badges AS b INNER JOIN      users AS u ON      b.UserId = u.Id WHERE      b.Name = 'Necromancer' LIMIT 10
SELECT users.DisplayName FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Title = 'Open source tools for visualizing multi-dimensional data?'
SELECT posts.Title FROM users INNER JOIN posts ON users.Id = posts.LastEditorUserId WHERE users.DisplayName = 'Vebjorn Ljosa'
SELECT      SUM(p.Score) AS TotalScore,     u.WebsiteUrl FROM      users u INNER JOIN      posts p ON      u.Id = p.LastEditorUserId WHERE      u.DisplayName = 'Yevgeny'
SELECT c.Text FROM posts p  INNER JOIN postHistory ph ON p.Id = ph.PostId  INNER JOIN comments c ON ph.PostId = c.PostId  WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%'
SELECT DISTINCT u.DisplayName FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id INNER JOIN users AS u ON v.UserId = u.Id WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT      AVG(posts.ViewCount) AS AverageViewCount,     posts.Title,     comments.Text FROM      tags INNER JOIN      posts ON tags.Id = posts.PostTypeId INNER JOIN      comments ON posts.Id = comments.PostId WHERE      tags.TagName = '<humor>'
SELECT COUNT(*) AS comment_count FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(DISTINCT b.UserId) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND STRFTIME('%Y', b.Date) = '2011'
SELECT COUNT(*) AS user_count FROM (     SELECT UserId     FROM badges     GROUP BY UserId     HAVING COUNT(*) > 5 ) AS subquery
SELECT COUNT(*) FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'New York' AND b.Name IN ('Teacher', 'Supporter')
SELECT users.Reputation FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Id = 1
SELECT u.Id FROM users u INNER JOIN postHistory ph ON u.Id = ph.UserId GROUP BY u.Id, ph.PostId HAVING COUNT(ph.Id) = 1 AND u.Views >= 1000
SELECT b.Name FROM comments AS c INNER JOIN badges AS b ON c.UserId = b.UserId WHERE c.UserId = ( SELECT UserId FROM comments GROUP BY UserId ORDER BY COUNT(Id) DESC LIMIT 1 )
SELECT COUNT(*)  FROM users AS u INNER JOIN badges AS b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'
SELECT CAST(SUM(CASE WHEN strftime('%Y', `Date`) = '2010' THEN 1 ELSE 0 END) AS REAL) * 100.0 / SUM(CASE WHEN strftime('%Y', `Date`) = '2011' THEN 1 ELSE 0 END) AS percentage_difference FROM badges WHERE Name = 'Student'
SELECT      ph.PostHistoryTypeId,      COUNT(DISTINCT c.UserId) AS CommentCount FROM      postHistory AS ph INNER JOIN      comments AS c ON      ph.PostId = c.PostId WHERE      ph.PostId = 3720 GROUP BY      ph.PostHistoryTypeId
SELECT posts.ViewCount FROM postLinks INNER JOIN posts ON postLinks.PostId = posts.Id WHERE postLinks.RelatedPostId = 61217
SELECT      p.Score,      pl.LinkTypeId FROM      posts p INNER JOIN      postLinks pl ON      p.Id = pl.PostId WHERE      p.Id = 395
SELECT Id AS post_id, OwnerUserId AS user_id FROM posts WHERE Score > 60
SELECT SUM(FavoriteCount) AS FavoriteCount FROM posts WHERE OwnerUserId = 686   AND SUBSTR(CreationDate, 1, 4) = '2011'
SELECT CAST(SUM(u.UpVotes) AS REAL) / COUNT(u.Id) AS AverageUpVotes, CAST(SUM(u.Age) AS REAL) / COUNT(u.Id) AS AverageAge FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId GROUP BY u.Id HAVING COUNT(p.Id) > 10
SELECT COUNT(*) AS BadgeCount FROM badges WHERE Name = 'Announcer'
SELECT badges.Name FROM badges WHERE badges.Date = '2010-07-19 19:39:08.0'
SELECT COUNT(*) AS PositiveCommentCount FROM comments WHERE Score > 60
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id)  FROM posts  WHERE Score = 10
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT T2.Reputation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'Pierre'
SELECT badges.Date FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.Location = 'Rochester, NY'
SELECT (COUNT(CASE WHEN b.Name = 'Teacher' THEN b.UserId END)) * 100.0 / COUNT(u.Id) AS TeacherPercentage FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id
SELECT      CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(b.Id) AS TeenagerPercentage FROM      badges b INNER JOIN      users u ON      b.UserId = u.Id WHERE      b.Name = 'Organizer'
SELECT Score FROM comments WHERE CreationDate LIKE '2010-07-19 19:19:56.0%'
SELECT      comments.Text  FROM      comments  INNER JOIN      posts  ON      comments.PostId = posts.Id  WHERE      comments.CreationDate = '2010-07-19 19:37:33.0'
SELECT users.Age FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.Location = 'Vienna, Austria'
SELECT COUNT(*) AS AdultCount FROM badges AS B INNER JOIN users AS U ON B.UserId = U.Id WHERE B.Name = 'Supporter' AND U.Age BETWEEN 19 AND 65
SELECT SUM(u.Views) AS TotalViews FROM badges b INNER JOIN users u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MIN(Reputation) FROM users)
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Sharpie'
SELECT COUNT(*) AS NumberOfElders FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Supporter' AND T2.Age > 65
SELECT DisplayName  FROM users  WHERE Id = 30
SELECT COUNT(*) AS NumberOfUsers FROM users WHERE Location = 'New York'
SELECT COUNT(Id) FROM votes WHERE substr(CreationDate, 1, 4) = '2010'
SELECT COUNT(Id)  FROM users  WHERE Age BETWEEN 19 AND 65
SELECT Displayname FROM users WHERE Views = (SELECT MAX(views) FROM users)
SELECT CAST(COUNT(CASE WHEN substr(CreationDate, 1, 4) = '2010' THEN 1 END) AS REAL) /       CAST(COUNT(CASE WHEN substr(CreationDate, 1, 4) = '2011' THEN 1 END) AS REAL) AS       ratio_2010_2011 FROM votes
SELECT tags.TagName FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId INNER JOIN tags ON posts.PostTypeId = tags.Id WHERE users.DisplayName = 'John Salvatier'
SELECT COUNT(*) AS PostCount FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Daniel Vassallo'
SELECT COUNT(Votes.Id) FROM users INNER JOIN votes ON users.Id = votes.UserId WHERE users.DisplayName = 'Harlan'
SELECT posts.Id FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'slashnick' ORDER BY posts.AnswerCount DESC LIMIT 1
SELECT p.Id AS PostId FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY p.Id ORDER BY SUM(p.ViewCount) DESC LIMIT 1
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T3.DisplayName = 'Matt Parker'   AND T2.PostId > 4
SELECT COUNT(*) AS NegativeCommentCount FROM users AS u INNER JOIN comments AS c ON u.Id = c.UserId WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60
SELECT DISTINCT tags.TagName FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId INNER JOIN tags ON posts.Id = tags.Id WHERE users.DisplayName = 'Mark Meckes' AND posts.CommentCount = 0
SELECT users.DisplayName FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN tags.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(posts.Id) AS percentage FROM posts INNER JOIN tags ON posts.Tags = tags.Id INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Community'
SELECT      SUM(CASE WHEN u.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -      SUM(CASE WHEN u.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END) AS calculation FROM      posts p INNER JOIN      users u ON      p.OwnerUserId = u.Id
SELECT COUNT(DISTINCT b.UserId) FROM badges AS b WHERE b.Name = 'Commentator' AND strftime('%Y', b.Date) = '2014'
SELECT COUNT(Id) FROM posts WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59'
SELECT      DisplayName,      Age  FROM      users ORDER BY      Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*)  FROM comments  WHERE UserId = 13 AND Score < 60
SELECT posts.Title, comments.UserDisplayName FROM posts INNER JOIN comments ON posts.Id = comments.PostId WHERE comments.Score > 60
SELECT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.Location = 'North Pole'   AND STRFTIME('%Y', badges.Date) = '2011'
SELECT users.DisplayName, users.WebsiteUrl FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.FavoriteCount > 150
SELECT      COUNT(ph.Id) AS PostHistoryCount,      MAX(ph.CreationDate) AS LastEditDate FROM      posts p INNER JOIN      postHistory ph ON      p.Id = ph.PostId WHERE      p.Title = 'What is the best introductory Bayesian statistics textbook?'
SELECT      users.LastAccessDate,      users.Location FROM      users INNER JOIN      badges ON users.Id = badges.UserId WHERE      badges.Name = 'outliers'
SELECT posts.Title AS RelatedPostTitle FROM posts INNER JOIN postLinks ON posts.Id = postLinks.PostId WHERE posts.Title = 'How to tell if something happened in a data set which monitors a value over time'
SELECT      postHistory.PostId,      badges.Name FROM      users INNER JOIN      postHistory ON users.Id = postHistory.UserId INNER JOIN      badges ON users.Id = badges.UserId WHERE      users.DisplayName = 'Samuel'     AND postHistory.CreationDate BETWEEN '2013-01-01' AND '2013-12-31'     AND badges.Date BETWEEN '2013-01-01' AND '2013-12-31'
SELECT      users.DisplayName  FROM      posts  INNER JOIN      users  ON      posts.OwnerUserId = users.Id  ORDER BY      posts.ViewCount DESC  LIMIT 1
SELECT users.DisplayName, users.Location FROM posts INNER JOIN tags ON posts.Id = tags.ExcerptPostId INNER JOIN users ON posts.OwnerUserId = users.Id WHERE tags.TagName = 'hypothesis-testing'
SELECT      p.Title,      pl.LinkTypeId FROM      posts p INNER JOIN      postLinks pl ON      p.Id = pl.PostId WHERE      p.Title = 'What are principal component scores?'
SELECT      u.DisplayName AS ParentDisplayName FROM      posts p INNER JOIN      users u ON p.OwnerUserId = u.Id WHERE      p.ParentId IS NOT NULL ORDER BY      p.Score DESC LIMIT 1
SELECT      users.DisplayName,      users.WebsiteUrl FROM      votes INNER JOIN      users  ON      votes.UserId = users.Id WHERE      votes.VoteTypeId = 8 ORDER BY      votes.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(Id) FROM tags WHERE `Count` BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT Age FROM users ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(*) FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE STRFTIME('%Y', v.CreationDate) = '2011' AND v.BountyAmount = 50
SELECT Id FROM users ORDER BY Age ASC LIMIT 1
SELECT SUM(Score) AS TotalScore FROM posts WHERE LasActivityDate LIKE '2010-07-19%'
SELECT      (CAST(COUNT(pl.Id) AS REAL) / 12) AS AverageMonthlyLinks  FROM      postLinks pl  INNER JOIN      posts p ON pl.PostId = p.Id  WHERE      p.AnswerCount <= 2               AND strftime('%Y', pl.CreationDate) = '2010'
SELECT p.Id AS PostId FROM votes AS v INNER JOIN posts AS p ON v.PostId = p.Id WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT      p.Title FROM posts p JOIN postLinks pl ON p.Id = pl.PostId WHERE pl.CreationDate = (SELECT MIN(CreationDate) FROM postLinks) LIMIT 1
SELECT      u.DisplayName FROM      badges b INNER JOIN      users u ON b.UserId = u.Id GROUP BY      b.UserId, u.DisplayName ORDER BY      COUNT(b.Id) DESC LIMIT 1
SELECT MIN(v.CreationDate) AS FirstVoteDate FROM users u INNER JOIN votes v ON u.Id = v.UserId WHERE u.DisplayName = 'chl'
SELECT MIN(posts.CreaionDate) AS FirstPostCreationDate FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.Id = (     SELECT MIN(users.Id)      FROM users )
SELECT u.DisplayName FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Autobiographer' ORDER BY b.Date ASC LIMIT 1
SELECT COUNT(DISTINCT u.Id) FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4
SELECT AVG(v.PostId) AS AvgPosts FROM users u INNER JOIN votes v ON u.Id = v.UserId WHERE u.Age = (SELECT MAX(Age) FROM users)
SELECT      DisplayName FROM      users ORDER BY      Reputation DESC LIMIT 1
SELECT COUNT(*) AS Count FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(*) FROM users AS u INNER JOIN posts AS p ON u.Id = p.OwnerUserId WHERE u.DisplayName = 'Jay Stevens'   AND STRFTIME('%Y', p.CreationDate) = '2010'
SELECT      posts.Id,      posts.Title FROM      posts INNER JOIN      users  ON      posts.OwnerUserId = users.Id WHERE      users.DisplayName = 'Harvey Motulsky' ORDER BY      posts.ViewCount DESC LIMIT 1
SELECT p.Id, p.Title FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score = (SELECT MAX(Score) FROM posts) LIMIT 1
SELECT AVG(posts.Score) AS AverageScore FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Stephen Turner'
SELECT DISTINCT u.DisplayName FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000   AND strftime('%Y', p.CreationDate) = '2011'
SELECT      posts.Id AS PostId,     users.DisplayName AS OwnerDisplayName FROM      posts INNER JOIN      users  ON      posts.OwnerUserId = users.Id WHERE      strftime('%Y', posts.CreationDate) = '2010' ORDER BY      posts.FavoriteCount DESC LIMIT 1
SELECT      CAST(SUM(CASE WHEN u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(p.Id) AS percentage FROM      posts p INNER JOIN      users u ON p.OwnerUserId = u.Id WHERE      u.CreationDate LIKE '2011-%'
SELECT      CAST(COUNT(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM      users u
SELECT SUM(p.ViewCount) AS TotalViews, u.DisplayName AS LastPostedBy FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Computer Game Datasets' ORDER BY p.LasActivityDate DESC LIMIT 1
SELECT COUNT(*)  FROM posts  WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(c.Id) AS CommentCount FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.Score = (SELECT MAX(Score) FROM posts)
SELECT COUNT(*) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT users.DisplayName, users.Location FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Id = 183 ORDER BY posts.LastEditDate DESC LIMIT 1
SELECT badges.Name FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Emmett' ORDER BY badges.Date DESC LIMIT 1
SELECT COUNT(Id) AS AdultUsersCount FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000
SELECT      SUM(julianday(badges.`Date`) - julianday(users.CreationDate)) AS total_time_difference FROM      badges INNER JOIN      users ON badges.UserId = users.Id WHERE      users.DisplayName = 'Zolomon'
SELECT      users.Id AS userId,     COUNT(postHistory.Id) AS postCount,     COUNT(comments.Id) AS commentCount FROM      users LEFT JOIN      postHistory ON users.Id = postHistory.UserId LEFT JOIN      comments ON users.Id = comments.UserId WHERE      users.Id = (SELECT Id FROM users ORDER BY CreationDate DESC LIMIT 1) GROUP BY      users.Id
SELECT      comments.Text,      users.DisplayName  FROM      comments  INNER JOIN      posts ON comments.PostId = posts.Id  INNER JOIN      users ON comments.UserId = users.Id  WHERE      posts.Title = 'Analysing wind data with R'  ORDER BY      comments.CreationDate DESC  LIMIT 10
SELECT COUNT(DISTINCT UserId) AS NumberOfUsers FROM badges WHERE Name = 'Citizen Patrol'
SELECT COUNT(*) AS post_count FROM posts p INNER JOIN tags t ON p.Tags LIKE '%' || t.TagName || '%' WHERE t.TagName = 'careers'
SELECT Reputation, Views FROM users WHERE Displayname = 'Jarrod Dixon'
SELECT COUNT(c.Id) AS CommentCount, p.AnswerCount FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.Title LIKE 'Clustering 1D data%'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(*)  FROM votes  WHERE BountyAmount >= 30
SELECT CAST(SUM(CASE WHEN p.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS Percentage FROM    posts p JOIN    users u ON p.OwnerUserId = u.Id WHERE    u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(*) AS NumberOfPosts FROM posts WHERE Score < 20
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count < 20
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT      users.Reputation,      users.UpVotes FROM      comments INNER JOIN      users ON      comments.UserId = users.Id WHERE      comments.Text = 'fine, you win :)'
SELECT c.Text FROM comments AS c INNER JOIN posts AS p ON c.PostId = p.Id WHERE p.Title LIKE '%linear regression%'
SELECT      c.Text FROM      posts p INNER JOIN      comments c ON p.Id = c.PostId WHERE      p.ViewCount BETWEEN 100 AND 150 ORDER BY      c.Score DESC LIMIT 1
SELECT      comments.CreationDate,      users.Age FROM      comments INNER JOIN      users  ON      comments.UserId = users.Id WHERE      comments.Text LIKE '%http://%'
SELECT COUNT(*) FROM comments AS c INNER JOIN posts AS p ON c.PostId = p.Id WHERE c.Score = 0 AND p.ViewCount < 5
SELECT COUNT(*) FROM posts AS p INNER JOIN comments AS c ON p.Id = c.PostId WHERE p.CommentCount = 1 AND c.Score = 0
SELECT COUNT(u.Id) AS TotalUsers FROM comments AS c JOIN users AS u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40
SELECT      posts.Id,      comments.Text FROM      posts INNER JOIN      comments ON posts.Id = comments.PostId WHERE      posts.Title = 'Group differences on a five point Likert item'
SELECT users.UpVotes FROM users INNER JOIN comments ON users.Id = comments.UserId WHERE comments.Text = 'R is also lazy evaluated.'
SELECT comments.Text FROM users INNER JOIN comments ON users.Id = comments.UserId WHERE users.DisplayName = 'Harvey Motulsky'
SELECT users.DisplayName FROM comments INNER JOIN users ON comments.UserId = users.Id WHERE comments.Score BETWEEN 1 AND 5 AND users.DownVotes = 0
SELECT CAST(SUM(CASE WHEN u.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM users u INNER JOIN comments c ON u.Id = c.UserId WHERE c.Score BETWEEN 5 AND 10
SELECT superpower.power_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = '3-D Man'
SELECT COUNT(*) FROM superpower AS sp INNER JOIN hero_power AS hp ON sp.id = hp.power_id WHERE sp.power_name = 'Super Strength'
SELECT COUNT(s.id)  FROM superhero AS s INNER JOIN hero_power AS hp ON s.id = hp.hero_id INNER JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND s.height_cm > 200
SELECT s.full_name FROM superhero s INNER JOIN hero_power hp ON s.id = hp.hero_id GROUP BY s.full_name HAVING COUNT(hp.power_id) > 15
SELECT COUNT(*) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse'
SELECT COUNT(DISTINCT superhero.id) AS count FROM hero_power INNER JOIN superhero ON hero_power.hero_id = superhero.id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superpower.power_name = 'Agility' AND colour.colour = 'Blue'
SELECT s.superhero_name FROM superhero s  INNER JOIN colour c1 ON s.eye_colour_id = c1.id  INNER JOIN colour c2 ON s.hair_colour_id = c2.id  INNER JOIN hero_power hp ON s.id = hp.hero_id  INNER JOIN superpower sp ON hp.power_id = sp.id  WHERE c1.colour = 'Blue'  AND c2.colour = 'Blond'  AND sp.power_name = 'Agility'
SELECT COUNT(s.id) FROM superhero AS s INNER JOIN publisher AS p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'
SELECT superhero.superhero_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron'
SELECT colour.colour AS eye_color FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE publisher.publisher_name = 'Marvel Comics' GROUP BY colour.colour ORDER BY COUNT(*) DESC
SELECT AVG(superhero.height_cm) AS average_height FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT DISTINCT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T3.power_name = 'Super Strength' AND T4.publisher_name = 'Marvel Comics'
SELECT COUNT(s.id) FROM superhero s JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'DC Comics'
SELECT      p.publisher_name FROM      superhero AS su INNER JOIN      hero_attribute AS ha ON su.id = ha.hero_id INNER JOIN      attribute AS a ON ha.attribute_id = a.id INNER JOIN      publisher AS p ON su.publisher_id = p.id WHERE      a.attribute_name = 'Speed' ORDER BY      ha.attribute_value ASC LIMIT 1
SELECT COUNT(T1.id) AS supersheroes_count FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'
SELECT      publisher.publisher_name FROM      superhero INNER JOIN      publisher  ON      superhero.publisher_id = publisher.id WHERE      superhero.superhero_name = 'Blue Beetle II'
SELECT COUNT(*) AS count FROM superhero AS su INNER JOIN colour AS c ON su.hair_colour_id = c.id WHERE c.colour = 'Blond'
SELECT      superhero.superhero_name FROM      superhero INNER JOIN      hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN      attribute ON hero_attribute.attribute_id = attribute.id WHERE      attribute.attribute_name = 'Intelligence' ORDER BY      hero_attribute.attribute_value ASC LIMIT 1
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'Copycat'
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch'
SELECT COUNT(*) AS count FROM superhero AS su  JOIN gender AS g ON su.gender_id = g.id  JOIN hero_attribute AS ha ON su.id = ha.hero_id  JOIN attribute AS a ON ha.attribute_id = a.id  WHERE g.gender = 'Female'    AND a.attribute_name = 'Strength'    AND ha.attribute_value = 100
SELECT      superhero.superhero_name FROM      hero_power INNER JOIN      superhero ON      hero_power.hero_id = superhero.id GROUP BY      superhero.superhero_name ORDER BY      COUNT(hero_power.power_id) DESC LIMIT 1
SELECT COUNT(superhero.id) AS count FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire'
SELECT      CAST(SUM(CASE WHEN a.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(s.id) AS percentage FROM      superhero s INNER JOIN      publisher p ON s.publisher_id = p.id INNER JOIN      alignment a ON s.alignment_id = a.id WHERE      p.publisher_name = 'Marvel Comics'
SELECT SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) -         SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS Number_of_Heroes  FROM publisher AS p  JOIN superhero AS s ON p.id = s.publisher_id
SELECT publisher.id FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Star Trek'
SELECT      AVG(ha.attribute_value) AS average_attribute_value FROM      superhero AS s INNER JOIN      hero_attribute AS ha ON      s.id = ha.hero_id
SELECT COUNT(*) AS count FROM superhero WHERE full_name IS NULL
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Deathlok'
SELECT AVG(superhero.weight_kg) AS average_weight FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female'
SELECT DISTINCT sp.power_name FROM superhero AS s INNER JOIN gender AS g ON s.gender_id = g.id INNER JOIN hero_power AS hp ON s.id = hp.hero_id INNER JOIN superpower AS sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5
SELECT s.superhero_name FROM superhero s INNER JOIN race r ON s.race_id = r.id WHERE r.race = 'Alien'
SELECT T1.superhero_name FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.height_cm BETWEEN 170 AND 190 AND T2.colour = 'No Colour'
SELECT p.power_name FROM hero_power hp INNER JOIN superpower p ON hp.power_id = p.id WHERE hp.hero_id = 56
SELECT      superhero.full_name FROM      superhero INNER JOIN      race ON      superhero.race_id = race.id WHERE      race.race = 'Demi-God' LIMIT 5
SELECT COUNT(*) AS bad_superheroes_count FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Bad'
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169
SELECT colour.colour FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE superhero.height_cm = 185 AND race.race = 'Human'
SELECT      colour.colour FROM      superhero JOIN      colour ON superhero.eye_colour_id = colour.id ORDER BY      superhero.weight_kg DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN p.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(s.id) AS percentage FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id WHERE s.height_cm BETWEEN 150 AND 180
SELECT      superhero.superhero_name FROM      superhero INNER JOIN      gender ON      superhero.gender_id = gender.id WHERE      gender.gender = 'Male'     AND superhero.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero)
SELECT      s.power_name FROM      superpower AS s INNER JOIN      hero_power AS hp ON s.id = hp.power_id GROUP BY      s.power_name ORDER BY      COUNT(hp.hero_id) DESC LIMIT 1
SELECT      hero_attribute.attribute_value FROM      superhero INNER JOIN      hero_attribute ON      superhero.id = hero_attribute.hero_id WHERE      superhero.superhero_name = 'Abomination'
SELECT sp.power_name FROM hero_power hp INNER JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1
SELECT COUNT(hp.hero_id) AS number_of_heroes FROM superpower AS sp JOIN hero_power AS hp ON sp.id = hp.power_id WHERE sp.power_name = 'Stealth'
SELECT      superhero.full_name FROM      superhero INNER JOIN      hero_attribute ON      superhero.id = hero_attribute.hero_id INNER JOIN      attribute ON      hero_attribute.attribute_id = attribute.id WHERE      attribute.attribute_name = 'Strength' ORDER BY      hero_attribute.attribute_value DESC LIMIT 1
SELECT CAST(SUM(s.skin_colour_id = 1) AS REAL) * 1.0 / COUNT(s.id) AS average_skin_colour FROM superhero s
SELECT COUNT(*)  FROM superhero  INNER JOIN publisher ON superhero.publisher_id = publisher.id  WHERE publisher.publisher_name = 'Dark Horse Comics'
SELECT s.superhero_name FROM superhero s INNER JOIN hero_attribute ha ON s.id = ha.hero_id INNER JOIN attribute a ON ha.attribute_id = a.id INNER JOIN publisher p ON s.publisher_id = p.id WHERE a.attribute_name = 'Durability' AND p.publisher_name = 'Dark Horse Comics' ORDER BY ha.attribute_value DESC LIMIT 1
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien'
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight'
SELECT      s.eye_colour_id,      s.hair_colour_id,      s.skin_colour_id FROM      superhero s INNER JOIN      gender g ON s.gender_id = g.id INNER JOIN      publisher p ON s.publisher_id = p.id WHERE      g.gender = 'Female'     AND p.publisher_name = 'Dark Horse Comics'
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s INNER JOIN      publisher p ON      s.publisher_id = p.id WHERE      s.hair_colour_id = s.skin_colour_id     AND s.hair_colour_id = s.eye_colour_id
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(s.id) AS percentage FROM superhero s INNER JOIN colour c ON s.skin_colour_id = c.id INNER JOIN gender g ON s.gender_id = g.id WHERE g.gender = 'Female'
SELECT      superhero.superhero_name,      race.race  FROM      superhero INNER JOIN      race  ON      superhero.race_id = race.id WHERE      superhero.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT      superhero.superhero_name FROM      superhero INNER JOIN      hero_power ON superhero.id = hero_power.hero_id INNER JOIN      superpower ON hero_power.power_id = superpower.id WHERE      superpower.power_name = 'Adaptation'
SELECT COUNT(hp.power_id) AS number_of_powers FROM superhero AS s INNER JOIN hero_power AS hp ON s.id = hp.hero_id WHERE s.superhero_name = 'Amazo'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Hunter Zolomon'
SELECT      superhero.height_cm FROM      superhero INNER JOIN      colour ON      superhero.eye_colour_id = colour.id WHERE      colour.colour = 'Amber'
SELECT superhero.superhero_name FROM superhero JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Black' AND hair_colour.colour = 'Black'
SELECT superhero.eye_colour_id FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Gold'
SELECT superhero.full_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire'
SELECT s.superhero_name FROM superhero AS s INNER JOIN alignment AS a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral'
SELECT COUNT(*) FROM hero_attribute AS ha INNER JOIN attribute AS a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute)
SELECT race.race, alignment.alignment FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(s.id) AS percent FROM superhero s INNER JOIN gender g ON s.gender_id = g.id INNER JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'
SELECT AVG(superhero.weight_kg) AS average_weight FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT      SUM(CASE WHEN superhero.full_name = 'Emil Blonsky' THEN superhero.weight_kg ELSE 0 END) -      SUM(CASE WHEN superhero.full_name = 'Charles Chandler' THEN superhero.weight_kg ELSE 0 END) AS weight_difference FROM      superhero
SELECT AVG(height_cm) AS average_height FROM superhero
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero AS T1 JOIN race AS T2 ON T1.race_id = T2.id JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 21 AND T3.id = 1
SELECT      superhero.superhero_name FROM      superhero INNER JOIN      hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN      attribute ON hero_attribute.attribute_id = attribute.id WHERE      attribute.attribute_name = 'Speed' ORDER BY      hero_attribute.attribute_value DESC LIMIT 1
SELECT COUNT(*)  FROM superhero WHERE alignment_id = 3
SELECT attribute.attribute_name, hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = '3-D Man'
SELECT superhero.superhero_name FROM superhero INNER JOIN colour AS eye_colour ON superhero.eye_colour_id = eye_colour.id INNER JOIN colour AS hair_colour ON superhero.hair_colour_id = hair_colour.id WHERE eye_colour.colour = 'Blue' AND hair_colour.colour = 'Brown'
SELECT DISTINCT p.publisher_name FROM superhero AS s INNER JOIN publisher AS p ON s.publisher_id = p.id WHERE s.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM superhero WHERE publisher_id = 1
SELECT CAST(SUM(CASE WHEN T2.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id
SELECT CAST(SUM(CASE WHEN gender_id = 1 THEN 1 ELSE 0 END) AS REAL) * 1.0 / SUM(CASE WHEN gender_id = 2 THEN 1 ELSE 0 END) AS male_female_ratio FROM superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT sp.id AS power_id FROM superpower AS sp INNER JOIN hero_power AS hp ON sp.id = hp.power_id WHERE sp.power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT      colour.colour FROM      superhero JOIN      colour ON superhero.eye_colour_id = colour.id WHERE      superhero.full_name = 'Karen Beecher-Duncan'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Helen Parr'
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38
SELECT race.race FROM hero_attribute INNER JOIN superhero ON hero_attribute.hero_id = superhero.id INNER JOIN race ON superhero.race_id = race.id ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT      alignment.alignment,      superpower.power_name FROM      superhero INNER JOIN      alignment  ON      superhero.alignment_id = alignment.id INNER JOIN      hero_power  ON      superhero.id = hero_power.hero_id INNER JOIN      superpower  ON      hero_power.power_id = superpower.id WHERE      superhero.superhero_name = 'Atom IV'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5
SELECT AVG(hero_attribute.attribute_value) AS average_attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.alignment_id = 3
SELECT      colour.colour FROM      superhero INNER JOIN      hero_attribute ON      superhero.id = hero_attribute.hero_id INNER JOIN      colour ON      superhero.skin_colour_id = colour.id WHERE      hero_attribute.attribute_value = 100
SELECT COUNT(*)  FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 1 AND T3.id = 2
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN colour ON superhero.hair_colour_id = colour.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE colour.colour = 'Blue' AND gender.gender = 'Male'
SELECT CAST(SUM(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE superhero.alignment_id = 2
SELECT      SUM(CASE WHEN colour.id = 7 THEN 1 ELSE 0 END) -     SUM(CASE WHEN colour.id = 1 THEN 1 ELSE 0 END) AS difference FROM      superhero AS T1 LEFT JOIN      colour AS colour ON      T1.eye_colour_id = colour.id WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL
SELECT      hero_attribute.attribute_value  FROM      superhero INNER JOIN      hero_attribute  ON      superhero.id = hero_attribute.hero_id INNER JOIN      attribute  ON      hero_attribute.attribute_id = attribute.id WHERE      superhero.superhero_name = 'Hulk'      AND attribute.attribute_name = 'Strength'
SELECT sp.power_name FROM superhero AS s INNER JOIN hero_power AS hp ON s.id = hp.hero_id INNER JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T2.colour = 'Green' AND T3.alignment = 'Bad'
SELECT COUNT(*) FROM superhero AS super INNER JOIN gender AS g ON super.gender_id = g.id INNER JOIN publisher AS p ON super.publisher_id = p.id WHERE g.gender = 'Female' AND p.publisher_name = 'Marvel Comics'
SELECT      superhero.superhero_name FROM      superpower INNER JOIN      hero_power ON superpower.id = hero_power.power_id INNER JOIN      superhero ON hero_power.hero_id = superhero.id WHERE      superpower.power_name = 'Wind Control' ORDER BY      superhero.superhero_name
SELECT g.gender FROM superpower AS sp INNER JOIN hero_power AS hp ON sp.id = hp.power_id INNER JOIN superhero AS s ON hp.hero_id = s.id INNER JOIN gender AS g ON s.gender_id = g.id WHERE sp.power_name = 'Phoenix Force'
SELECT      superhero.superhero_name FROM      superhero INNER JOIN      publisher  ON      superhero.publisher_id = publisher.id WHERE      publisher.publisher_name = 'DC Comics' ORDER BY      superhero.weight_kg DESC LIMIT 1
SELECT AVG(superhero.height_cm) AS average_height FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE race.race <> 'Human' AND publisher.publisher_name = 'Dark Horse Comics'
SELECT COUNT(*) FROM attribute INNER JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id INNER JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100
SELECT SUM(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) -         SUM(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id
SELECT      a.attribute_name FROM      superhero s INNER JOIN      hero_attribute ha ON s.id = ha.hero_id INNER JOIN      attribute a ON ha.attribute_id = a.id WHERE      s.superhero_name = 'Black Panther' ORDER BY      ha.attribute_value ASC LIMIT 1
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT      (SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM      superhero s INNER JOIN      publisher pu  ON      s.publisher_id = pu.id INNER JOIN      gender g  ON      s.gender_id = g.id WHERE      pu.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN al.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(s.id) AS good_percentage FROM superhero s  INNER JOIN publisher p ON s.publisher_id = p.id  INNER JOIN alignment al ON s.alignment_id = al.id  WHERE p.publisher_name = 'Marvel Comics'
SELECT COUNT(*)  FROM superhero  WHERE full_name LIKE 'John%'
SELECT T2.id FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id ORDER BY T1.attribute_value ASC LIMIT 1
SELECT full_name  FROM superhero  WHERE superhero_name = 'Alien'
SELECT      superhero.full_name FROM      superhero JOIN      colour  ON      superhero.eye_colour_id = colour.id WHERE      superhero.weight_kg < 100 AND      colour.colour = 'Brown'
SELECT ha.attribute_value FROM superhero AS s INNER JOIN hero_attribute AS ha ON s.id = ha.hero_id WHERE s.superhero_name = 'Aquababy'
SELECT      superhero.weight_kg,      race.race FROM      superhero INNER JOIN      race ON superhero.race_id = race.id WHERE      superhero.id = 40
SELECT AVG(s.height_cm) AS average_height FROM superhero s INNER JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral'
SELECT      superhero.id AS hero_id FROM      superhero INNER JOIN      hero_power ON superhero.id = hero_power.hero_id INNER JOIN      superpower ON hero_power.power_id = superpower.id WHERE      superpower.power_name = 'Intelligence'
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf'
SELECT      sp.power_name FROM      superhero AS su INNER JOIN      hero_power AS hp ON su.id = hp.hero_id INNER JOIN      superpower AS sp ON hp.power_id = sp.id WHERE      su.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT d.driverRef FROM qualifying q INNER JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 20 ORDER BY q.q1 DESC LIMIT 5
SELECT drivers.surname FROM qualifying INNER JOIN races ON qualifying.raceId = races.raceId INNER JOIN drivers ON qualifying.driverId = drivers.driverId WHERE races.raceId = 19 ORDER BY qualifying.q2 ASC LIMIT 1
SELECT races.year FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.location = 'Shanghai'
SELECT races.url FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Circuit de Barcelona-Catalunya'
SELECT races.name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Germany'
SELECT circuits.name FROM constructors INNER JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId INNER JOIN races ON constructorResults.raceId = races.raceId INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE constructors.constructorRef = 'renault'
SELECT COUNT(*) FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.lat != 0 AND (c.country != 'Asia' AND c.country != 'Europe')
SELECT races.name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain'
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Australian Grand Prix'
SELECT races.url FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.circuitRef = 'sepang'
SELECT races.time FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.circuitRef = 'sepang'
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Abu Dhabi Grand Prix'
SELECT c.country FROM constructorResults cr INNER JOIN races r ON cr.raceId = r.raceId INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.raceId = 24 AND cr.points = 1
SELECT q.q1 FROM drivers d INNER JOIN qualifying q ON d.driverId = q.driverId WHERE d.forename = 'Bruno' AND d.surname = 'Senna' AND q.raceId = 354
SELECT      drivers.nationality FROM      qualifying INNER JOIN      drivers ON      qualifying.driverId = drivers.driverId WHERE      qualifying.raceId = 355     AND CAST(REPLACE(qualifying.q2, ':', '') AS integer) = 140
SELECT drivers.number FROM qualifying INNER JOIN drivers ON qualifying.driverId = drivers.driverId WHERE qualifying.raceId = 903 AND qualifying.q3 LIKE '1:54.%'
SELECT COUNT(*) AS drivers_not_finished FROM races AS r INNER JOIN results AS res ON r.raceId = res.raceId WHERE r.name = 'Bahrain Grand Prix' AND r.year = 2007 AND res.time IS NOT NULL
SELECT year FROM races WHERE raceId = 901
SELECT COUNT(DISTINCT r.driverId) AS finished_count FROM results r INNER JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '2015-11-29' AND r.time IS NOT NULL
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = 592 AND results.time IS NOT NULL ORDER BY drivers.dob DESC LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.url FROM races INNER JOIN lapTimes ON races.raceId = lapTimes.raceId INNER JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE races.raceId = 161 AND lapTimes.time LIKE '1:27.0%'
SELECT      d.nationality FROM      results AS r INNER JOIN      drivers AS d ON      r.driverId = d.driverId WHERE      r.raceId = 933 ORDER BY      r.fastestLapSpeed DESC LIMIT 1
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Malaysian Grand Prix'
SELECT constructors.url FROM constructorResults INNER JOIN constructors ON constructorResults.constructorId = constructors.constructorId WHERE constructorResults.raceId = 9 ORDER BY constructorResults.points DESC LIMIT 1
SELECT q.q1 FROM qualifying AS q INNER JOIN drivers AS d ON q.driverId = d.driverId WHERE q.raceId = 345 AND d.forename = 'Lucas' AND d.surname = 'di Grassi'
SELECT DISTINCT d.nationality FROM qualifying AS q INNER JOIN drivers AS d ON q.driverId = d.driverId WHERE q.raceId = 347 AND q.q2 = '0:01:15'
SELECT drivers.code FROM qualifying INNER JOIN races ON qualifying.raceId = races.raceId INNER JOIN drivers ON qualifying.driverId = drivers.driverId WHERE races.raceId = 45 AND qualifying.q3 LIKE '1:33.%'
SELECT r.time FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE d.forename = 'Bruce' AND d.surname = 'McLaren' AND r.raceId = 743
SELECT drivers.forename, drivers.surname FROM results INNER JOIN races ON results.raceId = races.raceId INNER JOIN drivers ON results.driverId = drivers.driverId WHERE races.name = 'San Marino Grand Prix' AND races.year = 2006 AND results.position = 2
SELECT seasons.url FROM races INNER JOIN seasons ON races.year = seasons.year WHERE races.raceId = 901
SELECT COUNT(*) AS not_finishing_drivers FROM races AS r  INNER JOIN results AS res ON r.raceId = res.raceId  WHERE r.year = 2015  AND r.date = '2015-11-29'  AND res.time IS NULL
SELECT      d.forename,      d.surname FROM      races AS r INNER JOIN      results AS res ON r.raceId = res.raceId INNER JOIN      drivers AS d ON res.driverId = d.driverId WHERE      r.raceId = 872 ORDER BY      d.dob DESC LIMIT 1
SELECT      drivers.forename,      drivers.surname FROM      lapTimes INNER JOIN      drivers ON      lapTimes.driverId = drivers.driverId WHERE      lapTimes.raceId = 348 ORDER BY      lapTimes.time ASC LIMIT 1
SELECT drivers.nationality FROM results INNER JOIN drivers ON results.driverId = drivers.driverId ORDER BY results.fastestLapSpeed DESC LIMIT 1
SELECT      (COALESCE(r1.fastestLapSpeed, 0) - COALESCE(r2.fastestLapSpeed, 0)) * 100.0 /      COALESCE(r2.fastestLapSpeed, 0) AS percentage_difference FROM      results r1 JOIN      results r2 ON      r1.raceId = r2.raceId JOIN      drivers d ON      r1.driverId = d.driverId WHERE      d.forename = 'Paul'      AND d.surname = 'di Resta'      AND r1.raceId = 853      AND r2.raceId = 854
SELECT      CAST(COUNT(DISTINCT results.driverId) AS REAL) * 100.0 / COUNT(*) AS completion_rate FROM      races JOIN      results  ON      races.raceId = results.raceId WHERE      races.date = '1983-07-16'
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year ASC LIMIT 1
SELECT      COUNT(*) AS NumberOfRacesIn2005 FROM races WHERE `year` = 2005 ORDER BY name DESC
SELECT name FROM races WHERE date = (     SELECT MIN(date) FROM races )
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1
SELECT `year`  FROM races  GROUP BY `year`  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT name FROM races WHERE year = 2017 AND `year` NOT IN (SELECT `year` FROM seasons WHERE year = 2000)
SELECT      circuits.country,      circuits.name,      circuits.location  FROM      races  INNER JOIN      circuits  ON      races.circuitId = circuits.circuitId  WHERE      races.name = 'European Grand Prix'  ORDER BY      races.year ASC  LIMIT 1
SELECT races.year FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'British Grand Prix' AND circuits.name = 'Brands Hatch' ORDER BY races.year DESC LIMIT 1
SELECT COUNT(r.raceId) AS numberOfSeasons FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'British Grand Prix' AND c.circuitRef = 'silverstone'
SELECT      drivers.forename,      drivers.surname FROM      races INNER JOIN      results ON races.raceId = results.raceId INNER JOIN      drivers ON results.driverId = drivers.driverId WHERE      races.year = 2010      AND races.name = 'Singapore Grand Prix' ORDER BY      results.position
SELECT      drivers.forename,      drivers.surname FROM      results INNER JOIN      drivers  ON      results.driverId = drivers.driverId ORDER BY      results.points DESC LIMIT 1
SELECT      d.forename,      d.surname,      r.points FROM      races AS rsc JOIN      results AS r ON      rsc.raceId = r.raceId JOIN      drivers AS d ON      r.driverId = d.driverId WHERE      rsc.name = 'Chinese Grand Prix'      AND rsc.year = 2017 ORDER BY      r.points DESC LIMIT 3
SELECT      drivers.forename,      drivers.surname,      races.name FROM      lapTimes INNER JOIN      drivers  ON      lapTimes.driverId = drivers.driverId INNER JOIN      races  ON      lapTimes.raceId = races.raceId ORDER BY      lapTimes.milliseconds ASC LIMIT 1
SELECT AVG(l.milliseconds) AS average_lap_time FROM laptimes AS l INNER JOIN drivers AS d ON l.driverId = d.driverId INNER JOIN races AS r ON l.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Malaysian Grand Prix' AND r.year = 2009
SELECT CAST(SUM(CASE WHEN r.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE d.surname = 'Hamilton' AND r.raceId IN (SELECT raceId FROM races WHERE year >= 2010)
SELECT      d.forename,      d.surname,      d.nationality,      MAX(ds.points) AS max_points  FROM      driverStandings ds  INNER JOIN      drivers d ON      ds.driverId = d.driverId  GROUP BY      ds.driverId  ORDER BY      COUNT(ds.wins) DESC  LIMIT 1
SELECT      drivers.forename,      drivers.surname,      (strftime('%Y', 'now') - strftime('%Y', drivers.dob)) AS age FROM      drivers WHERE      drivers.nationality = 'Japanese' ORDER BY      age ASC LIMIT 1
SELECT      c.name AS circuit_name FROM      races r INNER JOIN      circuits c ON      r.circuitId = c.circuitId WHERE      r.date BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY      c.name HAVING      COUNT(r.raceId) = 4
SELECT circuits.name AS circuit_name, circuits.location, races.name AS race_name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2006 AND circuits.country = 'USA'
SELECT      races.name AS race_name,      circuits.name AS circuit_name,      circuits.location FROM      races INNER JOIN      circuits ON      races.circuitId = circuits.circuitId WHERE      strftime('%m %Y', races.date) = '09 2005'
SELECT races.name FROM drivers INNER JOIN results ON drivers.driverId = results.driverId INNER JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20
SELECT COUNT(*) AS win_count FROM drivers d INNER JOIN results r ON d.driverId = r.driverId INNER JOIN races ra ON r.raceId = ra.raceId INNER JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.name = 'Sepang International Circuit'
SELECT r.name AS race_name, r.year FROM drivers d INNER JOIN lapTimes lt ON d.driverId = lt.driverId INNER JOIN races r ON lt.raceId = r.raceId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' ORDER BY lt.milliseconds ASC LIMIT 1
SELECT AVG(ds.points) AS avg_points FROM races r INNER JOIN driverStandings ds ON r.raceId = ds.raceId INNER JOIN drivers d ON ds.driverId = d.driverId WHERE r.year = 2000 AND d.forename = 'Eddie' AND d.surname = 'Irvine'
SELECT      races.year,      results.points FROM      results INNER JOIN      drivers  ON      results.driverId = drivers.driverId INNER JOIN      races  ON      results.raceId = races.raceId WHERE      drivers.forename = 'Lewis'      AND drivers.surname = 'Hamilton' ORDER BY      races.date ASC LIMIT 1
SELECT races.name, circuits.country FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2017 ORDER BY races.date ASC
SELECT r.name AS race_name, r.year, c.location FROM races r INNER JOIN results res ON r.raceId = res.raceId INNER JOIN circuits c ON r.circuitId = c.circuitId GROUP BY r.raceId, r.year, c.location ORDER BY SUM(res.laps) DESC LIMIT 1
SELECT (COUNT(CASE WHEN c.country = 'Germany' THEN 1 END) * 1.0) / COUNT(*) * 100 AS percentage FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT COUNT(*)  FROM drivers  WHERE code IS NULL
SELECT nationality FROM drivers ORDER BY dob DESC LIMIT 1
SELECT surname  FROM drivers  WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' LIMIT 1
SELECT circuits.name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009
SELECT races.year FROM circuits INNER JOIN races ON circuits.circuitId = races.circuitId WHERE circuits.name = 'Silverstone'
SELECT circuits.url FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit'
SELECT races.time FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2010 AND circuits.location = 'Abu Dhabi'
SELECT COUNT(*) AS race_count FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'
SELECT races.date FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.circuitRef = 'catalunya'
SELECT circuits.url FROM circuits INNER JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Spanish Grand Prix' AND races.`year` = 2009
SELECT MIN(T1.fastestLapTime) AS fastest_lap_time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT      drivers.forename,      drivers.surname FROM      drivers INNER JOIN      results  ON      drivers.driverId = results.driverId ORDER BY      results.fastestLapSpeed DESC LIMIT 1
SELECT drivers.driverRef FROM races INNER JOIN results ON races.raceId = results.raceId INNER JOIN drivers ON results.driverId = drivers.driverId WHERE races.name = 'Canadian Grand Prix' AND races.year = 2007 AND results.position = 1
SELECT races.name FROM races INNER JOIN results ON races.raceId = results.raceId INNER JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT r.name FROM results res INNER JOIN drivers d ON res.driverId = d.driverId INNER JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1
SELECT      results.fastestLapSpeed FROM      races INNER JOIN      results ON          races.raceId = results.raceId WHERE      races.name = 'Spanish Grand Prix'      AND races.year = 2009 ORDER BY      results.fastestLapSpeed DESC LIMIT 1
SELECT DISTINCT races.year FROM drivers INNER JOIN results ON drivers.driverId = results.driverId INNER JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT T2.positionOrder FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Chinese Grand Prix' AND T3.year = 2008
SELECT d.forename, d.surname FROM results r INNER JOIN drivers d ON r.driverId = d.driverId INNER JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Australian Grand Prix' AND ra.date LIKE '1989%' AND r.grid = 4
SELECT COUNT(T2.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.time IS NOT NULL
SELECT      l.time AS fastestLapTime FROM      races r INNER JOIN      lapTimes l ON r.raceId = l.raceId INNER JOIN      drivers d ON l.driverId = d.driverId WHERE      r.year = 2008     AND r.name = 'Australian Grand Prix'     AND d.forename = 'Lewis' ORDER BY      l.milliseconds ASC LIMIT 1
SELECT results.time FROM races INNER JOIN results ON races.raceId = results.raceId WHERE races.year = 2008 AND races.name = 'Chinese Grand Prix' AND results.position = 2
SELECT d.forename, d.surname, r.url FROM races r INNER JOIN results res ON r.raceId = res.raceId INNER JOIN drivers d ON res.driverId = d.driverId WHERE r.name = 'Australian Grand Prix' AND r.year = 2008 ORDER BY res.points DESC LIMIT 1
SELECT COUNT(COUNT.driverId) AS TotalDrivers FROM races INNER JOIN results ON races.raceId = results.raceId INNER JOIN drivers AS COUNT ON results.driverId = COUNT.driverId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND COUNT.nationality = 'British'
SELECT COUNT(*) AS count FROM results AS r INNER JOIN races AS race ON r.raceId = race.raceId WHERE race.year = 2008 AND race.name = 'Chinese Grand Prix' AND r.time IS NOT NULL
SELECT      SUM(T2.points) AS total_points FROM      drivers AS T1 INNER JOIN      results AS T2 ON      T1.driverId = T2.driverId WHERE      T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(CAST(SUBSTR(r.fastestLapTime, 1, 2) AS integer) * 60 + CAST(SUBSTR(r.fastestLapTime, 4, 2) AS integer) + CAST(SUBSTR(r.fastestLapTime, 7, 3) AS real) / 1000 ) AS average_fastest_lap_time FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT CAST(COUNT(CASE WHEN T2.time IS NOT NULL THEN 1 END) AS REAL) * 100.0 / COUNT(T2.resultId) AS rate FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008
SELECT      (CAST(r.time AS REAL) - CAST(l.time AS REAL)) * 100.0 / CAST(l.time AS REAL) AS percentage_speed_difference  FROM      races r  INNER JOIN      results l ON      r.raceId = l.raceId  INNER JOIN      results c ON      l.raceId = c.raceId  WHERE      r.year = 2008  AND r.name = 'Australian Grand Prix'  AND c.position = 1  ORDER BY      l.position ASC  LIMIT 2
SELECT COUNT(*) AS circuit_count FROM circuits WHERE location = 'Adelaide' AND country = 'Australia'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) AS count_of_drivers FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31'
SELECT MAX(cs.points) AS max_points FROM constructors c INNER JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'British'
SELECT      constructors.name AS constructor_name FROM      constructorStandings INNER JOIN      constructors ON      constructorStandings.constructorId = constructors.constructorId ORDER BY      constructorStandings.points DESC LIMIT 1
SELECT DISTINCT constructors.name FROM constructorStandings INNER JOIN constructors ON constructorStandings.constructorId = constructors.constructorId WHERE constructorStandings.raceId = 291 AND constructorStandings.points = 0
SELECT COUNT(*) AS constructor_count FROM constructors AS C INNER JOIN constructorResults AS CR ON C.constructorId = CR.constructorId WHERE C.nationality = 'Japanese' AND CR.points = 0 GROUP BY C.constructorId HAVING COUNT(*) = 2
SELECT      constructors.name FROM      constructorStandings INNER JOIN      constructors ON constructorStandings.constructorId = constructors.constructorId WHERE      constructorStandings.positionText = '1'
SELECT COUNT(*) AS count FROM constructors JOIN results ON constructors.constructorId = results.constructorId WHERE constructors.nationality = 'French' AND results.laps > 50
SELECT CAST(SUM(CASE WHEN r.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM races r INNER JOIN results res ON r.raceId = res.raceId INNER JOIN drivers d ON res.driverId = d.driverId WHERE r.year BETWEEN 2007 AND 2009 AND d.nationality = 'Japanese'
SELECT r.year, AVG(CAST(strftime('%s', r.time) AS REAL) - CAST(strftime('%s', '00:00:00') AS REAL)) AS average_time_seconds  FROM races r  INNER JOIN results res ON r.raceId = res.raceId  WHERE r.year < 1975  AND res.points > 0  GROUP BY r.year
SELECT d.forename, d.surname FROM drivers d JOIN driverStandings ds ON d.driverId = ds.driverId WHERE strftime('%Y', d.dob) > '1975' AND ds.position = 2
SELECT COUNT(*) AS count FROM drivers AS D INNER JOIN results AS R ON D.driverId = R.driverId WHERE D.nationality = "Italian" AND R.time IS NULL
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN lapTimes ON drivers.driverId = lapTimes.driverId ORDER BY lapTimes.time ASC LIMIT 1
SELECT      r.fastestLap FROM      results AS r INNER JOIN      races AS ra ON      r.raceId = ra.raceId WHERE      ra.year = 2009 ORDER BY      r.points DESC LIMIT 1
SELECT AVG(res.fastestLapSpeed) AS avg_fastest_lap_speed FROM races AS r INNER JOIN results AS res ON r.raceId = res.raceId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009
SELECT      races.name,      races.year FROM      races INNER JOIN      results  ON      races.raceId = results.raceId WHERE      results.milliseconds IS NOT NULL ORDER BY      results.milliseconds ASC LIMIT 1
SELECT CAST(COUNT(CASE WHEN R.laps > 50 THEN D.driverId END) AS REAL) * 100.0 / COUNT(D.driverId) FROM drivers AS D INNER JOIN results AS R ON D.driverId = R.driverId WHERE strftime('%Y', D.dob) < '1985' AND R.raceId IN (SELECT raceId FROM races WHERE `year` BETWEEN 2000 AND 2005)
SELECT COUNT(*) FROM drivers AS D INNER JOIN lapTimes AS LT ON D.driverId = LT.driverId WHERE D.nationality = 'French' AND CAST(LT.milliseconds AS REAL) / 1000 < 120
SELECT DISTINCT code FROM drivers WHERE nationality LIKE '%American%'
SELECT raceId FROM races WHERE year = 2009
SELECT COUNT(*) FROM results WHERE raceId = 18
SELECT COUNT(driverId) FROM drivers WHERE nationality = 'Netherlands' ORDER BY dob DESC LIMIT 3
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE strftime('%Y', dob) = '1980' AND nationality = 'British'
SELECT      d.forename,      d.surname FROM      drivers d INNER JOIN      lapTimes lt ON      d.driverId = lt.driverId WHERE      d.dob BETWEEN '1980-01-01' AND '1990-12-31'     AND d.nationality = 'German' ORDER BY      lt.time ASC LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY STRFTIME('%Y', dob) ASC LIMIT 1
SELECT      drivers.driverId,      drivers.code FROM      drivers INNER JOIN      results ON          drivers.driverId = results.driverId WHERE      strftime('%Y', drivers.dob) = '1971'      AND results.fastestLapTime IS NOT NULL
SELECT      d.forename,      d.surname FROM      drivers d JOIN      laptimes la ON d.driverId = la.driverId WHERE      d.nationality = 'Spanish'      AND STRFTIME('%Y', d.dob) < '1982' GROUP BY      d.driverId ORDER BY      MAX(la.time) DESC LIMIT 10
SELECT races.year FROM results INNER JOIN races ON results.raceId = races.raceId WHERE results.fastestLapTime IS NOT NULL ORDER BY results.fastestLapTime DESC LIMIT 1
SELECT r.year FROM races r INNER JOIN lapTimes lt ON r.raceId = lt.raceId WHERE lt.time IS NOT NULL ORDER BY lt.time ASC LIMIT 1
SELECT      driverId FROM      lapTimes WHERE      lap = 1 ORDER BY      time ASC LIMIT 5
SELECT COUNT(*) AS disqualified_finishers FROM races r INNER JOIN results res ON r.raceId = res.raceId INNER JOIN status s ON res.statusId = s.statusId WHERE r.raceId BETWEEN 50 AND 100 AND s.statusID = 2 AND res.time IS NOT NULL
SELECT COUNT(*) AS number_of_circuits, lat, lng FROM circuits WHERE country = 'Austria'
SELECT r.raceId FROM results AS r JOIN races AS cr ON r.raceId = cr.raceId WHERE r.time IS NOT NULL GROUP BY r.raceId ORDER BY COUNT(r.raceId) DESC LIMIT 1
SELECT      d.driverRef,      d.nationality,      d.dob FROM      drivers d JOIN      qualifying q ON      d.driverId = q.driverId WHERE      q.raceId = 23      AND q.q2 IS NOT NULL
SELECT races.year, races.date, races.time FROM races INNER JOIN qualifying ON races.raceId = qualifying.raceId INNER JOIN drivers ON qualifying.driverId = drivers.driverId ORDER BY drivers.dob DESC LIMIT 1
SELECT COUNT(DISTINCT T2.driverId) AS num_drivers_with_puncture FROM status AS T1 INNER JOIN results AS T2 ON T1.statusId = T2.statusId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T3.nationality = 'American' AND T1.status = 'Puncture'
SELECT      c.url FROM      constructorResults cr INNER JOIN      races r ON cr.raceId = r.raceId INNER JOIN      constructors c ON cr.constructorId = c.constructorId WHERE      c.nationality = 'Italian' ORDER BY      cr.points DESC LIMIT 1
SELECT      constructors.url FROM      constructorStandings INNER JOIN      constructors ON constructorStandings.constructorId = constructors.constructorId GROUP BY      constructorStandings.constructorId ORDER BY      SUM(constructorStandings.wins) DESC LIMIT 1
SELECT d.forename, d.surname FROM races AS r INNER JOIN lapTimes AS l ON r.raceId = l.raceId INNER JOIN drivers AS d ON l.driverId = d.driverId WHERE r.name = 'French Grand Prix' AND l.lap = 3 ORDER BY l.time DESC LIMIT 1
SELECT lt.time, lt.milliseconds FROM lapTimes lt WHERE lt.lap = 1 ORDER BY lt.time ASC LIMIT 1
SELECT AVG(T1.fastestLapTime) AS average_fastest_lap_time  FROM results AS T1  INNER JOIN races AS T2  ON T1.raceId = T2.raceId  WHERE T2.name = 'United States Grand Prix'    AND T1.time IS NOT NULL    AND T1.rank < 11
SELECT      d.forename,      d.surname,      AVG(ps.duration) AS avg_duration FROM      drivers d INNER JOIN      pitstops ps  ON      d.driverId = ps.driverId WHERE      d.dob BETWEEN '1980-01-01' AND '1985-12-31'     AND d.nationality = 'German' GROUP BY      d.forename,      d.surname ORDER BY      avg_duration ASC LIMIT 3
SELECT      results.time FROM      races INNER JOIN      results ON races.raceId = results.raceId WHERE      races.date LIKE '2008%'      AND races.name = 'Canadian Grand Prix'     AND results.position = 1 ORDER BY      results.time DESC LIMIT 1
SELECT cons.constructorRef, cons.url FROM races rac INNER JOIN results res ON rac.raceId = res.raceId INNER JOIN constructors cons ON res.constructorId = cons.constructorId WHERE rac.name = 'Singapore Grand Prix' AND rac.year = 2009 AND res.position = 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT cs.points, c.name, c.nationality FROM races r INNER JOIN constructorStandings cs ON r.raceId = cs.raceId INNER JOIN constructors c ON cs.constructorId = c.constructorId WHERE r.name = 'Monaco Grand Prix' AND r.year BETWEEN 1980 AND 2010 ORDER BY cs.points DESC LIMIT 1
SELECT AVG(r.points) AS average_points FROM drivers d INNER JOIN results r ON d.driverId = r.driverId INNER JOIN races rc ON r.raceId = rc.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND rc.name = 'Turkish Grand Prix'
SELECT AVG(race_count) AS avg_races_per_year FROM ( SELECT strftime('%Y', `date`) AS year, COUNT(*) AS race_count FROM races WHERE `date` BETWEEN '2000-01-01' AND '2010-12-31' GROUP BY strftime('%Y', `date`) ) AS races_per_year
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) AS wins FROM driverStandings WHERE positionText = '91'
SELECT races.name FROM races INNER JOIN results ON races.raceId = results.raceId ORDER BY results.fastestLapSpeed ASC LIMIT 1
SELECT circuits.location || ', ' || circuits.country AS full_location FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.date = ( SELECT MAX(date) FROM races ) LIMIT 1
SELECT      drivers.forename,      drivers.surname FROM races INNER JOIN qualifying ON races.raceId = qualifying.raceId INNER JOIN drivers ON qualifying.driverId = drivers.driverId WHERE races.year = 2008   AND races.circuitId = (SELECT circuitId FROM circuits WHERE name = 'Marina Bay Street Circuit')   AND qualifying.q3 IS NOT NULL   AND qualifying.position = 1 LIMIT 1
SELECT      drivers.forename,      drivers.surname,      drivers.nationality,      races.name AS race_name FROM      drivers INNER JOIN      results  ON      drivers.driverId = results.driverId INNER JOIN      races  ON      results.raceId = races.raceId WHERE      drivers.dob = (SELECT MAX(dob) FROM drivers) LIMIT 1
SELECT COUNT(*) AS number_of_accidents FROM status AS s INNER JOIN results AS r ON s.statusId = r.statusId INNER JOIN races AS ra ON r.raceId = ra.raceId WHERE s.statusId = 3 AND ra.name = 'Canadian Grand Prix'
SELECT      d.forename,      d.surname,      SUM(ds.wins) AS total_wins FROM      drivers d INNER JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.dob = (     SELECT MIN(dob)      FROM drivers ) GROUP BY      d.forename, d.surname
SELECT MAX(duration) AS longest_stop_time FROM pitStops
SELECT time FROM lapTimes ORDER BY time ASC LIMIT 1
SELECT MAX(ps.duration) AS longest_duration FROM drivers AS d INNER JOIN pitStops AS ps ON d.driverId = ps.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT      ps.lap FROM      races r INNER JOIN      pitStops ps ON r.raceId = ps.raceId INNER JOIN      drivers d ON ps.driverId = d.driverId WHERE      r.name = 'Australian Grand Prix'     AND r.year = 2011     AND d.forename = 'Lewis'
SELECT pitStops.duration FROM races INNER JOIN pitStops ON races.raceId = pitStops.raceId WHERE races.year = 2011 AND races.raceId = (     SELECT raceId FROM races WHERE `year` = 2011 AND name = 'Australian Grand Prix' )
SELECT MIN(lt.time) AS lap_record FROM lapTimes lt INNER JOIN results r ON lt.raceId = r.raceId AND lt.driverId = r.driverId INNER JOIN drivers d ON r.driverId = d.driverId WHERE d.forename = 'Lewis'
SELECT d.forename, d.surname FROM drivers d INNER JOIN lapTimes lt ON d.driverId = lt.driverId ORDER BY lt.time ASC LIMIT 20
SELECT      circuits.name FROM      drivers INNER JOIN      laptimes ON drivers.driverId = laptimes.driverId INNER JOIN      races ON laptimes.raceId = races.raceId INNER JOIN      circuits ON races.circuitId = circuits.circuitId WHERE      drivers.forename = 'Lewis' ORDER BY      laptimes.time ASC LIMIT 1
SELECT MAX(lt.time) AS fastest_lap_record FROM races r INNER JOIN lapTimes lt ON r.raceId = lt.raceId WHERE r.name = 'Austrian Grand Prix Circuit'
SELECT lt.time FROM circuits AS c JOIN races AS r ON c.circuitId = r.circuitId JOIN lapTimes AS lt ON r.raceId = lt.raceId WHERE c.country = 'Italy'
SELECT races.name FROM races INNER JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE races.name = 'Austrian Grand Prix' ORDER BY lapTimes.time ASC LIMIT 1
SELECT pitStops.duration  FROM races  INNER JOIN laptimes ON races.raceId = laptimes.raceId  INNER JOIN pitStops ON laptimes.raceId = pitStops.raceId  WHERE races.name = 'Austrian Grand Prix'
SELECT DISTINCT circuits.lat, circuits.lng FROM races INNER JOIN lapTimes ON races.raceId = lapTimes.raceId INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE lapTimes.time = '1:29.488'
SELECT AVG(ps.milliseconds) FROM drivers AS d INNER JOIN pitStops AS ps ON d.driverId = ps.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT AVG(lapTimes.milliseconds) AS average_lap_time FROM lapTimes INNER JOIN races ON lapTimes.raceId = races.raceId INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT height, player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes)
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT player_api_id FROM Player_Attributes ORDER BY crossing DESC LIMIT 5
SELECT L.name FROM Match AS M INNER JOIN League AS L ON M.league_id = L.id WHERE M.season = '2015/2016' GROUP BY L.id ORDER BY SUM(M.home_team_goal + M.away_team_goal) DESC LIMIT 1
SELECT      home_team_api_id AS team_api_id FROM      Match WHERE      season = '2015/2016' GROUP BY      home_team_api_id HAVING      SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) > 0 ORDER BY      SUM(CASE WHEN home_team_goal < away_team_goal THEN 1 ELSE 0 END) ASC LIMIT 1
SELECT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id ORDER BY Player_Attributes.penalties DESC LIMIT 10
SELECT      T.team_long_name FROM      Team AS T INNER JOIN      Match AS M ON      T.team_api_id = M.away_team_api_id INNER JOIN      League AS L ON      M.country_id = L.id WHERE      L.name = 'Scotland Premier League'     AND M.season = '2009/2010' GROUP BY      T.team_long_name HAVING      SUM(CASE WHEN M.away_team_goal > M.home_team_goal THEN 1 ELSE 0 END) > 0 ORDER BY      SUM(CASE WHEN M.away_team_goal > M.home_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT TAT.buildUpPlaySpeed FROM Team AS T INNER JOIN Team_Attributes AS TAT ON T.team_fifa_api_id = TAT.team_fifa_api_id ORDER BY TAT.buildUpPlaySpeed DESC LIMIT 4
SELECT      L.name FROM      Match AS M INNER JOIN      League AS L ON      M.league_id = L.id WHERE      M.season = '2015/2016'     AND M.home_team_goal = M.away_team_goal GROUP BY      L.id ORDER BY      COUNT(*) DESC LIMIT 1
SELECT strftime('%Y', 'now') - strftime('%Y', P.birthday) AS player_age  FROM Player_Attributes AS PA  INNER JOIN Player AS P ON PA.player_fifa_api_id = P.player_fifa_api_id  WHERE PA.sprint_speed >= 97  AND strftime('%Y', PA.date) BETWEEN '2013' AND '2015'
SELECT L.name AS league_name, COUNT(M.id) AS match_count FROM League L JOIN Match M ON L.id = M.league_id GROUP BY L.id ORDER BY match_count DESC LIMIT 1
SELECT AVG(height) AS average_height FROM Player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00'
SELECT PA.player_api_id FROM Player_Attributes AS PA WHERE PA.date LIKE '2010-%' ORDER BY PA.overall_rating DESC LIMIT 1
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60
SELECT DISTINCT team.team_long_name FROM Team AS team INNER JOIN Team_Attributes AS ba ON team.id = ba.team_api_id INNER JOIN Match AS match ON team.id = match.home_team_api_id WHERE strftime('%Y', match.date) = '2012' AND ba.buildUpPlayPassing IS NOT NULL AND ba.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing)                                   FROM Team_Attributes                                   WHERE buildUpPlayPassing IS NOT NULL)
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.id) AS percentage FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) BETWEEN '1987' AND '1992'
SELECT L.name, SUM(M.home_team_goal) + SUM(M.away_team_goal) AS total_goals FROM Match M INNER JOIN League L ON M.league_id = L.id GROUP BY L.name ORDER BY total_goals ASC LIMIT 5
SELECT AVG(T2.long_shots) AS average_long_shots FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT P.player_name FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.height > 180 GROUP BY P.player_name ORDER BY AVG(PA.heading_accuracy) DESC LIMIT 10
SELECT T.team_long_name FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.id = TA.team_api_id INNER JOIN Match AS M ON T.id = M.home_team_api_id WHERE TA.buildUpPlayDribblingClass = 'Normal' AND M.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 23:59:59' ORDER BY TA.chanceCreationPassing DESC
SELECT L.name FROM League AS L INNER JOIN Match AS M ON L.id = M.country_id WHERE M.season = '2009/2010' GROUP BY L.name HAVING AVG(M.home_team_goal) > AVG(M.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, INSTR(birthday, '-') + 1, 2) = '10'
SELECT      Player_Attributes.attacking_work_rate FROM      Player INNER JOIN      Player_Attributes ON      Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id WHERE      Player.player_name = 'Franco Zennaro'
SELECT TA.buildUpPlayPositioningClass FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.team_fifa_api_id = TA.team_fifa_api_id WHERE T.team_long_name = 'ADO Den Haag'
SELECT PA.heading_accuracy FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'Francois Affolter' AND PA.date = '2014-09-18 00:00:00'
SELECT Player_Attributes.overall_rating FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Gabriel Tamas'     AND strftime('%Y', Player_Attributes.date) = '2011'
SELECT COUNT(*) FROM League AS L INNER JOIN Match AS M ON L.id = M.league_id WHERE L.name = 'Scotland Premier League' AND M.season = '2015/2016'
SELECT PA.preferred_foot FROM Player_Attributes AS PA JOIN Player AS P ON PA.player_api_id = P.player_api_id ORDER BY P.birthday DESC LIMIT 1
SELECT P.player_name FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT COUNT(*)  FROM Player AS P INNER JOIN Player_Attributes AS PA  ON P.player_api_id = PA.player_api_id WHERE P.weight < 130 AND PA.preferred_foot = 'left'
SELECT Team.team_short_name FROM Team INNER JOIN Team_Attributes ON Team.team_fifa_api_id = Team_Attributes.team_fifa_api_id WHERE Team_Attributes.chanceCreationPassingClass = 'Risky'
SELECT PA.defensive_work_rate FROM Player_Attributes AS PA INNER JOIN Player AS P ON PA.player_api_id = P.player_api_id WHERE P.player_name = 'David Wilson'
SELECT Player.birthday FROM Player INNER JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id ORDER BY Player_Attributes.overall_rating DESC LIMIT 1
SELECT League.name FROM Country INNER JOIN League ON Country.id = League.country_id WHERE Country.name = 'Netherlands'
SELECT AVG(T1.home_team_goal) AS average_home_team_goal FROM `Match` AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T1.season = '2010/2011' AND T2.name = 'Poland'
SELECT      P.player_name FROM      Player AS P INNER JOIN      Player_Attributes AS A ON      P.id = A.player_api_id GROUP BY      P.height ORDER BY      AVG(A.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990'
SELECT COUNT(T1.id) AS player_count FROM Player AS T1 INNER JOIN Team_Attributes AS T2 ON T1.id = T2.team_fifa_api_id WHERE T1.player_name LIKE 'Adam%' AND T1.weight > 170 AND T2.buildUpPlaySpeedClass = 'Fast'
SELECT DISTINCT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.overall_rating > 80 AND strftime('%Y', T2.date) BETWEEN '2008' AND '2010'
SELECT pa.potential FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Doran'
SELECT DISTINCT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.preferred_foot = 'left'
SELECT T.team_long_name FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.id = TA.team_fifa_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB'
SELECT T.team_short_name FROM Team_Attributes AS TA INNER JOIN Team AS T ON TA.team_fifa_api_id = T.team_fifa_api_id WHERE TA.buildUpPlayPassing > 70
SELECT AVG(t1.overall_rating) AS average_overall_rating FROM Player_Attributes t1 INNER JOIN Player t2 ON t1.player_api_id = t2.id WHERE strftime('%Y', t1.date) >= '2010' AND strftime('%Y', t1.date) <= '2015' AND t2.height > 170
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1
SELECT      C.name FROM      League AS L INNER JOIN      Country AS C ON L.country_id = C.id WHERE      L.name = 'Italy Serie A'
SELECT T.team_short_name FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.team_fifa_api_id = TA.team_fifa_api_id WHERE TA.buildUpPlaySpeed = 31 AND TA.buildUpPlayDribbling = 53 AND TA.buildUpPlayPassing = 32
SELECT AVG(PA.overall_rating) FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'Aaron Doran'
SELECT COUNT(*) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T2.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T1.date) BETWEEN '2008-08' AND '2008-10'
SELECT T1.team_short_name FROM Match AS T2 INNER JOIN Team AS T1 ON T2.home_team_api_id = T1.team_api_id WHERE T2.home_team_goal = 10
SELECT      Player.player_name FROM      Player INNER JOIN      Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE      Player_Attributes.potential = 61 ORDER BY      Player_Attributes.balance DESC LIMIT 1
SELECT      AVG(CASE WHEN P.player_name = 'Abdou Diallo' THEN PA.ball_control END) -      AVG(CASE WHEN P.player_name = 'Aaron Appindangoye' THEN PA.ball_control END) AS control_difference FROM      Player AS P INNER JOIN      Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE      P.player_name IN ('Abdou Diallo', 'Aaron Appindangoye')
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY CAST(REPLACE(SUBSTR(birthday, 1, 4), '-', '') AS INT) DESC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(*) AS count_players FROM Player_Attributes AS pa INNER JOIN Player AS p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE pa.preferred_foot = 'left' AND pa.attacking_work_rate = 'low'
SELECT Country.name FROM League INNER JOIN Country ON League.country_id = Country.id WHERE League.name = 'Belgium Jupiler League'
SELECT League.name FROM Country  INNER JOIN League ON Country.id = League.country_id WHERE Country.name = 'Germany'
SELECT Player.player_name FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id ORDER BY Player_Attributes.overall_rating DESC LIMIT 1
SELECT COUNT(DISTINCT pa.player_fifa_api_id) AS num_players FROM Player_Attributes pa JOIN Player p ON pa.player_fifa_api_id = p.player_fifa_api_id WHERE strftime('%Y', p.birthday) < '1986' AND pa.defensive_work_rate = 'high'
SELECT Player.player_name FROM Player JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY Player_Attributes.crossing DESC LIMIT 1
SELECT      pa.heading_accuracy FROM      Player AS p INNER JOIN      Player_Attributes AS pa ON      p.player_api_id = pa.player_api_id WHERE      p.player_name = 'Ariel Borysiuk'
SELECT COUNT(*) AS count FROM Player INNER JOIN Player_Attributes ON Player.id = Player_Attributes.player_api_id WHERE Player.height > 180 AND Player_Attributes.volleys > 70
SELECT P.player_name FROM Player_Attributes AS PA INNER JOIN Player AS P ON PA.player_fifa_api_id = P.player_fifa_api_id WHERE PA.volleys > 70 AND PA.dribbling > 70
SELECT COUNT(*) AS match_count FROM Match AS m INNER JOIN Country AS c ON m.country_id = c.id WHERE m.season = '2008/2009' AND c.name = 'Belgium'
SELECT      Player_Attributes.long_passing FROM      Player_Attributes INNER JOIN      Player  ON      Player_Attributes.player_api_id = Player.player_api_id ORDER BY      Player.birthday DESC LIMIT 1
SELECT COUNT(*) FROM League AS L INNER JOIN Match AS M ON L.id = M.league_id WHERE L.name = 'Belgium Jupiler League' AND SUBSTR(M.date, 1, 7) = '2009-04'
SELECT l.name AS league_name FROM League l JOIN Match m ON l.id = m.league_id WHERE m.season = '2008/2009' GROUP BY l.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(PA.overall_rating) AS average_overall_rating FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE strftime('%Y', P.birthday) < '1986'
SELECT CAST((PA1.overall_rating - PA2.overall_rating) AS REAL) * 100.0 / PA2.overall_rating AS percentage_difference FROM Player_Attributes AS PA1 INNER JOIN Player_Attributes AS PA2 INNER JOIN Player AS P1 ON PA1.player_api_id = P1.player_api_id INNER JOIN Player AS P2 ON PA2.player_api_id = P2.player_api_id WHERE P1.player_name = 'Ariel Borysiuk' AND P2.player_name = 'Paulin Puel'
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player AS T2 INNER JOIN Player_Attributes AS T1 ON T2.player_api_id = T1.player_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T1.crossing) AS total_crossing_score  FROM Player_Attributes AS T1  INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id  WHERE T2.player_name = 'Aaron Lennox'
SELECT ta.chanceCreationPassing, ta.chanceCreationPassingClass FROM Team t INNER JOIN Team_Attributes ta ON t.team_api_id = ta.team_api_id WHERE t.team_long_name = 'Ajax' ORDER BY ta.chanceCreationPassing DESC LIMIT 1
SELECT Player_Attributes.preferred_foot FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Abdou Diallo'
SELECT MAX(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Dorlan Pabon'
SELECT AVG(M.away_team_goal) AS avg_goals FROM Team AS T INNER JOIN Match AS M ON T.team_api_id = M.away_team_api_id INNER JOIN Country AS C ON M.country_id = C.id WHERE T.team_long_name = 'Parma' AND C.name = 'Italy'
SELECT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.overall_rating = 77 AND Player_Attributes.date LIKE '2016-06-23%' ORDER BY Player.birthday DESC LIMIT 1
SELECT Player_Attributes.overall_rating FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Aaron Mooy' AND Player_Attributes.date LIKE '2016-02-04%'
SELECT potential FROM Player_Attributes WHERE player_api_id = (   SELECT player_api_id   FROM Player   WHERE player_name = 'Francesco Parravicini' ) AND date = '2010-08-30 00:00:00'
SELECT Player_Attributes.attacking_work_rate FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.player_name = 'Francesco Migliore' AND Player_Attributes.date LIKE '2015-05-01%'
SELECT Player_Attributes.defensive_work_rate FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_api_id = Player.player_api_id WHERE Player.player_name = 'Kevin Berigaud' AND Player_Attributes.date = '2013-02-22 00:00:00'
SELECT pa.date FROM Player_Attributes AS pa INNER JOIN Player AS p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Kevin Constant' ORDER BY pa.crossing DESC LIMIT 1
SELECT      T2.buildUpPlaySpeedClass FROM      Team AS T1 INNER JOIN      Team_Attributes AS T2 ON      T1.team_fifa_api_id = T2.team_fifa_api_id WHERE      T1.team_long_name = 'Willem II'     AND T2.date = '2011-02-22'
SELECT Team_Attributes.buildUpPlayDribblingClass FROM Team INNER JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_short_name = 'LEI' AND Team_Attributes.date = '2015-09-10 00:00:00'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date LIKE '2010-02-22%'
SELECT      T2.chanceCreationPassingClass FROM      Team AS T1 INNER JOIN      Team_Attributes AS T2 ON      T1.team_fifa_api_id = T2.team_fifa_api_id WHERE      T1.team_long_name = 'PEC Zwolle' AND      T2.date = '2013-09-20 00:00:00'
SELECT T2.chanceCreationCrossingClass FROM Team AS T1 INNER JOIN Match AS T3 ON T1.team_api_id = T3.away_team_api_id OR T1.team_api_id = T3.home_team_api_id INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.date = '2010-02-22 00:00:00' AND T1.team_long_name = 'Hull City'
SELECT TA.defenceAggressionClass FROM Team_Attributes AS TA INNER JOIN Team AS T ON TA.team_fifa_api_id = T.team_fifa_api_id WHERE T.team_long_name = 'Hannover 96' AND TA.date LIKE '2015-09-10%'
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Marko Arnautovic' AND pa.date BETWEEN '2007-02-22' AND '2016-04-21'
SELECT CAST((PA1.overall_rating - PA2.overall_rating) AS REAL) * 100 / PA1.overall_rating AS percentage FROM Player AS P1 JOIN Player_Attributes AS PA1 ON P1.id = PA1.player_fifa_api_id JOIN Player AS P2 JOIN Player_Attributes AS PA2 ON P2.id = PA2.player_fifa_api_id WHERE PA1.date = '2013-07-12' AND P1.player_name = 'Landon Donovan' AND PA2.date = '2013-07-12' AND P2.player_name = 'Jordan Bowery'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE (strftime('%J', datetime('now', 'localtime')) - strftime('%J', birthday)) / 365 > 35
SELECT COUNT(M.home_team_goal) AS total_home_team_goals FROM Player AS P JOIN Match AS M ON P.id = M.home_team_api_id WHERE P.player_name = 'Aaron Lennon'
SELECT COALESCE(SUM(m.away_team_goal), 0) AS total_away_goals FROM Player AS p INNER JOIN Match AS m ON p.player_api_id = m.away_team_api_id WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(M.home_team_goal) AS total_goals FROM Match AS M JOIN Player AS P ON M.home_team_api_id = P.id WHERE (strftime('%J', 'now') - strftime('%J', P.birthday)) / 365 <= 30
SELECT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_fifa_api_id = Player_Attributes.player_fifa_api_id ORDER BY Player_Attributes.overall_rating DESC LIMIT 1
SELECT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id  WHERE Player_Attributes.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.attacking_work_rate = 'high'
SELECT P.player_name FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE PA.finishing = 1 ORDER BY (julianday('now') - julianday(P.birthday)) DESC LIMIT 1
SELECT Player.player_name FROM Player INNER JOIN Team AS Team ON Player.id = Team.team_api_id INNER JOIN League AS League ON Team.team_fifa_api_id = League.id INNER JOIN Country AS Country ON League.country_id = Country.id WHERE Country.name = 'Belgium'
SELECT      P.player_name,      C.name FROM      Player_Attributes AS PA INNER JOIN      Player AS P ON      PA.player_fifa_api_id = P.player_fifa_api_id INNER JOIN      Team AS T ON      P.player_fifa_api_id = T.team_fifa_api_id INNER JOIN      Country AS C ON      PA.player_fifa_api_id = T.team_fifa_api_id WHERE      PA.vision > 89
SELECT      C.name FROM      Player AS P INNER JOIN      Country AS C ON      P.player_fifa_api_id = C.id GROUP BY      C.name ORDER BY      AVG(P.weight) DESC LIMIT 1
SELECT team.team_long_name FROM Team AS team INNER JOIN Team_Attributes AS attributes ON team.team_fifa_api_id = attributes.team_fifa_api_id WHERE attributes.buildUpPlaySpeedClass = 'Slow'
SELECT T.team_short_name FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.team_fifa_api_id = TA.team_fifa_api_id WHERE TA.chanceCreationPassingClass = 'Safe'
SELECT AVG(P.height) AS avg_height  FROM Player AS P  INNER JOIN Country AS C ON P.id = C.id  WHERE C.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-12-31'
SELECT      (PA1.jumping - PA2.jumping) AS JumpingDifference FROM      Player_Attributes AS PA1 JOIN      Player_Attributes AS PA2 ON PA1.player_fifa_api_id = PA2.player_fifa_api_id JOIN      Player AS P1 ON PA1.player_fifa_api_id = P1.player_fifa_api_id JOIN      Player AS P2 ON PA2.player_fifa_api_id = P2.player_fifa_api_id WHERE      PA1.id = 6 AND PA2.id = 23
SELECT      pa.player_fifa_api_id FROM      Player_Attributes AS pa INNER JOIN      Player AS p ON      pa.player_fifa_api_id = p.player_fifa_api_id WHERE      pa.preferred_foot = 'right' ORDER BY      pa.potential ASC LIMIT 5
SELECT COUNT(*) AS player_count FROM Player_Attributes WHERE crossing = (SELECT MAX(crossing) FROM Player_Attributes) AND preferred_foot = 'left'
SELECT CAST((SUM(CASE WHEN PA.stamina > 80 AND PA.strength > 80 THEN 1 ELSE 0 END)) AS REAL) * 100.0 / COUNT(*) AS percentage FROM Player_Attributes AS PA
SELECT      C.name FROM      League AS L INNER JOIN      Country AS C ON      L.country_id = C.id WHERE      L.name = 'Poland Ekstraklasa'
SELECT      M.home_team_goal,      M.away_team_goal FROM      Country AS C INNER JOIN      League AS L ON C.id = L.country_id INNER JOIN      Match AS M ON L.id = M.league_id WHERE      C.name = 'Belgium'     AND L.name = 'Belgian Jupiler League'     AND M.date LIKE '2008-09-24%'
SELECT pa.sprint_speed, pa.agility, pa.acceleration FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Alexis Blin'
SELECT Team_Attributes.buildUpPlaySpeedClass FROM Team INNER JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*) AS number_of_matches FROM Country INNER JOIN League ON Country.id = League.country_id INNER JOIN Match ON League.id = Match.country_id WHERE Country.name = 'Italy' AND Match.season = '2015/2016'
SELECT MAX(M.home_team_goal) AS max_home_team_goals FROM Match AS M INNER JOIN League AS L ON M.league_id = L.id WHERE L.name = 'Netherlands Eredivisie'
SELECT PA.finishing, PA.curve FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id ORDER BY P.weight DESC LIMIT 1
SELECT L.name FROM Match AS M INNER JOIN League AS L ON M.league_id = L.id INNER JOIN Country AS C ON L.country_id = C.id WHERE M.season = '2015/2016' GROUP BY L.name ORDER BY COUNT(M.id) DESC LIMIT 4
SELECT T2.team_long_name FROM Team AS T2 INNER JOIN Match AS T1 ON T1.away_team_api_id = T2.id ORDER BY T1.away_team_goal DESC LIMIT 1
SELECT Player.player_name FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_fifa_api_id = Player.player_fifa_api_id ORDER BY Player_Attributes.overall_rating DESC LIMIT 1
SELECT CAST(COUNT(CASE WHEN P.height < 180 AND PA.overall_rating > 70 THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.id = PA.player_api_id
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS percentage_deviation FROM Patient WHERE SEX = 'M'
SELECT CAST(COUNT(CASE WHEN STRFTIME('%Y', Birthday) > '1930' AND SEX = 'F' THEN 1 END) AS REAL) * 100 / COUNT(CASE WHEN SEX = 'F' THEN 1 END) AS percentage FROM Patient
SELECT      CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage_inpatients  FROM      Patient  WHERE      Birthday BETWEEN '1930-01-01' AND '1940-12-31'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS ratio FROM Patient WHERE Diagnosis = 'SLE'
SELECT Patient.Diagnosis, Laboratory.Date FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = 30609
SELECT      Patient.SEX,      Patient.Birthday,      Examination.`Examination Date`,      Examination.Symptoms FROM      Patient INNER JOIN      Examination  ON      Patient.ID = Examination.ID WHERE      Patient.ID = 163109
SELECT      Patient.ID,      Patient.SEX,      Patient.Birthday FROM      Patient INNER JOIN      Laboratory ON      Patient.ID = Laboratory.ID WHERE      Laboratory.LDH > 500
SELECT      E.ID,      (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS age FROM      Examination AS E INNER JOIN      Patient AS P ON      P.ID = E.ID WHERE      E.RVVT = '+'
SELECT      Patient.ID,      Patient.SEX,      Patient.Diagnosis AS disease FROM      Patient INNER JOIN      Examination  ON      Patient.ID = Examination.ID WHERE      Examination.Thrombosis = 2
SELECT P.ID FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) = '1937' AND L.`T-CHO` >= 250
SELECT      Patient.ID,      Patient.SEX,      Patient.Description AS Diagnosis FROM      Patient INNER JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.ALB < 3.5
SELECT      (SUM(CASE WHEN L.TP < 6.0 OR L.TP > 8.5 THEN 1 ELSE 0 END) * 1.0) * 100.0 / COUNT(*) AS percentage FROM      Patient P INNER JOIN      Laboratory L ON P.ID = L.ID WHERE      P.SEX = 'F'
SELECT AVG(e.`aCL IgG`) AS Avg_aCL_IgG FROM Examination e INNER JOIN Patient p ON e.ID = p.ID WHERE p.Admission = '+' AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) >= 50
SELECT COUNT(*) AS count FROM Patient WHERE SEX = 'F' AND Description LIKE '%1997%' AND Admission = '-'
SELECT MIN(strftime('%Y', `First Date`) - strftime('%Y', Birthday)) AS Youngest_Age FROM Patient
SELECT COUNT(*) AS total_patients FROM Examination AS e INNER JOIN Patient AS p ON e.ID = p.ID WHERE p.SEX = 'F' AND e.Thrombosis = '1' AND strftime('%Y', e.`Examination Date`) = '1997'
SELECT MAX(strftime('%Y', p.Birthday)) - MIN(strftime('%Y', p.Birthday)) AS age_gap FROM Patient p JOIN Laboratory l ON p.ID = l.ID WHERE l.TG >= 200
SELECT E.Symptoms, P.Diagnosis FROM Patient P INNER JOIN Examination E ON P.ID = E.ID WHERE E.Symptoms IS NOT NULL ORDER BY P.Birthday ASC LIMIT 1
SELECT AVG(total_patients_per_month) AS average_patients_per_month FROM (SELECT STRFTIME('%m', L.`Date`) AS month, COUNT(P.ID) AS total_patients_per_month FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.`Date` BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY STRFTIME('%m', L.`Date`)) AS subquery
SELECT      L.`Date`,      (strftime('%Y', P.Birthday) - strftime('%Y', P.`First Date`)) AS age FROM      Patient AS P INNER JOIN      Laboratory AS L ON P.ID = L.ID WHERE      P.Diagnosis = 'SJS' ORDER BY      age DESC LIMIT 1
SELECT      CAST(SUM(CASE WHEN p.SEX = 'M' AND l.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) /     SUM(CASE WHEN p.SEX = 'F' AND l.UA <= 6.5 THEN 1 ELSE 0 END) AS male_female_ratio FROM      Patient p INNER JOIN      Laboratory l ON      p.ID = l.ID
SELECT COUNT(*) AS PatientCount FROM Examination AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE (julianday(T1.`Examination Date`) - julianday(T2.`First Date`)) / 365.0 >= 1
SELECT COUNT(*) FROM Examination AS E INNER JOIN Patient AS P ON E.ID = P.ID WHERE P.Birthday < '1993-12-31' AND strftime('%Y', E.`Examination Date`) BETWEEN '1990' AND '1993'
SELECT COUNT(T1.ID) FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-BIL` >= 2.0
SELECT Examination.Diagnosis FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.`Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Examination.Diagnosis ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(1999 - strftime('%Y', Birthday)) AS avg_age_1999 FROM Patient JOIN Laboratory  ON Patient.ID = Laboratory.ID WHERE Laboratory.`Date` BETWEEN '1991-10-01' AND '1991-10-30'
SELECT      strftime('%Y', E.`Examination Date`) - strftime('%Y', P.Birthday) AS Age,       P.Diagnosis FROM      Examination E INNER JOIN      Patient P ON E.ID = P.ID INNER JOIN      Laboratory L ON P.ID = L.ID ORDER BY      L.HGB DESC LIMIT 1
SELECT `ANA` FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT T1.`T-CHO` FROM Laboratory AS T1 WHERE T1.ID = 2927464 AND T1.`Date` = '1995-09-04' AND T1.`T-CHO` < 250
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY Diagnosis ASC LIMIT 1
SELECT Examination.`aCL IgM` FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.Diagnosis = 'SLE' AND Patient.Description = '1994-02-19' AND Examination.`Examination Date` = '1993-11-12'
SELECT Patient.SEX FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.Date = '1992-06-12' AND Laboratory.GPT = 9 AND (Patient.SEX = 'M' OR Patient.SEX = 'F')
SELECT      (strftime('%Y', '1991-10-21') - strftime('%Y', P.Birthday)) AS age FROM      Laboratory AS L INNER JOIN      Patient AS P ON      L.ID = P.ID WHERE      L.UA = '8.4'     AND L.Date = '1991-10-21'
SELECT COUNT(*) AS count_lab_tests_1995 FROM Laboratory AS lab JOIN Patient AS p ON lab.ID = p.ID WHERE p.`First Date` = '1991-06-13' AND p.Diagnosis = 'SJS' AND lab.`Date` BETWEEN '1995-01-01' AND '1995-12-31'
SELECT Patient.Diagnosis FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`Examination Date` = '1997-01-27' AND Patient.Diagnosis = 'SLE'
SELECT e.Symptoms FROM Patient p INNER JOIN Examination e ON p.ID = e.ID WHERE p.Birthday = '1959-03-01' AND e.`Examination Date` = '1993-09-27'
SELECT AVG(CASE WHEN SUBSTR(T2.`Date`, 1, 7) = '1981-11' THEN T2.`T-CHO` ELSE NULL END) - AVG(CASE WHEN SUBSTR(T2.`Date`, 1, 7) = '1981-12' THEN T2.`T-CHO` ELSE NULL END) AS decrease_rate FROM Laboratory AS T2 INNER JOIN Patient AS T1 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-02-18'
SELECT ID FROM Patient WHERE Diagnosis = 'BEHCET' AND SUBSTR(Description, 1, 4) >= '1997' AND SUBSTR(Description, 1, 4) < '1998'
SELECT COUNT(*) FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4
SELECT ID FROM Patient WHERE SEX = 'F' AND strftime('%Y', Birthday) = '1964' AND Admission = '+' ORDER BY ID
SELECT COUNT(*) AS patient_count FROM Examination WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` * 1.2 > (SELECT AVG(`aCL IgM`) FROM Examination)
SELECT CAST(SUM(CASE WHEN L.UA <= 6.5 AND L.`U-PRO` > 0 AND L.`U-PRO` < 30 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(L.ID) AS percentage FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID
SELECT (SUM(CASE WHEN P.Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage FROM Patient P WHERE P.SEX = 'M' AND strftime('%Y', P.`First Date`) = '1981'
SELECT DISTINCT T.ID FROM Patient AS T INNER JOIN Laboratory AS L ON T.ID = L.ID WHERE T.Admission = '-'    AND L.`Date` LIKE '1991-10%'    AND L.`T-BIL` < 2.0
SELECT COUNT(*) AS count FROM Patient AS p JOIN Examination AS e ON p.ID = e.ID WHERE e.`ANA Pattern` != 'P' AND p.SEX = 'F' AND p.Birthday BETWEEN '1980-01-01' AND '1989-12-31'
SELECT P.SEX FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'PSS' AND L.CRP > 2 AND L.CRE = 1 AND L.LDH = 123
SELECT AVG(T2.ALB) AS average_albumin FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'   AND T1.Diagnosis = 'SLE'   AND T2.PLT > 400
SELECT      E.Symptoms  FROM      Patient AS P  INNER JOIN      Examination AS E  ON      P.ID = E.ID  WHERE      P.Diagnosis = 'SLE'  GROUP BY      E.Symptoms  ORDER BY      COUNT(E.Symptoms) DESC  LIMIT 1
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473
SELECT COUNT(*) FROM Patient WHERE Diagnosis = 'APS' AND SEX = 'F'
SELECT COUNT(*) AS count FROM Laboratory WHERE STRFTIME('%Y', Date) = '1997' AND TP > 6 AND TP < 8.5
SELECT CAST(SUM(CASE WHEN T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100.0 / SUM(1) AS proportion FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.Symptoms LIKE '%thrombocytopenia%'
SELECT      CAST(SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage_women FROM      Patient P WHERE      STRFTIME('%Y', P.BIRTHDAY) = '1980'      AND P.Diagnosis = 'RA'
SELECT COUNT(*) AS patient_count FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Patient.SEX = 'M' AND Examination.`Examination Date` BETWEEN '1995-01-01' AND '1997-12-31' AND Examination.`Diagnosis` = 'Behcet' AND Patient.Admission = '-'
SELECT COUNT(*) AS Count FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'F' AND L.WBC < 3.5
SELECT      JULIANDAY(Examination.`Examination Date`) - JULIANDAY(Patient.`First Date`) AS DaysSinceFirstDate FROM      Patient INNER JOIN      Examination ON      Patient.ID = Examination.ID WHERE      Patient.ID = 821298
SELECT CASE WHEN P.SEX = 'M' AND L.UA > 8.0 THEN 'Yes' WHEN P.SEX = 'F' AND L.UA > 6.5 THEN 'Yes' ELSE 'No' END AS is_normal_range FROM Laboratory L INNER JOIN Patient P ON L.ID = P.ID WHERE L.ID = 57266
SELECT Laboratory.Date FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = 48473 AND Laboratory.GOT > 60
SELECT      P.SEX,      P.Birthday FROM      Laboratory AS LAB INNER JOIN      Patient AS P ON      LAB.ID = P.ID WHERE      LAB.GOT < 60     AND strftime('%Y', LAB.Date) = '1994'
SELECT Patient.ID FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'M' AND Laboratory.GPT > 60
SELECT P.Diagnosis FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.GPT > 60 ORDER BY P.Birthday ASC
SELECT AVG(Laboratory.LDH) AS avg_ldh FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.LDH < 500
SELECT Patient.ID, strftime('%Y', current_timestamp) - strftime('%Y', Patient.Birthday) AS Age FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH BETWEEN 600 AND 800
SELECT      P.Admission FROM      Laboratory AS L INNER JOIN      Patient AS P ON      L.ID = P.ID WHERE      L.ALP < 300
SELECT      T1.ID FROM      Patient AS T1 INNER JOIN      Laboratory AS T2 ON      T1.ID = T2.ID WHERE      T1.Birthday = '1982-04-01'     AND T2.ALP < 300
SELECT P.ID, P.SEX, P.Birthday FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TP < 6.0
SELECT (l.TP - 8.5) AS deviation FROM Patient AS p INNER JOIN Laboratory AS l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.TP > 8.5
SELECT P.Birthday FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND (L.ALB <= 3.5 OR L.ALB >= 5.5) ORDER BY P.Birthday DESC
SELECT      CASE          WHEN L.ALB BETWEEN 3.5 AND 5.5 THEN 'Yes'         ELSE 'No'     END AS Normal_Albumin FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) = '1982'
SELECT CAST(COUNT(CASE WHEN T2.UA > 8.0 THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS percentage  FROM Patient AS T1  INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID  WHERE T1.Sex = 'F'
SELECT AVG(L.UA) AS average_UA FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.Date = (   SELECT MAX(L2.Date)     FROM Laboratory AS L2     WHERE L2.ID = L.ID )   AND (P.Sex = 'M' AND L.UA < 8.0 OR P.Sex = 'F' AND L.UA < 6.5)
SELECT      Patient.ID,      Patient.SEX,      Patient.Birthday FROM      Patient INNER JOIN Laboratory  ON      Patient.ID = Laboratory.ID WHERE      Laboratory.UN = 29
SELECT      p.ID,      p.SEX,      p.Birthday FROM      Patient p INNER JOIN      Laboratory l ON      p.ID = l.ID WHERE      p.Diagnosis = 'RA'      AND l.UN < 30
SELECT COUNT(*) FROM Laboratory AS l INNER JOIN Patient AS p ON l.ID = p.ID WHERE l.CRE >= 1.5 AND p.Sex = 'M'
SELECT CASE WHEN SUM(CASE WHEN P.Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN P.Sex = 'F' THEN 1 ELSE 0 END) THEN 1 ELSE 0 END AS gender_comparison FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.CRE >= 1.5
SELECT P.ID, P.SEX, P.Birthday FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID ORDER BY L.`T-BIL` DESC LIMIT 1
SELECT      P.SEX,      GROUP_CONCAT(DISTINCT P.ID) AS IDs FROM      Laboratory AS L INNER JOIN      Patient AS P ON      L.ID = P.ID WHERE      L.`T-BIL` >= 2.0 GROUP BY      P.SEX
SELECT Patient.ID, Laboratory.`T-CHO` FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID ORDER BY Patient.Birthday ASC, Laboratory.`T-CHO` DESC LIMIT 1
SELECT AVG(strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS average_age FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.`T-CHO` >= 250
SELECT      Patient.ID,      Patient.Diagnosis FROM      Patient INNER JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Laboratory.TG > 300
SELECT COUNT(DISTINCT P.ID) AS patient_count FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.TG > 200 AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) > 50
SELECT DISTINCT P.ID FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.ADMISSION = '-' AND L.CPK < 250
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE SUBSTR(P.Birthday, 1, 4) BETWEEN '1936' AND '1956' AND P.SEX = 'M' AND L.CPK > 250
SELECT      P.ID,      P.SEX,      (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age  FROM      Laboratory AS Lab  INNER JOIN      Patient AS P ON      Lab.ID = P.ID  WHERE      Lab.`T-CHO` < 250  AND      Lab.GLU >= 180
SELECT      Patient.ID,      Laboratory.GLU FROM      Patient INNER JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Patient.Description LIKE '1991%'      AND Laboratory.GLU < 180
SELECT      P.ID,      P.SEX,      P.Birthday FROM      Patient AS P INNER JOIN      Laboratory AS L  ON      P.ID = L.ID WHERE      L.WBC <= 3.5      OR L.WBC >= 9.0 GROUP BY      P.SEX ORDER BY      P.Birthday ASC
SELECT      Patient.Diagnosis,      Patient.ID,      CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', Patient.Birthday) AS INTEGER) AS Age FROM      Patient INNER JOIN      Laboratory  ON      Patient.ID = Laboratory.ID WHERE      Laboratory.RBC < 3.5
SELECT      P.ID,      P.Admission FROM      Patient AS P INNER JOIN      Laboratory AS L ON P.ID = L.ID WHERE      P.Sex = 'F'     AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) >= 50     AND (L.RBC <= 3.5 OR L.RBC >= 6.0)     AND P.Admission = '+'
SELECT      P.ID,      P.SEX FROM      Patient AS P INNER JOIN      Laboratory AS L ON      P.ID = L.ID WHERE      P.Admission = '-'      AND L.HGB < 10
SELECT      P.ID,      P.SEX FROM      Patient AS P INNER JOIN      Laboratory AS L ON P.ID = L.ID WHERE      P.Diagnosis = 'SLE'     AND L.HGB BETWEEN 10 AND 17 ORDER BY      P.Birthday DESC LIMIT 1
SELECT      P.ID,      (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS age FROM      Patient AS P INNER JOIN      Laboratory AS L ON      P.ID = L.ID WHERE      L.HCT >= 52 GROUP BY      P.ID HAVING      COUNT(L.ID) > 2
SELECT AVG(HCT) AS Average_HCT FROM Laboratory WHERE `Date` LIKE '1991%' AND HCT < 29
SELECT SUM(CASE WHEN L.PLT < 100 THEN 1 ELSE 0 END) AS low_plt_count,         SUM(CASE WHEN L.PLT > 400 THEN 1 ELSE 0 END) AS high_plt_count  FROM Laboratory L
SELECT      P.ID AS PatientID FROM      Laboratory AS L INNER JOIN      Patient AS P ON      L.ID = P.ID WHERE      L.Date LIKE '1984%'       AND (CAST(strftime('%Y', DATE('now')) AS INTEGER) - CAST(strftime('%Y', P.Birthday) AS INTEGER)) < 50     AND L.PLT BETWEEN 100 AND 400
SELECT CAST(SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) > 55 AND L.PT >= 14
SELECT P.ID FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.`First Date` > '1992-12-31' AND L.PT < 14
SELECT COUNT(*) FROM Examination AS E INNER JOIN Laboratory AS L ON E.ID = L.ID WHERE E.`Examination Date` > '1997-01-01'   AND L.APTT < 45
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.APTT > 45 AND T2.Thrombosis = 0
SELECT SUM(CASE WHEN T1.Sex = 'M' AND T2.WBC > 3.5 AND T2.WBC < 9.0 AND (T2.FG <= 150 OR T2.FG >= 450) THEN 1 ELSE 0 END) AS abnormal_fibrinogen_count FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID
SELECT COUNT(DISTINCT T1.ID) AS patient_count FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01'   AND T2.FG NOT BETWEEN 150 AND 450
SELECT  Patient.Diagnosis FROM  Patient INNER JOIN  Laboratory ON  Patient.ID = Laboratory.ID WHERE  Laboratory.`U-PRO` >= 30
SELECT Patient.ID FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.`U-PRO` BETWEEN 0 AND 30 AND Patient.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT ID) AS patient_count FROM Laboratory WHERE IGG >= 2000
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IGG > 900 AND T1.IGG < 2000 AND T2.Symptoms IS NOT NULL
SELECT P.Diagnosis FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.IGA BETWEEN 80 AND 500 ORDER BY L.IGA DESC LIMIT 1
SELECT COUNT(*) AS result FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.`First Date` >= '1990-01-01' AND L.`IGA` > 80 AND L.`IGA` < 500
SELECT P.Diagnosis FROM Examination AS E INNER JOIN Patient AS P ON E.ID = P.ID WHERE (E.`aCL IgM` <= 40 OR E.`aCL IgM` >= 400) GROUP BY P.Diagnosis ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(T2.ID) AS count_patients FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRP = '+' AND T2.Description IS NULL
SELECT COUNT(*) FROM Laboratory AS lab INNER JOIN Patient AS pat ON lab.ID = pat.ID WHERE lab.CRE >= 1.5 AND (strftime('%Y', 'now') - strftime('%Y', pat.Birthday)) < 70
SELECT COUNT(DISTINCT P.ID) AS TotalPatients FROM Examination AS E INNER JOIN Patient AS P ON E.ID = P.ID WHERE E.KCT = '+'   AND P.Diagnosis = 'RA'
SELECT P.Diagnosis FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE strftime('%Y', P.Birthday) >= '1985' AND L.RA IN ('-', '+-')
SELECT DISTINCT P.ID FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.RF < 20 AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) > 60
SELECT COUNT(*) AS patients_count FROM Laboratory AS L INNER JOIN Examination AS E ON L.ID = E.ID WHERE L.RF < 20 AND E.Thrombosis = '0'
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.C3 > 35 AND T2.`ANA Pattern` = 'P'
SELECT E.ID FROM Examination AS E INNER JOIN Patient AS P ON E.ID = P.ID INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE (L.ALB < 29 AND L.ALB > 52) OR (L.ALB IS NULL) GROUP BY E.ID ORDER BY MAX(E.`aCL IgA`) DESC LIMIT 1
SELECT COUNT(*) AS count_of_patients FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = '1' AND T2.C4 > 10
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '+' AND (L.RNP = '-' OR L.RNP = '0')
SELECT T1.Birthday FROM Patient AS T1 JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SM IN ('-', '1') AND T2.Thrombosis = 0
SELECT P.ID FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3
SELECT P.ID FROM Examination AS E INNER JOIN Patient AS P ON E.ID = P.ID INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE E.`Examination Date` > '1997-01-01'   AND L.`SC170` IN ('negative', '0')
SELECT      COUNT(*)  FROM      Laboratory AS Lab INNER JOIN      Patient AS Pat ON Lab.ID = Pat.ID INNER JOIN      Examination AS Exam ON Lab.ID = Exam.ID WHERE      Lab.SC170 IN ('negative', '0')      AND Pat.Sex = 'F'      AND Exam.Symptoms IS NULL
SELECT COUNT(DISTINCT P.ID) AS patient_count FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.SSA IN ('0', '-') AND strftime('%Y', P.`First Date`) < '2000'
SELECT P.ID FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE L.SSA NOT IN ('negative', '0') ORDER BY P.`First Date` ASC LIMIT 1
SELECT COUNT(DISTINCT P.ID) FROM Patient AS P JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SLE' AND (L.SSB = '-' OR L.SSB = '0')
SELECT COUNT(*) AS symptom_count FROM Examination AS E INNER JOIN Laboratory AS L ON E.ID = L.ID WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT P.ID) AS COUNT FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.CENTROMEA NOT IN ('-', '+-') AND L.SSB NOT IN ('-', '+-')
SELECT      P.Diagnosis FROM      Patient AS P INNER JOIN      Laboratory AS L ON      P.ID = L.ID WHERE      L.DNA >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T1.Description IS NULL
SELECT COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGG BETWEEN 900 AND 2000 AND T2.Admission = '+'
SELECT CAST(SUM(CASE WHEN L.GOT >= 60 AND P.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.GOT >= 60
SELECT COUNT(*) AS count FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.GOT < 60
SELECT Patient.Birthday FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.GOT >= 60 ORDER BY Patient.Birthday ASC LIMIT 1
SELECT      P.Birthday FROM      Patient AS P INNER JOIN      Laboratory AS L ON P.ID = L.ID WHERE      L.GPT < 60 ORDER BY      L.GPT DESC LIMIT 3
SELECT COUNT(*) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60
SELECT      P.`First Date` AS first_date_recorded FROM      Patient P JOIN      Laboratory L ON      P.ID = L.ID WHERE      L.LDH < 500 ORDER BY      L.LDH DESC LIMIT 1
SELECT P.`First Date` FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.LDH >= 500 ORDER BY P.`First Date` DESC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS l INNER JOIN Patient AS p ON l.ID = p.ID WHERE l.ALP >= 300 AND p.Admission = '+'
SELECT COUNT(*) AS CountFromLabFromPatient  FROM Patient  INNER JOIN Laboratory  ON Patient.ID = Laboratory.ID  WHERE Patient.Admission = '-'  AND Laboratory.ALP < 300
SELECT Patient.Diagnosis FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.TP < 6.0
SELECT COUNT(*) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Diagnosis = 'SJS' AND L.TP > 6.0 AND L.TP < 8.5
SELECT      E.`Examination Date` FROM      Laboratory AS L INNER JOIN      Examination AS E ON      L.ID = E.ID WHERE      L.ALB BETWEEN 3.5 AND 5.5 ORDER BY      L.ALB DESC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE P.Sex = 'M' AND L.ALB BETWEEN 3.5 AND 5.5 AND L.TP BETWEEN 6.0 AND 8.5
SELECT e.`aCL IgG`, e.`aCL IgM`, e.`aCL IgA` FROM Examination AS e INNER JOIN Patient AS p ON e.ID = p.ID INNER JOIN Laboratory AS l ON p.ID = l.ID WHERE p.SEX = 'F' AND l.UA > 6.5 ORDER BY l.UA DESC LIMIT 1
SELECT MAX(E.ANA) AS highest_ana FROM Examination E INNER JOIN Laboratory L ON E.ID = L.ID WHERE L.CRE < 1.5
SELECT      E.ID FROM      Laboratory AS L INNER JOIN      Examination AS E ON      L.ID = E.ID WHERE      L.CRE < 1.5 ORDER BY      E.`aCL IgA` DESC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` >= 2.0 AND T2.`ANA Pattern` LIKE '%P%'
SELECT E.ANA FROM Examination AS E  INNER JOIN Laboratory AS L ON E.ID = L.ID  WHERE L.`T-BIL` < 2.0  ORDER BY L.`T-BIL` DESC  LIMIT 1
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-CHO` >= 250 AND T2.KCT = '-'
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-CHO` < 250 AND T2.`ANA Pattern` = 'P'
SELECT COUNT(*) AS patient_count FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 AND T2.Symptoms IS NOT NULL
SELECT      P.Diagnosis FROM      Patient AS P INNER JOIN      Laboratory AS L ON P.ID = L.ID WHERE      L.TG < 200 ORDER BY      L.TG DESC LIMIT 1
SELECT E.ID FROM Examination AS E INNER JOIN Laboratory AS L ON E.ID = L.ID WHERE E.Thrombosis = 0 AND L.CPK < 250
SELECT COUNT(P.ID) AS count_patients FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID INNER JOIN Examination AS E ON P.ID = E.ID WHERE L.CPK < 250 AND (E.KCT = '+' OR E.RVVT = '+' OR E.LAC = '+')
SELECT Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.GLU > 180 ORDER BY Patient.Birthday ASC LIMIT 1
SELECT COUNT(*) AS count FROM Laboratory AS L INNER JOIN Examination AS E ON L.ID = E.ID WHERE L.GLU < 180 AND E.Thrombosis = 0
SELECT COUNT(P.ID) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Admission = '+' AND L.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(*) FROM Patient AS p JOIN Laboratory AS l ON p.ID = l.ID WHERE p.Diagnosis = 'SLE' AND l.WBC BETWEEN 3.5 AND 9.0
SELECT Patient.ID FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE (Laboratory.RBC <= 3.5 OR Laboratory.RBC >= 6.0) AND Patient.Admission = '-'
SELECT COUNT(P.ID) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE L.PLT BETWEEN 100 AND 400 AND P.Diagnosis IS NOT NULL
SELECT      lab.PLT FROM      Laboratory AS lab INNER JOIN      Patient AS pat ON      lab.ID = pat.ID WHERE      pat.Diagnosis = 'MCTD' AND lab.PLT > 100 AND lab.PLT < 400
SELECT AVG(Laboratory.PT) AS avg_pt FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.PT < 14   AND Patient.Sex = 'M'
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.Thrombosis = 2 OR T1.Thrombosis = 1) AND T2.PT < 14
SELECT major.major_name  FROM member  INNER JOIN major ON member.link_to_major = major.major_id  WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders'
SELECT COUNT(*) AS student_count FROM member AS m INNER JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.college = 'College of Engineering'
SELECT m.first_name, m.last_name FROM member AS m INNER JOIN major AS maj ON m.link_to_major = maj.major_id WHERE maj.department = 'Art and Design Department'
SELECT COUNT(*) AS count_students FROM event AS e INNER JOIN attendance AS a ON e.event_id = a.link_to_event WHERE e.event_name = 'Women''s Soccer'
SELECT m.phone FROM event AS e INNER JOIN attendance AS a ON e.event_id = a.link_to_event INNER JOIN member AS m ON a.link_to_member = m.member_id WHERE e.event_name = 'Women''s Soccer'
SELECT COUNT(*) FROM event AS E INNER JOIN attendance AS A ON E.event_id = A.link_to_event INNER JOIN member AS M ON A.link_to_member = M.member_id WHERE E.event_name = 'Women''s Soccer' AND M.t_shirt_size = 'Medium'
SELECT event.event_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_name ORDER BY COUNT(attendance.link_to_member) DESC LIMIT 1
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT T3.event_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean'
SELECT COUNT(*) FROM member AS m JOIN attendance AS a ON m.member_id = a.link_to_member JOIN event AS e ON a.link_to_event = e.event_id WHERE m.first_name = 'Sacha' AND m.last_name = 'Harrison' AND strftime('%Y', e.event_date) = '2019'
SELECT COUNT(*) AS meeting_count FROM event AS e INNER JOIN attendance AS a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' GROUP BY e.event_id HAVING COUNT(a.link_to_member) > 10
SELECT      event.event_name FROM      event INNER JOIN      attendance ON event.event_id = attendance.link_to_event WHERE      event.type != 'fundraising' GROUP BY      event.event_name HAVING      COUNT(attendance.link_to_member) > 20
SELECT CAST(COUNT(a.link_to_member) AS REAL) / COUNT(DISTINCT e.event_name) AS average_attendance FROM event e INNER JOIN attendance a ON e.event_id = a.link_to_event WHERE e.type = 'Meeting' AND strftime('%Y', e.event_date) = '2020'
SELECT      expense.expense_description FROM      expense INNER JOIN      budget ON expense.link_to_budget = budget.budget_id ORDER BY      expense.cost DESC LIMIT 1
SELECT COUNT(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'
SELECT m.first_name, m.last_name FROM event AS e INNER JOIN attendance AS a ON e.event_id = a.link_to_event INNER JOIN member AS m ON a.link_to_member = m.member_id WHERE e.event_name = 'Laugh Out Loud'
SELECT member.last_name FROM major JOIN member ON major.major_id = member.link_to_major WHERE major.major_name = 'Law and Constitutional Studies'
SELECT      zip_code.county FROM      member INNER JOIN      zip_code ON      member.zip = zip_code.zip_code WHERE      member.first_name = 'Sherri'     AND member.last_name = 'Ramsey'
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt'
SELECT income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President'
SELECT      SUM(b.spent) AS total_spent FROM      budget AS b INNER JOIN      event AS e ON      b.link_to_event = e.event_id WHERE      e.event_name = 'September Meeting'      AND b.category = 'Food'
SELECT      z.city,      z.state FROM      member AS m INNER JOIN      zip_code AS z ON      m.zip = z.zip_code WHERE      m.position = 'President'
SELECT member.first_name, member.last_name FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Illinois'
SELECT SUM(b.spent) FROM budget AS b INNER JOIN event AS e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name = 'September Meeting'
SELECT major.department FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Pierce' OR member.last_name = 'Guidi'
SELECT SUM(b.amount) AS total_budget FROM budget b INNER JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'October Speaker'
SELECT      CASE          WHEN expense.approved = 'true' THEN 'Approved'         ELSE 'Not Approved'     END AS is_expense_approved FROM      event INNER JOIN      budget ON event.event_id = budget.link_to_event INNER JOIN      expense ON budget.budget_id = expense.link_to_budget WHERE      event.event_name = 'October Meeting'     AND expense.expense_date = '2019-10-08'
SELECT AVG(e.cost) AS total_average_cost FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.first_name = 'Elijah'    AND m.last_name = 'Allen'    AND (strftime('%m', e.expense_date) = '09' OR strftime('%m', e.expense_date) = '10')
SELECT (SUM(CASE WHEN CAST(SUBSTR(e.event_date, 1, 4) AS INTEGER) = 2019 THEN B.spent ELSE 0 END) -           SUM(CASE WHEN CAST(SUBSTR(e.event_date, 1, 4) AS INTEGER) = 2020 THEN B.spent ELSE 0 END)) AS spendingDifference  FROM budget AS B INNER JOIN event AS e ON B.link_to_event = e.event_id
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_date = '2019-09-04' AND expense_description = 'Posters'
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'
SELECT COUNT(*) AS num_majors FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT zip_code.county FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher'
SELECT      SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) AS total_burden  FROM      event AS e  INNER JOIN      budget AS b ON      e.event_id = b.link_to_event  WHERE      e.event_name = 'November Meeting'
SELECT SUM(budget.amount) AS total_budget FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker'
SELECT event.status FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Post Cards, Posters' AND expense.expense_date = '2019-08-20'
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason'
SELECT COUNT(m.member_id) AS count FROM member AS m INNER JOIN major AS maj ON m.link_to_major = maj.major_id WHERE maj.major_name = 'Business'   AND m.t_shirt_size = 'Medium'
SELECT      zip_code.type FROM      member INNER JOIN      zip_code ON      member.zip = zip_code.zip_code WHERE      member.first_name = 'Christof'     AND member.last_name = 'Nielson'
SELECT ma.major_name FROM member AS m INNER JOIN major AS ma ON m.link_to_major = ma.major_id WHERE m.position = 'Vice President'
SELECT zip_code.state FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'
SELECT major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'President'
SELECT income.date_received FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues'
SELECT      member.first_name,      member.last_name FROM      member INNER JOIN      income ON member.member_id = income.link_to_member WHERE      income.source = 'Dues' ORDER BY      income.date_received ASC LIMIT 1
SELECT SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.amount ELSE 0 END) > SUM(CASE WHEN e.event_name = 'October Meeting' THEN b.amount ELSE 0 END) AS moreAmountThanOther FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement'
SELECT CAST(SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN e.event_name = 'November Speaker' THEN b.amount ELSE 0 END) AS percent FROM budget AS b INNER JOIN event AS e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker'
SELECT SUM(expense.cost) AS total_cost FROM expense WHERE expense.expense_description = 'Pizza'
SELECT COUNT(*) AS city_count FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT DISTINCT major.department FROM major WHERE major.college = 'College of Humanities and Social Sciences'
SELECT      zip_code.city,      zip_code.county,      zip_code.state FROM      member INNER JOIN      zip_code ON      member.zip = zip_code.zip_code WHERE      member.first_name = 'Amy'      AND member.last_name = 'Firth'
SELECT expense.expense_description FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id ORDER BY budget.remaining ASC LIMIT 1
SELECT member.first_name, member.last_name FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'October Meeting'
SELECT T1.college FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major GROUP BY T1.college ORDER BY COUNT(T2.member_id) DESC LIMIT 1
SELECT major.major_name FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event ORDER BY budget.amount DESC LIMIT 1
SELECT expense.expense_description FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE member.position = 'Vice President'
SELECT COUNT(T2.link_to_member) AS member_count FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer'
SELECT income.date_received FROM member JOIN income ON member.member_id = income.link_to_member WHERE member.first_name = 'Casey' AND member.last_name = 'Mason'
SELECT COUNT(*) FROM member AS T1 JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Maryland'
SELECT COUNT(*) FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T2.phone = '954-555-6240'
SELECT m.first_name, m.last_name FROM member AS m INNER JOIN major AS maj ON m.link_to_major = maj.major_id WHERE maj.department = 'School of Applied Sciences, Technology and Education'
SELECT      e.event_name  FROM      event e  INNER JOIN      budget b ON e.event_id = b.link_to_event  WHERE      e.status = 'Closed'  ORDER BY      b.spent / b.amount DESC  LIMIT 1
SELECT COUNT(DISTINCT member_id) FROM member WHERE position = 'President'
SELECT MAX(spent) AS max_spent FROM budget
SELECT COUNT(*) FROM event WHERE type = 'Meeting' AND SUBSTR(event_date, 1, 4) = '2020'
SELECT SUM(spent) AS total_spent FROM budget WHERE category = 'Food'
SELECT      member.first_name,      member.last_name FROM      member INNER JOIN      attendance  ON      member.member_id = attendance.link_to_member GROUP BY      member.first_name, member.last_name HAVING      COUNT(attendance.link_to_event) > 7
SELECT      member.first_name,      member.last_name FROM      member INNER JOIN      major  ON      member.link_to_major = major.major_id INNER JOIN      attendance  ON      member.member_id = attendance.link_to_member INNER JOIN      event  ON      attendance.link_to_event = event.event_id WHERE      major.major_name = 'Interior Design'      AND event.event_name = 'Community Theater'
SELECT      m.first_name,      m.last_name FROM      zip_code AS z INNER JOIN      member AS m ON      z.zip_code = m.zip WHERE      z.city = 'Georgetown'     AND z.state = 'South Carolina'
SELECT SUM(income.amount) AS total_income FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'
SELECT      m.first_name,      m.last_name FROM      income AS i INNER JOIN      member AS m ON      i.link_to_member = m.member_id WHERE      i.amount > 40
SELECT SUM(e.cost) AS total_expense FROM expense AS e JOIN budget AS b ON e.link_to_budget = b.budget_id JOIN event AS ev ON b.link_to_event = ev.event_id WHERE ev.event_name = 'Yearly Kickoff'
SELECT m.first_name, m.last_name FROM event AS e  INNER JOIN budget AS b ON e.event_id = b.link_to_event  INNER JOIN attendance AS a ON b.link_to_event = a.link_to_event  INNER JOIN member AS m ON a.link_to_member = m.member_id  WHERE e.event_name = 'Yearly Kickoff'
SELECT      member.first_name,      member.last_name,      income.source FROM      income INNER JOIN      member  ON      income.link_to_member = member.member_id ORDER BY      income.amount DESC LIMIT 1
SELECT event.event_name FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.cost = (SELECT MIN(cost) FROM expense) ORDER BY expense.cost ASC LIMIT 1
SELECT (SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.spent ELSE 0 END)) * 100.0 / (SELECT SUM(spent) FROM budget) AS yearly_kickoff_percentage FROM event e JOIN budget b ON e.event_id = b.link_to_event
SELECT CAST(SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) * 1.0 / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS ratio FROM major
SELECT source FROM income WHERE date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY source ORDER BY SUM(amount) DESC LIMIT 1
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching'
SELECT COUNT(member.member_id) AS member_count FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'Community Theater'   AND event.event_date LIKE '2019-%'
SELECT COUNT(*) AS num_events, major.major_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Luisa' AND member.last_name = 'Guidi'
SELECT AVG(b.spent) AS avg_spent FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Food' AND e.status = 'Closed'
SELECT      event.event_name FROM      budget INNER JOIN      event ON      budget.link_to_event = event.event_id WHERE      budget.category = 'Advertisement' ORDER BY      budget.spent DESC LIMIT 1
SELECT 1 FROM member AS m INNER JOIN attendance AS a ON m.member_id = a.link_to_member INNER JOIN event AS e ON a.link_to_event = e.event_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean' AND e.event_name = 'Women''s Soccer'
SELECT CAST(SUM(CASE WHEN e.type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(e.event_id) FROM event e WHERE e.event_date BETWEEN '2019-01-01' AND '2019-12-31'
SELECT expense.cost FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Posters' AND event.event_name = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining < 0 AND event.status = 'Closed' ORDER BY budget.remaining ASC LIMIT 1
SELECT      e.expense_description,      SUM(e.cost) AS total_value FROM      expense e INNER JOIN      budget b ON e.link_to_budget = b.budget_id INNER JOIN      event evt ON b.link_to_event = evt.event_id WHERE      evt.event_name = 'October Meeting'      AND e.approved = 'true' GROUP BY      e.expense_description
SELECT      b.category,      SUM(b.amount) AS amount_budgeted FROM      event AS e INNER JOIN      budget AS b  ON      e.event_id = b.link_to_event WHERE      e.event_name = 'April Speaker' GROUP BY      b.category ORDER BY      amount_budgeted ASC
SELECT amount FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3
SELECT SUM(cost) AS total_cost FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'
SELECT      member.first_name,      member.last_name,      SUM(expense.cost) AS total_cost FROM      member INNER JOIN      expense ON      member.member_id = expense.link_to_member WHERE      member.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY      member.first_name,      member.last_name
SELECT expense.expense_description FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE member.first_name = 'Sacha'   AND member.last_name = 'Harrison'
SELECT e.expense_description FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE m.t_shirt_size = 'X-Large'
SELECT member.zip FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.cost < 50
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen'
SELECT m.position FROM member AS m INNER JOIN major AS maj ON m.link_to_major = maj.major_id WHERE maj.major_name = 'Business'
SELECT COUNT(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'
SELECT DISTINCT event.type FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.remaining > 30
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215'
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_date = '2020-03-24T12:00:00'
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT (CAST(COUNT(CASE WHEN major.major_name = 'Business' THEN 1 END) AS REAL) * 100.0) / COUNT(member.member_id)  FROM member  INNER JOIN major  ON member.link_to_major = major.major_id
SELECT b.category FROM event AS e INNER JOIN budget AS b ON e.event_id = b.link_to_event WHERE e.location = 'MU 215'
SELECT COUNT(*)  FROM income  WHERE amount = 50
SELECT COUNT(*) FROM member WHERE t_shirt_size = 'X-Large' AND position = 'Member'
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'
SELECT      member.last_name,      major.department,      major.college FROM      member INNER JOIN      major ON      member.link_to_major = major.major_id WHERE      major.major_name = 'Environmental Engineering'
SELECT      b.category FROM      budget AS b INNER JOIN      event AS e ON      b.link_to_event = e.event_id WHERE      e.location = 'MU 215'     AND e.type = 'Guest Speaker'     AND b.spent = 0
SELECT zip_code.city, zip_code.state FROM member INNER JOIN major ON member.link_to_major = major.major_id INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE major.department = 'Electrical and Computer Engineering Department' AND member.position = 'Member'
SELECT DISTINCT e.event_name FROM event e INNER JOIN attendance a ON e.event_id = a.link_to_event INNER JOIN member m ON a.link_to_member = m.member_id WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.'
SELECT      member.last_name,      member.position  FROM      expense  INNER JOIN      member  ON      expense.link_to_member = member.member_id  WHERE      expense.expense_description = 'Pizza'  AND      expense.expense_date = '2019-09-10'
SELECT      member.last_name FROM      event INNER JOIN      attendance ON event.event_id = attendance.link_to_event INNER JOIN      member ON attendance.link_to_member = member.member_id WHERE      event.event_name = 'Women''s Soccer'   AND member.position = 'Member'
SELECT CAST(SUM(CASE WHEN income.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE member.t_shirt_size = 'Medium'
SELECT DISTINCT state FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND city = 'San Juan' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'
SELECT DISTINCT T2.link_to_event FROM expense AS T1 INNER JOIN attendance AS T2 ON T1.link_to_member = T2.link_to_member WHERE T1.cost > 50
SELECT      T1.first_name,      T1.last_name,      T2.link_to_event  FROM      member AS T1 INNER JOIN      attendance AS T2  ON      T1.member_id = T2.link_to_member  INNER JOIN      expense AS T3  ON      T1.member_id = T3.link_to_member  WHERE      T3.approved = 'true'      AND T3.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Katy'
SELECT member.phone FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE major.college = 'College of Agriculture and Applied Sciences' AND major.major_name = 'Business'
SELECT m.email FROM expense AS e JOIN member AS m ON e.link_to_member = m.member_id WHERE e.expense_date BETWEEN '2019-09-10' AND '2019-11-19'   AND e.cost > 20
SELECT COUNT(*) FROM member AS m INNER JOIN major AS c ON m.link_to_major = c.major_id WHERE c.major_name LIKE '%education%' AND c.college = 'College of Education & Human Services' AND m.position = 'Member'
SELECT CAST(SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event.event_id) AS percentage FROM event INNER JOIN budget b ON event.event_id = b.link_to_event
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expense GROUP BY expense_description HAVING AVG(cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(COUNT(CASE WHEN type = 'PO Box' THEN 1 END) AS FLOAT) * 100.0 / COUNT(*) AS percentage FROM zip_code
SELECT event.event_name, event.location FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.remaining > 0
SELECT      event.event_name,      event.event_date FROM      event  INNER JOIN      budget  ON      event.event_id = budget.link_to_event  INNER JOIN      expense  ON      budget.budget_id = expense.link_to_budget  WHERE      expense.expense_description = 'Pizza'      AND expense.cost > 50      AND expense.cost < 100
SELECT      m.first_name,      m.last_name,      major.major_name FROM      member m INNER JOIN      expense e ON      m.member_id = e.link_to_member INNER JOIN      major ON      m.link_to_major = major.major_id WHERE      e.cost > 100
SELECT      z.city,      z.county FROM      income INNER JOIN      event ON income.link_to_member = event.event_id INNER JOIN      zip_code z ON event.location = z.zip_code GROUP BY      z.city, z.county HAVING      COUNT(income.amount) > 40
SELECT      m.first_name,      m.last_name FROM      member m INNER JOIN      expense e ON      m.member_id = e.link_to_member GROUP BY      m.member_id HAVING      COUNT(e.expense_id) > 1 ORDER BY      SUM(e.cost) DESC LIMIT 1
SELECT AVG(e.cost) AS average_amount_paid FROM expense e INNER JOIN member m ON e.link_to_member = m.member_id WHERE m.position != 'Member'
SELECT e.event_name FROM budget AS b INNER JOIN event AS e ON b.link_to_event = e.event_id INNER JOIN expense AS ex ON ex.link_to_budget = b.budget_id WHERE b.category = 'Parking' GROUP BY e.event_name HAVING SUM(ex.cost) / COUNT(b.budget_id) < (     SELECT AVG(cost) FROM expense WHERE category = 'Parking' )
SELECT CAST(SUM(T1.cost) AS REAL) * 100.0 / SUM(T2.spent) AS percentage FROM expense T1 INNER JOIN budget T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event e ON T2.link_to_event = e.event_id WHERE e.type = 'Meeting'
SELECT e.expense_description FROM expense AS e INNER JOIN budget AS b ON e.link_to_budget = b.budget_id WHERE e.expense_description = 'Water, chips, cookies' ORDER BY e.cost DESC LIMIT 1
SELECT      m.first_name,      m.last_name FROM      member m INNER JOIN      expense e ON      m.member_id = e.link_to_member GROUP BY      m.first_name,      m.last_name ORDER BY      SUM(e.cost) DESC LIMIT 5
SELECT      member.first_name,      member.last_name,      member.phone FROM      member INNER JOIN      expense  ON      member.member_id = expense.link_to_member WHERE      expense.cost > (SELECT AVG(cost) FROM expense)
SELECT      (SUM(CASE WHEN z.state = 'New Jersey' THEN 1 ELSE 0 END) * 100.0) /      (COUNT(*) * 1.0) -      (SUM(CASE WHEN z.state = 'Vermont' THEN 1 ELSE 0 END) * 100.0)  FROM      member m INNER JOIN      zip_code z ON m.zip = z.zip_code
SELECT major.major_name, major.department FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT      m.first_name,      m.last_name,      e.cost FROM      member m INNER JOIN      expense e ON      m.member_id = e.link_to_member WHERE      e.expense_description = 'Water, Veggie tray, supplies'
SELECT      member.last_name,      member.phone FROM      major INNER JOIN      member  ON      major.major_id = member.link_to_major WHERE      major.major_name = 'Elementary Education'
SELECT budget.category, budget.amount FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Food'
SELECT      member.first_name,      member.last_name,      income.amount FROM      member INNER JOIN      income  ON      member.member_id = income.link_to_member WHERE      income.date_received = '2019-09-09'
SELECT budget.category FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters'
SELECT member.first_name, member.last_name, major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary'
SELECT SUM(CAST(b.spent AS REAL)) AS total_amount_spent, e.event_name FROM budget AS b INNER JOIN event AS e ON b.link_to_event = e.event_id WHERE b.category = 'Speaker Gifts'
SELECT zip_code.city FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT member.first_name, member.last_name, member.position FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina' AND member.zip = 28092
SELECT COUNT(*) AS Number_of_Gas_Stations FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT CAST(SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN c.Currency = 'CZK' THEN 1 ELSE 0 END) AS Ratio FROM customers c
SELECT customers.CustomerID FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'LAM' AND yearmonth.`Date` BETWEEN '201201' AND '201212' GROUP BY customers.CustomerID ORDER BY SUM(yearmonth.Consumption) ASC LIMIT 1
SELECT CAST(AVG(T1.Consumption) AS REAL) / 12.0 AS Average_Yearly_Consumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.`Date` LIKE '2013%' AND T2.Segment = 'SME'
SELECT      customers.CustomerID FROM      customers INNER JOIN      yearmonth ON      customers.CustomerID = yearmonth.CustomerID WHERE      customers.Currency = 'CZK' AND      yearmonth.`Date` BETWEEN '201101' AND '201112' GROUP BY      customers.CustomerID ORDER BY      SUM(yearmonth.Consumption) DESC LIMIT 1
SELECT COUNT(T1.CustomerID) AS count_customers FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.`Date` BETWEEN '201201' AND '201212' AND T2.Segment = 'KAM' AND T1.Consumption < 30000
SELECT SUM(CASE WHEN customers.Currency = 'CZK' THEN yearmonth.Consumption ELSE 0 END) - SUM(CASE WHEN customers.Currency = 'EUR' THEN yearmonth.Consumption ELSE 0 END) AS CurrencyDifference FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE yearmonth.Date BETWEEN '201201' AND '201212'
SELECT      strftime('%Y', t.`Date`) AS year FROM      transactions_1k t INNER JOIN      customers c ON      t.CustomerID = c.CustomerID WHERE      c.Currency = 'EUR' GROUP BY      strftime('%Y', t.`Date`) ORDER BY      SUM(t.Amount) DESC LIMIT 1
SELECT      customers.Segment FROM      customers INNER JOIN      yearmonth ON      customers.CustomerID = yearmonth.CustomerID GROUP BY      customers.Segment ORDER BY      SUM(yearmonth.Consumption) ASC LIMIT 1
SELECT SUBSTR(yearmonth.`Date`, 1, 4) AS Year FROM yearmonth INNER JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'CZK' GROUP BY SUBSTR(yearmonth.`Date`, 1, 4) ORDER BY SUM(yearmonth.Consumption) DESC LIMIT 1
SELECT      y.`Date` AS peak_month FROM      yearmonth y INNER JOIN      customers c ON y.CustomerID = c.CustomerID WHERE      c.Segment = 'SME'     AND y.`Date` BETWEEN '201301' AND '201312' GROUP BY      y.`Date` ORDER BY      SUM(y.Consumption) DESC LIMIT 1
SELECT      AVG(CASE WHEN customers.Segment = 'SME' THEN yearmonth.Consumption END)      - AVG(CASE WHEN customers.Segment = 'LAM' THEN yearmonth.Consumption END) AS Difference_SME_LAM,     AVG(CASE WHEN customers.Segment = 'LAM' THEN yearmonth.Consumption END)      - AVG(CASE WHEN customers.Segment = 'KAM' THEN yearmonth.Consumption END) AS Difference_LAM_KAM,     AVG(CASE WHEN customers.Segment = 'KAM' THEN yearmonth.Consumption END)      - AVG(CASE WHEN customers.Segment = 'SME' THEN yearmonth.Consumption END) AS Difference_KAM_SME FROM      yearmonth JOIN      customers ON yearmonth.CustomerID = customers.CustomerID WHERE      SUBSTR(yearmonth.`Date`, 1, 4) = '2013'
SELECT      customers.Segment,      (SUM(yearmonth.Consumption) - SUM(yearmonth_2012.Consumption)) * 100.0 / SUM(yearmonth_2012.Consumption) AS PercentageIncrease FROM      customers INNER JOIN      yearmonth ON customers.CustomerID = yearmonth.CustomerID INNER JOIN      yearmonth AS yearmonth_2012 ON customers.CustomerID = yearmonth_2012.CustomerID WHERE      customers.Currency = 'EUR'     AND yearmonth_2012.Date LIKE '2012%'     AND yearmonth.Date LIKE '2013%' GROUP BY      customers.Segment
SELECT SUM(yearmonth.Consumption) AS total_consumption FROM yearmonth INNER JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.CustomerID = 6 AND yearmonth.`Date` BETWEEN '201308' AND '201311'
SELECT (SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Discount') - (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK' AND Segment = 'Discount') AS discount_difference
SELECT (SUM(CASE WHEN CustomerID = 7 THEN Consumption ELSE 0 END) - SUM(CASE WHEN CustomerID = 5 THEN Consumption ELSE 0 END)) AS ConsumptionDifference FROM yearmonth WHERE Date LIKE '201304%'
SELECT      SUM(CASE WHEN c.Currency = 'CZK' THEN t.Amount ELSE 0 END) -      SUM(CASE WHEN c.Currency = 'EUR' THEN t.Amount ELSE 0 END) AS AmountDifference FROM      customers AS c INNER JOIN      transactions_1k AS t ON      c.CustomerID = t.CustomerID WHERE      c.Segment = 'SME'
SELECT c.CustomerID FROM customers c INNER JOIN yearmonth y ON c.CustomerID = y.CustomerID WHERE c.Segment = 'LAM'   AND c.Currency = 'EUR'   AND y.`Date` LIKE '201310%' ORDER BY y.Consumption DESC LIMIT 1
SELECT customers.CustomerID, SUM(yearmonth.Consumption) AS TotalConsumption FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'KAM' GROUP BY customers.CustomerID ORDER BY TotalConsumption DESC LIMIT 1
SELECT SUM(yearmonth.Consumption) FROM yearmonth INNER JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE yearmonth.`Date` LIKE '201305%' AND customers.Segment = 'KAM'
SELECT      (SUM(CASE WHEN transactions_1k.Amount > 46.73 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM      customers INNER JOIN      transactions_1k ON customers.CustomerID = transactions_1k.CustomerID WHERE      customers.Segment = 'LAM'
SELECT Country, COUNT(*) AS NumOfGasStations FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY NumOfGasStations DESC
SELECT CAST(SUM(CASE WHEN customers.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS KAM_euro_percentage FROM customers WHERE customers.Segment = 'KAM'
SELECT CAST(COUNT(CASE WHEN ym.Consumption > 528.3 THEN 1 END) AS REAL) * 100.0 / COUNT(*) AS percentage_customer_consumption FROM yearmonth AS ym WHERE ym.`Date` LIKE '201202%'
SELECT (SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS PremiumPercentage FROM gasstations WHERE Country = 'SVK'
SELECT      y.CustomerID FROM      yearmonth y INNER JOIN      transactions_1k t ON y.CustomerID = t.CustomerID WHERE      y.`Date` LIKE '201309%' GROUP BY      y.CustomerID ORDER BY      SUM(t.Amount) DESC LIMIT 1
SELECT      customers.Segment FROM      yearmonth INNER JOIN      customers ON      yearmonth.CustomerID = customers.CustomerID WHERE      yearmonth.`Date` LIKE '201309%' GROUP BY      customers.Segment ORDER BY      SUM(yearmonth.Consumption) ASC LIMIT 1
SELECT customers.CustomerID FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE yearmonth.`Date` LIKE '201206%' AND customers.Segment = 'SME' GROUP BY customers.CustomerID ORDER BY SUM(yearmonth.Consumption) ASC LIMIT 1
SELECT Consumption FROM yearmonth WHERE SUBSTR(Date, 1, 4) = '2012' ORDER BY Consumption DESC LIMIT 1
SELECT MAX(monthly_consumption) AS max_monthly_consumption FROM (     SELECT          SUM(Consumption) / 12 AS monthly_consumption     FROM yearmonth AS T1     INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID     WHERE T2.Currency = 'EUR'     GROUP BY T1.CustomerID )
SELECT products.Description FROM transactions_1k INNER JOIN yearmonth ON transactions_1k.CustomerID = yearmonth.CustomerID INNER JOIN products ON transactions_1k.ProductID = products.ProductID WHERE yearmonth.`Date` LIKE '201309%'
SELECT DISTINCT g.Country FROM yearmonth AS y JOIN gasstations AS g ON y.CustomerID = g.GasStationID WHERE y.Date LIKE '201306%'
SELECT DISTINCT gasstations.ChainID FROM gasstations INNER JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR'
SELECT products.Description FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID INNER JOIN products ON transactions_1k.ProductID = products.ProductID WHERE customers.Currency = 'EUR'
SELECT AVG(t1.Price) AS AveragePrice FROM transactions_1k AS t1 WHERE t1.`Date` LIKE '2012-01%'
SELECT COUNT(c.CustomerID) AS TotalCustomers FROM customers AS c INNER JOIN yearmonth AS y ON c.CustomerID = y.CustomerID WHERE c.Currency = 'EUR' AND y.Consumption > 1000
SELECT products.Description FROM transactions_1k INNER JOIN products ON transactions_1k.ProductID = products.ProductID INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE'
SELECT DISTINCT t.`Time` FROM transactions_1k t INNER JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.ChainID = 11
SELECT COUNT(DISTINCT transactions_1k.TransactionID) AS total_transactions FROM gasstations INNER JOIN transactions_1k ON gasstations.GasStationID = transactions_1k.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000
SELECT COUNT(*) AS TotalTransactions FROM transactions_1k AS T INNER JOIN gasstations AS G ON T.GasStationID = G.GasStationID WHERE G.Country = 'CZE' AND T.Date > '2012-01-01'
SELECT AVG(t.Price) AS AverageTotalPrice FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'
SELECT AVG(T1.Price) AS AverageTotalPrice FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'EUR'
SELECT      customers.CustomerID FROM      transactions_1k INNER JOIN      customers ON      transactions_1k.CustomerID = customers.CustomerID WHERE      transactions_1k.`Date` = '2012-08-25' GROUP BY      customers.CustomerID ORDER BY      SUM(transactions_1k.Amount) DESC LIMIT 1
SELECT gasstations.Country FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.Date = '2012-08-25' ORDER BY transactions_1k.CustomerID ASC LIMIT 1
SELECT customers.Currency FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.Date = '2012-08-24'   AND transactions_1k.`Time` = '16:25:00'   AND customers.Segment = 'SME'
SELECT customers.Segment FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.Date = '2012-08-23' AND transactions_1k.Time = '21:20:00'
SELECT COUNT(*) AS transaction_count FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.Date LIKE '2012-08-26' AND transactions_1k.Time < '13:00:00' AND customers.Currency = 'CZK'
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.`Date` = '2012-08-24' AND T1.`Time` = '12:42:00'
SELECT ProductID FROM transactions_1k WHERE `Date` = '2012-08-23' AND `Time` = '21:20:00'
SELECT      SUM(y.Consumption) AS TotalExpense,      y.Date AS Date,      t.Amount AS Expense FROM      transactions_1k AS t INNER JOIN      yearmonth AS y  ON      t.CustomerID = y.CustomerID WHERE      t.Amount = 124.05      AND t.Date = '2012-08-24'     AND y.`Date` LIKE '2012-01-%'
SELECT COUNT(*) AS TotalTransactions FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-26' AND T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T2.Country = 'CZE'
SELECT c.Currency FROM yearmonth AS y JOIN customers AS c ON y.CustomerID = c.CustomerID WHERE y.`Date` LIKE '201306%' GROUP BY y.CustomerID HAVING SUM(y.Consumption) > 214582.17
SELECT customers.Currency FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.CardID = 667467
SELECT customers.Currency FROM transactions_1k INNER JOIN products ON transactions_1k.ProductID = products.ProductID INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.Date = '2012-08-24' AND products.Description = 'Nafta' AND transactions_1k.Price = 548.4
SELECT CAST(SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(tc.TransactionID) AS percentage FROM customers AS c JOIN transactions_1k AS tc ON c.CustomerID = tc.CustomerID WHERE tc.Date LIKE '2012-08-25'
SELECT      CAST(         (SUM(CASE WHEN ym.`Date` LIKE '2012%' THEN ym.Consumption ELSE 0 END) -           SUM(CASE WHEN ym.`Date` LIKE '2013%' THEN ym.Consumption ELSE 0 END)) AS REAL     ) / SUM(CASE WHEN ym.`Date` LIKE '2012%' THEN ym.Consumption ELSE 0 END) AS ConsumptionDecreaseRate     FROM      yearmonth ym     INNER JOIN      transactions_1k t ON      ym.CustomerID = t.CustomerID     WHERE      t.`Date` = '2012-08-25'       AND ym.`Date` LIKE '2012%'        AND ym.`Date` LIKE '2013%'
SELECT      gst.GasStationID FROM      transactions_1k AS t INNER JOIN      gasstations AS gst ON      t.GasStationID = gst.GasStationID GROUP BY      t.GasStationID ORDER BY      SUM(t.Amount) DESC LIMIT 1
SELECT      (SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Percentage_Premium FROM      gasstations WHERE      Country = 'SVK'
SELECT SUM(t.Amount) AS TotalSpentThisMonth FROM transactions_1k t INNER JOIN yearmonth y ON t.CustomerID = y.CustomerID WHERE t.CustomerID = 38508 AND y.Date LIKE '201201%'
SELECT      p.Description FROM      transactions_1k AS t INNER JOIN      products AS p ON      t.ProductID = p.ProductID GROUP BY      p.ProductID, p.Description ORDER BY      SUM(t.Amount) DESC LIMIT 5
SELECT c.CustomerID, SUM(tx.Price) / SUM(tx.Amount) AS AveragePricePerItem, c.Currency FROM transactions_1k AS tx INNER JOIN customers AS c ON tx.CustomerID = c.CustomerID GROUP BY c.CustomerID, c.Currency ORDER BY SUM(tx.Amount) DESC LIMIT 1
SELECT      gasstations.Country FROM      transactions_1k INNER JOIN      gasstations ON      transactions_1k.GasStationID = gasstations.GasStationID WHERE      transactions_1k.ProductID = 2 ORDER BY      transactions_1k.Price DESC LIMIT 1
