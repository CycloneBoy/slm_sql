SELECT      MAX(frp.`Free Meal Count (K-12)`) FROM      frpm AS frp INNER JOIN      schools AS sch ON frp.CDSCode = sch.CDSCode WHERE      sch.`County` = 'Alameda County'
SELECT frpm.`Free Meal Count (Ages 5-17)` AS eligible_free_rate FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`Enrollment (Ages 5-17)` > 0 ORDER BY frpm.`Free Meal Count (Ages 5-17)` LIMIT 3
SELECT s.Zip FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter School (Y/N)` = 1 AND s.County = 'Fresno'
SELECT s.MailStreet FROM frpm f JOIN schools s ON f.CDSCode = s.CDSCode ORDER BY f.`FRPM Count (K-12)` DESC LIMIT 1
SELECT T2.Phone FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T2.OpenDate > '2000-01-01'
SELECT COUNT(*) FROM satscores AS s INNER JOIN schools AS sch ON s.cds = sch.CDSCode WHERE s.AvgScrMath > 400 AND sch.Virtual = 'F'
SELECT s.School FROM schools s INNER JOIN satscores st ON s.CDSCode = st.cds WHERE st.NumTstTakr > 500 AND s.Magnet = 1
SELECT s.Phone FROM schools s INNER JOIN satscores sc ON s.CDSCode = sc.cds WHERE sc.AvgScrRead > 1500 AND sc.AvgScrMath > 1500 ORDER BY sc.NumTstTakr DESC LIMIT 1
SELECT NumTstTakr FROM satscores WHERE NumTstTakr = (SELECT MAX(NumTstTakr) FROM satscores)
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.Charter = 1
SELECT frpm.`FRPM Count (Ages 5-17)` FROM frpm JOIN satscores ON frpm.CDSCode = satscores.cds ORDER BY satscores.AvgScrRead DESC LIMIT 1
SELECT      frpm.CDSCode FROM      frpm GROUP BY      frpm.CDSCode HAVING      SUM(frpm.`Enrollment (K-12)`) + SUM(frpm.`Enrollment (Ages 5-17)`) > 500
SELECT MAX(NumGE1500 / NumTstTakr) AS max_eligible_free_rate FROM satscores INNER JOIN frpm ON satscores.cds = frpm.CDSCode WHERE frpm.`Charter School (Y/N)` = 1   AND satscores.NumGE1500 IS NOT NULL   AND satscores.NumTstTakr IS NOT NULL
SELECT schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.CDSCode ORDER BY (satscores.NumGE1500 / satscores.NumTstTakr) DESC LIMIT 3
SELECT frpm.CDSCode FROM frpm ORDER BY frpm.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT schools.District FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.StatusType = 'Active' ORDER BY satscores.AvgScrRead DESC LIMIT 1
SELECT COUNT(*) AS merged_school_count FROM frpm rp JOIN schools s ON rp.CDSCode = s.CDSCode WHERE s.County = 'Alameda' AND rp.`Charter School (Y/N)` = 0
SELECT      FRPM.`Charter School Number` FROM      frpm WHERE      FRPM.`Enrollment (Ages 5-17)` > 499 ORDER BY      FRPM.`Enrollment (Ages 5-17)` DESC
SELECT COUNT(*) AS number_of_schools FROM schools s INNER JOIN satscores sc ON s.CDSCode = sc.cds WHERE s.FundingType = 'Directly funded' AND sc.NumTstTakr <= 250
SELECT schools.Phone FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds WHERE satscores.AvgScrMath > 0 ORDER BY satscores.AvgScrMath DESC LIMIT 1
SELECT COUNT(S.CDSCode) FROM frpm AS F INNER JOIN schools AS S ON F.CDSCode = S.CDSCode WHERE S.County = 'Amador' AND F.`Low Grade` = 9 AND F.`High Grade` = 12
SELECT COUNT(*) FROM frpm AS fr INNER JOIN schools AS s ON fr.CDSCode = s.CDSCode WHERE s.County = 'Los Angeles' AND fr.`Free Meal Count (K-12)` > 500 AND fr.`Free Meal Count (K-12)` < 700
SELECT      T1.`School` FROM      schools AS T1 INNER JOIN      frpm AS T2 ON      T1.CDSCode = T2.CDSCode WHERE      T1.County = 'Contra Costa' ORDER BY      T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT      s.School,      s.Street  FROM      frpm AS f  INNER JOIN      schools AS s  ON      f.CDSCode = s.CDSCode  WHERE      (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > 30
SELECT      s.School FROM      frpm AS f INNER JOIN      schools AS s  ON      f.CDSCode = s.CDSCode WHERE      f.`Free Meal Count (K-12)` > 0.1      AND f.`Enrollment (K-12)` >= 1500
SELECT      s.FundingType  FROM      satscores AS ss  INNER JOIN      schools AS s  ON      ss.cds = s.CDSCode  WHERE      s.County = 'Riverside'  GROUP BY      s.FundingType  HAVING      AVG(ss.AvgScrMath) > 400
SELECT      s.School,      s.Street,      s.City,      s.State,      s.Zip FROM      schools s INNER JOIN      satscores sc ON s.CDSCode = sc.cds WHERE      s.State = 'CA'      AND s.County = 'Monterey'      AND sc.NumTstTakr > 800
SELECT      schools.`School`,      AVG(frpm.`Enrollment (Ages 5-17)`) AS AverageScoresInWriting,     schools.`Phone` FROM      schools INNER JOIN      frpm ON schools.CDSCode = frpm.CDSCode WHERE      schools.`OpenDate` > '1991-01-01' OR schools.`ClosedDate` < '2000-12-31' GROUP BY      schools.`School` ORDER BY      AverageScoresInWriting DESC
SELECT      s.School,      s.DOC AS DOCType FROM      frpm f JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.`Charter School (Y/N)` = 0  GROUP BY      s.School,      s.DOC HAVING      ABS(f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (         SELECT              AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`)          FROM              frpm f2          WHERE              f2.`Charter School (Y/N)` = 0      )
SELECT schools.OpenDate FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds ORDER BY satscores.enroll12 DESC LIMIT 1
SELECT      T2.City FROM      schools AS T2 INNER JOIN      satscores AS T3 ON T2.CDSCode = T3.cds WHERE      T3.NumTstTakr <= 12 ORDER BY      T3.NumTstTakr ASC LIMIT 5
SELECT      f.`Free Meal Count (K-12)` / f.`Enrollment (K-12)` FROM      frpm AS f ORDER BY      f.`Enrollment (K-12)` DESC LIMIT 1
SELECT     frpm.`Frpm Count (K-12)` FROM     frpm INNER JOIN     schools ON     frpm.CDSCode = schools.CDSCode WHERE     schools.DOC = '66'     AND     schools.SOC = 'K-12' ORDER BY     frpm.`Frpm Count (K-12)` DESC LIMIT 5
SELECT schools.Website FROM schools INNER JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE frpm.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT      frpm.`Free Meal Count (Ages 5-17)`,      frpm.`Enrollment (Ages 5-17)` FROM      frpm JOIN      schools ON      frpm.CDSCode = schools.CDSCode WHERE      schools.AdmFName1 = 'Kacey'      AND schools.AdmLName1 = 'Gibson'
SELECT      schools.AdmEmail1 AS AdministratorEmail FROM      frpm JOIN      schools ON frpm.CDSCode = schools.CDSCode WHERE      frpm.`Charter School (Y/N)` = 1 ORDER BY      frpm.`Enrollment (K-12)` ASC LIMIT 1
SELECT      schools.AdmFName1,      schools.AdmLName1 FROM      schools INNER JOIN      satscores ON schools.CDSCode = satscores.cds WHERE      satscores.NumGE1500 >= 1500 ORDER BY      satscores.NumGE1500 DESC LIMIT 1
SELECT      s.Street,     s.City,     s.Zip,     s.State FROM      satscores AS ss INNER JOIN      schools AS s ON ss.cds = s.CDSCode ORDER BY      (ss.NumGE1500 / ss.NumTstTakr) ASC LIMIT 1
SELECT T1.Website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Los Angeles' AND T2.NumTstTakr BETWEEN 2000 AND 3000
SELECT AVG(satscores.NumTstTakr) AS AverageTestTakers FROM schools INNER JOIN satscores ON schools.CDSCode = satscores.cds WHERE schools.County = 'Fresno'   AND schools.OpenDate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.District = 'Fresno Unified' ORDER BY T2.AvgScrRead ASC LIMIT 1
SELECT      sch.School FROM      schools sch INNER JOIN      satscores scrs ON sch.CDSCode = scrs.cds WHERE      sch.Virtual = 'F' ORDER BY      scrs.AvgScrRead DESC LIMIT 5
SELECT s.EdOpsName FROM satscores AS ss JOIN schools AS s ON ss.cds = s.CDSCode ORDER BY ss.AvgScrMath DESC LIMIT 1
SELECT AVG(S.AvgScrMath + S.AvgScrRead + S.AvgScrWrite) AS avg_math_score FROM satscores S WHERE S.AvgScrMath = ( SELECT MIN(AvgScrMath) FROM satscores )
SELECT AVG(s.AvgScrWrite) AS AverageWritingScore FROM satscores s WHERE s.NumTstTakr = (     SELECT MAX(s2.NumTstTakr) FROM satscores s2 )
SELECT      s.School,      AVG(sa.AvgScrWrite) AS AverageWritingScore FROM      schools AS s INNER JOIN      satscores AS sa ON s.CDSCode = sa.cds WHERE      s.AdmFName1 = 'Ricci' AND      s.AdmLName1 = 'Ulrich' GROUP BY      s.School
SELECT      s.School  FROM      schools s  INNER JOIN      satscores sc  ON      s.CDSCode = sc.cds  WHERE      s.DOC = 31  ORDER BY      sc.enroll12 DESC  LIMIT 1
SELECT CAST(COUNT(CASE WHEN OpenDate BETWEEN '2015-01-01' AND '2080-12-31' THEN 1 ELSE NULL END) AS REAL) / 12 AS AverageOpenersPerMonth FROM schools WHERE County = 'Alameda' AND DOC = 52
SELECT (CAST(SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END)) AS unified_to_elementary_ratio FROM schools sc INNER JOIN frpm frp ON sc.CDSCode = frp.CDSCode WHERE sc.County = 'Orange'
SELECT      County,      ClosedDate FROM      schools  WHERE      StatusType = 'Closed'  GROUP BY      County  ORDER BY      COUNT(*) DESC  LIMIT 1
SELECT s.MailStreet, s.School FROM schools AS s INNER JOIN satscores AS sa ON s.CDSCode = sa.cds ORDER BY sa.AvgScrMath DESC LIMIT 1
SELECT s.MailStreet, s.School FROM schools s INNER JOIN satscores sats ON s.CDSCode = sats.cds ORDER BY sats.AvgScrRead ASC LIMIT 1
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.City = 'Lakeport' AND (T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite) >= 1500
SELECT COUNT(*) AS NumberOfTestTakers FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.MailCity = 'Fresno'
SELECT School, MailZip FROM schools WHERE AdmFName1 = 'Avetik' AND AdmLName1 = 'Atoian'
SELECT CAST(SUM(CASE WHEN schools.County = 'California' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN schools.County = 'California' THEN 1 ELSE 0 END) AS ratio FROM schools INNER JOIN frpm ON schools.CDSCode = frpm.CDSCode
SELECT COUNT(*) FROM schools WHERE City = 'San Joaquin' AND StatusType = 'Active'
SELECT s.Phone, s.Ext FROM schools s INNER JOIN satscores sc ON s.CDSCode = sc.cds ORDER BY sc.AvgScrWrite DESC LIMIT 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE AdmFName1 = 'Mike' AND AdmLName1 = 'Larson'    OR AdmFName1 = 'Dante' AND AdmLName1 = 'Larson'
SELECT s.Website FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode WHERE s.Virtual = 'P' AND s.Charter = 1 AND s.County = 'San Joaquin'
SELECT COUNT(*) FROM schools JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE schools.DOC = 52 AND schools.Charter = 1 AND schools.City = 'Hickman'
SELECT COUNT(*) AS NonCharteredSchools FROM schools INNER JOIN frpm ON schools.CDSCode = frpm.CDSCode WHERE Charter = 0 AND schools.County = 'Los Angeles' AND ((frpm.`Free Meal Count (K-12)`) * 100.0 / frpm.`Enrollment (K-12)`) < 0.18
SELECT      s.AdmFName1,      s.AdmLName1,      s.City FROM      schools s WHERE      s.Charter = 1      AND s.CharterNum = '00D2'
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'
SELECT (SUM(CASE WHEN s.fundingtype = 'Locally funded' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Ratio FROM frpm fr INNER JOIN schools s ON fr.CDSCode = s.CDSCode WHERE s.County = 'Santa Clara'
SELECT COUNT(*) FROM schools WHERE FundingType = 'Directly funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT SUM(CASE WHEN FundingType = 'Community College District' THEN 1 ELSE 0 END) AS total_closures FROM schools WHERE City = 'San Francisco' AND strftime('%Y', ClosedDate) = '1989'
SELECT s.County FROM schools s WHERE s.SOC = 11 AND s.ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY s.County ORDER BY COUNT(*) DESC LIMIT 1
SELECT DOC FROM schools WHERE SOC = 31 AND SOCType = 'State Special Schools'
SELECT COUNT(*) FROM schools WHERE County = 'Alpine' AND StatusType IN ('Closed', 'Active')
SELECT District FROM schools WHERE Magnet = 0 AND City = 'Fresno'
SELECT COUNT(*) AS NumberOfStudents FROM frpm AS fr INNER JOIN schools AS s ON fr.CDSCode = s.CDSCode WHERE fr.`Enrollment (Ages 5-17)` > 5 AND fr.`Academic Year` = '2014-2015' AND s.`City` = 'Fremont' AND s.`EdOpsCode` = 'SSS'
SELECT Frpm.`Free Meal Count (Ages 5-17)` FROM Frpm INNER JOIN schools ON Frpm.CDSCode = schools.CDSCode WHERE schools.MailStreet = 'PO Box 1040' AND schools.EdOpsCode = 'Youth Authority School'
SELECT      frpm.`Low Grade` FROM      frpm INNER JOIN      schools     ON frpm.CDSCode = schools.CDSCode WHERE      schools.EdOpsCode = 'SPECON'      AND schools.CDSCode = '0613360'
SELECT      s.School AS SchoolName FROM      frpm f INNER JOIN      schools s ON f.CDSCode = s.CDSCode WHERE      f.`County Code` = 37 AND f.`NSLP Provision Status` = 'Breakfast Provision 2'
SELECT schools.City FROM frpm INNER JOIN schools ON frpm.CDSCode = schools.CDSCode WHERE frpm.`NSLP Provision Status` = 'Lunch Provision 2'   AND frpm.`Low Grade` = '9'   AND frpm.`High Grade` = '12'   AND schools.`County` = 'Merced'
SELECT     frpm.`County Name`,     frpm.`FRPM Count (Ages 5-17)`,     (frpm.`FRPM Count (Ages 5-17)`) * 100 / frpm.`Enrollment (Ages 5-17)` AS `Percent (%) Eligible FRPM (Ages 5-17)` FROM     frpm INNER JOIN     schools ON frpm.CDSCode = schools.CDSCode WHERE     schools.`County` = 'Los Angeles'     AND frpm.`Enrollment (Ages 5-17)` IS NOT NULL
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(GSserved) DESC LIMIT 1
SELECT County, COUNT(*) AS SchoolCount FROM schools WHERE Virtual = 'F' GROUP BY County ORDER BY SchoolCount DESC LIMIT 1
SELECT      s.School,      s.Latitude  FROM      schools s  WHERE      s.Latitude = (          SELECT              MAX(Latitude)          FROM              schools      )  ORDER BY      s.Latitude DESC  LIMIT 1
SELECT City, School AS SchoolName FROM schools WHERE State = 'CA' ORDER BY Latitude ASC LIMIT 1
SELECT GSoffered FROM schools WHERE Longitude = (SELECT MAX(Longitude) FROM schools)
SELECT COUNT(*), MIN(School) AS MinCity FROM schools AS S INNER JOIN frpm AS F ON S.CDSCode = F.CDSCode WHERE S.Magnet = 1 AND S.GSserved = 'Kindergarten to 8th Grade' GROUP BY S.City
SELECT AdmFName1 AS firstName, COUNT(*) AS administratorCount FROM schools GROUP BY AdmFName1 ORDER BY administratorCount DESC LIMIT 2
SELECT      f.`Percent (%) Eligible Free (K-12)` AS Percent_Free_Meal,      f.`Enrollment (K-12)` AS Enrollment_K_12,     f.`Free Meal Count (K-12)` AS Free_Meal_K_12,     f.`District Code` FROM      frpm f JOIN      schools s ON f.`CDSCode` = s.`CDSCode` WHERE      s.`AdmFName1` = 'Alusine'
SELECT      S.AdmFName2 AS AdminLastName,      S.District,      S.County,      S.School  FROM      schools AS S WHERE      S.Charter = 1
SELECT DISTINCT s.AdmEmail1 FROM schools s WHERE s.County = 'San Bernardino' AND s.State = 'CA' AND s.OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND s.DOC = 54 AND s.SOC = 62
SELECT s.AdmEmail1 FROM satscores AS sc INNER JOIN schools AS s ON sc.cds = s.CDSCode WHERE sc.NumTstTakr >= 1500 ORDER BY sc.NumTstTakr DESC LIMIT 1
SELECT COUNT(*) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND district.A3 = 'east Bohemia'
SELECT COUNT(*) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'Prague'
SELECT AVG(A12) AS A12_1995, AVG(A13) AS A13_1996 FROM district
SELECT DISTINCT district.district_id FROM district INNER JOIN client ON district.district_id = client.district_id WHERE district.A11 BETWEEN 6000 AND 10000 AND client.gender = 'F'
SELECT COUNT(*) FROM client AS c INNER JOIN district AS d ON c.district_id = d.district_id WHERE c.gender = 'M'   AND d.A3 = 'North Bohemia'   AND d.A11 > 8000
SELECT T1.client_id FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' ORDER BY T1.birth_date ASC LIMIT 1
SELECT C.client_id FROM client AS C INNER JOIN district AS D ON C.district_id = D.district_id WHERE C.birth_date < '1945-01-01' ORDER BY D.A11 DESC LIMIT 1
SELECT COUNT(*) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON account.account_id = disp.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER'
SELECT      c.client_id  FROM      client c  INNER JOIN      disp d  ON      c.client_id = d.client_id  WHERE      d.type = 'DISPONENT'  AND      d.account_id IN (         SELECT              account_id          FROM              disp          WHERE              type = 'DISPONENT'     )
SELECT T1.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.status = 'A' AND T1.date BETWEEN '1997-01-01' AND '1997-12-31' ORDER BY T1.amount ASC LIMIT 1
SELECT      lo.account_id FROM      loan lo INNER JOIN      account a ON lo.account_id = a.account_id WHERE      lo.duration > 12     AND a.date LIKE '1993-%' ORDER BY      lo.amount DESC, a.date DESC LIMIT 1
SELECT COUNT(*) FROM client AS c INNER JOIN district AS d ON c.district_id = d.district_id WHERE c.gender = 'F'   AND c.birth_date < '1950-01-01'   AND d.A2 = 'Sokolov'
SELECT account_id FROM trans WHERE date LIKE '1995-%' ORDER BY date ASC LIMIT 1
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.amount > 3000
SELECT client.client_id FROM client INNER JOIN card ON client.client_id = card.client_id WHERE card.issued = '1994-03-03'
SELECT trans.date FROM trans WHERE trans.amount = 840 AND trans.date = '1998-10-14'
SELECT d.district_id FROM loan l INNER JOIN account a ON l.account_id = a.account_id INNER JOIN district d ON a.district_id = d.district_id WHERE l.date = '1994-08-25'
SELECT MAX(trans.amount) AS max_transaction_amount  FROM trans  INNER JOIN account ON trans.account_id = account.account_id  WHERE account.date LIKE '1996-10-21'
SELECT      c.gender FROM      client c INNER JOIN      district d ON c.district_id = d.district_id ORDER BY      d.A11 DESC LIMIT 1
SELECT l.amount FROM loan l INNER JOIN account a ON l.account_id = a.account_id WHERE l.amount = (     SELECT MAX(amount) FROM loan )
SELECT COUNT(*) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.A2 LIKE '%Jesenik%' AND client.gender = 'F'
SELECT t.account_id FROM trans t INNER JOIN account a ON t.account_id = a.account_id WHERE t.amount = 5100 AND t.date = '1998-09-02'
SELECT COUNT(account_id) FROM account JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Litomerice' AND date LIKE '1996%'
SELECT district.A2 FROM district INNER JOIN client ON district.district_id = client.district_id WHERE client.gender = 'F' AND client.birth_date = '1976-01-29'
SELECT c.birth_date FROM client c INNER JOIN loan l ON c.client_id = l.account_id WHERE l.amount = 98832 AND l.date = '1996-01-03'
SELECT      client.client_id  FROM      client  INNER JOIN      district  ON      client.district_id = district.district_id  WHERE      district.A3 = 'Prague'  ORDER BY      client.client_id  LIMIT 1
SELECT CAST(SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) FROM district d INNER JOIN client c ON d.district_id = c.district_id WHERE d.A3 = 'south Bohemia' ORDER BY d.A4 DESC LIMIT 1
SELECT      ((t.balance - (SELECT balance FROM trans WHERE date = '1993-03-22') / 1.0) / (SELECT balance FROM trans WHERE date = '1993-03-22' AND account = t.account_id) * 100) AS increase_rate FROM      trans t WHERE      t.date BETWEEN '1993-03-22' AND '1998-12-27' ORDER BY      t.date DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100.0 / SUM(amount) AS percentage FROM loan
SELECT COUNT(CASE WHEN T1.amount < 100000 THEN 1 END) * 100.0 / COUNT(*) AS loan_percentage FROM loan AS T1
SELECT trans.account_id, district.A2, district.A3 FROM trans INNER JOIN account ON trans.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE trans.date > '1993-01-01' AND account.date > '1993-01-01' AND account.date < trans.date
SELECT account.account_id, account.frequency FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.A3 = 'east Bohemia' AND account.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT account_id, date FROM account WHERE district_id IN (     SELECT district_id     FROM district     WHERE A2 = 'Prachatice' )
SELECT district.A2, district.A3 FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.loan_id = 4990
SELECT      loan.account_id,      district.A2,      district.A3  FROM      loan  INNER JOIN      account ON loan.account_id = account.account_id  INNER JOIN      district ON account.district_id = district.district_id  WHERE      loan.amount > 300000
SELECT      l.loan_id,      d.A3 AS district,      d.A11 AS average_salary FROM      loan l INNER JOIN      account a ON l.account_id = a.account_id INNER JOIN      district d ON a.district_id = d.district_id WHERE      l.duration = 60
SELECT ds.A2 AS district, ds.A3 AS state, ((ds.A13 - ds.A12) / ds.A12) * 100 AS unemployment_rate_increment FROM loan l INNER JOIN account a ON l.account_id = a.account_id INNER JOIN district ds ON a.district_id = ds.district_id WHERE l.status = 'D'
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', account.date) = '1993' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM district JOIN account ON district.district_id = account.district_id WHERE district.A2 = 'Decin'
SELECT DISTINCT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT district.A2 FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' GROUP BY district.A2 ORDER BY COUNT(client.client_id) DESC LIMIT 9
SELECT district.A2 AS district_name FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'VYDAJ' AND trans.date LIKE '1996-01%' ORDER BY trans.amount DESC LIMIT 10
SELECT COUNT(*) FROM district d INNER JOIN card c ON d.district_id = c.disp_id WHERE d.A3 = 'south Bohemia' AND c.type != 'credit card'
SELECT     d.A3 AS district_name FROM     loan l  INNER JOIN     account a ON l.account_id = a.account_id  INNER JOIN     district d ON a.district_id = d.district_id  WHERE     l.status IN ('C', 'D')  GROUP BY     d.A3  ORDER BY     COUNT(*) DESC  LIMIT 1
SELECT AVG(l.amount) AS average_loan_amount FROM loan l INNER JOIN client c ON l.account_id = c.client_id WHERE c.gender = 'M'
SELECT A2, A13 FROM district ORDER BY A13 DESC
SELECT COUNT(*) FROM account AS T2 INNER JOIN district AS T1 ON T2.district_id = T1.district_id WHERE T1.A16 = (SELECT MAX(A16) FROM district)
SELECT COUNT(*) FROM trans t INNER JOIN account a ON t.account_id = a.account_id WHERE t.operation = 'VYBER KARTOU' AND a.frequency = 'POPLATEK MESICNE' AND t.balance < 0
SELECT COUNT(*) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK MESICNE' AND T1.amount >= 250000 AND T1.status = 'A' AND T1.date BETWEEN '1995-01-01' AND '1997-12-31'
SELECT COUNT(*) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.district_id = 1 AND loan.status = 'C'
SELECT COUNT(*) FROM client WHERE district_id = (     SELECT district_id FROM district ORDER BY A15 DESC LIMIT 1 ) AND gender = 'M'
SELECT COUNT(*) FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT COUNT(ACCOUNT_ID) FROM account WHERE district_id = (SELECT district_id FROM district WHERE A2 = 'Pisek')
SELECT T3.A2 FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 10000 AND T1.date LIKE '1997%'
SELECT      trans.account_id FROM      trans INNER JOIN      account ON trans.account_id = account.account_id INNER JOIN      district ON account.district_id = district.district_id WHERE      trans.k_symbol = 'SIPO' AND district.A2 = 'Pisek'
SELECT DISTINCT account.account_id FROM card INNER JOIN account ON card.card_id = account.account_id WHERE card.type = 'gold'
SELECT AVG(trans.amount) AS average_amount FROM trans JOIN account ON trans.account_id = account.account_id WHERE trans.date BETWEEN '1995-01-01' AND '2021-12-31' AND trans.operation = 'VYBER KARTOU'
SELECT DISTINCT t.account_id FROM trans AS t WHERE t.operation = 'VYBER KARTOU' AND t.date LIKE '1998-%' AND t.amount < (SELECT AVG(amount) FROM trans WHERE date LIKE '1998-%')
SELECT DISTINCT c.client_id FROM client c INNER JOIN district d ON c.district_id = d.district_id INNER JOIN account a ON c.client_id = a.district_id INNER JOIN card ca ON a.account_id = ca.disp_id INNER JOIN loan lo ON a.account_id = lo.account_id WHERE c.gender = 'F'
SELECT COUNT(*) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.gender = 'F' AND district.A3 LIKE '%South Bohemia%'
SELECT DISTINCT account.account_id FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN disp ON account.account_id = disp.account_id WHERE district.A2 = 'Tabor' AND disp.type = 'OWNER'
SELECT d.type FROM disp AS d JOIN account AS a ON d.account_id = a.account_id JOIN district AS dis ON a.district_id = dis.district_id WHERE d.type = 'OWNER' AND dis.A11 BETWEEN 8000 AND 9000
SELECT COUNT(t.account_id) AS total_accounts FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.A3 LIKE 'North Bohemia%' AND t.bank = 'AB'
SELECT d.A2 FROM district d INNER JOIN account a ON d.district_id = a.district_id INNER JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ'
SELECT AVG(t.amount) AS average_crimes_1995 FROM district d INNER JOIN account a ON d.district_id = a.district_id INNER JOIN trans t ON a.account_id = t.account_id WHERE d.A3 = 'Region'   AND d.A15 > 4000   AND strftime('%Y', t.date) >= '1997'
SELECT COUNT(*) FROM card WHERE type = 'classic'
SELECT COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A2 = 'Hl.m. Praha'
SELECT CAST(SUM(CASE WHEN type = 'gold' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(type = 'gold') AS gold_card_percentage FROM card WHERE issued < '1998-01-01'
SELECT      c.card_id FROM      card c INNER JOIN      loan l ON c.card_id = l.account_id WHERE      c.type = 'OWNER' ORDER BY      l.amount DESC LIMIT 1
SELECT district.A15 FROM district INNER JOIN account ON district.district_id = account.district_id WHERE account.account_id = 532
SELECT d.district_id FROM trans t JOIN account a ON t.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE t.trans_id = 33333
SELECT * FROM trans WHERE operation = 'VYBER' AND account_id = (SELECT account_id FROM client WHERE client_id = 3356)
SELECT COUNT(*) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000
SELECT card.type FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN card ON disp.disp_id = card.disp_id WHERE client.client_id = 13539
SELECT T2.A3  FROM client AS T1  INNER JOIN district AS T2  ON T1.district_id = T2.district_id  WHERE T1.client_id = 3541
SELECT      d.district_id FROM      loan l INNER JOIN      account a ON l.account_id = a.account_id INNER JOIN      district d ON a.district_id = d.district_id WHERE      l.status = 'A' GROUP BY      d.district_id ORDER BY      COUNT(*) DESC LIMIT 1
SELECT client.gender FROM order JOIN account ON order.account_id = account.account_id JOIN client ON account.client_id = client.client_id WHERE order.order_id = 32423
SELECT T1.trans_id FROM trans AS T1 INNER JOIN account ON T1.account_id = account.account_id WHERE account.district_id = 5
SELECT COUNT(*) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.A2 = 'Jesenik'
SELECT DISTINCT c.client_id FROM client c  INNER JOIN account a ON c.district_id = a.district_id  INNER JOIN card ca ON a.account_id = ca.disp_id  WHERE ca.type = 'junior' AND ca.issued >= '1996-01-01'
SELECT      (COUNT(CASE WHEN T2.gender = 'F' THEN 1 END) * 100.0 / COUNT(*)) AS percentage FROM      client AS T2 JOIN      district AS T1 ON      T2.district_id = T1.district_id WHERE      T1.A11 > 10000
SELECT AVG(lo.amount) AS average_amount_1997, (SUM(lo.amount) - AVG(lo.amount)) / AVG(lo.amount) * 100 AS growth_rate FROM client c INNER JOIN loan lo ON c.client_id = lo.account_id WHERE c.gender = 'M' AND lo.date BETWEEN '1996-01-01' AND '1997-12-31'
SELECT COUNT(*) FROM trans WHERE operation = 'VYBER KARTOU' AND date > '1995-01-01'
SELECT      SUM(CASE WHEN A3 = 'East Bohemia' THEN T1.amount ELSE 0 END) -      SUM(CASE WHEN A3 = 'North Bohemia' THEN T1.amount ELSE 0 END) AS      crimes_difference FROM      trans AS T1 INNER JOIN      account AS T2 ON T1.account_id = T2.account_id INNER JOIN      district AS T3 ON T2.district_id = T3.district_id WHERE      T1.date BETWEEN '1996-01-01' AND '1996-12-31'
SELECT COUNT(*) FROM disp INNER JOIN account ON disp.account_id = account.account_id WHERE account.account_id BETWEEN 1 AND 10 AND disp.type IN ('OWNER', 'DISPONENT')
SELECT COUNT(trans.trans_id), SUM(trans.amount) AS total_amount FROM trans WHERE trans.account_id = 3 AND trans.k_symbol = 'DLOGS'
SELECT strftime('%Y', birth_date) AS birth_year FROM client WHERE client_id = 130
SELECT COUNT(*) FROM account a INNER JOIN disp d ON a.account_id = d.account_id WHERE d.type = 'OWNER' AND a.frequency = 'POPLATEK PO OBRATU'
SELECT amount FROM loan WHERE account_id = (SELECT account_id FROM client WHERE client_id = 992)
SELECT SUM(trans.amount) AS total_amount FROM trans INNER JOIN account ON trans.account_id = account.account_id WHERE trans.account_id = 851
SELECT card.type FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN card ON disp.disp_id = card.disp_id WHERE client.client_id = 9
SELECT SUM(t.amount) AS total_amount FROM client c INNER JOIN trans t ON c.client_id = t.account_id WHERE c.client_id = 617 AND t.date LIKE '1998-%'
SELECT c.client_id FROM client c INNER JOIN district d ON c.district_id = d.district_id WHERE c.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND d.A3 = 'east Bohemia'
SELECT l.account_id FROM loan l INNER JOIN client c ON l.account_id = c.client_id WHERE c.gender = 'F' GROUP BY l.account_id ORDER BY l.amount DESC LIMIT 3
SELECT COUNT(*) FROM client c JOIN trans t ON c.client_id = t.account_id WHERE c.gender = 'M' AND c.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND t.k_symbol = 'SIPO' AND t.amount > 4000
SELECT COUNT(T2.account_id) AS number_of_accounts FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Beroun' AND T2.date > '1996-01-01'
SELECT COUNT(*)  FROM client AS c INNER JOIN card AS cr ON c.district_id = cr.disp_id WHERE c.gender = 'F' AND cr.type = 'junior'
SELECT CAST(COUNT(CASE WHEN T1.gender = 'F' THEN 1 END) AS REAL) * 100.0 / COUNT(*) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague'
SELECT      (CAST(SUM(CASE WHEN c.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) AS percentage FROM      client c INNER JOIN      account a ON c.client_id = a.district_id WHERE      a.frequency = 'POPLATEK TYDNE'
SELECT COUNT(*) AS number_of_clients FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT account.account_id FROM loan INNER JOIN account ON loan.account_id = account.account_id WHERE loan.duration > 24 AND account.date < '1997-01-01' ORDER BY loan.amount ASC LIMIT 1
SELECT c.client_id FROM client c INNER JOIN district d ON c.district_id = d.district_id WHERE c.gender = 'F'   AND c.birth_date = (       SELECT MIN(c.birth_date)       FROM client c       WHERE c.gender = 'F'   )   AND d.A6 = (       SELECT MIN(d.A6)       FROM district d       WHERE d.district_id IN (           SELECT c.district_id           FROM client c           WHERE c.gender = 'F'       )   )
SELECT COUNT(*) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.birth_date LIKE '1920%' AND district.A3 = 'east Bohemia'
SELECT COUNT(*) FROM loan l INNER JOIN account a ON l.account_id = a.account_id WHERE l.duration = 24 AND a.frequency = 'POPLATEK TYDNE' AND l.amount > 0
SELECT AVG(loan.amount) FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN trans ON loan.account_id = trans.account_id WHERE loan.status = 'C' AND trans.date > loan.date
SELECT DISTINCT c.client_id, c.district_id FROM client c INNER JOIN disp d ON c.client_id = d.client_id INNER JOIN account a ON d.account_id = a.account_id WHERE d.type = 'OWNER'
SELECT      cl.client_id,      cl.gender FROM      client cl JOIN      disp d ON cl.client_id = d.client_id JOIN      card c ON d.account_id = c.disp_id WHERE      c.type = 'gold'      AND d.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' AND a.element = 'cl'
SELECT AVG(element = 'o') AS average_o_count FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_type = '-'
SELECT AVG(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS average_single_bonded_molecules FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT COUNT(*) FROM molecule AS m JOIN atom AS a ON m.molecule_id = a.molecule_id WHERE a.element = 'na' AND m.label = '-'
SELECT DISTINCT      B.molecule_id  FROM      bond AS B  INNER JOIN      molecule AS M  ON      B.molecule_id = M.molecule_id  WHERE      B.bond_type = '#'      AND M.label = '+'
SELECT (CAST(SUM(CASE WHEN T2.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(T1.bond_id) AS percentage FROM bond T1 JOIN atom T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '='
SELECT COUNT(*) FROM bond WHERE bond_type = '#'
SELECT COUNT(*) FROM atom WHERE element != 'br'
SELECT COUNT(DISTINCT T1.molecule_id) AS num_carcinogenic_molecules FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element IS NOT NULL AND T1.molecule_id BETWEEN 'TR000' AND 'TR099'
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c'
SELECT atom.element FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR004_8_9'
SELECT atom.element FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_type = '='
SELECT m.label FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'h' GROUP BY m.label ORDER BY COUNT(*) DESC LIMIT 1
SELECT bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'cl'
SELECT DISTINCT c.atom_id FROM connected AS c INNER JOIN bond AS b ON c.bond_id = b.bond_id WHERE b.bond_type = '-'
SELECT DISTINCT atom.atom_id FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '-'
SELECT      atom.element FROM      atom WHERE      atom.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY      atom.element ORDER BY      COUNT(atom.element) ASC  LIMIT 1
SELECT bond.bond_type FROM bond JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20'
SELECT m.label FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element != 'sn' AND (m.label = '+' OR m.label = '-')
SELECT COUNT(DISTINCT atom.atom_id) AS distinct_atom_count FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '-'  AND atom.element IN ('i', 's')
SELECT connected.atom_id FROM connected JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#'
SELECT atom_id2 FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE molecule_id = 'TR181')
SELECT      (SUM(CASE WHEN atom.element = 'f' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS fluency_percentage FROM      molecule JOIN      atom ON molecule.molecule_id = atom.molecule_id WHERE      molecule.label = '+'
SELECT      SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond.bond_id) AS percentage FROM      molecule INNER JOIN      bond ON molecule.molecule_id = bond.molecule_id WHERE      molecule.label = '+'
SELECT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR000' ORDER BY atom.element LIMIT 3
SELECT      c.atom_id FROM bond JOIN      connected AS c  ON      c.bond_id = 'TR001_2_6'  WHERE      c.bond_id = 'TR001_2_6'
SELECT      SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) -      SUM(CASE WHEN label = '-' THEN 1 ELSE 0 END)  FROM      molecule
SELECT atom.atom_id FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR000_2_5'
SELECT connected.bond_id FROM connected JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id = 'TR000_2'
SELECT molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '=' ORDER BY molecule.label LIMIT 5
SELECT (SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) * 100.0 / COUNT(bond_id)) AS double_bond_percentage FROM bond WHERE molecule_id = 'TR008'
SELECT      (SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100.0 AS percentage FROM      molecule
SELECT CAST(COUNT(CASE WHEN atom.element = 'h' THEN 1 ELSE NULL END) AS REAL) * 100.0 / COUNT(*) AS hydrogen_percentage FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR206'
SELECT bond.bond_type FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR000'
SELECT      atom.element,      molecule.label  FROM      molecule  INNER JOIN      atom ON molecule.molecule_id = atom.molecule_id  WHERE      molecule.molecule_id = 'TR060'
SELECT      b.bond_type,     COUNT(*) AS bond_count FROM      molecule m JOIN      bond b ON m.molecule_id = b.molecule_id WHERE      m.molecule_id = 'TR010' GROUP BY      b.bond_type ORDER BY      bond_count DESC LIMIT 1
SELECT      molecule.molecule_id FROM      bond INNER JOIN      molecule ON bond.molecule_id = molecule.molecule_id WHERE      bond.bond_type = '-' AND molecule.label = '-' ORDER BY      molecule.molecule_id LIMIT 3
SELECT bond_type FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_type ASC LIMIT 2
SELECT COUNT(b.bond_id) AS bond_count FROM molecule m JOIN connected c ON m.molecule_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE m.molecule_id = 'TR009' AND c.atom_id = 'TR009_12' OR c.atom_id2 = 'TR009_12'
SELECT COUNT(*) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'br'
SELECT bond.bond_type, connected.atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_6_9'
SELECT m.label FROM atom a INNER JOIN molecule m ON a.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label = '+'
SELECT COUNT(bond.molecule_id) FROM bond WHERE bond.bond_type = '#'
SELECT COUNT(*) FROM connected JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id LIKE 'TR%_19'
SELECT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR004'
SELECT COUNT(*) FROM molecule WHERE label = '-'
SELECT DISTINCT m.molecule_id FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE SUBSTR(a.atom_id, 7, 2) BETWEEN '21' AND '25' AND m.label = '+'
SELECT bond.bond_id FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element IN ('p', 'n')
SELECT m.label FROM bond b INNER JOIN molecule m ON b.molecule_id = m.molecule_id WHERE b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(b.bond_id) DESC LIMIT 1
SELECT AVG(bond_count) AS average_bonds FROM (   SELECT a.atom_id, COUNT(b.bond_id) AS bond_count   FROM atom a   INNER JOIN bond b ON a.molecule_id = b.molecule_id   WHERE a.element = 'i'   GROUP BY a.atom_id )
SELECT bond.bond_type, bond.bond_id FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.atom_id = 45 OR bond.bond_type IN ('=', '-') OR bond.bond_type = '#'
SELECT DISTINCT atom.element FROM atom WHERE atom.atom_id NOT IN (SELECT atom_id FROM connected)
SELECT atom.atom_id FROM molecule  INNER JOIN bond ON molecule.molecule_id = bond.molecule_id  INNER JOIN atom ON bond.molecule_id = atom.molecule_id  WHERE bond.bond_type = '#' AND molecule.molecule_id = 'TR041'
SELECT atom.element FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR144_8_19'
SELECT m.label FROM molecule m INNER JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '+' AND b.bond_type = '=' GROUP BY m.molecule_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT      a.element  FROM      molecule m  INNER JOIN      atom a ON m.molecule_id = a.molecule_id  WHERE      m.label = '+'  GROUP BY      a.element  ORDER BY      COUNT(*) ASC  LIMIT 1
SELECT      c.atom_id FROM      connected c JOIN      atom a  ON      c.atom_id = a.atom_id WHERE      a.element = 'pb'
SELECT a.element FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE b.bond_type = '#'
SELECT      (COUNT(T1.bond_id) * 100.0 / (SELECT COUNT(*) FROM bond)) AS bond_max_commonality_percentage FROM      bond AS T1 WHERE      T1.molecule_id IN (         SELECT              T2.molecule_id         FROM              atom AS T2         GROUP BY              T2.element         ORDER BY              COUNT(*) DESC         LIMIT 1     )
SELECT CAST(SUM(CASE WHEN bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS carcinogenic_proportion FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond_type = '-'
SELECT COUNT(*) FROM atom WHERE element IN ('c', 'h')
SELECT connected.atom_id2 FROM connected JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 's'
SELECT bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'sn'
SELECT COUNT(DISTINCT a.element) AS single_element_count FROM bond b INNER JOIN atom a ON b.molecule_id = a.molecule_id WHERE b.bond_type = '-'
SELECT COUNT(*) FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_type = '#' AND atom.element IN ('p', 'br')
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT m.molecule_id FROM molecule m JOIN bond b ON m.molecule_id = b.molecule_id WHERE m.label = '-' AND b.bond_type = '-'
SELECT (CAST(SUM(CASE WHEN a.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COALESCE(COUNT(a.atom_id), 1) FROM atom AS a INNER JOIN bond AS b ON a.molecule_id = b.molecule_id WHERE b.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030'
SELECT bond.bond_type FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id IN ('TR000', 'TR050') AND bond.bond_type IN ('=', '-', '=')
SELECT atom.element FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_10_11'
SELECT COUNT(b.bond_id) AS bond_id_count FROM bond b JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 'i'
SELECT MAX(m.label) AS most_common_label FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'ca'
SELECT b.bond_id FROM bond b INNER JOIN atom a ON b.molecule_id = a.molecule_id WHERE b.bond_id = 'TR001_1_8' AND a.element IN ('cl', 'c')
SELECT      m.molecule_id FROM      molecule m INNER JOIN      bond b  ON      m.molecule_id = b.molecule_id  INNER JOIN      atom a  ON      m.molecule_id = a.molecule_id  WHERE      b.bond_type = '#'      AND m.label = '-'      AND a.element = 'c'  LIMIT 2
SELECT (COUNT(CASE WHEN atom.element = 'cl' THEN 1 END) * 100.0 / COUNT(*)) AS carcinogenic_percentage FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT bond.molecule_id FROM bond WHERE bond.bond_type = '='
SELECT atom.atom_id AS first_atom, connected.atom_id2 AS second_atom FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#'
SELECT atom.element FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR000_1_2'
SELECT COUNT(*) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-'
SELECT molecule.label FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_10_11'
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+'
SELECT atom.element FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND substr(atom.atom_id, 7, 1) = '4'
SELECT      (COUNT(CASE WHEN atom.element = 'h' THEN atom.atom_id END) * 1.0 / COUNT(atom.atom_id)) AS hydrogen_ratio FROM      molecule JOIN      atom ON molecule.molecule_id = atom.molecule_id WHERE      molecule.molecule_id = 'TR006'
SELECT T1.label  FROM molecule AS T1  INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id  WHERE T2.element = 'ca'
SELECT DISTINCT bond.bond_type FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'c' AND bond.bond_type IN ('=', '-', '#')
SELECT atom.element FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR001_10_11'
SELECT (CAST(SUM(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(*) AS triple_bond_percentage FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id
SELECT  (SUM(CASE WHEN bond_type = ' = ' THEN 1 ELSE 0 END) * 1.0 / COUNT(bond_id)) * 100 AS double_bond_percentage  FROM  bond  JOIN  molecule  ON  bond.molecule_id = molecule.molecule_id  WHERE  molecule.molecule_id = 'TR047'
SELECT      m.label  FROM      molecule m  JOIN      atom a ON m.molecule_id = a.molecule_id  JOIN      connected c ON a.atom_id = c.atom_id  WHERE      c.atom_id = 'TR001_1'      AND c.bond_id IN (         SELECT b.bond_id          FROM bond b          JOIN molecule mol ON b.molecule_id = mol.molecule_id          WHERE mol.molecule_id = m.molecule_id      )      AND m.label = '+'
SELECT label FROM molecule WHERE molecule_id = 'TR151'
SELECT atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR151'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT atom.atom_id FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id BETWEEN 'TR010' AND 'TR050' AND atom.element = 'c'
SELECT COUNT(*) FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = '='
SELECT COUNT(T1.atom_id) FROM atom AS T1 JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.element = 'h'
SELECT bond.molecule_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR000_1_2' AND atom.atom_id = 'TR000_1'
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '-' AND a.element = 'c'
SELECT (CAST(SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) AS carcinogenic_molecule_percentage FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'h'
SELECT label FROM molecule WHERE molecule_id = 'TR124'
SELECT atom.atom_id FROM atom WHERE atom.molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT DISTINCT atom.element FROM bond JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR006' AND bond.bond_type = '='
SELECT molecule.label, atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te')
SELECT b.bond_type, c.atom_id2 FROM bond AS b JOIN connected AS c ON b.bond_id = c.bond_id WHERE b.bond_type = '-'
SELECT a.element FROM bond b INNER JOIN atom a ON b.molecule_id = a.molecule_id WHERE b.bond_type = '#'
SELECT DISTINCT atom.element FROM atom JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR000_2_3'
SELECT COUNT(*) FROM bond AS b JOIN atom AS a ON b.molecule_id = a.molecule_id WHERE a.element = 'cl'
SELECT aa.atom_id, COUNT(DISTINCT bb.bond_id) AS bond_count FROM atom aa INNER JOIN bond bb ON aa.molecule_id = bb.molecule_id WHERE aa.molecule_id = 'TR346' GROUP BY aa.atom_id
SELECT COUNT(*) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '=' AND molecule.label = '+'
SELECT COUNT(*) FROM bond b INNER JOIN atom a ON b.molecule_id = a.molecule_id WHERE a.element = 's' AND b.bond_type != '='
SELECT molecule.label FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_2_4'
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR001'
SELECT COUNT(*)  FROM bond  WHERE bond_type = '-'
SELECT DISTINCT m.molecule_id FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'cl' AND m.label = '+'
SELECT m.label FROM molecule m INNER JOIN atom a ON m.molecule_id = a.molecule_id WHERE a.element = 'c' AND m.label = '-'
SELECT (CAST(SUM(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) AS percentage FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT atom.element) FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR001_3_4' AND atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te')
SELECT bond_type FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id IN (SELECT atom_id FROM atom WHERE atom_id IN ('TR000_1', 'TR000_2'))
SELECT      atom.molecule_id  FROM      atom  INNER JOIN      connected  ON      atom.atom_id = connected.atom_id  WHERE      atom.atom_id = 'TR000_2'  AND      connected.atom_id2 = 'TR000_4'
SELECT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000' AND label = '+'
SELECT      (CAST(COUNT(CASE WHEN bond_type = '-' THEN 1 END) AS REAL) * 100.0 / COUNT(bond_id)) AS percentage FROM      bond
SELECT COUNT(*) FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'n' AND molecule.label = '+'
SELECT atom.molecule_id FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 's' AND bond.bond_type = '='
SELECT m.molecule_id FROM molecule m JOIN atom a ON m.molecule_id = a.molecule_id WHERE m.label = '-' GROUP BY m.molecule_id HAVING COUNT(*) > 5
SELECT      atom.element  FROM      bond  INNER JOIN      atom  ON      bond.molecule_id = atom.molecule_id  WHERE      bond.molecule_id = 'TR024'      AND bond.bond_type = '='      AND atom.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT molecule.label FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id GROUP BY molecule.molecule_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT (CAST(SUM(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 'h' AND bond.bond_type = '#'
SELECT COUNT(*) FROM molecule WHERE label = '+'
SELECT COUNT(*) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.molecule_id BETWEEN 'TR004' AND 'TR010'
SELECT COUNT(*) FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR008' AND atom.element = 'c'
SELECT atom.element FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-'
SELECT COUNT(*) FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_type = '=' AND atom.element = 'o'
SELECT COUNT(*) FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '-'
SELECT a.element, b.bond_type FROM molecule m  INNER JOIN atom a ON m.molecule_id = a.molecule_id  INNER JOIN bond b ON m.molecule_id = b.molecule_id  WHERE m.molecule_id = 'TR002'
SELECT atom.atom_id FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'c' AND bond.bond_type = '=' AND atom.molecule_id = 'TR012'
SELECT atom.atom_id FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'o'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT DISTINCT asciiName FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)
SELECT name FROM cards WHERE edhrecRank < 100 AND frameVersion = 2015
SELECT      cards.name FROM      cards INNER JOIN      legalities ON      cards.uuid = legalities.uuid WHERE      cards.rarity = 'mythic'      AND legalities.format = 'gladiator'      AND legalities.status = 'Banned'
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Artifact' AND T1.side IS NULL AND T2.format = 'vintage'
SELECT cards.id, cards.artist  FROM cards  INNER JOIN legalities ON cards.uuid = legalities.uuid  WHERE (cards.power = '*' OR cards.power IS NULL)     AND legalities.format = 'commander'     AND legalities.status = 'Legal'
SELECT c.id, c.artist, c.hasContentWarning, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele'
SELECT r.text FROM rulings r INNER JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Sublime Epiphany' AND c.number = '74s'
SELECT c.name, c.artist, c.isPromo FROM cards c INNER JOIN rulings r ON c.uuid = r.uuid WHERE c.isPromo = 1 GROUP BY c.id ORDER BY COUNT(r.uuid) DESC LIMIT 1
SELECT l.format FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Annul' AND c.number = '29'
SELECT c.name FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE fd.language = 'Japanese'
SELECT (CAST(SUM(CASE WHEN st.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(*) AS percentage FROM set_translations st JOIN cards c ON st.setCode = c.uuid
SELECT s.name AS set_name, SUM(s.totalSetSize) AS total_cards FROM sets AS s INNER JOIN set_translations AS t ON s.code = t.setCode WHERE t.language = 'Italian' GROUP BY s.name
SELECT COUNT(types) AS total_card_types FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords  FROM cards  WHERE name = 'Angel of Mercy'
SELECT COUNT(*) FROM cards WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originaltype FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT st.language FROM cards c INNER JOIN sets s ON c.setCode = s.code INNER JOIN set_translations st ON s.code = st.setCode WHERE c.name = 'Angel of Mercy'
SELECT COUNT(*) FROM legalities l INNER JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'restricted' AND c.isTextless = 0
SELECT r.text FROM rulings r INNER JOIN cards c ON r.uuid = c.uuid WHERE c.name = 'Condemn'
SELECT COUNT(*) FROM legalities AS L INNER JOIN cards AS C ON L.uuid = C.uuid WHERE L.status = 'restricted' AND C.isStarter = 1
SELECT l.status  FROM cards c  INNER JOIN legalities l ON c.uuid = l.uuid  WHERE c.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT l.format FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Benalish Knight'
SELECT cards.artist FROM cards INNER JOIN set_translations ON cards.uuid = set_translations.setCode WHERE set_translations.language = 'Phyrexian'
SELECT (CAST(COUNT(CASE WHEN c.borderColor = 'borderless' THEN 1 ELSE NULL END) AS REAL) * 100.0) / COUNT(*) FROM cards c
SELECT COUNT(*) FROM set_translations st INNER JOIN cards c ON st.setCode = c.setCode WHERE st.language = 'German' AND c.isReprint = 1
SELECT COUNT(*) FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE c.borderColor = 'borderless' AND st.language = 'Russian'
SELECT      (CAST(SUM(CASE WHEN st.language = 'French' AND c.isStorySpotlight = 1 THEN 1 ELSE 0 END) AS REAL) / COUNT(c.id)) * 100 AS percentage FROM      cards c INNER JOIN      set_translations st ON c.uuid = st.setCode WHERE      c.isStorySpotlight = 1
SELECT COUNT(*)  FROM cards  WHERE toughness = '99'
SELECT c.name FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Aaron Boyd'
SELECT COUNT(*) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0
SELECT layout  FROM cards  WHERE keywords LIKE '%flying%'
SELECT COUNT(*) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'
SELECT cards.artist FROM cards INNER JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.language = 'Chinese Simplified'
SELECT c.id FROM cards c INNER JOIN sets s ON c.setCode = s.code INNER JOIN set_translations st ON s.code = st.setCode WHERE c.availability = 'paper' AND st.language = 'Japanese'
SELECT COUNT(*)  FROM cards c INNER JOIN legalities l  ON c.uuid = l.uuid  WHERE l.status = 'Banned' AND c.borderColor = 'white'
SELECT f.uuid, f.language FROM legalities l JOIN foreign_data f ON l.uuid = f.uuid WHERE l.format = 'legacy'
SELECT r.text FROM cards c INNER JOIN rulings r ON c.uuid = r.uuid WHERE c.name = 'Beacon of Immortality'
SELECT COUNT(*) AS card_count, l.status AS legal_status FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.frameVersion = 'future' AND l.status = 'legal'
SELECT cards.id, cards.colors FROM cards WHERE cards.setCode = 'OGW'
SELECT      c.name,      st.language FROM      set_translations st INNER JOIN      cards c ON st.setCode = c.setCode WHERE      st.setCode = '10E'      AND c.convertedManaCost = 5      AND st.translation IS NOT NULL
SELECT cards.name, rulings.date FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originalType = 'Creature - Elf'
SELECT cards.colors, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 AND 20
SELECT c.name FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.originalType = 'Artifact' AND c.colors = 'B'
SELECT c.name FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.rarity = 'uncommon' ORDER BY r.date ASC
SELECT COUNT(*) FROM cards WHERE artist = 'John Avon' AND cardKingdomId IS NOT NULL AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1'
SELECT COUNT(*) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = 2003 AND borderColor = 'black' AND availability = 'mtgo,paper'
SELECT SUM(manaCost) AS total_mana_cost FROM cards WHERE artist = 'Rob Alexander'
SELECT subtypes, supertypes FROM cards WHERE availability = 'arena'
SELECT st.setCode FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Spanish'
SELECT CAST(SUM(CASE WHEN isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM cards WHERE frameEffects = 'legendary'
SELECT      (CAST(SUM(CASE WHEN isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*)) AS percentage FROM      cards INNER JOIN      rulings ON cards.uuid = rulings.uuid WHERE      isStorySpotlight = 1
SELECT      (CAST(COUNT(CASE WHEN set_translations.language = 'Spanish' THEN cards.id ELSE NULL END) AS REAL) * 100.0) / COUNT(cards.id) FROM      cards  INNER JOIN      set_translations  ON      cards.uuid = set_translations.setCode
SELECT st.language FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 309
SELECT COUNT(*) FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.block = 'Commander' AND st.language = 'Portuguese (Brasil)'
SELECT c.id FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.types = 'Creature' AND l.status = 'Legal'
SELECT cards.type FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode INNER JOIN cards ON sets.code = cards.setCode WHERE set_translations.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'
SELECT COUNT(*) FROM legalities AS L JOIN rulings AS R ON L.uuid = R.uuid WHERE L.format = 'premodern' AND R.text LIKE 'This is a triggered mana ability.'
SELECT cards.id FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Erica Yang' AND legalities.format = 'pauper' AND cards.availability = 'paper'
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT      c.name FROM      cards c INNER JOIN      sets s ON c.cardKingdomId = s.code WHERE      c.artist = 'Matthew D. Wilson'     AND c.borderColor = 'black'     AND c.cardKingdomId = '122719'     AND c.layout = 'normal'     AND c.borderColor = 'black'
SELECT COUNT(*) FROM cards c INNER JOIN rulings r ON c.uuid = r.uuid WHERE r.date = '2007-02-01' AND c.rarity = 'rare'
SELECT st.language FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.baseSetSize = 180 AND s.block = 'Ravnica'
SELECT      (CAST(SUM(CASE WHEN lc.status = 'legal' THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(*) FROM      legalities lc INNER JOIN      cards c  ON      lc.uuid = c.uuid WHERE      lc.format = 'commander'
SELECT      (CAST(COUNT(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE NULL END) AS REAL) * 100.0) / COUNT(*) FROM      cards INNER JOIN      sets ON cards.uuid = sets.code
SELECT      (CAST(SUM(CASE WHEN T1.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(T1.id) AS expansion_percentage FROM      set_translations T1 INNER JOIN      sets T2 ON T1.setCode = T2.code WHERE      T2.type = 'expansion'
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(*) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000
SELECT COUNT(*) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promoTypes = 'arena league' ORDER BY name LIMIT 3
SELECT st.language FROM set_translations AS st INNER JOIN foreign_data AS fd ON st.id = fd.id WHERE fd.multiverseid = 149934
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId ASC LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 AND layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS proportion FROM cards
SELECT id FROM cards WHERE hasAlternativeDeckLimit = 0 AND subtypes IN ('Angel', 'Wizard')
SELECT name FROM sets WHERE mtgoCode IS NULL OR mtgoCode = '' ORDER BY name ASC LIMIT 3
SELECT st.language FROM sets AS s INNER JOIN set_translations AS st ON s.code = st.setCode WHERE s.mcmName = 'Archenemy' AND s.setCode = 'ARC'
SELECT sets.name, set_translations.translation FROM sets INNER JOIN set_translations ON sets.id = set_translations.id WHERE sets.id = 5
SELECT st.language, s.type FROM set_translations st INNER JOIN sets s ON st.setCode = s.code WHERE st.id = 206
SELECT s.id FROM sets AS s INNER JOIN set_translations AS st ON s.code = st.setCode INNER JOIN legalities AS l ON s.code = l.uuid WHERE st.language = 'Italian' AND s.block = 'Shadowmoor' ORDER BY s.name ASC LIMIT 2
SELECT sets.id FROM sets INNER JOIN set_translations ON sets.id = set_translations.id WHERE sets.isForeignOnly = 1 AND sets.isFoilOnly = 1 AND set_translations.language = 'Japanese'
SELECT s.name AS set_name FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Russian' ORDER BY s.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(T1.id) AS percentage FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Chinese Simplified'
SELECT COUNT(*) AS num_sets FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese' AND (s.mtgoCode IS NULL OR s.mtgoCode = '')
SELECT COUNT(id) FROM cards WHERE borderColor = 'black'
SELECT COUNT(id) AS count FROM cards WHERE frameEffects = 'extendedart'
SELECT asciiName FROM cards WHERE borderColor = 'black' AND isFullArt = 1
SELECT st.language FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.id = 174
SELECT name FROM sets WHERE code = 'ALL'
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Masques', 'Mirage')
SELECT code FROM sets WHERE type = 'expansion'
SELECT name, type FROM cards WHERE watermark = 'boros'
SELECT fd.language, fd.flavorText, c.type FROM foreign_data fd JOIN cards c ON fd.uuid = c.uuid WHERE c.watermark = 'colorpie'
SELECT (CAST(SUM(CASE WHEN cards.convertedManaCost = 10 THEN 1 ELSE NULL END) AS REAL) * 100.0) / COUNT(cards.id) AS percentage FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Abyssal Horror'
SELECT code FROM sets WHERE type = 'commander'
SELECT cards.name, cards.type FROM cards WHERE cards.watermark = 'abzan'
SELECT      st.language,      c.type FROM      cards c INNER JOIN      set_translations st ON c.setCode = st.setCode WHERE      c.watermark = 'azorius'
SELECT COUNT(*) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT COUNT(*) FROM cards WHERE availability LIKE '%paper%' AND hand = '3'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost  FROM cards  WHERE name = 'Ancestor''s Chosen'
SELECT COUNT(*) AS unknown_power_cards_count FROM cards WHERE borderColor = 'white' AND power IN ('*', NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena,mtgo%'
SELECT c.name FROM cards c INNER JOIN (SELECT name FROM cards WHERE name = 'Serra Angel' UNION ALL SELECT name FROM cards WHERE name = 'Shrine Keeper') c1 ON c.name = c1.name ORDER BY c.convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE convertedManaCost > 7.0 ORDER BY convertedManaCost DESC LIMIT 3
SELECT s.name  FROM cards c  INNER JOIN sets s ON c.setCode = s.code  INNER JOIN set_translations st ON s.code = st.setCode  WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Italian'
SELECT COUNT(set_translations.id) AS number_of_translations FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode INNER JOIN cards ON sets.id = cards.id WHERE cards.name = 'Angel of Mercy'
SELECT cards.name FROM cards JOIN set_translations ON cards.setCode = set_translations.setCode WHERE set_translations.translation = 'Hauptset Zehnte Edition'
SELECT st.language FROM sets s INNER JOIN set_translations st ON s.code = st.setCode INNER JOIN cards c ON s.id = c.id WHERE c.name = 'Ancestor''s Chosen' AND st.language = 'Korean'
SELECT COUNT(*) AS num_cards FROM cards ca INNER JOIN sets s ON ca.setCode = s.code INNER JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Hauptset Zehnte Edition' AND ca.artist = 'Adam Rex'
SELECT T1.baseSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.translation = 'Hauptset Zehnte Edition'
SELECT st.translation FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Eighth Edition' AND st.language = 'Chinese Simplified'
SELECT EXISTS (SELECT 1 FROM sets WHERE name = 'Angel of Mercy')
SELECT sets.releaseDate FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE cards.name = 'Ancestor''s Chosen'
SELECT s.type FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.code = '10E' AND st.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(*) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL
SELECT EXISTS (   SELECT 1   FROM sets   WHERE name = 'Adarkar Valkyrie' AND isForeignOnly = 1 )
SELECT COUNT(*) AS baseSetSizeLessThan100 FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE sets.baseSetSize < 100 AND set_translations.language = 'Italian'
SELECT COUNT(*) FROM cards AS c INNER JOIN sets AS s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.borderColor = 'black'
SELECT c.name FROM cards c INNER JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' ORDER BY c.convertedManaCost DESC LIMIT 1
SELECT DISTINCT c.artist FROM cards c INNER JOIN sets s ON c.setCode = s.code WHERE s.name = 'Coldsnap' AND c.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT cards.number FROM cards INNER JOIN sets ON cards.uuid = sets.code WHERE sets.name = 'Coldsnap' AND cards.number = 4
SELECT COUNT(*) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT fd.flavorText FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.name = 'Ancestor''s Chosen' AND fd.language = 'Italian'
SELECT language FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND flavorText IS NOT NULL
SELECT DISTINCT c.type FROM cards c JOIN set_translations st ON c.setCode = st.setCode WHERE st.language = 'German' AND c.name = 'Ancestor''s Chosen'
SELECT st.translation FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Coldsnap' AND st.language = 'Italian'
SELECT c.name FROM sets s INNER JOIN cards c ON s.code = c.setCode INNER JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Coldsnap' AND st.language = 'Italian' ORDER BY c.convertedManaCost DESC LIMIT 1
SELECT rulings.date FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Reminisce'
SELECT      SUM(CASE WHEN cards.convertedManaCost = 7 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS percentage_of_7_mana FROM      cards JOIN      sets ON cards.setCode = sets.code WHERE      sets.name = 'Coldsnap'
SELECT (SUM(CASE WHEN cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS card_percentage FROM cards WHERE name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
SELECT s.mcmName FROM sets s WHERE s.releaseDate = '2017-06-09'
SELECT type FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT rs.text AS ruling_text FROM cards c INNER JOIN rulings rs ON c.uuid = rs.uuid WHERE c.artist = 'Jim Pavelec'
SELECT DISTINCT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'
SELECT sets.baseSetSize FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Rinascita di Alara'
SELECT sets.type FROM sets INNER JOIN set_translations ON sets.code = set_translations.setCode WHERE set_translations.translation = 'Huitième Edition'
SELECT st.translation FROM sets s INNER JOIN set_translations st ON s.code = st.setCode INNER JOIN cards c ON s.code = c.setCode WHERE c.name = 'Tendo Ice Bridge' AND st.language = 'French'
SELECT COUNT(*) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Tenth Edition'
SELECT set_translations.language FROM cards INNER JOIN sets ON cards.setCode = sets.code INNER JOIN set_translations ON sets.id = set_translations.id WHERE cards.name = 'Fellwar Stone' AND set_translations.language = 'Japanese'
SELECT c.name FROM cards c INNER JOIN sets s ON c.setCode = s.code WHERE s.name = 'Journey into Nyx Hero''s Path' ORDER BY c.convertedManaCost DESC LIMIT 1
SELECT s.releaseDate FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.translation = 'Ola de frío'
SELECT sets.type FROM sets INNER JOIN cards ON sets.code = cards.setCode WHERE cards.name = 'Samite Pilgrim'
SELECT COUNT(*) FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedManaCost = '3'
SELECT st.translation FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE s.name = 'Mirrodin' AND st.language = 'Chinese Simplified'
SELECT CAST(SUM(CASE WHEN s.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Japanese'
SELECT (CAST(SUM(CASE WHEN T1.isOnlineOnly = 1 THEN 1 ELSE NULL END) AS REAL) * 100.0 / COUNT(*)) AS percentage FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Portuguese (Brazil)'
SELECT availability FROM cards WHERE isTextless = 1 AND artist = 'Aleksi Briclot'
SELECT id FROM sets WHERE baseSetSize = (SELECT MAX(baseSetSize) FROM sets)
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*' AND hasFoil = 0 AND duelDeck = 'a'
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT c.id FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE l.format = 'duel' ORDER BY c.manaCost DESC LIMIT 10
SELECT MIN(c.originalReleaseDate) AS oldest_card_date, l.format AS legal_play_format FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'mythic' AND l.status = 'legal' ORDER BY c.originalReleaseDate ASC LIMIT 1
SELECT COUNT(c.id) AS total_cards FROM cards c INNER JOIN foreign_data fd ON c.uuid = fd.uuid WHERE c.artist = 'Volkan Baǵa' AND fd.language = 'French'
SELECT COUNT(*) FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid WHERE c.rarity = 'rare' AND c.types = 'Enchantment' AND c.name = 'Abundance' AND l.status = 'Legal'
SELECT l.format, c.name FROM legalities l INNER JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format, c.name ORDER BY COUNT(l.id) DESC LIMIT 1
SELECT set_translations.language FROM sets INNER JOIN set_translations ON sets.id = set_translations.id WHERE sets.name = 'Battlebond'
SELECT c.artist, l.format FROM cards c INNER JOIN legalities l ON c.uuid = l.uuid GROUP BY c.artist ORDER BY COUNT(*) ASC LIMIT 1
SELECT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameVersion = '1997' AND cards.artist = 'D. Alexander Gregory' AND cards.hasContentWarning = 1 AND legalities.format = 'legacy'
SELECT cards.name, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.edhrecRank = 1
SELECT AVG(s.totalSetSize) AS average_sets FROM sets s WHERE s.releaseDate BETWEEN '2012-01-01' AND '2015-12-31'
SELECT DISTINCT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'
SELECT uuid FROM legalities WHERE format = 'oldschool' OR status IN ('banned', 'restricted')
SELECT COUNT(*) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT r.text FROM rulings r INNER JOIN cards c ON r.uuid = c.uuid WHERE c.artist = 'Kev Walker' ORDER BY r.date DESC
SELECT cards.name, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal'
SELECT s.name FROM sets s INNER JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Korean' AND st.language != '%Japanese%'
SELECT cards.frameVersion, cards.cardKingdomFoilId FROM cards INNER JOIN legalities ON cards.id = legalities.id WHERE cards.artist = 'Allen Williams' AND legalities.status = 'Banned'
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE strftime('%Y', CreationDate) = '2011'
SELECT COUNT(*) FROM users WHERE LastAccessDate > '2014-09-01'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(*) FROM users WHERE Upvotes > 100 AND Downvotes > 1
SELECT COUNT(*) FROM users WHERE Views > 10 AND strftime('%Y', CreationDate) > '2013'
SELECT COUNT(*) FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie'
SELECT posts.Title FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'
SELECT u.DisplayName FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Eliciting priors from experts'
SELECT p.Title FROM posts p JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.ViewCount DESC LIMIT 1
SELECT u.DisplayName FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT SUM(p.CommentCount) AS total_comments  FROM posts p  INNER JOIN users u ON p.OwnerUserId = u.Id  WHERE u.DisplayName = 'csgillespie'
SELECT p.AnswerCount FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csgillespie' ORDER BY p.AnswerCount DESC LIMIT 1
SELECT u.DisplayName FROM posts p INNER JOIN users u ON p.LastEditorUserId = u.Id WHERE p.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(*) FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'csg Gillespie' AND p.ParentId IS NULL
SELECT u.DisplayName FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.ClosedDate IS NOT NULL
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.Age > 65 AND T1.Score >= 20
SELECT users.Location FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Title = 'Eliciting priors from experts'
SELECT T1.Body FROM posts AS T1 INNER JOIN tags AS T2 ON T1.Id = T2.ExcerptPostId WHERE T2.TagName = 'bayesian'
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id ORDER BY T1.Count DESC LIMIT 1
SELECT COUNT(*) AS badge_count FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie'
SELECT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'csgillespie'
SELECT COUNT(*) FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'csgillespie' AND strftime('%Y', badges.Date) = '2011'
SELECT u.DisplayName FROM users u INNER JOIN badges b ON u.Id = b.UserId GROUP BY u.Id, u.DisplayName ORDER BY COUNT(b.Id) DESC LIMIT 1
SELECT AVG(posts.Score) AS AverageScore FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'csgillespie'
SELECT CAST(SUM(b.Id) AS REAL) / COUNT(u.Id) AS AverageBadges FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200
SELECT  (COUNT(CASE WHEN u.Age > 65 THEN p.Id ELSE NULL END) * 100.0 / COUNT(*)) AS percentage_of_elder_users FROM  posts p INNER JOIN  users u ON p.OwnerUserId = u.Id WHERE  p.Score > 5
SELECT COUNT(*) AS TotalVotes FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT      v.CreationDate  FROM      votes v  GROUP BY      v.PostId  ORDER BY      COUNT(v.Id) DESC  LIMIT 1
SELECT COUNT(*) FROM badges WHERE Name = 'Revival'
SELECT posts.Title FROM posts INNER JOIN comments ON posts.Id = comments.PostId WHERE comments.Score = (SELECT MAX(Score) FROM comments) ORDER BY posts.Id DESC LIMIT 1
SELECT COUNT(T2.Id) AS CommentCount FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount = 1910
SELECT posts.FavoriteCount FROM posts INNER JOIN comments ON posts.Id = comments.PostId WHERE comments.UserId = 3025 AND comments.CreationDate = '2014-04-23 20:29:39.0'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ParentId = 107829 AND T1.CommentCount = 1 LIMIT 1
SELECT      p.ClosedDate IS NULL   FROM      comments c   INNER JOIN      posts p ON c.PostId = p.Id   WHERE      c.UserId = '23853'         AND c.CreationDate = '2013-07-12 09:08:18.0'
SELECT users.Reputation FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Id = '65041'
SELECT COUNT(*) FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Tiago Pasqualini'
SELECT users.DisplayName FROM votes INNER JOIN users ON votes.UserId = users.Id WHERE votes.Id = '6347'
SELECT COUNT(*) AS VoteCount FROM posts p INNER JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data visualization%'
SELECT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(p.Id) AS REAL) / COUNT(v.PostId) AS posts_per_vote_ratio FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId INNER JOIN votes v ON p.Id = v.PostId WHERE u.Id = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT T2.Text FROM comments AS T2 INNER JOIN posts AS T3 ON T2.PostId = T3.Id WHERE T2.Score = 17
SELECT     DisplayName FROM     users WHERE     WebsiteUrl = 'http://stackoverflow.com'
SELECT B.Name FROM Badges AS B INNER JOIN Users AS U ON B.UserId = U.Id WHERE U.DisplayName = 'SilentGhost'
SELECT users.DisplayName FROM comments INNER JOIN users ON comments.UserId = users.Id WHERE comments.Text = 'thank you user93!'
SELECT comments.Text FROM comments INNER JOIN users ON comments.UserId = users.Id WHERE users.DisplayName = 'A Lion'
SELECT users.DisplayName, users.Reputation FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Title = 'Understanding what Dassault iSight is doing?'
SELECT TEXT FROM comments WHERE PostId IN (   SELECT Id   FROM posts   WHERE Title = 'How does gentle boosting differ from AdaBoost?' )
SELECT u.DisplayName FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Necromancer' LIMIT 10
SELECT u.DisplayName FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT posts.Title FROM posts INNER JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Vebjorn Ljosa'
SELECT SUM(posts.Score) AS TotalScore FROM posts INNER JOIN users ON posts.LastEditorUserId = users.Id WHERE users.DisplayName = 'Yevgeny'
SELECT c.Text FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(v.BountyAmount) AS TotalBountyAmount FROM posts p INNER JOIN votes v ON p.Id = v.PostId WHERE p.Title LIKE '%data%'
SELECT u.DisplayName FROM votes v  INNER JOIN posts p ON v.PostId = p.Id  INNER JOIN users u ON v.UserId = u.Id  WHERE v.BountyAmount = 50 AND p.Title LIKE '%variance%'
SELECT      AVG(posts.ViewCount) AS AverageViewCount,     posts.Title,     comments.Text FROM      posts INNER JOIN      comments ON posts.Id = comments.PostId WHERE      posts.Tags LIKE '%<humor>%' GROUP BY      posts.Title, comments.Text
SELECT COUNT(*) AS TotalComments FROM comments INNER JOIN users ON comments.UserId = users.Id WHERE users.Id = 13
SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users)
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(DISTINCT u.Id) AS SupporterCountDuring2011 FROM badges b INNER JOIN users u ON b.UserId = u.Id WHERE b.Name = 'Supporter' AND STRFTIME('%Y', b.`Date`) = '2011'
SELECT COUNT(*) AS NumberOfUsers FROM badges WHERE Name > 5
SELECT COUNT(u.Id) FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE b.Name IN ('Teacher', 'Supporter') AND u.Location = 'New York'
SELECT users.Reputation FROM posts JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Id = 1
SELECT h.UserId FROM postHistory h INNER JOIN users u ON h.UserId = u.Id WHERE h.PostId IN (     SELECT h2.PostId FROM postHistory h2 GROUP BY h2.PostId HAVING COUNT(*) > 1 ) AND u.Views >= 1000
SELECT b.Name AS Badge FROM (     SELECT c.UserId     FROM comments c     GROUP BY c.UserId     ORDER BY COUNT(*) DESC     LIMIT 1 ) AS top_user INNER JOIN badges b ON top_user.UserId = b.UserId
SELECT COUNT(u.Id) AS UserCount FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE u.Location = 'India' AND b.Name = 'Teacher'
SELECT (SUM(CASE WHEN b.Name = 'Student' THEN 1 ELSE 0 END) - COUNT(CASE WHEN b.Name = 'Student' THEN b.Id ELSE NULL END)) * 100.0 / COUNT(b.Id) AS percentage_difference FROM badges b WHERE b.date BETWEEN '2010-01-01' AND '2011-12-31'
SELECT ph.PostHistoryTypeId, COUNT(DISTINCT c.UserId) AS UniqueUsersCount FROM postHistory ph INNER JOIN comments c ON ph.PostId = c.PostId WHERE ph.PostId = 3720
SELECT posts.ViewCount FROM posts JOIN postlinks ON posts.Id = postlinks.PostId WHERE postlinks.RelatedPostId = 61217
SELECT p.Score, pl.LinkTypeId FROM posts p INNER JOIN postlinks pl ON p.Id = pl.PostId WHERE p.Id = 395
SELECT p.Id AS PostId, u.Id AS UserId FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Score > 60
SELECT SUM(posts.FavoriteCount) FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.Id = 686 AND strftime('%Y', posts.CreaionDate) = '2011'
SELECT      AVG(UpVotes) AS average_up_votes,     AVG(users.Age) AS average_age FROM      votes INNER JOIN      users ON votes.UserId = users.Id GROUP BY      users.Age
SELECT COUNT(users.Id) AS AnnouncerBadgeCount FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Announcer'
SELECT badges.Name FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE badges.`Date` = '2010-07-19 19:39:08.0'
SELECT COUNT(*) FROM comments WHERE Score > 60
SELECT Text FROM comments WHERE creationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(*) FROM posts WHERE Score = 10
SELECT DISTINCT badges.Name FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT u.Reputation FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Date = '2010-07-19 19:39:08.0'
SELECT badges.Name FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Pierre'
SELECT b.Date FROM badges b INNER JOIN users u ON b.UserId = u.Id WHERE u.Location = 'Rochester, NY'
SELECT      (CAST(SUM(CASE WHEN badges.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) AS Teacher_Badge_Percentage FROM      badges JOIN      users ON badges.UserId = users.Id
SELECT      (CAST(SUM(CASE WHEN users.Age BETWEEN 13 AND 18 THEN 1 ELSE NULL END) AS REAL) * 100.0) / COUNT(*) AS tenured_percentage FROM      users INNER JOIN      badges ON      users.Id = badges.UserId WHERE      badges.Name = 'Organizer'
SELECT Score FROM comments WHERE CreationDate = '2010-07-19 19:19:56.0'
SELECT      comments.Text FROM      comments WHERE      comments.CreationDate = '2010-07-19 19:37:33.0'
SELECT users.Age FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE users.Location = 'Vienna, Austria'
SELECT COUNT(*) FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age BETWEEN 19 AND 65
SELECT users.Views FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE badges.Date = '2010-07-19 19:39:08.0'
SELECT badges.Name FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.Reputation = ( SELECT MIN(Reputation) FROM users )
SELECT badges.Name FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.DisplayName = 'Sharpie'
SELECT COUNT(*) FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Supporter' AND users.Age > 65
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(*) FROM users WHERE Location = 'New York'
SELECT COUNT(*)  FROM votes  WHERE strftime('%Y', CreationDate) = '2010'
SELECT COUNT(*) AS AdultUsers FROM users WHERE Age BETWEEN 19 AND 65
SELECT DISTINCT T1.DisplayName FROM users AS T1 WHERE T1.Views = (SELECT MAX(Views) FROM users)
SELECT      SUM(CASE WHEN strftime('%Y', v.CreationDate) = '2010' THEN 1 ELSE 0 END) * 1.0 /      SUM(CASE WHEN strftime('%Y', v.CreationDate) = '2011' THEN 1 ELSE 0 END) AS vote_ratio_2010_2011 FROM      votes v
SELECT tags.`TagName` FROM tags INNER JOIN posts ON tags.Id = posts.PostTypeId INNER JOIN votes ON posts.Id = votes.PostId INNER JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'John Salvatier'
SELECT COUNT(*) FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE users.DisplayName = 'Daniel Vassallo'
SELECT COUNT(*) AS number_of_votes FROM votes INNER JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'Harlan'
SELECT p.Id FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'slashnick' GROUP BY p.Id ORDER BY p.AnswerCount DESC LIMIT 1
SELECT      p.Id FROM      posts p INNER JOIN      users u ON p.OwnerUserId = u.Id WHERE      (u.DisplayName = 'Harvey Motulsky' OR u.DisplayName = 'Noah Snyder') ORDER BY      p.ViewCount DESC LIMIT 1
SELECT COUNT(*) AS num_posts FROM votes INNER JOIN users ON votes.UserId = users.Id WHERE users.DisplayName = 'Matt Parker' AND votes.PostId > 4
SELECT COUNT(*) FROM comments AS c  JOIN users AS u ON c.UserId = u.Id  WHERE u.DisplayName = 'Neil McGuigan' AND c.Score < 60
SELECT DISTINCT tags.TagName FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id INNER JOIN tags ON posts.Id = tags.Id WHERE users.DisplayName = 'Mark Meckes' AND posts.CommentCount = 0
SELECT users.DisplayName FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN t.TagName = 'r' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(p.Id) AS Percentage FROM posts p JOIN tags t ON p.Id = t.ExcerptPostId JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Community'
SELECT      (SUM(CASE WHEN u1.DisplayName = 'Mornington' THEN p.ViewCount ELSE 0 END) -                 SUM(CASE WHEN u2.DisplayName = 'Amos' THEN p.ViewCount ELSE 0 END)) AS total_difference  FROM      posts p  INNER JOIN      users u1 ON p.OwnerUserId = u1.Id  INNER JOIN      users u2 ON p.OwnerUserId = u2.Id
SELECT COUNT(DISTINCT b.UserId) FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE b.Name = 'Commentator' AND b.`Date` LIKE '2014-%'
SELECT COUNT(*)  FROM posts  WHERE CreationDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT u.DisplayName, u.Age FROM users u WHERE u.Id IN (     SELECT u.Id FROM users u WHERE u.Views = (         SELECT MAX(Views) FROM users     ) )
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(*) FROM comments WHERE Score < 60 AND UserId = 13
SELECT T1.Title, T3.DisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T1.OwnerUserId = T3.Id WHERE T2.Score > 60
SELECT b.Name FROM badges AS b INNER JOIN users AS u ON b.UserId = u.Id WHERE u.Location = 'North Pole' AND b.Date LIKE '%2011%'
SELECT u.DisplayName, u.WebsiteUrl FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId WHERE p.FavoriteCount > 150
SELECT      postHistory.Id AS PostHistoryCount,      postHistory.CreationDate AS LastEditDate FROM      postHistory INNER JOIN      posts  ON      postHistory.PostId = posts.Id WHERE      posts.Title = 'What is the best introductory Bayesian statistics textbook?'
SELECT users.LastAccessDate, users.Location FROM users INNER JOIN badges ON users.Id = badges.UserId WHERE badges.Name = 'outliers'
SELECT p.Title FROM posts p INNER JOIN postLinks pl ON p.Id = pl.PostId WHERE p.Title = 'How to tell if something happened in a data set which monitors a value over time'
SELECT p.Id, b.Name FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id INNER JOIN badges b ON p.Id = b.UserId WHERE u.DisplayName = 'Samuel' AND strftime('%Y', p.CreaionDate) = '2013'
SELECT users.DisplayName FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id ORDER BY posts.ViewCount DESC LIMIT 1
SELECT      users.DisplayName AS User_DisplayName,      users.Location AS User_Location FROM      posts INNER JOIN      tags ON posts.Id = tags.ExcerptPostId INNER JOIN      users ON posts.OwnerUserId = users.Id WHERE      tags.TagName = 'hypothesis-testing'
SELECT      p.Title,      pl.LinkTypeId  FROM      posts p  INNER JOIN      postLinks pl  ON      p.Id = pl.PostId  WHERE      p.Title = 'What are principal component scores?'
SELECT users.DisplayName FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.ParentId IS NOT NULL ORDER BY posts.Score DESC LIMIT 1
SELECT u.DisplayName, u.WebsiteUrl FROM users u INNER JOIN ( SELECT VoteTypeId, MAX(BountyAmount) AS highest_bounty FROM votes WHERE VoteTypeId = 8 GROUP BY VoteTypeId ) v ON u.Id = v.VoteTypeId WHERE v.highest_bounty = ( SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8 )
SELECT p.Title FROM posts p ORDER BY p.ViewCount DESC LIMIT 5
SELECT COUNT(T.Id) AS TagCount FROM tags T WHERE T.Count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts ORDER BY FavoriteCount DESC LIMIT 1
SELECT MAX(Reputation) AS MostInfamousUserReputation FROM users
SELECT COUNT(*) AS PostCount FROM votes v JOIN posts p ON v.PostId = p.Id WHERE v.BountyAmount = 50 AND strftime('%Y', v.CreationDate) = '2011'
SELECT Id FROM users ORDER BY Age ASC LIMIT 1
SELECT SUM(Score) AS sum_score FROM posts WHERE LasActivityDate LIKE '2010-07-19%'
SELECT AVG(link_count) AS AverageLinksCreated FROM (     SELECT T2.PostId, COUNT(T2.Id) AS link_count     FROM posts AS T1     INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId     WHERE T1.AnswerCount <= 2     AND T1.CreaionDate BETWEEN '2010-01-01' AND '2010-12-31'     GROUP BY T2.PostId ) AS filtered_posts
SELECT p.Id FROM posts p INNER JOIN votes v ON p.Id = v.PostId WHERE v.UserId = 1465 ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT      p.Title  FROM      posts p  INNER JOIN      postlinks pl  ON      p.Id = pl.PostId  ORDER BY      pl.CreationDate  LIMIT 1
SELECT u.DisplayName FROM users u INNER JOIN badges b ON u.Id = b.UserId GROUP BY u.DisplayName ORDER BY COUNT(b.Name) DESC LIMIT 1
SELECT MIN(v.CreationDate) AS first_vote_date FROM votes v INNER JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl'
SELECT MIN(T3.CreaionDate) AS startDate FROM users AS T1 INNER JOIN posts AS T3 ON T1.Id = T3.OwnerUserId WHERE T1.Age = (     SELECT MIN(Age)     FROM users )
SELECT users.DisplayName FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE badges.Name = 'Autobiographer' ORDER BY badges.Date ASC LIMIT 1
SELECT COUNT(*) FROM users u JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Location = 'United Kingdom' AND p.FavoriteCount >= 4
SELECT AVG(v.PostId) AS AverageVotes FROM votes v INNER JOIN users u ON v.UserId = u.Id WHERE u.Age = (SELECT MAX(Age) FROM users)
SELECT      DisplayName  FROM      users  WHERE      Reputation = (          SELECT              MAX(Reputation)          FROM              users      )
SELECT COUNT(*) FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(posts.Id) AS NumberOfPosts FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', posts.CreationDate) = '2010'
SELECT p.Id, p.Title FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE u.DisplayName = 'Harvey Motulsky' ORDER BY p.ViewCount DESC LIMIT 1
SELECT posts.Id, posts.Title FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id ORDER BY posts.Score DESC LIMIT 1
SELECT AVG(posts.Score) AS average_score FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE users.DisplayName = 'Stephen Turner'
SELECT DISTINCT u.DisplayName FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.ViewCount > 20000   AND strftime('%Y', p.CreaionDate) = '2011'
SELECT p.Id AS PostId, u.DisplayName FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE strftime('%Y', p.CreaionDate) = '2010' ORDER BY p.FavoriteCount DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN u.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(ps.Id) AS percentage FROM posts ps INNER JOIN users u ON ps.OwnerUserId = u.Id WHERE strftime('%Y', ps.CreaionDate) = '2011'
SELECT CAST(SUM(CASE WHEN u.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM      users u
SELECT users.DisplayName FROM posts INNER JOIN users ON posts.OwnerUserId = users.Id WHERE posts.Title = 'Computer Game Datasets' ORDER BY posts.ViewCount DESC LIMIT 1
SELECT COUNT(*) AS total_posts_above_average FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(c.Id) AS CommentCount FROM posts p JOIN comments c ON p.Id = c.PostId WHERE p.Score = (SELECT MAX(Score) FROM posts)
SELECT COUNT(*) AS post_count FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT u.DisplayName, u.Location FROM posts p INNER JOIN users u ON p.OwnerUserId = u.Id WHERE p.Id = 183 ORDER BY p.LastEditDate DESC LIMIT 1
SELECT b.Name  FROM badges AS b  INNER JOIN users AS u  ON b.UserId = u.Id  WHERE u.DisplayName = 'Emmett'  ORDER BY b.Date DESC  LIMIT 1
SELECT COUNT(*) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000
SELECT strftime('%s', b.`Date`) - strftime('%s', u.`CreationDate`) AS BadgeDuration FROM users u INNER JOIN badges b ON u.Id = b.UserId WHERE u.DisplayName = 'Zolomon'
SELECT      u.Id,      COUNT(p.Id) AS NumberOfPosts,      COUNT(c.Id) AS NumberOfComments FROM      users u LEFT JOIN      posts p ON u.Id = p.OwnerUserId LEFT JOIN      comments c ON p.Id = c.PostId WHERE      u.CreationDate = (         SELECT MAX(CreationDate) FROM users     ) GROUP BY      u.Id
SELECT      c.Text FROM      comments c INNER JOIN      posts p ON c.PostId = p.Id WHERE      p.Title = 'Analysing wind data with R' ORDER BY      c.CreationDate DESC LIMIT 10
SELECT COUNT(u.Id) AS badge_count FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Citizen Patrol'
SELECT COUNT(*) AS NumberOfPosts FROM posts p INNER JOIN tags t ON p.Id = t.ExcerptPostId WHERE t.TagName = 'careers'
SELECT Reputation, Views  FROM users  WHERE DisplayName = 'Jarrod Dixon'
SELECT COUNT(c.Id) AS TotalNumberOfComments, COUNT(c.Id) AS TotalNumberOfAnswers FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.Title = 'Clustering 1D data'
SELECT CreationDate  FROM users  WHERE DisplayName = 'IrishStat'
SELECT COUNT(*)  FROM votes AS V INNER JOIN posts AS P ON V.PostId = P.Id WHERE V.BountyAmount >= 30
SELECT (COUNT(CASE WHEN p.Score > 50 THEN p.Id END) * 100.0 / COUNT(*)) AS percentage_above_50 FROM users u INNER JOIN posts p ON u.Id = p.OwnerUserId WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
SELECT COUNT(Id) FROM posts WHERE Score < 20
SELECT COUNT(*) AS tag_count FROM tags WHERE Id < 15 AND Count <= 20
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT users.Reputation, users.UpVotes FROM comments INNER JOIN users ON comments.UserId = users.Id WHERE comments.Text = 'fine, you win :)'
SELECT c.Text FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.Title LIKE '%linear regression%'
SELECT T3.Text FROM posts AS T1 INNER JOIN comments AS T3 ON T1.Id = T3.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T3.Score DESC LIMIT 1
SELECT c.CreationDate, u.Age FROM comments c INNER JOIN users u ON c.UserId = u.Id WHERE c.Text LIKE '%http://%'
SELECT COUNT(*) FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.ViewCount < 5 AND c.Score = 0
SELECT COUNT(*) FROM comments c INNER JOIN posts p ON c.PostId = p.Id WHERE p.CommentCount = 1 AND c.Score = 0
SELECT COUNT(*) FROM comments c INNER JOIN users u ON c.UserId = u.Id WHERE c.Score = 0 AND u.Age = 40
SELECT p.Id AS PostId, c.Text AS Comments FROM posts p INNER JOIN comments c ON p.Id = c.PostId WHERE p.Title = 'Group differences on a five point Likert item'
SELECT users.UpVotes FROM comments INNER JOIN users ON comments.UserId = users.Id WHERE comments.Text = 'R is also lazy evaluated.'
SELECT T1.Text  FROM comments AS T1  INNER JOIN users AS T2  ON T1.UserId = T2.Id  WHERE T2.DisplayName = 'Harvey Motulsky'
SELECT u.DisplayName FROM comments c INNER JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 1 AND 5 GROUP BY u.DisplayName HAVING COUNT(*) = 0 ORDER BY COUNT(*) DESC
SELECT CAST(SUM(CASE WHEN c.Score = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM comments c JOIN users u ON c.UserId = u.Id WHERE c.Score BETWEEN 5 AND 10
SELECT sp.power_name FROM superhero AS s INNER JOIN hero_power AS hp ON s.id = hp.hero_id INNER JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = '3-D Man'
SELECT COUNT(DISTINCT superhero.id) AS strength_superhero_count FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength'
SELECT COUNT(*) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200
SELECT      T1.full_name FROM      superhero AS T1 INNER JOIN      hero_power AS T2  ON      T1.id = T2.hero_id GROUP BY      T1.full_name HAVING      COUNT(T2.power_id) > 15
SELECT COUNT(*) FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue'
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse'
SELECT COUNT(T1.id) AS filtered_superhero_count FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.colour = 'Blue' AND T4.power_name = 'Agility'
SELECT DISTINCT s.superhero_name FROM superhero s INNER JOIN colour c1 ON s.eye_colour_id = c1.id INNER JOIN colour c2 ON s.hair_colour_id = c2.id INNER JOIN superpower sp ON s.id = sp.id WHERE c1.colour = 'Blue' AND c1.id = c1.id AND c2.colour = 'Blond' AND c2.id = c2.id AND sp.power_name = 'Agility'
SELECT COUNT(*) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT s.superhero_name FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics' ORDER BY s.height_cm DESC
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron'
SELECT colour.colour FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE publisher.publisher_name = 'Marvel Comics' GROUP BY colour.colour ORDER BY COUNT(superhero.id) DESC
SELECT AVG(s.height_cm) AS average_superhero_height FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id WHERE p.publisher_name = 'Marvel Comics'
SELECT superhero.superhero_name FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength'
SELECT COUNT(*) AS DC_Comics_Publisher_count FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE publisher.publisher_name = 'DC Comics'
SELECT p.publisher_name FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id INNER JOIN hero_attribute ha ON s.id = ha.hero_id INNER JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' ORDER BY ha.attribute_value LIMIT 1
SELECT COUNT(s.id) AS gold_eyed_superheroes FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id INNER JOIN colour c ON s.eye_colour_id = c.id WHERE p.publisher_name = 'Marvel Comics'   AND c.colour = 'Gold'
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II'
SELECT COUNT(s.id) FROM superhero s INNER JOIN colour c ON s.hair_colour_id = c.id WHERE c.colour = 'Blond'
SELECT      T3.superhero_name FROM      superhero AS T3 INNER JOIN      hero_attribute AS T2 ON T3.id = T2.hero_id INNER JOIN      attribute AS T4 ON T2.attribute_id = T4.id WHERE      T4.attribute_name = 'Intelligence' ORDER BY      T2.attribute_value ASC LIMIT 1
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'Copycat'
SELECT s.superhero_name FROM superhero s INNER JOIN hero_attribute ha ON s.id = ha.hero_id INNER JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Durability' AND ha.attribute_value < 50
SELECT superhero.superhero_name  FROM superhero  INNER JOIN hero_power ON superhero.id = hero_power.hero_id  INNER JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Death Touch'
SELECT COUNT(*) FROM superhero AS S JOIN gender AS G ON S.gender_id = G.id JOIN hero_attribute AS HA ON S.id = HA.hero_id JOIN attribute AS A ON HA.attribute_id = A.id WHERE G.gender = 'Female' AND A.attribute_name = 'Strength' AND HA.attribute_value = 100
SELECT      s.superhero_name  FROM      superhero AS s  INNER JOIN      hero_power AS hp  ON      s.id = hp.hero_id  GROUP BY      s.superhero_name  ORDER BY      COUNT(*) DESC  LIMIT 1
SELECT COUNT(*)  FROM superhero  WHERE race_id = (SELECT id FROM race WHERE race = 'Vampire')
SELECT      (SUM(CASE WHEN alignment = 'Bad' THEN 1 ELSE 0 END) * 100.0 /                   COUNT(*)) AS bad_self_interest_percentage  FROM      superhero  INNER JOIN      publisher ON superhero.publisher_id = publisher.id  INNER JOIN      alignment ON superhero.alignment_id = alignment.id  WHERE      publisher.publisher_name = 'Marvel Comics'
SELECT      p.publisher_name,     COUNT(s.id) AS total_superheroes FROM      superhero s INNER JOIN      publisher p ON s.publisher_id = p.id WHERE      p.publisher_name IN ('DC Comics', 'Marvel Comics') GROUP BY      p.publisher_name ORDER BY      total_superheroes DESC LIMIT 1
SELECT publisher.id  FROM publisher  INNER JOIN superhero  ON publisher.id = superhero.publisher_id  WHERE publisher.publisher_name = 'Star Trek'
SELECT AVG(ha.attribute_value) AS average_attribute_value FROM hero_attribute AS ha JOIN attribute AS a ON ha.attribute_id = a.id
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75
SELECT sp.power_name FROM superhero s INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Deathlok'
SELECT AVG(weight_kg) AS average_weight FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female'
SELECT sp.power_name FROM superhero s INNER JOIN gender g ON s.gender_id = g.id INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE g.gender = 'Male' LIMIT 5
SELECT superhero.superhero_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT      s.superhero_name FROM      superhero s INNER JOIN      colour c  ON      s.eye_colour_id = c.id WHERE      s.height_cm BETWEEN 170 AND 190      AND c.colour = 'No Colour'
SELECT sp.power_name FROM hero_power hp INNER JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 56
SELECT      superhero.full_name  FROM      superhero  INNER JOIN      publisher ON superhero.publisher_id = publisher.id  INNER JOIN      race ON superhero.race_id = race.id  WHERE      race.race = 'Demi-God'  LIMIT 5
SELECT COUNT(*) FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Bad'
SELECT r.race FROM superhero s JOIN race r ON s.race_id = r.id WHERE s.weight_kg = 169
SELECT      c.colour  FROM      superhero s  INNER JOIN      race r  ON      s.race_id = r.id  INNER JOIN      colour c  ON      s.hair_colour_id = c.id  WHERE      s.height_cm = 185      AND r.race = 'human'
SELECT      C.colour  FROM      superhero AS S  INNER JOIN      colour AS C  ON      S.eye_colour_id = C.id  ORDER BY      S.weight_kg DESC  LIMIT 1
SELECT      (CAST(COUNT(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 END) AS REAL) * 100.0) / COUNT(*) FROM      superhero  INNER JOIN      publisher ON superhero.publisher_id = publisher.id  WHERE      superhero.height_cm BETWEEN 150 AND 180
SELECT      T1.superhero_name  FROM      superhero AS T1  INNER JOIN      gender AS T2  ON      T1.gender_id = T2.id  WHERE      T2.gender = 'Male'       AND T1.weight_kg > (         SELECT AVG(T12.weight_kg)          FROM superhero AS T12      )
SELECT sp.power_name FROM superhero su INNER JOIN hero_power hp ON su.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id GROUP BY sp.power_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.attribute_value FROM hero_attribute AS T2 INNER JOIN superhero AS T1 ON T2.hero_id = T1.id WHERE T1.superhero_name = 'Abomination'
SELECT sp.power_name FROM hero_power hp INNER JOIN superpower sp ON hp.power_id = sp.id WHERE hp.hero_id = 1
SELECT COUNT(*) FROM hero_power hp INNER JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Stealth'
SELECT      s.full_name FROM      superhero s INNER JOIN      hero_attribute ha ON s.id = ha.hero_id INNER JOIN      attribute a ON ha.attribute_id = a.id WHERE      a.attribute_name = 'Strength' ORDER BY      ha.attribute_value DESC LIMIT 1
SELECT COUNT(superhero.id) / (SELECT COUNT(id) FROM superhero WHERE skin_colour_id = 1) AS average_superhero_height FROM superhero WHERE skin_colour_id = 1
SELECT COUNT(*) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics'
SELECT      s.superhero_name FROM      superhero s JOIN      hero_attribute ha ON s.id = ha.hero_id JOIN      attribute a ON ha.attribute_id = a.id JOIN      publisher p ON s.publisher_id = p.id WHERE      a.attribute_name = 'Durability'      AND p.publisher_name = 'Dark Horse Comics' ORDER BY      ha.attribute_value DESC LIMIT 1
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien'
SELECT s.superhero_name FROM superhero AS s INNER JOIN hero_power AS hp ON s.id = hp.hero_id INNER JOIN superpower AS sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight'
SELECT      sh.eye_colour_id,      sh.hair_colour_id,      sh.skin_colour_id  FROM      superhero sh  INNER JOIN      gender g  ON      sh.gender_id = g.id  INNER JOIN      publisher p  ON      sh.publisher_id = p.id  WHERE      g.gender = 'Female'  AND      p.publisher_name = 'Dark Horse Comics'
SELECT      s.superhero_name,      p.publisher_name FROM      superhero s INNER JOIN      publisher p ON s.publisher_id = p.id WHERE      s.hair_colour_id = s.skin_colour_id AND      s.hair_colour_id = s.eye_colour_id
SELECT r.race  FROM superhero s  JOIN race r ON s.race_id = r.id  WHERE s.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN gender.gender = 'Female' AND colour.colour = 'Blue' THEN 1 ELSE NULL END) AS REAL) * 100.0 / COUNT(gender.id) AS blue_female_percentage FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN colour ON superhero.skin_colour_id = colour.id
SELECT superhero.superhero_name, race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler'
SELECT gender.gender FROM superhero JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13'
SELECT superhero.superhero_name FROM superhero  INNER JOIN hero_power ON superhero.id = hero_power.hero_id  INNER JOIN superpower ON hero_power.power_id = superpower.id  WHERE superpower.power_name = 'Adaptation'
SELECT COUNT(*) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Amazo'
SELECT sp.power_name FROM superhero s INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE s.full_name = 'Hunter Zolomon'
SELECT      s.height_cm  FROM      superhero s  INNER JOIN      colour c ON s.eye_colour_id = c.id  WHERE      c.colour = 'Amber'
SELECT superhero.superhero_name  FROM superhero  WHERE superhero.eye_colour_id IN (     SELECT colour.id      FROM colour      WHERE colour.colour = 'Black' )  AND superhero.hair_colour_id IN (     SELECT colour.id      FROM colour      WHERE colour.colour = 'Black' )
SELECT colour.colour FROM colour INNER JOIN superhero ON colour.id = superhero.skin_colour_id WHERE colour.colour = 'Gold'
SELECT superhero.full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire'
SELECT superhero_name FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT COUNT(ha.hero_id) FROM hero_attribute ha INNER JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Strength'
SELECT race.race, alignment.alignment FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks'
SELECT (CAST(SUM(CASE WHEN g.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100) / COUNT(*) AS female_superhero_percentage FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id INNER JOIN gender g ON s.gender_id = g.id WHERE p.publisher_name = 'Marvel Comics'
SELECT AVG(weight_kg) AS average_weight FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT SUM(weight_kg) FROM superhero WHERE full_name = 'Charles Chandler') AS difference FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.full_name IN ('Emil Blonsky', 'Charles Chandler')
SELECT AVG(height_cm) AS average_height FROM superhero
SELECT sp.power_name FROM superhero AS s INNER JOIN hero_power AS hp ON s.id = hp.hero_id INNER JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.superhero_name = 'Abomination'
SELECT COUNT(*) FROM superhero  INNER JOIN gender ON superhero.gender_id = gender.id  INNER JOIN race ON superhero.race_id = race.id  WHERE race.id = 21 AND gender.id = 1
SELECT      s.superhero_name FROM      superhero s INNER JOIN      hero_attribute ha ON s.id = ha.hero_id INNER JOIN      attribute a ON ha.attribute_id = a.id WHERE      a.attribute_name = 'Speed' ORDER BY      ha.attribute_value DESC LIMIT 1
SELECT COUNT(*) FROM superhero WHERE alignment_id = 3
SELECT a.attribute_name, ha.attribute_value FROM superhero s INNER JOIN hero_attribute ha ON s.id = ha.hero_id INNER JOIN attribute a ON ha.attribute_id = a.id WHERE s.superhero_name = '3-D Man'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Brown'
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(*) FROM publisher p INNER JOIN superhero s ON p.id = s.publisher_id WHERE p.id = 1
SELECT CAST(SUM(CASE WHEN c.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) AS percentage FROM superhero s INNER JOIN gender g ON s.gender_id = g.id INNER JOIN colour c ON s.eye_colour_id = c.id
SELECT CAST(SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS REAL) AS ratio FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT hp.power_id FROM superpower sp INNER JOIN hero_power hp ON sp.id = hp.power_id WHERE sp.power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan'
SELECT sp.power_name FROM superhero AS s INNER JOIN hero_power AS hp ON s.id = hp.hero_id INNER JOIN superpower AS sp ON hp.power_id = sp.id WHERE s.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38
SELECT H.race FROM superhero AS S INNER JOIN hero_attribute AS HA ON S.id = HA.hero_id INNER JOIN race AS H ON S.race_id = H.id WHERE HA.attribute_value = (     SELECT MAX(attribute_value) FROM hero_attribute )
SELECT alignment.alignment, superpower.power_name FROM superhero JOIN alignment ON superhero.alignment_id = alignment.id JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Atom IV'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5
SELECT AVG(ah.attribute_value) AS average_attribute_value FROM superhero s INNER JOIN hero_attribute ah ON s.id = ah.hero_id INNER JOIN alignment a ON s.alignment_id = a.id WHERE a.id = 3
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value = 100
SELECT COUNT(superhero.id) AS good_females FROM superhero  INNER JOIN alignment ON superhero.alignment_id = alignment.id  INNER JOIN gender ON superhero.gender_id = gender.id  WHERE alignment.id = 1 AND gender.id = 2
SELECT      superhero.superhero_name FROM      superhero INNER JOIN      hero_attribute ON superhero.id = hero_attribute.hero_id WHERE      hero_attribute.attribute_value BETWEEN 75 AND 80
SELECT race.race FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN colour ON superhero.hair_colour_id = colour.id INNER JOIN race ON superhero.race_id = race.id WHERE colour.colour = 'blue'   AND gender.gender = 'male'
SELECT (CAST(SUM(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*)) AS female_superhero_percentage FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE superhero.alignment_id = 2
SELECT      SUM(CASE WHEN T1.eye_colour_id = 7 THEN 1 ELSE 0 END) -      SUM(CASE WHEN T1.eye_colour_id = 1 THEN 1 ELSE 0 END)  FROM      superhero AS T1  INNER JOIN      colour AS T2  ON      T1.eye_colour_id = T2.id  WHERE      T1.weight_kg = 0 OR T1.weight_kg IS NULL
SELECT MAX(T1.attribute_value) AS strongest_attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = 'Hulk'   AND T2.attribute_name = 'Strength'
SELECT sp.power_name FROM superhero AS su JOIN hero_power AS hp ON su.id = hp.hero_id JOIN superpower AS sp ON hp.power_id = sp.id WHERE su.superhero_name = 'Ajax'
SELECT COUNT(*) FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad'
SELECT COUNT(*) AS female_superhero_count FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superhero.gender_id = (SELECT id FROM gender WHERE gender = 'Female')
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Wind Control' ORDER BY T1.superhero_name
SELECT g.gender FROM superhero s INNER JOIN gender g ON s.gender_id = g.id INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Phoenix Force'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'DC Comics' ORDER BY T1.weight_kg DESC LIMIT 1
SELECT AVG(s.height_cm) AS average_height FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id INNER JOIN race r ON s.race_id = r.id WHERE r.race <> 'Human' AND p.publisher_name = 'Dark Horse Comics'
SELECT COUNT(ah.hero_id) FROM hero_attribute ah INNER JOIN attribute a ON ah.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ah.attribute_value = 100
SELECT SUM(CASE WHEN publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id
SELECT      attribute.attribute_name  FROM      superhero JOIN      hero_attribute ON superhero.id = hero_attribute.hero_id JOIN      attribute ON hero_attribute.attribute_id = attribute.id WHERE      superhero.superhero_name = 'Black Panther' ORDER BY      hero_attribute.attribute_value LIMIT 1
SELECT      c.colour  FROM      superhero s  INNER JOIN      colour c  ON      s.eye_colour_id = c.id  WHERE      s.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT MAX(height_cm) FROM superhero)
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT (CAST(SUM(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) AS female_percentage FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'George Lucas'
SELECT (SUM(CASE WHEN alignment = 'Good' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id JOIN alignment ON superhero.alignment_id = alignment.id WHERE publisher_name = 'Marvel Comics'
SELECT COUNT(*)  FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute WHERE attribute_value = (SELECT MIN(attribute_value) FROM hero_attribute)
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg < 100 AND colour.id = 9
SELECT      ha.attribute_value FROM      superhero s INNER JOIN      hero_attribute ha ON s.id = ha.hero_id WHERE      s.superhero_name = 'Aquababy'
SELECT      s.weight_kg,      r.race  FROM      superhero s  INNER JOIN      hero_attribute ha  ON      s.id = ha.hero_id  INNER JOIN      race r  ON      s.race_id = r.id  WHERE      s.id = 40
SELECT AVG(s.height_cm) AS average_height_cm FROM superhero s INNER JOIN alignment a ON s.alignment_id = a.id WHERE a.alignment = 'Neutral'
SELECT T1.id AS hero_id  FROM superhero AS T1  INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id  INNER JOIN superpower AS T3 ON T2.power_id = T3.id  WHERE T3.power_name = 'Intelligence'
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf'
SELECT sp.power_name FROM superhero s INNER JOIN hero_power hp ON s.id = hp.hero_id INNER JOIN superpower sp ON hp.power_id = sp.id WHERE s.height_cm > (SELECT AVG(height_cm) * 0.8 FROM superhero)
SELECT DISTINCT d.driverRef FROM qualifying q INNER JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 20 AND q.q1 = (SELECT MAX(q1) FROM qualifying WHERE raceId = 20)
SELECT d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId WHERE q.raceId = 19 AND q.q2 = (SELECT MIN(q2) FROM qualifying WHERE raceId = 19)
SELECT DISTINCT r.year FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE c.location = 'Shanghai'
SELECT races.url FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Circuit de Barcelona-Catalunya'
SELECT races.name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Germany'
SELECT cs.position FROM circuits c INNER JOIN constructorStandings cs ON c.circuitId = cs.raceId INNER JOIN constructors con ON cs.constructorId = con.constructorId WHERE con.constructorRef = 'renault'
SELECT COUNT(*) FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.country NOT IN ('Asia', 'Europe')
SELECT races.name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Spain'
SELECT circuits.lat, circuits.lng FROM circuits INNER JOIN races ON circuits.circuitId = races.circuitId WHERE races.name = 'Australian Grand Prix'
SELECT r.url FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'sepang'
SELECT races.time FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Sepang International Circuit'
SELECT c.lat, c.lng FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'Abu Dhabi Grand Prix'
SELECT constructors.nationality FROM races  JOIN constructorStandings ON races.raceId = constructorStandings.raceId  JOIN constructors ON constructorStandings.constructorId = constructors.constructorId  WHERE races.raceId = 24    AND constructorStandings.positionText = '1'
SELECT q.q1 FROM qualifying AS q JOIN drivers AS d ON q.driverId = d.driverId WHERE q.raceId = 354 AND q.driverId = (SELECT driverId FROM drivers WHERE forename = 'Bruno' AND surname = 'Senna')
SELECT d.nationality FROM qualifying AS q JOIN drivers AS d ON q.driverId = d.driverId WHERE q.raceId = 355 AND q.q2 IS NULL
SELECT D.forename, D.surname FROM results R JOIN drivers D ON R.driverId = D.driverId JOIN qualifying Q ON R.raceId = Q.raceId WHERE R.raceId = 903 AND Q.position = 0 AND Q.raceId = 903 AND Q.raceId = 903
SELECT COUNT(*) FROM races r INNER JOIN results res ON r.raceId = res.raceId WHERE r.name = 'Bahrain Grand Prix' AND r.year = 2007 AND res.time IS NOT NULL
SELECT seasons.url FROM races JOIN seasons ON races.year = seasons.year WHERE races.raceId = 901
SELECT COUNT(DISTINCT results.driverId) AS number_of_drivers  FROM results  INNER JOIN races ON results.raceId = races.raceId  WHERE races.date = '2015-11-29'
SELECT drivers.dob FROM drivers INNER JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = 592 AND results.time IS NOT NULL ORDER BY drivers.dob ASC LIMIT 1
SELECT drivers.url FROM lapTimes INNER JOIN drivers ON lapTimes.driverId = drivers.driverId WHERE lapTimes.raceId = 161 AND lapTimes.time LIKE 'M:SS%'
SELECT d.nationality FROM results r INNER JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 933 ORDER BY r.fastestLapSpeed DESC LIMIT 1
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.name = 'Malaysian Grand Prix'
SELECT constructors.url FROM constructorResults INNER JOIN constructors ON constructorResults.constructorId = constructors.constructorId WHERE constructorResults.raceId = 9 ORDER BY constructorResults.points DESC LIMIT 1
SELECT q1 FROM qualifying q JOIN drivers d ON q.driverId = d.driverId WHERE q.raceId = 345 AND d.forename = 'Lucas' AND d.surname = 'di Grassi' ORDER BY q.raceId LIMIT 1
SELECT raceId  FROM qualifying  WHERE raceId = (SELECT raceId FROM races WHERE raceId = 347)    AND q2 = '0:01:15'
SELECT d.forename, d.surname FROM drivers d JOIN qualifying q ON d.driverId = q.driverId JOIN races r ON q.raceId = r.raceId WHERE r.raceId = 45 AND q.q3 = 'M:SS-33'
SELECT T1.time FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Bruce' AND T2.surname = 'McLaren' AND T1.raceId = 743
SELECT      d.forename,      d.surname FROM      results r INNER JOIN      races ra ON r.raceId = ra.raceId INNER JOIN      drivers d ON r.driverId = d.driverId WHERE      ra.name = 'San Marino Grand Prix'      AND ra.year = 2006      AND r.position = 2
SELECT r.url FROM races r WHERE r.raceId = 901
SELECT COUNT(DISTINCT results.driverId) AS drivers_not_finishing FROM results INNER JOIN races ON results.raceId = races.raceId WHERE races.date = '2015-11-29'
SELECT drivers.dob FROM results INNER JOIN drivers ON results.driverId = drivers.driverId WHERE results.raceId = 872 AND results.time IS NOT NULL ORDER BY drivers.dob ASC LIMIT 1
SELECT d.forename, d.surname FROM results r INNER JOIN drivers d ON r.driverId = d.driverId WHERE r.raceId = 348 ORDER BY r.time ASC LIMIT 1
SELECT d.nationality FROM results r INNER JOIN drivers d ON r.driverId = d.driverId WHERE r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT (CAST(T1.fastestLapSpeed AS REAL) - (SELECT MIN(fastestLapSpeed) FROM results WHERE raceId = 853) / (SELECT MIN(fastestLapSpeed) FROM results WHERE raceId = 853)) * 100 AS percentage_faster FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.forename = 'Paul' AND T2.surname = 'di Resta' AND T1.raceId IN (SELECT raceId FROM results WHERE raceId IN (853, 854))
SELECT CAST(COUNT(DISTINCT r.driverId) AS REAL) * 100.0 / COUNT(*) FROM results r JOIN races ra ON r.raceId = ra.raceId WHERE ra.date = '1983-07-16'
SELECT MIN(T1.year) AS earliest_year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Singapore'
SELECT COUNT(raceId) AS num_races FROM races WHERE year = 2005 ORDER BY COUNT(raceId) DESC
SELECT name FROM races WHERE year = (SELECT MIN(year) FROM races)
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(raceId) DESC LIMIT 1
SELECT      races.name  FROM      races  INNER JOIN      seasons  ON      races.year = seasons.year  WHERE      races.year = 2017 AND      seasons.year <> 2000
SELECT c.country, c.name AS circuit_name, c.location AS circuit_location FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = (SELECT MIN(year) FROM races) LIMIT 1
SELECT MAX(year) AS latest_year FROM races WHERE name LIKE 'British Grand Prix' ORDER BY year DESC LIMIT 1
SELECT COUNT(*) FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit'
SELECT      d.forename,      d.surname FROM      results r INNER JOIN      races ra ON r.raceId = ra.raceId INNER JOIN      drivers d ON r.driverId = d.driverId WHERE      ra.year = 2010      AND ra.name = 'Singapore Grand Prix' ORDER BY      r.position
SELECT      d.forename,      d.surname FROM      results r INNER JOIN      drivers d ON r.driverId = d.driverId ORDER BY      r.points DESC LIMIT 1
SELECT      d.forename,      d.surname,      r.points FROM      results r INNER JOIN      drivers d ON r.driverId = d.driverId INNER JOIN      races rsc ON r.raceId = rsc.raceId WHERE      rsc.year = 2017 AND rsc.name = 'Chinese Grand Prix' ORDER BY      r.points DESC LIMIT 3
SELECT      drivers.forename,      drivers.surname,      races.name FROM      lapTimes INNER JOIN      drivers ON lapTimes.driverId = drivers.driverId INNER JOIN      races ON lapTimes.raceId = races.raceId WHERE      lapTimes.milliseconds = (SELECT MIN(milliseconds) FROM lapTimes)
SELECT AVG(l.milliseconds) AS average_lap_time FROM laptimes l INNER JOIN drivers d ON l.driverId = d.driverId INNER JOIN races r ON l.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.name = 'Malaysian Grand Prix'
SELECT CAST(COUNT(CASE WHEN results.position != 1 THEN 1 ELSE NULL END) AS REAL) * 100.0 / COUNT(results.raceId) AS percentage FROM results INNER JOIN drivers ON results.driverId = drivers.driverId INNER JOIN races ON results.raceId = races.raceId WHERE drivers.surname = 'Hamilton' AND races.year >= 2010
SELECT d.forename, d.surname, MAX(ds.wins) AS max_wins, MAX(ds.points) AS max_points FROM drivers d INNER JOIN driverStandings ds ON d.driverId = ds.driverId GROUP BY d.forename, d.surname ORDER BY max_wins DESC LIMIT 1
SELECT      d.forename,      d.surname FROM      drivers d WHERE      d.nationality = 'Japanese'  ORDER BY      CAST(strftime('%Y', d.dob) AS INTEGER) ASC LIMIT 1
SELECT c.name FROM circuits c INNER JOIN races r ON c.circuitId = r.circuitId WHERE r.year BETWEEN 1990 AND 2000 GROUP BY c.name HAVING COUNT(r.raceId) = 4
SELECT c.name AS Circuit_Name, c.location AS Circuit_Location, r.name AS Race_Name FROM circuits AS c INNER JOIN races AS r ON c.circuitId = r.circuitId WHERE c.country = 'USA' AND r.year = 2006
SELECT      r.name AS race_name,      c.name AS circuit_name,      c.location AS circuit_location FROM      races r INNER JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.year = 2005 AND r.date LIKE '2005-09-%'
SELECT      r.name FROM      driverstandings ds INNER JOIN      races r ON      ds.raceId = r.raceId INNER JOIN      drivers d ON      ds.driverId = d.driverId WHERE      d.forename = 'Alex'      AND d.surname = 'Yoong'     AND ds.position < 20
SELECT COUNT(*) FROM results r INNER JOIN drivers d ON r.driverId = d.driverId INNER JOIN races ra ON r.raceId = ra.raceId INNER JOIN circuits c ON ra.circuitId = c.circuitId WHERE d.forename = 'Michael' AND d.surname = 'Schumacher' AND c.circuitRef = 'sepang' ORDER BY r.points DESC LIMIT 1
SELECT      r.raceId,      r.year FROM      results AS res INNER JOIN      drivers AS d ON res.driverId = d.driverId INNER JOIN      races AS r ON res.raceId = r.raceId WHERE      d.forename = 'Michael'      AND d.surname = 'Schumacher' ORDER BY      res.milliseconds ASC LIMIT 1
SELECT AVG(r.points) AS average_points FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE d.forename = 'Eddie' AND d.surname = 'Irvine' AND r.raceId IN (     SELECT races.raceId     FROM races     WHERE races.year = 2000 )
SELECT      r.points FROM      results r JOIN      drivers d ON r.driverId = d.driverId WHERE      d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY      r.raceId ASC LIMIT 1
SELECT name FROM races WHERE year = 2017 ORDER BY date
SELECT      r.name,      r.year,      c.location  FROM      results res  INNER JOIN      races r ON res.raceId = r.raceId  INNER JOIN      circuits c ON r.circuitId = c.circuitId  WHERE      res.laps > 0  ORDER BY      res.laps DESC  LIMIT 1
SELECT      (CAST(COUNT(CASE WHEN c.country = 'Germany' THEN 1 ELSE NULL END) AS REAL) * 100.0) / COUNT(r.raceId) AS Germany_percentage  FROM      races r  INNER JOIN      circuits c ON r.circuitId = c.circuitId  WHERE      r.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT circuitRef  FROM circuits  WHERE name IN ('Silverstone Circuit', 'Hockenheimring', 'Hungaroring')  ORDER BY lat DESC  LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT COUNT(*)  FROM drivers  WHERE code IS NULL
SELECT      drivers.nationality  FROM      drivers  WHERE      strftime('%Y', drivers.dob) = (SELECT MAX(strftime('%Y', drivers.dob)) FROM drivers)  ORDER BY      drivers.dob  LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT circuits.name FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix'
SELECT DISTINCT r.year FROM races r JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'silverstone'
SELECT r.url FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE c.circuitRef = 'silverstone'
SELECT r.time FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.year = 2010 AND c.location = 'Abu Dhabi'
SELECT COUNT(races.raceId) AS TotalRaces FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.country = 'Italy'
SELECT races.date FROM races JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.circuitRef = 'catalunya'
SELECT c.url FROM races r INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009
SELECT MIN(fastestLapTime) AS fastest_lap_time FROM results JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT      d.forename,      d.surname FROM      results r INNER JOIN      drivers d  ON      r.driverId = d.driverId WHERE      r.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT d.driverRef FROM results r INNER JOIN drivers d ON r.driverId = d.driverId INNER JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Canadian Grand Prix' AND ra.year = 2007 ORDER BY r.position LIMIT 1
SELECT races.name FROM races INNER JOIN driverStandings ON races.raceId = driverStandings.raceId INNER JOIN drivers ON driverStandings.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT r.name FROM drivers d INNER JOIN results res ON d.driverId = res.driverId INNER JOIN races r ON res.raceId = r.raceId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY res.rank ASC LIMIT 1
SELECT T2.fastestLapSpeed FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009 ORDER BY T2.fastestLapSpeed DESC LIMIT 1
SELECT DISTINCT races.year FROM drivers INNER JOIN results ON drivers.driverId = results.driverId INNER JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT results.positionOrder FROM drivers JOIN results ON drivers.driverId = results.driverId JOIN races ON results.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix' AND races.year = 2008
SELECT d.forename, d.surname FROM drivers d JOIN results r ON d.driverId = r.driverId JOIN races ra ON r.raceId = ra.raceId WHERE r.grid = 4 AND ra.year = 1989 AND ra.name = 'Australian Grand Prix'
SELECT COUNT(DISTINCT r.driverId) AS driver_count FROM results r INNER JOIN drivers d ON r.driverId = d.driverId INNER JOIN races rsc ON r.raceId = rsc.raceId WHERE r.time IS NOT NULL AND rsc.year = 2008 AND rsc.name = 'Australian Grand Prix'
SELECT      lt.time  FROM      results AS r INNER JOIN      drivers AS d ON r.driverId = d.driverId INNER JOIN      races AS rsc ON r.raceId = rsc.raceId INNER JOIN      lapTimes AS lt ON r.raceId = lt.raceId AND r.driverId = lt.driverId WHERE      d.forename = 'Lewis'      AND d.surname = 'Hamilton'      AND rsc.year = 2008      AND rsc.name = 'Australian Grand Prix' ORDER BY      lt.time ASC  LIMIT 1
SELECT races.time FROM races INNER JOIN results ON races.raceId = results.raceId WHERE races.name = 'Chinese Grand Prix' AND races.year = 2008 AND results.position = 2
SELECT r.url FROM races r INNER JOIN results res ON r.raceId = res.raceId WHERE r.year = 2008 AND r.name = 'Australian Grand Prix' AND res.position = 2
SELECT COUNT(DISTINCT D.driverId) FROM drivers D INNER JOIN results R ON D.driverId = R.driverId INNER JOIN races R1 ON R.raceId = R1.raceId WHERE R1.year = 2008 AND R1.name = 'Australian Grand Prix' AND D.nationality = 'British'
SELECT COUNT(DISTINCT r.driverId) AS driver_count FROM results r INNER JOIN races ra ON r.raceId = ra.raceId WHERE ra.name = 'Chinese Grand Prix' AND ra.year = 2008 AND r.time IS NOT NULL
SELECT SUM(results.points) AS total_points FROM drivers INNER JOIN results ON drivers.driverId = results.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT AVG(results.fastestLapTime) AS average_fastest_lap_time FROM results INNER JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT 1.0 * COUNT(*) / COUNT(races.raceId) AS rate FROM races INNER JOIN lapTimes ON races.raceId = lapTimes.raceId WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND races.time IS NOT NULL
SELECT      CAST(100 AS REAL) -      (CAST(MAX(r.time) AS REAL) - MAX(r2.time)) / CAST(MAX(r.time) AS REAL) * 100 AS percentage_difference  FROM      results r  INNER JOIN      races r2 ON r.raceId = r2.raceId  INNER JOIN      results r3 ON r.raceId = r3.raceId AND r.driverId = r3.driverId WHERE      r2.name = '2008 Australian Grand Prix' AND      r.time IS NOT NULL
SELECT COUNT(*)  FROM circuits  WHERE location = 'Adelaide' AND country = 'Australia'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob > '1980-01-01'
SELECT MAX(T2.points) AS max_points FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British'
SELECT constructors.name FROM constructorStandings INNER JOIN constructors ON constructorStandings.constructorId = constructors.constructorId ORDER BY constructorStandings.points DESC LIMIT 1
SELECT      c.name FROM      constructorStandings cs INNER JOIN      constructors c ON cs.constructorId = c.constructorId WHERE      cs.raceId = 291 GROUP BY      c.name HAVING      AVG(cs.points) = 0
SELECT COUNT(cs.raceId) AS total_races FROM constructors c INNER JOIN constructorStandings cs ON c.constructorId = cs.constructorId WHERE c.nationality = 'Japanese' AND cs.points = 0 GROUP BY c.constructorId HAVING COUNT(cs.raceId) = 2
SELECT constructors.name FROM results INNER JOIN constructors ON results.constructorId = constructors.constructorId WHERE results.rank = 1
SELECT COUNT(*) FROM results INNER JOIN constructors ON results.constructorId = constructors.constructorId WHERE constructors.nationality = 'French' AND results.laps > 50
SELECT CAST(COUNT(CASE WHEN r.time IS NOT NULL THEN r.driverId ELSE NULL END) AS REAL) * 100.0 / COUNT(r.driverId) AS race_completion_percentage FROM results r INNER JOIN drivers d ON r.driverId = d.driverId INNER JOIN races rcr ON r.raceId = rcr.raceId WHERE d.nationality = 'Japanese' AND rcr.year BETWEEN 2007 AND 2009
SELECT      r.year,      AVG(strftime('%s', res.time) - strftime('%s', '00:00:00')) AS average_time_seconds FROM      races r INNER JOIN      results res ON      r.raceId = res.raceId WHERE      res.time IS NOT NULL AND      r.year < 1975 GROUP BY      r.year
SELECT drivers.forename, drivers.surname FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE drivers.dob > '1975-01-01' AND results.rank = 2
SELECT COUNT(*) AS non_finished_drivers FROM drivers INNER JOIN races ON drivers.driverId = races.raceId WHERE drivers.nationality = 'Italian' AND races.time IS NULL
SELECT d.forename, d.surname FROM drivers d JOIN lapTimes lt ON d.driverId = lt.driverId ORDER BY lt.time ASC LIMIT 1
SELECT strftime('%H:%M:%S.%f', fastestLapTime) AS fastest_lap_time_formatted FROM results r JOIN races r2 ON r.raceId = r2.raceId WHERE r2.year = 2009 ORDER BY r.fastestLap DESC LIMIT 1
SELECT AVG(res.fastestLapSpeed) AS average_fastest_lap_speed FROM races r INNER JOIN results res ON r.raceId = res.raceId WHERE r.name = 'Spanish Grand Prix' AND r.year = 2009
SELECT races.name, races.year FROM results INNER JOIN races ON results.raceId = races.raceId WHERE results.milliseconds IS NOT NULL ORDER BY results.milliseconds ASC LIMIT 1
SELECT      (CAST(COUNT(CASE WHEN d.dob < 1985 THEN d.driverId END) AS REAL) * 100.0) / COUNT(*) FROM      results r JOIN      drivers d ON r.driverId = d.driverId JOIN      races ra ON r.raceId = ra.raceId WHERE      ra.year BETWEEN 2000 AND 2005     AND ra.year >= 2000
SELECT COUNT(*) FROM drivers d INNER JOIN lapTimes lt ON d.driverId = lt.driverId WHERE d.nationality = 'French' AND CAST(lt.time AS REAL) < 120
SELECT code FROM drivers WHERE nationality = 'American'
SELECT raceId  FROM races  WHERE year = 2009
SELECT COUNT(*) FROM driverstandings WHERE raceId = 18
SELECT COUNT(*) AS youngest_indian_drivers FROM drivers WHERE nationality IN ('Netherlands', 'Dutch') ORDER BY strftime('%Y', dob) ASC LIMIT 3
SELECT drivers.driverRef FROM drivers INNER JOIN results ON drivers.driverId = results.driverId WHERE drivers.forename = 'Robert' AND drivers.surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND dob LIKE '1980%'
SELECT      d.forename,      d.surname  FROM      drivers d  JOIN      lapTimes lt  ON      d.driverId = lt.driverId  JOIN      races r  ON      lt.raceId = r.raceId  WHERE      d.dob BETWEEN '1980-01-01' AND '1990-12-31'      AND d.nationality = 'German'  ORDER BY      lt.time ASC  LIMIT 3
SELECT d.driverRef FROM drivers d INNER JOIN driverStandings ds ON d.driverId = ds.driverId WHERE d.nationality = 'German' ORDER BY d.dob LIMIT 1
SELECT d.driverId, d.code FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE d.dob LIKE '%1971-%' AND r.fastestLapTime IS NOT NULL
SELECT D.forename, D.surname FROM drivers D INNER JOIN lapTimes LT ON D.driverId = LT.driverId WHERE D.dob < '1982-01-01' AND D.nationality = 'Spanish' GROUP BY D.driverId, D.forename, D.surname ORDER BY MAX(LT.time) DESC LIMIT 10
SELECT     r.year FROM     results AS res INNER JOIN     races AS r ON     res.raceId = r.raceId WHERE     res.fastestLapTime IS NOT NULL ORDER BY     res.fastestLapTime DESC LIMIT 1
SELECT r.year FROM lapTimes l  INNER JOIN races r ON l.raceId = r.raceId  WHERE l.time = (SELECT MAX(time) FROM lapTimes)
SELECT driverId FROM lapTimes WHERE lap = 1 ORDER BY time ASC LIMIT 5
SELECT COUNT(*) FROM results r INNER JOIN status s ON r.statusId = s.statusId WHERE r.raceId BETWEEN 50 AND 100 AND s.status = 'Disqualified'
SELECT COUNT(*) AS circuit_count, lat, lng  FROM circuits  WHERE country = 'Austria'
SELECT raceId FROM results WHERE time IS NOT NULL GROUP BY raceId ORDER BY COUNT(time) DESC LIMIT 1
SELECT      d.driverRef,      d.nationality,      d.dob FROM      qualifying q  INNER JOIN      drivers d  ON      q.driverId = d.driverId  WHERE      q.raceId = 23      AND q.q2 IS NOT NULL
SELECT d.dob AS driver_dob, d.forename, d.surname, r.date AS race_date, r.time AS race_time FROM drivers d INNER JOIN qualifying q ON d.driverId = q.driverId INNER JOIN races r ON q.raceId = r.raceId ORDER BY d.dob ASC LIMIT 1
SELECT COUNT(*) AS number_of_drivers FROM drivers d INNER JOIN results r ON d.driverId = r.driverId INNER JOIN status s ON r.statusId = s.statusId WHERE d.nationality = 'American' AND s.status = 'Puncture'
SELECT constructors.url  FROM constructors  INNER JOIN constructorResults ON constructors.constructorId = constructorResults.constructorId  WHERE constructors.nationality = 'Italian'  ORDER BY constructorResults.points DESC  LIMIT 1
SELECT      constructors.url  FROM      constructorStandings  INNER JOIN      constructors  ON      constructorStandings.constructorId = constructors.constructorId  GROUP BY      constructorStandings.constructorId  ORDER BY      SUM(constructorStandings.wins) DESC  LIMIT 1
SELECT l.time FROM races r INNER JOIN lapTimes l ON r.raceId = l.raceId WHERE r.name = 'French Grand Prix' AND l.lap = 3 ORDER BY l.time DESC LIMIT 1
SELECT time, milliseconds FROM lapTimes WHERE time = (SELECT MIN(time) FROM lapTimes)
SELECT AVG(r.fastestLapTime) AS average_fastest_lap_time FROM results r INNER JOIN races ra ON r.raceId = ra.raceId WHERE ra.year = 2006 AND r.rank < 11
SELECT      d.forename,      d.surname,      AVG(ps.duration) AS average_pitstop_duration FROM      drivers d INNER JOIN      pitstops ps ON d.driverId = ps.driverId WHERE      d.dob BETWEEN '1980-01-01' AND '1985-12-31'     AND d.nationality = 'German' GROUP BY      d.driverId ORDER BY      average_pitstop_duration ASC LIMIT 3
SELECT drivers.forename, drivers.surname, SUBSTR(results.time, 1, 2) || ':' || SUBSTR(results.time, 4, 2) || ':' || SUBSTR(results.time, 7, 2) || '.' || SUBSTR(results.time, 9, 6) AS finish_time FROM races INNER JOIN results ON races.raceId = results.raceId INNER JOIN drivers ON results.driverId = drivers.driverId WHERE races.year = 2008 AND races.name = '1' AND results.position = 1 ORDER BY results.position DESC LIMIT 1
SELECT      constructors.constructorRef,      constructors.url  FROM      races  INNER JOIN      results ON races.raceId = results.raceId  INNER JOIN      constructors ON results.constructorId = constructors.constructorId  WHERE      races.year = 2009      AND races.name = 'Singapore Grand Prix'  ORDER BY      results.time DESC  LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND dob BETWEEN '1981-01-01' AND '1991-12-31'
SELECT drivers.forename, drivers.surname, drivers.url, drivers.dob FROM drivers WHERE drivers.nationality = 'German' AND drivers.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY drivers.dob DESC
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT      cs.name AS constructor_name,     cs.nationality,     SUM(cnr.points) AS total_points FROM      races r INNER JOIN      constructorResults cnr ON r.raceId = cnr.raceId INNER JOIN      constructors cs ON cnr.constructorId = cs.constructorId WHERE      r.name = 'Monaco Grand Prix'      AND r.year BETWEEN 1980 AND 2010 GROUP BY      cs.name, cs.nationality ORDER BY      total_points DESC LIMIT 1
SELECT AVG(r.points) AS average_points FROM drivers d  INNER JOIN results r ON d.driverId = r.driverId  INNER JOIN races ra ON r.raceId = ra.raceId  WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'  AND ra.name = 'Turkish Grand Prix'
SELECT AVG(races_count) AS average_races_per_year FROM (     SELECT COUNT(races.raceId) AS races_count     FROM races     WHERE races.year BETWEEN 2000 AND 2010     GROUP BY races.year ) AS yearly_race_count
SELECT      nationality FROM      drivers GROUP BY      nationality ORDER BY      COUNT(*) DESC LIMIT 1
SELECT ds.wins FROM driverStandings ds INNER JOIN results r ON ds.driverId = r.driverId WHERE ds.position = 91
SELECT r.name FROM results AS res INNER JOIN races AS r ON res.raceId = r.raceId WHERE res.fastestLapTime = (     SELECT MIN(fastestLapTime)      FROM results )
SELECT      c.location,      c.country FROM      races r INNER JOIN      circuits c ON r.circuitId = c.circuitId WHERE      r.date = (SELECT MAX(date) FROM races)
SELECT d.forename, d.surname FROM qualifying q INNER JOIN races r ON q.raceId = r.raceId INNER JOIN drivers d ON q.driverId = d.driverId WHERE r.year = 2008 AND q.position = 3 AND r.circuitId IN (SELECT circuitId FROM circuits WHERE name = 'Marina Bay Street Circuit')
SELECT d.forename, d.surname, r.name AS race_name FROM drivers d INNER JOIN races r ON d.driverId = r.raceId WHERE d.dob = (SELECT MIN(dob) FROM drivers ORDER BY dob ASC LIMIT 1) ORDER BY d.dob ASC LIMIT 1
SELECT COUNT(*) AS accidents_count FROM results r JOIN races ra ON r.raceId = ra.raceId JOIN status s ON r.statusId = s.statusId WHERE ra.name = 'Canadian Grand Prix' AND s.status = 'Accident' ORDER BY COUNT(*) DESC LIMIT 1
SELECT      d.forename,      d.surname,      ds.wins FROM      drivers d INNER JOIN      driverStandings ds ON d.driverId = ds.driverId WHERE      d.dob = (         SELECT MIN(dob)          FROM drivers      )
SELECT MAX(duration) AS longest_pit_stop_duration FROM pitstops
SELECT MIN(time) AS fastest_lap_time FROM lapTimes
SELECT MAX(p.duration) AS longest_time FROM drivers d INNER JOIN pitstops p ON d.driverId = p.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT pitstops.lap FROM drivers INNER JOIN pitstops ON drivers.driverId = pitstops.driverId INNER JOIN races ON pitstops.raceId = races.raceId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.year = 2011 AND races.name = 'Australian Grand Prix'
SELECT      ps.duration AS pit_stop_duration FROM      pitstops ps INNER JOIN      races r ON ps.raceId = r.raceId WHERE      r.name = 'Australian Grand Prix' AND r.year = 2011
SELECT r.time FROM drivers d INNER JOIN results r ON d.driverId = r.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' ORDER BY r.time ASC LIMIT 1
SELECT      d.forename,      d.surname FROM      drivers d INNER JOIN      lapTimes lt ON d.driverId = lt.driverId ORDER BY      lt.time ASC LIMIT 20
SELECT results.position FROM results JOIN races ON results.raceId = races.raceId JOIN drivers ON results.driverId = drivers.driverId WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.time ASC LIMIT 1
SELECT MAX(l.time) AS fastest_lap FROM races r INNER JOIN laptimes l ON r.raceId = l.raceId WHERE r.circuitId = (SELECT circuitId FROM circuits WHERE circuitRef = 'Austria Grand Prix Circuit')
SELECT      lt.time  FROM      circuits AS c INNER JOIN      races AS r ON c.circuitId = r.circuitId INNER JOIN      lapTimes AS lt ON r.raceId = lt.raceId WHERE      c.country = 'Italy'
SELECT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T3.circuitRef = 'sepang' ORDER BY T2.fastestLapTime DESC LIMIT 1
SELECT      MAX(p.time) AS fastest_pit_stop_time FROM      results r INNER JOIN      pitstops p ON r.raceId = p.raceId AND r.driverId = p.driverId WHERE      r.raceId IN (         SELECT              r.raceId          FROM              results r         INNER JOIN              drivers d ON r.driverId = d.driverId         INNER JOIN              circuits c ON r.raceId = c.circuitId         WHERE              c.circuitId = 26     )
SELECT c.lat, c.lng FROM circuits c JOIN lapTimes lt ON c.circuitId = lt.raceId WHERE lt.time = '1:29.488'
SELECT AVG(pi.milliseconds) AS average_pit_stop_time_ms FROM drivers d INNER JOIN pitstops pi ON d.driverId = pi.driverId WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton'
SELECT AVG(lt.milliseconds) AS average_lap_time_ms FROM lapTimes lt INNER JOIN races r ON lt.raceId = r.raceId INNER JOIN circuits c ON r.circuitId = c.circuitId WHERE c.country = 'Italy'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT Player.player_name FROM Player ORDER BY Player.height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential = (SELECT MIN(potential) FROM Player_Attributes) LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT pa.player_api_id FROM Player_Attributes pa ORDER BY pa.crossing DESC LIMIT 5
SELECT      L.name  FROM      League AS L  INNER JOIN      Match AS M  ON      M.league_id = L.id  WHERE      M.season = '2015/2016'  GROUP BY      L.name  ORDER BY      SUM(M.home_team_goal + M.away_team_goal) DESC  LIMIT 1
SELECT      home_team_api_id FROM      Match WHERE      season = '2015/2016'     AND home_team_goal - away_team_goal < 0 ORDER BY      home_team_goal - away_team_goal ASC LIMIT 1
SELECT      p.player_name FROM      Player AS p JOIN      Player_Attributes AS pa ON p.id = pa.player_api_id ORDER BY      pa.penalties DESC LIMIT 10
SELECT team.team_long_name FROM Team AS team INNER JOIN Match AS match ON team.team_api_id = match.away_team_api_id INNER JOIN League AS league ON match.league_id = league.id WHERE league.name = 'Scotland Premier League' AND match.season = '2009/2010' AND match.away_team_goal > match.home_team_goal ORDER BY match.away_team_goal DESC LIMIT 1
SELECT T2.buildUpPlaySpeed FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id ORDER BY T2.buildUpPlaySpeed DESC LIMIT 4
SELECT      l.name FROM      Match m INNER JOIN      League l ON m.league_id = l.id WHERE      m.season = '2015/2016' GROUP BY      l.name ORDER BY      COUNT(*) DESC LIMIT 1
SELECT sprint_speed FROM Player_Attributes WHERE sprint_speed >= 97 AND strftime('%Y', date) BETWEEN '2013' AND '2015'
SELECT L.name, COUNT(*) AS matches_count FROM League AS L INNER JOIN Match AS M ON L.id = M.league_id GROUP BY L.id ORDER BY matches_count DESC LIMIT 1
SELECT SUM(height) / COUNT(id) AS average_height FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59'
SELECT player_api_id FROM Player_Attributes WHERE substr(date, 1, 4) = '2010' ORDER BY overall_rating DESC LIMIT 1
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed > 50 AND buildUpPlaySpeed < 60 GROUP BY team_fifa_api_id
SELECT T.team_long_name FROM Team AS T INNER JOIN Team_Attributes AS TAA ON T.team_api_id = TAA.team_api_id WHERE strftime('%Y', TAA.date) = '2012'   AND TAA.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE strftime('%Y', date) = '2012') ORDER BY T.team_long_name
SELECT (SUM(CASE WHEN preferred_foot = 'left' THEN 1 ELSE 0 END) * 100.0 / COUNT(pa.player_api_id)) AS left_foot_percentage FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.id = pa.player_api_id WHERE strftime('%Y', p.birthday) BETWEEN '1987' AND '1992'
SELECT      League.name  FROM      League  INNER JOIN      Match ON League.id = Match.league_id  INNER JOIN      Team ON Match.home_team_api_id = Team.team_api_id  INNER JOIN      Team AS Home_Team ON Match.home_team_api_id = Home_Team.team_api_id  INNER JOIN      Team AS Away_Team ON Match.away_team_api_id = Away_Team.team_api_id  GROUP BY      League.name  ORDER BY      SUM(Match.home_team_goal + Match.away_team_goal) ASC  LIMIT 5
SELECT AVG(T1.long_shots) AS average_long_shots FROM Player_Attributes T1 INNER JOIN Player T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Ahmed Samir Farag'
SELECT      P.player_name FROM      Player AS P INNER JOIN      Player_Attributes AS PA ON      P.id = PA.player_api_id WHERE      P.height > 180 GROUP BY      P.player_name ORDER BY      AVG(PA.heading_accuracy) DESC LIMIT 10
SELECT T.team_long_name FROM Team AS T INNER JOIN Team_Attributes AS TTA ON T.team_api_id = TTA.team_api_id WHERE TTA.buildUpPlayDribblingClass = 'Normal' AND TTA.date BETWEEN '2014-01-01 00:00:00' AND '2014-12-31 00:00:00' GROUP BY T.team_long_name HAVING AVG(TTA.chanceCreationPassing) < (SELECT AVG(chanceCreationPassing) FROM Team_Attributes) ORDER BY AVG(TTA.chanceCreationPassing) DESC
SELECT      L.name AS league_name FROM      League AS L INNER JOIN      Match AS M ON      L.id = M.league_id OR L.id = M.away_team_api_id WHERE      M.season = '2009/2010' GROUP BY      L.name HAVING      AVG(M.home_team_goal) > AVG(M.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 7) = '1970-10'
SELECT PA.attacking_work_rate FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.player_api_id = PA.player_api_id WHERE P.player_name = 'Franco Zennaro'
SELECT TAT.buildUpPlayPositioningClass FROM Team AS T INNER JOIN Team_Attributes AS TAT ON T.team_api_id = TAT.team_api_id WHERE T.team_long_name = 'ADO Den Haag'
SELECT pa.heading_accuracy FROM Player_Attributes pa INNER JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Francois Affolter' AND pa.date = '2014-09-18 00:00:00'
SELECT pa.overall_rating FROM Player_Attributes pa INNER JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Gabriel Tamas' AND strftime('%Y', pa.date) = '2011'
SELECT COUNT(*) FROM Match m INNER JOIN League l ON m.league_id = l.id WHERE m.season = '2015/2016' AND l.name = 'Scotland Premier League'
SELECT PA.preferred_foot FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.id = PA.player_api_id ORDER BY P.birthday DESC LIMIT 1
SELECT Player.player_name FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_api_id = Player.id ORDER BY Player_Attributes.potential DESC LIMIT 1
SELECT COUNT(*) FROM Player INNER JOIN Player_Attributes ON Player.id = Player_Attributes.player_api_id WHERE Player.weight < 130 AND Player_Attributes.preferred_foot = 'left'
SELECT T.team_short_name FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.chanceCreationPassingClass = 'Risky'
SELECT pa.defensive_work_rate FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'David Wilson'
SELECT      Player.birthday  FROM      Player  INNER JOIN      Player_Attributes  ON      Player.id = Player_Attributes.player_api_id  ORDER BY      Player_Attributes.overall_rating DESC  LIMIT 1
SELECT L.name FROM League AS L INNER JOIN Country AS C ON L.country_id = C.id WHERE C.name = 'Netherlands'
SELECT AVG(home_team_goal) AS average_home_team_goal FROM Match INNER JOIN Country ON Match.country_id = Country.id WHERE Country.name = 'Poland' AND Match.season = '2010/2011'
SELECT T2.player_name AS Highest_Finishing_Rate_Player FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.id WHERE T1.finishing IS NOT NULL GROUP BY T2.player_name ORDER BY AVG(T1.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(*) FROM Player WHERE strftime('%Y', birthday) = '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170
SELECT      Player.player_name  FROM      Player  INNER JOIN      Player_Attributes  ON      Player.id = Player_Attributes.player_api_id  WHERE      Player_Attributes.overall_rating > 80      AND      strftime('%Y', Player_Attributes.date) BETWEEN '2008' AND '2010'
SELECT pa.potential FROM Player_Attributes pa JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Aaron Doran'
SELECT p.player_name FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.id = pa.player_api_id WHERE pa.preferred_foot = 'left'
SELECT T.team_long_name FROM Team AS T INNER JOIN Team_Attributes AS TA ON T.team_api_id = TA.team_api_id WHERE TA.buildUpPlaySpeedClass = 'Fast'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB'
SELECT Team.team_short_name FROM Team INNER JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team_Attributes.buildUpPlayPassing > 70
SELECT AVG(pt.overall_rating) FROM Player AS p INNER JOIN Player_Attributes AS pt ON p.id = pt.player_api_id WHERE strftime('%Y', pt.date) BETWEEN '2010' AND '2015' AND p.height > 170
SELECT player_name FROM Player WHERE height = (SELECT MIN(height) FROM Player)
SELECT Country.name FROM League JOIN Country ON League.country_id = Country.id WHERE League.name = 'Italy Serie A'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE p.player_name = 'Aaron Doran'
SELECT COUNT(*) AS league_matches FROM League INNER JOIN Match ON League.id = Match.league_id WHERE League.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', Match.date) BETWEEN '2008-08' AND '2008-10'
SELECT Team.team_short_name FROM Match INNER JOIN Team ON Match.home_team_api_id = Team.team_api_id WHERE Match.home_team_goal = 10
SELECT      T2.player_name FROM      Player_Attributes AS T1 INNER JOIN      Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE      T1.potential = 61 ORDER BY      T1.balance DESC LIMIT 1
SELECT      AVG(CASE WHEN player_name = 'Abdou Diallo' THEN ball_control ELSE NULL END) -      AVG(CASE WHEN player_name = 'Aaron Appindangoye' THEN ball_control ELSE NULL END) AS ball_control_difference FROM      Player_Attributes JOIN      Player  ON      Player_Attributes.player_api_id = Player.id WHERE      Player.player_name IN ('Abdou Diallo', 'Aaron Appindangoye')
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name IN ('Aaron Lennon', 'Abdelaziz Barrada') ORDER BY birthday DESC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT country.name FROM League INNER JOIN Country ON League.id = Country.id WHERE League.name = 'Belgium Jupiler League'
SELECT League.name  FROM Country  INNER JOIN League ON Country.id = League.country_id  WHERE Country.name = 'Germany'
SELECT      T1.player_name FROM      Player AS T1 INNER JOIN      Player_Attributes AS T2 ON      T1.player_api_id = T2.player_api_id WHERE      T2.overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes)
SELECT COUNT(*) AS TotalPlayers FROM Player INNER JOIN Player_Attributes ON Player.id = Player_Attributes.player_api_id WHERE strftime('%Y', birthday) < '1986' AND Player_Attributes.defensive_work_rate = 'high'
SELECT      p.player_name FROM      Player AS p INNER JOIN      Player_Attributes AS pa ON p.player_api_id = pa.player_api_id WHERE      p.player_name IN ('Ariel Borysiuk', 'Arouna Kone') ORDER BY      pa.crossing DESC LIMIT 1
SELECT pa.heading_accuracy FROM Player_Attributes pa INNER JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Ariel Borysiuk'
SELECT COUNT(*) FROM Player INNER JOIN Player_Attributes ON Player.id = Player_Attributes.player_api_id WHERE Player.height > 180 AND Player_Attributes.volleys > 70
SELECT P.player_name FROM Player AS P INNER JOIN Player_Attributes AS PA ON P.id = PA.player_api_id WHERE PA.volleys > 70 AND PA.dribbling > 70
SELECT COUNT(*) FROM Country INNER JOIN Match ON Country.id = Match.country_id WHERE Country.name = 'Belgium' AND Match.season = '2008/2009'
SELECT pa.long_passing FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.player_api_id = pa.player_api_id ORDER BY p.birthday ASC LIMIT 1
SELECT COUNT(*) FROM Match INNER JOIN League ON Match.league_id = League.id WHERE League.name = 'Belgium Jupiler League' AND SUBSTR(date, 1, 7) = '2009-04'
SELECT l.name FROM League l INNER JOIN Match m ON l.id = m.league_id WHERE m.season = '2008/2009' GROUP BY l.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(pa.overall_rating) AS average_overall_rating FROM Player AS p INNER JOIN Player_Attributes AS pa ON p.id = pa.player_api_id WHERE strftime('%Y', p.birthday) < '1986'
SELECT (AVG(CASE WHEN player_name = 'Ariel Borysiuk' THEN overall_rating ELSE NULL END) - AVG(CASE WHEN player_name = 'Paulin Puel' THEN overall_rating ELSE NULL END)) * 100.0 / NULLIF(AVG(CASE WHEN player_name = 'Ariel Borysiuk' THEN overall_rating ELSE NULL END), NULL) FROM Player_Attributes AS P JOIN Player AS P1 ON P.player_api_id = P1.player_api_id WHERE P1.player_name IN ('Ariel Borysiuk', 'Paulin Puel')
SELECT AVG(TA.buildUpPlaySpeed) AS avg_build_up_play_speed FROM Team_Attributes TA INNER JOIN Team T ON TA.team_api_id = T.team_api_id WHERE T.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) AS average_overall_rating FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(TA.crossing) AS total_crossing_score FROM Player_Attributes AS TA INNER JOIN Player AS P ON TA.player_api_id = P.player_api_id WHERE P.player_name = 'Aaron Lennox'
SELECT      MAX(TA.chanceCreationPassing) AS highest_chance_creation_passing,                  TA.chanceCreationPassingClass FROM      Team AS T INNER JOIN      Team_Attributes AS TA ON      T.team_api_id = TA.team_api_id WHERE      T.team_long_name = 'Ajax' ORDER BY      TA.chanceCreationPassing DESC LIMIT 1
SELECT TA.preferred_foot FROM Player AS P INNER JOIN Player_attributes AS TA ON P.player_api_id = TA.player_api_id WHERE P.player_name = 'Abdou Diallo'
SELECT MAX(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Dorlan Pabon'
SELECT AVG(M.away_team_goal) AS average_goals FROM Team AS T INNER JOIN Match AS M ON T.team_api_id = M.away_team_api_id WHERE T.team_long_name = 'Parma'
SELECT p.player_name FROM Player p INNER JOIN Player_Attributes pa ON p.player_api_id = pa.player_api_id WHERE pa.overall_rating = 77 AND pa.date LIKE '2016-06-23%' ORDER BY p.birthday ASC LIMIT 1
SELECT      T2.overall_rating  FROM      Player AS T1  INNER JOIN      Player_Attributes AS T2  ON      T1.player_api_id = T2.player_api_id  WHERE      T1.player_name = 'Aaron Mooy'      AND T2.date LIKE '2016-02-04%'
SELECT pa.potential FROM Player_Attributes pa INNER JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Francesco Parravicini' AND pa.date = '2010-08-30 00:00:00'
SELECT pa.attacking_work_rate FROM Player_Attributes pa INNER JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.player_name = 'Francesco Migliore' AND pa.date LIKE '2015-05-01%'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'
SELECT T3.date FROM Player AS T1 INNER JOIN Player_Attributes AS T3 ON T1.player_api_id = T3.player_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T3.crossing DESC LIMIT 1
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id INNER JOIN Match AS T3 ON T1.team_api_id = T3.home_team_api_id WHERE T1.team_long_name = 'Willem II' AND T3.date = '2011-02-22'
SELECT T2.buildUpPlayDribblingClass  FROM Team AS T1  INNER JOIN Team_Attributes AS T2  ON T1.team_api_id = T2.team_api_id  WHERE T1.team_short_name = 'LEI'  AND T2.date = '2015-09-10 00:00:00'
SELECT Team_Attributes.buildUpPlayPassingClass FROM Team INNER JOIN Team_Attributes ON Team.team_api_id = Team_Attributes.team_api_id WHERE Team.team_long_name = 'FC Lorient' AND Team_Attributes.date LIKE '2010-02-22%'
SELECT T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'
SELECT T2.chanceCreationCrossingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'
SELECT T2.defenceAggressionClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.date LIKE '2015-09-10%'
SELECT AVG(pa.overall_rating) AS average_overall_rating  FROM Player_Attributes pa  INNER JOIN Player p ON pa.player_api_id = p.player_api_id  WHERE p.player_name = 'Marko Arnautovic'     AND pa.date BETWEEN '2007-02-22' AND '2016-04-21'
SELECT      (CAST(SUM(CASE WHEN Player.player_name = 'Landon Donovan' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) AS percentage FROM      Player INNER JOIN      Match ON      Player.id = Match.home_team_api_id WHERE      Match.date = '2013/7/12'       AND Player.player_name IN ('Landon Donovan', 'Jordan Bowery')
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM Player WHERE weight = (SELECT MAX(weight) FROM Player)
SELECT player_name FROM Player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) > 34
SELECT SUM(m.home_team_goal) AS total_home_team_goals FROM match m INNER JOIN Player p ON m.home_team_api_id = p.player_api_id WHERE p.player_name = 'Aaron Lennon'
SELECT SUM(home_team_goal) AS total_home_team_goals FROM Match AS m INNER JOIN Player AS p ON m.home_player_1 = p.player_api_id OR m.home_player_2 = p.player_api_id OR m.home_player_3 = p.player_api_id OR m.home_player_4 = p.player_api_id OR m.home_player_5 = p.player_api_id OR m.home_player_6 = p.player_api_id OR m.home_player_7 = p.player_api_id OR m.home_player_8 = p.player_api_id OR m.home_player_9 = p.player_api_id OR m.home_player_10 = p.player_api_id WHERE p.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(m.home_team_goal) AS total_home_team_goals FROM Match m INNER JOIN Player p ON m.home_team_api_id = p.player_api_id WHERE p.birthday < strftime('%Y', 'now') - 30
SELECT Player.player_name FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_api_id = Player.id ORDER BY Player_Attributes.overall_rating DESC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.potential = (SELECT MAX(potential) FROM Player_Attributes)
SELECT      Player.player_name FROM      Player INNER JOIN      Player_Attributes ON      Player.id = Player_Attributes.player_api_id WHERE      Player_Attributes.attacking_work_rate = 'high'
SELECT pp.player_name FROM Player pp INNER JOIN Player_Attributes pa ON pp.player_api_id = pa.player_api_id WHERE pa.finishing = 1 ORDER BY pp.birthday LIMIT 1
SELECT Player.player_name FROM Player INNER JOIN Country ON Player.player_api_id = Country.id INNER JOIN League ON Country.id = League.country_id WHERE Country.name = 'Belgium'
SELECT C.name FROM Player_attributes PA INNER JOIN Player P ON PA.player_api_id = P.player_api_id INNER JOIN Country C ON PA.player_fifa_api_id = C.id WHERE PA.vision > 89
SELECT      c.name FROM      Country c INNER JOIN      Player p ON c.id = p.player_fifa_api_id GROUP BY      c.id, c.name ORDER BY      AVG(p.weight) DESC LIMIT 1
SELECT T.team_long_name FROM Team AS T INNER JOIN Team_Attributes AS TAT ON T.team_api_id = TAT.team_api_id WHERE TAT.buildUpPlaySpeedClass = 'Slow'
SELECT T.team_short_name FROM Team AS T INNER JOIN Team_Attributes AS T_A ON T.team_api_id = T_A.team_api_id WHERE T_A.chanceCreationPassingClass = 'Safe'
SELECT AVG(T2.height) AS average_height FROM Player AS T2 INNER JOIN Country AS T1 ON T1.id = T2.player_fifa_api_id WHERE T1.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990'
SELECT jumping - jumping AS difference FROM Player_Attributes WHERE id IN (6, 23)
SELECT id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 5
SELECT COUNT(*) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = (SELECT MAX(crossing) FROM Player_Attributes)
SELECT CAST(SUM(CASE WHEN strength > 80 AND stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*) FROM Player_Attributes
SELECT Country.name FROM Country INNER JOIN League ON Country.id = League.country_id WHERE Country.name = 'Poland'
SELECT m.home_team_goal, m.away_team_goal FROM Match m INNER JOIN League l ON m.league_id = l.id WHERE m.date LIKE '2008-09-24%'     AND l.name = 'Belgium Jupiler League'
SELECT      pa.sprint_speed,      pa.agility,      pa.acceleration  FROM      Player_Attributes pa  INNER JOIN      Player p  ON      pa.player_api_id = p.player_api_id  WHERE      p.player_name = 'Alexis Blin'
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge'
SELECT COUNT(*) AS games_played FROM Match INNER JOIN League ON Match.league_id = League.id WHERE Match.season = '2015/2016' AND League.name = 'Italy Serie A'
SELECT MAX(home_team_goal) AS Highest_Score FROM Match JOIN League ON Match.league_id = League.id WHERE League.name = 'Netherlands Eredivisie'
SELECT pa.finishing, pa.curve FROM Player_Attributes pa INNER JOIN Player p ON pa.player_api_id = p.player_api_id WHERE p.weight = ( SELECT MAX(weight) FROM Player )
SELECT      T1.name  FROM      League AS T1  INNER JOIN      Match AS T2  ON      T1.id = T2.league_id  WHERE      T2.season = '2015/2016'  GROUP BY      T1.name  ORDER BY      COUNT(*) DESC  LIMIT 4
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Match AS T2 ON T1.team_api_id = T2.away_team_api_id ORDER BY T2.away_team_goal DESC LIMIT 1
SELECT Player.player_name FROM Player_Attributes INNER JOIN Player ON Player_Attributes.player_api_id = Player.id ORDER BY Player_Attributes.overall_rating DESC LIMIT 1
SELECT      (CAST(SUM(CASE WHEN P.height < 180 AND PA.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(P.id) AS percentage FROM      Player AS P INNER JOIN      Player_Attributes AS PA  ON      P.id = PA.player_api_id
SELECT COUNT(CASE WHEN SEX = 'M' AND Admission = '+' THEN ID END) - COUNT(CASE WHEN SEX = 'M' AND Admission = '-' THEN ID END) AS deviation_percentage FROM Patient WHERE SEX = 'M'
SELECT (100.0 * COUNT(CASE WHEN SEX = 'F' THEN ID END) / COUNT(*)) FROM Patient WHERE SEX = 'F' AND strftime('%Y', birthday) > '1930'
SELECT      CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS InpatientPercentage FROM      Patient WHERE      strftime('%Y', Birthday) BETWEEN '1930' AND '1940'
SELECT (CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END)) AS ratio FROM Examination JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Diagnosis = 'SLE'
SELECT Laboratory.`Date` FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.ID = 30609
SELECT      Patient.SEX,      Patient.Birthday,      Examination.`Examination Date`,      Examination.`Symptoms` FROM      Examination JOIN      Patient  ON      Examination.ID = Patient.ID WHERE      Examination.ID = 163109
SELECT      P.ID,      P.SEX,      P.Birthday  FROM      Laboratory AS L JOIN      Patient AS P  ON      L.ID = P.ID  WHERE      L.LDH > 500
SELECT P.ID, (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) AS Age FROM Examination AS E INNER JOIN Patient AS P ON E.ID = P.ID WHERE E.RVVT = '+'
SELECT      Patient.ID,      Patient.SEX,      Examination.Diagnosis FROM      Examination JOIN      Patient ON      Examination.ID = Patient.ID WHERE      Examination.Thrombosis = 2
SELECT ID FROM Patient WHERE year(birthday) = '1937'   AND T-CHO >= 250
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.ALB < 3.5
SELECT CAST(COUNT(CASE WHEN TP < 6.0 OR TP > 8.5 THEN 1 END) AS REAL) * 100 / COUNT(*) AS TP_percentage FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.SEX = 'F'
SELECT AVG(T1.`aCL IgG`) AS AverageAntiCardiolipinAbot FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Admission = '+' AND (strftime('%Y', 'now') - strftime('%Y', T2.`First Date`) - strftime('%m-%d', 'now') >= 50)
SELECT COUNT(ID) AS female_patients_admitted_in_1997 FROM Patient WHERE Admission = '-' AND Description LIKE '1997-%' AND sex = 'F'
SELECT MIN(     CASE         WHEN SUBSTR(`First Date`, 1, 4) < SUBSTR(`Birthday`, 1, 4) THEN 1         ELSE 0     END ) FROM Patient
SELECT COUNT(*) FROM Examination E INNER JOIN Patient P ON E.ID = P.ID WHERE E.Thrombosis = '1' AND E.`Examination Date` LIKE '1997%'   AND P.SEX = 'F'
SELECT      MAX(p.Birthday) - MIN(p.Birthday) AS age_gap FROM      Laboratory l INNER JOIN      Patient p ON l.ID = p.ID WHERE      l.tg >= 200
SELECT Examination.Symptoms, Examination.Diagnosis FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Symptoms IS NOT NULL ORDER BY Patient.Birthday ASC LIMIT 1
SELECT strftime('%Y-%m', Date) AS Month, COUNT(P.ID) AS MalePatientsTested FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'M' AND L.`Date` BETWEEN '1998-01-01' AND '1998-12-31' GROUP BY Month ORDER BY Month
SELECT      (julianday('now') - julianday(`First Date`)) / 365.25 AS Age_in_Number,     `First Date` FROM      Patient WHERE      Diagnosis = 'SJS' ORDER BY      Age_in_Number DESC LIMIT 1
SELECT  (CAST(SUM(CASE WHEN SEX = 'M' THEN 1 ELSE 0 END) AS REAL) * 1.0) /  (CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 1.0) FROM Laboratory AS lab INNER JOIN Patient AS pat ON lab.ID = pat.ID WHERE lab.UA <= '8.0' OR lab.UA <= '6.5'
SELECT COUNT(*) FROM Examination AS E INNER JOIN Patient AS P ON E.ID = P.ID WHERE (strftime('%Y', E.`Examination Date`) - strftime('%Y', P.`First Date`)) >= 1
SELECT COUNT(Patient.ID) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE (SELECT CAST(SUBSTR(Patient.Birthday, 1, 4) AS INTEGER) - 18) < 1990 AND Examination.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31'
SELECT COUNT(P.ID) FROM Patient AS P JOIN Laboratory AS Lab ON P.ID = Lab.ID WHERE P.SEX = 'M' AND Lab.T-BIL >= '2.0'
SELECT      T1.Diagnosis FROM      Examination AS T2 INNER JOIN      Patient AS T1  ON      T2.ID = T1.ID  WHERE      T2.`Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'  AND      T1.Diagnosis IN (         SELECT              DISTINCT Diagnosis          FROM              Examination          WHERE              `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31'      ) GROUP BY      T1.Diagnosis  ORDER BY      COUNT(T1.ID) DESC  LIMIT 1
SELECT AVG(STRFTIME('%Y', '1999-01-01') - STRFTIME('%Y', P.Birthday)) AS average_age FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.Date BETWEEN '1991-10-01' AND '1991-10-30'
SELECT      CAST(strftime('%Y', Examination.`Examination Date`) AS INTEGER) - CAST(strftime('%Y', Patient.Birthday) AS INTEGER) AS Age,     Patient.`Diagnosis` FROM      Examination INNER JOIN      Patient ON Examination.ID = Patient.ID ORDER BY      Examination.`Examination Date` DESC LIMIT 1
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT L.HCT FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.`Date` = '1995-09-04' AND L.HCT < 250
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY ID ASC LIMIT 1
SELECT T2.`aCL IgM` FROM Examination AS T2 INNER JOIN Patient AS T1 ON T2.ID = T1.ID WHERE T1.Description = '1994-02-19' AND T1.Diagnosis = 'SLE' AND T2.`Examination Date` = '1993-11-12'
SELECT      P.SEX FROM      Laboratory AS L  INNER JOIN      Patient AS P  ON      L.ID = P.ID  WHERE      L.`Date` = '1992-06-12'  AND      L.GPT = 9
SELECT (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday) -          (strftime('%Y', 'now') < strftime('%Y', Patient.Birthday) ||           '0000' || strftime('%Y', Patient.Birthday)) + (strftime('%Y', 'now') < '1900' || '0000' || strftime('%Y', 'now'))) AS Age  FROM Laboratory  INNER JOIN Patient  ON Laboratory.ID = Patient.ID  WHERE Laboratory.`Date` = '1991-10-21'    AND Laboratory.UA = '8.4'
SELECT COUNT(*) AS TotalLaboratoryTests FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.`First Date` = '1991-06-13'   AND Patient.Diagnosis = 'SJS'   AND Laboratory.`Date` BETWEEN '1995-01-01' AND '1995-12-31'
SELECT Patient.Diagnosis FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`Examination Date` = '1997-01-27' AND Patient.`First Date` = '1997-01-27' AND Examination.`Diagnosis` = 'SLE'
SELECT      Examination.Symptoms FROM      Examination INNER JOIN      Patient  ON      Examination.ID = Patient.ID  WHERE      Patient.Birthday = '1959-03-01'      AND Examination.`Examination Date` = '1993-09-27'
SELECT (SUM(CASE WHEN `Date` LIKE '1981-12-%' THEN `T-CHO` ELSE 0 END) - SUM(CASE WHEN `Date` LIKE '1981-01-%' THEN `T-CHO` ELSE 0 END)) * 100.0 / (SUM(CASE WHEN `Date` LIKE '1981-01-%' THEN `T-CHO` ELSE 0 END) + SUM(CASE WHEN `Date` LIKE '1981-12-%' THEN `T-CHO` ELSE 0 END)) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Birthday = '1959-02-18'
SELECT DISTINCT Examination.ID FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Diagnosis = 'Behcet' AND Examination.`Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'
SELECT COUNT(*) FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.Date BETWEEN '1987-07-06' AND '1996-01-31' AND L.GPT > 30 AND L.ALB < 4
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Admission = '+' AND strftime('%Y', Birthday) = '1964'
SELECT COUNT(*) AS number_of_patients FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.Thrombosis = 2 AND Examination.ANA = 'S' GROUP BY Examination.ANA HAVING AVG(`aCL IgM`) > (SELECT AVG(`aCL IgM`) FROM Examination)
SELECT      (SUM(CASE WHEN LA.UA < 6.5 THEN 1 ELSE 0 END) * 100.0 / COUNT(LA.ID)) AS percentage FROM      Laboratory AS LA JOIN      Patient AS P ON      LA.ID = P.ID WHERE      LA.UA < 6.5 AND LA.UA <= 30
SELECT      (SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Percentage FROM      Patient WHERE      strftime('%Y', `First Date`) = '1981' AND SEX = 'M'
SELECT DISTINCT p.ID  FROM Patient p  INNER JOIN Laboratory l  ON p.ID = l.ID  WHERE p.Admission = '-'    AND l.`Date` LIKE '1991-10%'    AND l.`T-BIL` < 2.0
SELECT COUNT(*) FROM Patient INNER JOIN Examination ON Patient.ID = Examination.ID WHERE Sex = 'F' AND Birthday BETWEEN '1980-01-01' AND '1989-12-31' AND Examination.`ANA Pattern` <> 'P'
SELECT      Patient.SEX FROM      Patient INNER JOIN      Examination ON Patient.ID = Examination.ID INNER JOIN      Laboratory ON Patient.ID = Laboratory.ID WHERE      Examination.Diagnosis = 'PSS'     AND Laboratory.CRP > 2     AND Laboratory.CRE = 1     AND Laboratory.LDH = 123
SELECT AVG(L.ALB) AS average_blood_albumin_level FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.PLT > 400 AND P.Diagnosis = 'SLE'
SELECT T2.symptoms FROM Examination T2 INNER JOIN Patient T1 ON T2.ID = T1.ID WHERE T1.Diagnosis = 'SLE' GROUP BY T2.symptoms ORDER BY COUNT(T2.symptoms) DESC LIMIT 1
SELECT      pd.Description,      e.Diagnosis  FROM      Examination e  JOIN      Patient pd  ON      e.ID = pd.ID  WHERE      pd.ID = 48473  ORDER BY      pd.Description ASC  LIMIT 1
SELECT COUNT(*) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(*) AS abnormal_protein_count FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE strftime('%Y', L.`Date`) = '1997'   AND L.tp > 6   AND L.tp < 8.5
SELECT CAST(SUM(CASE WHEN PATIENTS.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(PATIENTS.ID) FROM Examination AS EXAMINATION INNER JOIN Patient AS PATIENTS ON EXAMINATION.ID = PATIENTS.ID WHERE EXAMINATION.Symptoms = 'thrombocytopenia'
SELECT (CAST(SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) FROM Patient AS P WHERE P.BIRTHDAY LIKE '1980-%' AND P.Diagnosis = 'RA'
SELECT COUNT(*) FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.`Examination Date` BETWEEN '1995' AND '1997' AND T1.Diagnosis = 'Behcet' AND T2.Admission = '-'
SELECT COUNT(T1.ID)  FROM Patient AS T1  INNER JOIN Laboratory AS T2  ON T1.ID = T2.ID  WHERE T1.SEX = 'F' AND T2.WBC < 3.5
SELECT      MIN(Examination.`Examination Date`) - Patient.`First Date` FROM      Examination INNER JOIN      Patient ON      Examination.ID = Patient.ID WHERE      Examination.ID = 821298
SELECT DISTINCT T1.`UA` FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.ID = 57266 AND T1.UA > 8.0 AND (T1.UA > 6.5 OR T2.SEX IN ('M', 'F'))
SELECT      L.`Date` FROM      Laboratory AS L INNER JOIN      Patient AS P ON      L.ID = P.ID WHERE      L.GOT >= 60 AND P.ID = 48473
SELECT      Patient.SEX,      Patient.Birthday  FROM      Patient  INNER JOIN      Laboratory  ON      Patient.ID = Laboratory.ID  WHERE      Laboratory.GOT < 60      AND Laboratory.Date = '1994-01-01'
SELECT Library.`ID` FROM Laboratory AS Library INNER JOIN Patient AS Patient ON Library.ID = Patient.ID WHERE Patient.SEX = 'M' AND Library.GPT >= 60.5
SELECT PATIENT.Diagnosis FROM PATIENT INNER JOIN LABORATORY ON PATIENT.ID = LABORATORY.ID WHERE LABORATORY.GPT > 60 ORDER BY PATIENT.Birthday ASC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT      P.ID,      CAST(strftime('%Y', 'now') - strftime('%Y', P.Birthday) AS REAL) AS Age  FROM      Laboratory AS L  INNER JOIN      Patient AS P  ON      L.ID = P.ID  WHERE      L.LDH BETWEEN 100 AND 300
SELECT      pp.admission FROM      Patient pp INNER JOIN      Laboratory l ON pp.ID = l.ID WHERE      pp.admission = '+' AND l.ALP < 300
SELECT p.ID FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE p.Birthday = '1982-04-01' AND l.ALP < 300
SELECT      P.ID,      P.SEX,      P.Birthday  FROM      Laboratory AS L  INNER JOIN      Patient AS P  ON      L.ID = P.ID  WHERE      L.TP < 6.0
SELECT T1.TP - 8.5 AS TP_deviation FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'F' AND T1.TP > 8.5
SELECT      P.ID FROM      Patient AS P INNER JOIN      Laboratory AS Lab ON      P.ID = Lab.ID WHERE      P.SEX = 'M'      AND Lab.ALB <= 3.5      OR Lab.ALB >= 5.5 ORDER BY      P.Birthday DESC
SELECT Lab.ALB FROM Laboratory AS Lab INNER JOIN Patient AS P ON Lab.ID = P.ID WHERE strftime('%Y', P.Birthday) = '1982' AND Lab.ALB BETWEEN 3.5 AND 5.5
SELECT CAST(SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS uric_acid_percentage FROM Laboratory AS LAB INNER JOIN Patient AS P ON LAB.ID = P.ID WHERE LAB.UA > 8.0
SELECT AVG(T1.UA) AS AverageUA FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX IN ('M', 'F') AND T1.UA < 8.0 OR T1.UA < 6.5
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.UN = 29
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE UN < 30 AND Diagnosis = 'RA'
SELECT COUNT(*) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Sex = 'M' AND Laboratory.CRE >= 1.5
SELECT      CASE          WHEN SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) THEN 1 ELSE 0 END AS More_Males FROM      Laboratory AS L INNER JOIN      Patient AS P ON L.ID = P.ID WHERE      L.CRE >= 1.5
SELECT      p.ID,      p.SEX,      p.Birthday  FROM      Laboratory l  INNER JOIN      Patient p ON l.ID = p.ID  WHERE      l.TBIL = (SELECT MAX(TBIL) FROM Laboratory)
SELECT DISTINCT P.SEX FROM Patient AS P WHERE P.T-BIL >= 2.0 GROUP BY P.SEX
SELECT      Patient.ID,      Laboratory.T-CHO  FROM      Patient INNER JOIN      Laboratory  ON      Patient.ID = Laboratory.ID WHERE      Patient.Birthday = (         SELECT              MIN(birthday)          FROM              Patient     ) ORDER BY      Laboratory.T-CHO DESC  LIMIT 1
SELECT AVG(T-CHO - strftime('%Y', 'now'))  FROM Examination  INNER JOIN Patient  ON Examination.ID = Patient.ID  WHERE SEX = 'M' AND T-CHO > 250
SELECT P.ID, P.Diagnosis FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.TG > 300
SELECT COUNT(DISTINCT Patient.ID) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.TG >= 200 AND CAST(strftime('%Y', 'now') AS INTEGER) - CAST(strftime('%Y', Patient.Birthday) AS INTEGER) > 50
SELECT DISTINCT P.ID FROM Patient AS P INNER JOIN Laboratory AS Lab ON P.ID = Lab.ID WHERE P.Admission = '-' AND Lab.CPK < 250
SELECT COUNT(DISTINCT T1.ID) AS male_patients_with_high_CPK FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.sex = 'M' AND strftime('%Y', T1.Birthday) BETWEEN '1936' AND '1956' AND T2.CPK >= 250
SELECT      T1.ID,      T1.SEX,      (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) as age  FROM      Patient T1  INNER JOIN      Laboratory T2  ON      T1.ID = T2.ID  WHERE      T2.`GLU` <= 180      AND T2.`T-CHO` < 250
SELECT Patient.ID, Laboratory.GLU FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE substr(Patient.Description, 1, 4) = '1991' AND Laboratory.GLU < 180
SELECT      P.ID,      P.SEX,      P.Birthday FROM      Patient AS P INNER JOIN      Laboratory AS L  ON      P.ID = L.ID WHERE      L.WBC <= 3.5 OR L.WBC >= 9.0 GROUP BY      P.SEX,      P.Birthday ORDER BY      P.SEX ASC
SELECT      Patient.ID AS Patient_ID,      (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) AS Age FROM      Laboratory INNER JOIN      Patient  ON      Laboratory.ID = Patient.ID WHERE      Laboratory.RBC < 3.5
SELECT      Patient.Admission   FROM      Patient   INNER JOIN      Laboratory   ON Patient.ID = Laboratory.ID   WHERE      Patient.Sex = 'F'     AND (Patient.Birthday - strftime('%Y', 'now')) >= 50     AND Laboratory.RBC < 3.5     OR Laboratory.RBC > 6.0     AND Patient.Admission IN ('+', '-')
SELECT DISTINCT ID, SEX FROM Patient WHERE Admission = '-' AND HBG < 10
SELECT      p.ID,      p.SEX  FROM      Patient p  INNER JOIN      Laboratory l  ON      p.ID = l.ID  WHERE      p.Diagnosis = 'SLE'  AND      l.HGB BETWEEN 10 AND 17  ORDER BY      p.Birthday DESC  LIMIT 1
SELECT      Patient.ID AS PatientID,     (strftime('%Y', 'now') - strftime('%Y', Patient.Birthday)) AS Age FROM      Laboratory INNER JOIN      Patient  ON      Laboratory.ID = Patient.ID WHERE      Laboratory.HCT >= 52 GROUP BY      Laboratory.ID HAVING      COUNT(Laboratory.ID) > 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29
SELECT SUM(CASE WHEN PLT <= 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT >= 400 THEN 1 ELSE 0 END) AS difference FROM Laboratory
SELECT p.ID FROM Laboratory AS l INNER JOIN Patient AS p ON l.ID = p.ID WHERE l.`Date` LIKE '%1984%' AND (strftime('%Y', 'now') - strftime('%Y', p.Birthday)) < 50 AND l.PLT BETWEEN 100 AND 400
SELECT      (CAST(SUM(CASE WHEN P.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(P.ID) AS PercentFemalePT FROM      Laboratory AS L INNER JOIN      Patient AS P ON L.ID = P.ID WHERE      L.PT >= 14 AND P.SEX = 'F'
SELECT      P.ID  FROM      Patient AS P INNER JOIN      Laboratory AS L ON      P.ID = L.ID WHERE      P.`First Date` > 1992      AND L.PT < 14
SELECT COUNT(*) FROM Laboratory WHERE `Date` > '1997-01-01' AND APTT < 45
SELECT COUNT(*) AS abnormal_prothrombin_time_count FROM Laboratory AS L JOIN Examination AS E ON L.ID = E.ID WHERE L.APTT > 45 AND E.Thrombosis = 0
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Sex = 'M' AND T2.WBC > 3.5 AND T2.WBC < 9.0 AND T2.FG <= 150 OR T2.FG >= 450
SELECT COUNT(DISTINCT P.ID) AS NormalFibrinogenLevelPatients FROM Patient P INNER JOIN Laboratory L ON P.ID = L.ID WHERE L.FG BETWEEN 150 AND 450   AND P.Birthday > '1980-01-01'
SELECT DISTINCT T2.`Diagnosis` FROM `Laboratory` AS T1 INNER JOIN Patient AS T2 ON T1.`ID` = T2.ID WHERE T1.`U-PRO` >= 30
SELECT P.ID FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE P.Diagnosis = 'SLE'   AND L.`U-PRO` BETWEEN 0 AND 29 ORDER BY L.`U-PRO` DESC LIMIT 1
SELECT COUNT(DISTINCT L.ID) FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE L.IGG >= 2000
SELECT COUNT(*) AS Normal_IgG_and_Symptoms FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID WHERE Examination.`aCL IgG` BETWEEN 900 AND 2000 AND Examination.Symptoms IS NOT NULL
SELECT      P.Diagnosis FROM      Laboratory L  JOIN      Patient P  ON      L.ID = P.ID  WHERE      L.IGA BETWEEN 80 AND 500  ORDER BY      L.IGA DESC  LIMIT 1
SELECT COUNT(ID) FROM Laboratory WHERE IGA > 80 AND IGA < 500 AND `Date` BETWEEN '1990-01-01' AND '1990-12-31'
SELECT P.Diagnosis FROM Laboratory AS Lab INNER JOIN Patient AS P ON Lab.ID = P.ID WHERE Lab.IGM <= 40 OR Lab.IGM >= 400 GROUP BY P.Diagnosis ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.`CRP` = '+' AND P.Description IS NULL
SELECT COUNT(T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.CRE >= 1.5   AND SUBSTR(T2.Birthday, 4, 2) < 70
SELECT COUNT(DISTINCT Examination.ID) AS ValidPatientCount FROM Examination WHERE Examination.KCT = '+'
SELECT DISTINCT P.Diagnosis FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.Birthday > '1985-01-01' AND L.RA IN ('-', '+')
SELECT P.ID FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE L.RF < 20 AND (strftime('%Y', 'now') - strftime('%Y', P.Birthday)) > 60
SELECT COUNT(*) AS patient_count FROM Laboratory AS l INNER JOIN Examination AS e ON l.ID = e.ID WHERE l.RF < 20 AND e.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`C3` > 35 AND T2.`ANA Pattern` = 'P'
SELECT T2.ID FROM Examination AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.`aCL IgA` IN (29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52) ORDER BY T1.`aCL IgA` DESC LIMIT 1
SELECT COUNT(*) AS normal_complement_count FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.C4 > 10 AND T1.Diagnosis = 'APS'
SELECT COUNT(*) FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE RNP = '-' OR RNP = '0' AND Admission = '+'
SELECT Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.RNP NOT IN ('-', '+') ORDER BY Patient.Birthday ASC LIMIT 1
SELECT COUNT(p.ID) FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID INNER JOIN Examination e ON p.ID = e.ID WHERE l.SM IN ('-', '0', '1') AND e.Thrombosis = 0
SELECT P.ID FROM Patient AS P INNER JOIN Laboratory AS Lab ON P.ID = Lab.ID WHERE Lab.SM NOT IN ('negative', '0') ORDER BY P.Birthday DESC LIMIT 3
SELECT Examination.ID FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.`Examination Date` > '1997-01-01' AND Laboratory.`SC170` IN ('negative', '0')
SELECT COUNT(*) AS FemaleAnonymousSymptomCount FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T1.Sex = 'F'   AND T2.SC170 IN('negative', '0')   AND T3.Symptoms IS NULL
SELECT COUNT(DISTINCT p.ID)  FROM Patient p  JOIN Laboratory l ON p.ID = l.ID  WHERE l.SSA IN ('-', '+')  AND strftime('%Y', p.birthday) < '2000'
SELECT      p.ID FROM      Laboratory l INNER JOIN      Patient p ON l.ID = p.ID WHERE      l.SSA NOT IN ('negative', '0') ORDER BY      l.`Date` ASC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) AS normal_ssbs_and_diagnosed FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SSB = '-' AND T2.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT P.ID) AS NumberOfPatients FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID INNER JOIN Examination AS E ON P.ID = E.ID WHERE L.SSB IN ('negative', '0') AND E.Symptoms IS NULL
SELECT COUNT(DISTINCT p.ID) AS male_count FROM Patient p INNER JOIN Laboratory l ON p.ID = l.ID WHERE p.Sex = 'M' AND l.CENTROMEA IN ('-', '+')
SELECT Patient.Diagnosis FROM Patient JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.DNA >= 8
SELECT COUNT(DISTINCT T2.ID) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA < 8 AND T2.Description IS NULL
SELECT COUNT(*) AS Normal_Admitted_Patients FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE IGG BETWEEN 900 AND 2000 AND Admission = '+'
SELECT CAST(SUM(IIF(GOT > 60, 1, 0)) AS REAL) * 100.0 / COUNT(*) AS abnormal_sle_percentage FROM Laboratory AS L INNER JOIN Examination AS E ON L.ID = E.ID WHERE E.Diagnosis = 'SLE'
SELECT COUNT(*) FROM Patient AS P INNER JOIN Laboratory AS L ON P.ID = L.ID WHERE P.SEX = 'M' AND L.GOT < 60
SELECT P.Birthday FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.GOT >= 60 ORDER BY P.Birthday ASC LIMIT 1
SELECT      pp.Birthday  FROM      Laboratory l INNER JOIN      Patient pp ON l.ID = pp.ID WHERE      l.GPT < 60 ORDER BY      l.GPT DESC LIMIT 3
SELECT COUNT(*) AS Male_Patient_Count FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.GOT < 60 AND T2.Sex = 'M'
SELECT MIN(LDH) AS latest_ldh_date FROM Laboratory AS T1 JOIN Patient AS T2 ON T1.ID = T2.ID WHERE LDH < 500 ORDER BY LDH DESC LIMIT 1
SELECT T1.`First Date` FROM `Patient` AS T1 INNER JOIN `Laboratory` AS T2 ON T1.ID = T2.ID WHERE T2.`LDH` > 500 ORDER BY T1.`First Date` DESC LIMIT 1
SELECT COUNT(*) AS abnormal_alp_count FROM Laboratory l INNER JOIN Patient p ON l.ID = p.ID WHERE l.ALP >= 300 AND p.Admission = '+'
SELECT COUNT(*) FROM Patient AS p INNER JOIN Laboratory AS l ON p.ID = l.ID WHERE p.Admission = '-' AND l.ALP < 300
SELECT      Patient.Diagnosis FROM      Patient JOIN      Laboratory  ON      Patient.ID = Laboratory.ID WHERE      Laboratory.TP < 6.0
SELECT COUNT(*) AS normal_protein_count FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.Diagnosis = 'SJS' AND T1.TP BETWEEN 6.0 AND 8.5
SELECT Date FROM Laboratory WHERE ALB > 3.5 AND ALB < 5.5 ORDER BY ALB DESC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T2.SEX = 'M' AND T1.ALB > 3.5 AND T1.ALB < 5.5 AND T1.TP BETWEEN 6.0 AND 8.5
SELECT L.UA FROM Laboratory AS L JOIN Patient AS P ON L.ID = P.ID WHERE P.SEX = 'F' AND L.UA > 6.50 ORDER BY L.UA DESC LIMIT 1
SELECT MAX(ANA) AS highest_ana FROM Examination INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Laboratory.CRE < 1.5
SELECT P.ID FROM Laboratory AS L INNER JOIN Patient AS P ON L.ID = P.ID WHERE L.CRE < 1.5 ORDER BY L.CRE DESC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS L INNER JOIN Examination AS E ON L.ID = E.ID WHERE L.T-BIL > 2.0   AND E.AnAPattern LIKE '%P%'
SELECT T1.`ANA` FROM Laboratory AS T1 WHERE T1.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` < 2.0)
SELECT COUNT(P.ID) FROM Patient AS P JOIN Examination AS E ON P.ID = E.ID WHERE P.T-CHO >= 250 AND E.KCT = '-'
SELECT COUNT(*)  FROM Examination  INNER JOIN Patient  ON Examination.ID = Patient.ID  WHERE Examination.`ANA Pattern` = 'P'    AND Examination.T-CHO < 250
SELECT COUNT(*) FROM Laboratory AS L INNER JOIN Examination AS E ON L.ID = E.ID WHERE L.TG < 200 AND E.Symptoms IS NOT NULL
SELECT Patient.Diagnosis FROM Laboratory JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.TG < 200 ORDER BY Laboratory.TG DESC LIMIT 1
SELECT Patient.ID FROM Examination INNER JOIN Patient ON Examination.ID = Patient.ID INNER JOIN Laboratory ON Examination.ID = Laboratory.ID WHERE Examination.Thrombosis = 0 AND Laboratory.CPK < 250
SELECT COUNT(*) AS Normal_Creatinine_PHosphokinase_and_KE FROM Laboratory INNER JOIN Examination ON Laboratory.ID = Examination.ID WHERE CPK < 250 AND (KCT = '+' OR RVVT = '+' OR LAC = '+')
SELECT Patient.Birthday FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Laboratory.GLU > 180 ORDER BY Patient.Birthday ASC LIMIT 1
SELECT COUNT(*) FROM Laboratory AS L INNER JOIN Examination AS E ON L.ID = E.ID WHERE L.GLU < 180 AND E.Thrombosis = 0
SELECT COUNT(*) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.`Admission` = '+' AND Laboratory.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(*) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT T2.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.RBC BETWEEN 3.5 AND 6.0 AND T2.Admission = '-'
SELECT COUNT(*) FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.PLT > 100 AND Laboratory.PLT < 400 AND Patient.Diagnosis IS NOT NULL
SELECT Laboratory.PLT FROM Laboratory INNER JOIN Patient ON Laboratory.ID = Patient.ID WHERE Patient.Diagnosis = 'MCTD' AND Laboratory.PLT BETWEEN 100 AND 400
SELECT AVG(LP.PT) AS Average_Prothrombin_Time FROM Laboratory AS LP INNER JOIN Patient AS PT ON LP.ID = PT.ID WHERE PT.Sex = 'M' AND LP.PT < 14
SELECT COUNT(*) FROM Examination e JOIN Laboratory l ON e.ID = l.ID WHERE e.Thrombosis IN (2, 1) AND l.PT < 14
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders'
SELECT COUNT(*) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code INNER JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering'
SELECT member.first_name, member.last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design Department'
SELECT COUNT(*) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'Women''s Soccer'
SELECT member.phone FROM member  JOIN attendance ON member.member_id = attendance.link_to_member  JOIN event ON attendance.link_to_event = event.event_id  WHERE event.event_name = 'Women''s Soccer'
SELECT COUNT(*) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'Women'' Soccer' AND member.t_shirt_size = 'Medium'
SELECT e.event_name FROM attendance a INNER JOIN event e ON a.link_to_event = e.event_id WHERE a.link_to_member IN (SELECT member_id FROM member WHERE position = 'Member') GROUP BY e.event_name ORDER BY COUNT(a.link_to_event) DESC LIMIT 1
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id WHERE m.first_name = 'Maya' AND m.last_name = 'Mclean'
SELECT COUNT(*) AS event_count FROM attendance JOIN member ON attendance.link_to_member = member.member_id JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND event.event_date LIKE '%2019%'
SELECT COUNT(*) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event WHERE event.type = 'Meeting' GROUP BY event.event_id HAVING COUNT(*) > 10
SELECT event.event_name FROM event JOIN attendance ON event.event_id = attendance.link_to_event WHERE event.status IN ('Open', 'Closed') GROUP BY event.event_name HAVING COUNT(attendance.link_to_member) > 20
SELECT COUNT(event_id) / COUNT(*) AS average_attendance FROM event WHERE type = 'Meeting' AND event_date LIKE '2020-%'
SELECT expense_description FROM expense WHERE cost > 0 ORDER BY cost DESC LIMIT 1
SELECT COUNT(*) FROM member AS m INNER JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Environmental Engineering'
SELECT member.first_name, member.last_name FROM member JOIN attendance ON member.member_id = attendance.link_to_member JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud'
SELECT m.last_name FROM member m INNER JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.major_name = 'Law and Constitutional Studies'
SELECT zip_code.county FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt'
SELECT i.amount FROM member m INNER JOIN income i ON m.member_id = i.link_to_member WHERE m.position = 'Vice President'
SELECT SUM(b.spent) AS total_spent FROM budget AS b INNER JOIN event AS e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND e.type = 'Meeting' AND b.category = 'Food'
SELECT zip_code.city, zip_code.state FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'President'
SELECT member.first_name, member.last_name  FROM member  INNER JOIN zip_code ON member.zip = zip_code.zip_code  WHERE zip_code.state = 'Illinois'
SELECT SUM(b.spent) AS total_spent FROM budget b INNER JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'September Meeting' AND b.category = 'Advertisement'
SELECT major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Pierce' AND member.last_name = 'Guidi'
SELECT SUM(b.amount) AS total_budgeted_amount FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'October Speaker'
SELECT T1.expense_id, T1.expense_description, T1.expense_date, T1.cost, T1.approved FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_member = T2.event_id WHERE T2.event_name = 'October Meeting' AND T2.event_date = '2019-10-08' AND T1.approved IN ('true', 'false')
SELECT AVG(expense.cost) AS average_cost FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Elijah' AND member.last_name = 'Allen' AND (strftime('%m', expense.expense_date) = '9' OR strftime('%m', expense.expense_date) = '10')
SELECT      SUM(b.spent) - SUM(CASE WHEN strftime('%Y', b.link_to_event) = '2020' THEN b.spent ELSE 0 END) AS total_spent_by_2019_and_2020 FROM      event AS e INNER JOIN      budget AS b  ON      e.event_id = b.link_to_event WHERE      strftime('%Y', e.event_date) IN ('2019', '2020')
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT e.cost FROM expense e WHERE e.expense_description = 'Posters' AND e.expense_date = '2019-09-04'
SELECT b.remaining FROM budget b WHERE b.category = 'Food' ORDER BY b.remaining DESC LIMIT 1
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'
SELECT COUNT(*) AS major_count FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone  FROM member  WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT zip_code.county FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher'
SELECT COUNT(b.budget_id) AS exceeded_budget_count FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Meeting' AND b.remaining < 0
SELECT SUM(b.amount) AS total_budget_amount FROM event AS e INNER JOIN budget AS b ON e.event_id = b.link_to_event WHERE e.event_name = 'September Speaker'
SELECT budget.event_status FROM budget JOIN expense ON budget.link_to_event = expense.link_to_member WHERE expense.expense_description = 'Post Cards, Posters'   AND expense.expense_date = '2019-08-20'
SELECT      major.major_name  FROM      member  INNER JOIN      major  ON      member.link_to_major = major.major_id  WHERE      member.first_name = 'Brent'  AND      member.last_name = 'Thomason'
SELECT COUNT(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'
SELECT zct.type FROM member AS m INNER JOIN zip_code AS zct ON m.zip = zct.zip_code WHERE m.first_name = 'Christof' AND m.last_name = 'Nielson'
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT zip_code.state FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'
SELECT major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'President'
SELECT i.date_received FROM income i INNER JOIN member m ON i.link_to_member = m.member_id WHERE m.first_name = 'Connor'   AND m.last_name = 'Hilton'   AND i.source = 'Dues'
SELECT member.first_name, member.last_name FROM income JOIN member ON income.link_to_member = member.member_id WHERE income.source = 'Dues' ORDER BY strftime('%s', income.date_received) ASC LIMIT 1
SELECT COUNT(*) FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Advertisement' AND e.event_name IN ('Yearly Kickoff', 'October Meeting') GROUP BY b.category HAVING b.amount > (SELECT SUM(amount) FROM budget WHERE category = 'Advertisement') / (SELECT SUM(amount) FROM budget WHERE category = 'Advertisement' AND event_name IN ('Yearly Kickoff', 'October Meeting'))
SELECT (SUM(CASE WHEN b.category = 'Parking' THEN b.amount ELSE 0 END) * 100.0 / SUM(CASE WHEN e.event_name = 'November Speaker' THEN b.amount ELSE 0 END)) AS parking_percentage FROM budget b JOIN event e ON b.link_to_event = e.event_id WHERE e.event_name = 'November Speaker'
SELECT SUM(cost) AS total_pizza_cost FROM expense WHERE expense_description = 'Pizza'
SELECT COUNT(DISTINCT city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT      zip_code.city,      zip_code.county,      zip_code.state  FROM      member  INNER JOIN      zip_code  ON      member.zip = zip_code.zip_code  WHERE      member.first_name = 'Amy'      AND member.last_name = 'Firth'
SELECT expense.expense_description FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id ORDER BY budget.remaining ASC LIMIT 1
SELECT DISTINCT m.first_name, m.last_name FROM attendance a JOIN member m ON a.link_to_member = m.member_id JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting'
SELECT m.college FROM major m  INNER JOIN member me ON m.major_id = me.link_to_major  GROUP BY m.college  ORDER BY COUNT(*) DESC  LIMIT 1
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event ORDER BY budget.amount DESC LIMIT 1
SELECT expense.expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.position = 'Vice President'
SELECT COUNT(*) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT i.date_received FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE m.first_name = 'Casey' AND m.last_name = 'Mason'
SELECT COUNT(member_id) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland'
SELECT COUNT(*) FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240'
SELECT m.first_name, m.last_name FROM member m INNER JOIN major ma ON m.link_to_major = ma.major_id WHERE ma.department = 'School of Applied Sciences, Technology and Education'
SELECT      e.event_name FROM      event e JOIN      budget b ON e.event_id = b.link_to_event WHERE      e.status = 'Closed' ORDER BY      (b.spent / b.amount) DESC LIMIT 1
SELECT COUNT(*) FROM member WHERE position = 'President'
SELECT MAX(spent) AS highest_spent_amount FROM budget
SELECT COUNT(*) FROM event WHERE type = 'Meeting'   AND STRFTIME('%Y', event_date) = '2020'
SELECT SUM(spent) AS total_spent FROM budget WHERE category = 'Food'
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member GROUP BY m.member_id HAVING COUNT(a.link_to_event) > 7
SELECT DISTINCT m.first_name, m.last_name FROM member m INNER JOIN attendance a ON m.member_id = a.link_to_member INNER JOIN event e ON a.link_to_event = e.event_id INNER JOIN major ma ON m.link_to_major = ma.major_id WHERE e.event_name = 'Community Theater' AND ma.major_name = 'Interior Design'
SELECT member.first_name, member.last_name FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina'
SELECT income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'
SELECT member.first_name, member.last_name FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40
SELECT SUM(cost) AS total_expense FROM expense AS T1 INNER JOIN event AS T2 ON T1.link_to_member = T2.event_id WHERE T2.event_name = 'Yearly Kickoff'
SELECT member.first_name, member.last_name  FROM event  INNER JOIN attendance ON event.event_id = attendance.link_to_event  INNER JOIN member ON attendance.link_to_member = member.member_id  WHERE event.event_name = 'Yearly Kickoff'
SELECT member.first_name, member.last_name, income.source FROM member INNER JOIN income ON member.member_id = income.link_to_member ORDER BY income.amount DESC LIMIT 1
SELECT expense_id FROM expense ORDER BY cost ASC LIMIT 1
SELECT      CAST(SUM(CASE WHEN e.event_name = 'Yearly Kickoff' THEN b.spent ELSE 0 END) AS REAL) * 100.0 /      (SELECT SUM(b.spent) FROM budget AS b) AS percentage_of_yearly_kickoff_event FROM      event AS e INNER JOIN      budget AS b ON e.event_id = b.link_to_event
SELECT SUM(CASE WHEN major_name = 'Finance' THEN 1 ELSE 0 END) / SUM(CASE WHEN major_name = 'Physics' THEN 1 ELSE 0 END) AS finance_percentage FROM major
SELECT i.source FROM income AS i WHERE i.date_received BETWEEN '2019-09-01' AND '2019-09-30' ORDER BY i.amount DESC LIMIT 1
SELECT member.first_name, member.last_name, member.email  FROM member  WHERE member.position = 'Secretary'
SELECT COUNT(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching'
SELECT COUNT(DISTINCT attendance.link_to_member) AS number_of_members FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Community Theater' AND event.event_date LIKE '%2019%'
SELECT COUNT(*) AS number_of_events FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Luisa' AND member.last_name = 'Guidi'
SELECT SUM(spent) / COUNT(spent) AS average_spent FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer'
SELECT      (SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) * 100.0 / COUNT(event_id)) AS percentage FROM      event WHERE      event_date BETWEEN '2019-01-01' AND '2019-12-31'
SELECT      exp.cost  FROM      expense AS exp  INNER JOIN      event AS ev  ON      exp.link_to_event = ev.event_id  WHERE      exp.expense_description = 'Posters'      AND      ev.event_name = 'September Speaker'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(*) DESC LIMIT 1
SELECT e.event_name FROM event e INNER JOIN budget b ON e.event_id = b.link_to_event WHERE e.status = 'Closed' AND b.remaining < 0 ORDER BY b.remaining ASC LIMIT 1
SELECT      e.expense_id,      e.expense_description,      SUM(e.cost) AS total_cost FROM      expense e JOIN      budget b ON e.link_to_budget = b.budget_id JOIN      event ev ON b.link_to_event = ev.event_id WHERE      ev.event_name = 'October Meeting'      AND e.approved = 'true' GROUP BY      e.expense_id,      e.expense_description
SELECT b.category, SUM(b.amount) AS total_amount_budgeted FROM event e INNER JOIN budget b ON e.event_id = b.link_to_event WHERE e.event_name = 'April Speaker' GROUP BY b.category ORDER BY total_amount_budgeted ASC
SELECT MAX(amount) AS max_amount FROM budget WHERE category = 'Food'
SELECT amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3
SELECT SUM(cost) AS total_spent FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) AS total_expense FROM expense WHERE expense_date = '2019-08-20'
SELECT m.first_name, m.last_name, SUM(e.cost) AS total_cost FROM member m INNER JOIN expense e ON m.member_id = e.link_to_member WHERE m.member_id = 'rec4BLdZHS2Blfp4v'
SELECT      expense.expense_description  FROM      member  JOIN      expense  ON      member.member_id = expense.link_to_member  WHERE      member.first_name = 'Sacha'      AND member.last_name = 'Harrison'
SELECT expense.expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large'
SELECT m.zip FROM member m INNER JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost < 50
SELECT ma.major_name FROM member m INNER JOIN major ma ON m.link_to_major = ma.major_id WHERE m.first_name = 'Phillip' AND m.last_name = 'Cullen'
SELECT member.position FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business'
SELECT COUNT(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business'   AND member.t_shirt_size = 'Medium'
SELECT e.type FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215'
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_date = '2020-03-24T12:00:00'
SELECT m.major_name FROM major m INNER JOIN member mo ON m.major_id = mo.link_to_major WHERE mo.position = 'Vice President'
SELECT      CAST(SUM(CASE WHEN member.position = 'Member' AND major.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM      member INNER JOIN      major ON      member.link_to_major = major.major_id
SELECT budget.category FROM event JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(*) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education'
SELECT      m.last_name,      ma.department,      ma.college FROM      member m  INNER JOIN      major ma ON      m.link_to_major = ma.major_id  WHERE      ma.major_name = 'Environmental Engineering'
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.spent = 0
SELECT zip.city, zip.state FROM member AS m INNER JOIN zip_code AS zip ON m.zip = zip.zip_code INNER JOIN major AS ma ON m.link_to_major = ma.major_id WHERE ma.department = 'Electrical and Computer Engineering Department' AND m.position = 'Member'
SELECT e.event_name FROM attendance a INNER JOIN member m ON a.link_to_member = m.member_id INNER JOIN event e ON a.link_to_event = e.event_id WHERE e.type = 'Social' AND m.position = 'Vice President' AND e.location = '900 E. Washington St.'
SELECT member.last_name AS last_name, member.position AS position FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Pizza' AND expense.expense_date = '2019-09-10'
SELECT member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women'' Soccer' AND member.position = 'Member'
SELECT (CAST(SUM(CASE WHEN amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*)) AS percentage FROM member JOIN income ON member.member_id = income.link_to_member WHERE member.t_shirt_size = 'Medium' AND member.position = 'Member'
SELECT short_state FROM zip_code WHERE type = 'PO Box'
SELECT zip_code.zip_code FROM zip_code WHERE zip_code.type = 'PO Box'     AND zip_code.county = 'San Juan Municipio'     AND zip_code.state = 'Puerto Rico'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15' AND '2020-03-20'
SELECT expense_id FROM expense WHERE cost > 50
SELECT      m.first_name,      m.last_name,      a.link_to_event FROM      expense e INNER JOIN      member m ON      e.link_to_member = m.member_id INNER JOIN      attendance a ON      a.link_to_member = m.member_id WHERE      e.expense_date BETWEEN '2019-01-10' AND '2019-11-19'     AND e.approved = 'true'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO'
SELECT member.phone FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND major.college = 'College of Agriculture and Applied Sciences'
SELECT member.email FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.cost > 20 AND expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19'
SELECT COUNT(member_id) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Education & Human Services' AND member.position = 'Member'
SELECT (CAST(SUM(CASE WHEN b.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100.0) / COUNT(*) FROM budget b
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT e.expense_description FROM expense e GROUP BY e.expense_description HAVING AVG(e.cost) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT (SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_of_po_boxes FROM zip_code
SELECT      e.event_name,      e.location FROM      event e INNER JOIN      budget b ON e.event_id = b.link_to_event WHERE      b.remaining > 0
SELECT      event.event_name,      event.event_date FROM      expense,      event WHERE      expense.expense_description = 'Pizza'      AND expense.cost BETWEEN 50 AND 99
SELECT      member.first_name,      member.last_name,      major.major_name FROM      expense JOIN      member ON expense.link_to_member = member.member_id JOIN      major ON member.link_to_major = major.major_id WHERE      expense.cost > 100
SELECT z.city, z.county FROM income i INNER JOIN member m ON i.link_to_member = m.member_id INNER JOIN zip_code z ON m.zip = z.zip_code WHERE i.amount > 40
SELECT m.first_name, m.last_name FROM member m INNER JOIN expense e ON m.member_id = e.link_to_member GROUP BY m.member_id HAVING COUNT(DISTINCT e.expense_id) > 1 ORDER BY MAX(e.cost) DESC LIMIT 1
SELECT AVG(e.cost) AS average_amount_paid FROM member m INNER JOIN expense e ON m.member_id = e.link_to_member WHERE m.position != 'Member'
SELECT e.event_name FROM budget b INNER JOIN event e ON b.link_to_event = e.event_id WHERE b.category = 'Parking' AND b.spent < (SELECT AVG(spent) FROM budget WHERE category = 'Parking')
SELECT CAST(SUM(b.spent) AS REAL) * 100 / COUNT(*) AS meeting_percentage FROM event e INNER JOIN budget b ON e.event_id = b.link_to_event WHERE e.type = 'Meeting'
SELECT expense_description FROM expense WHERE expense_description = 'Water, chips, cookies' GROUP BY expense_description ORDER BY SUM(cost) DESC LIMIT 1
SELECT      m.first_name,     m.last_name FROM      member m JOIN      expense e ON m.member_id = e.link_to_member GROUP BY      m.member_id, m.first_name, m.last_name ORDER BY      SUM(e.cost) DESC LIMIT 5
SELECT member.first_name, member.last_name, member.phone FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > (SELECT AVG(cost) FROM expense)
SELECT      (COUNT(CASE WHEN position = 'Member' THEN 1 ELSE NULL END) * 1.0 / COUNT(position = 'MemberTotal')) * 100 -      (COUNT(CASE WHEN position = 'Member' THEN 1 ELSE NULL END) * 1.0 / COUNT(position = 'MemberTotal')) * 100 AS separation FROM      member INNER JOIN      zip_code ON      member.zip = zip_code.zip_code WHERE      zip_code.state IN ('New Jersey', 'Vermont')
SELECT major.major_name, major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT member.first_name, member.last_name, expense.cost FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Water, Veggie tray, supplies'
SELECT member.last_name, member.phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education'
SELECT budget.category, budget.amount FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'
SELECT e.event_name FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.category = 'Food'
SELECT member.first_name, member.last_name, income.amount FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE income.date_received = '2019-09-09'
SELECT budget.category FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters'
SELECT member.first_name, member.last_name, major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary'
SELECT      e.event_name,      SUM(b.spent) AS total_spent FROM      event e INNER JOIN      budget b ON e.event_id = b.link_to_event WHERE      b.category = 'Speaker Gifts' GROUP BY      e.event_name
SELECT zip_code.city FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT member.first_name, member.last_name, member.position FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.zip_code = 28092 AND zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina'
SELECT COUNT(*) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / CAST(SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) AS REAL) AS EUR_CZK_ratio FROM customers
SELECT     c.CustomerID FROM     yearmonth AS y INNER JOIN     customers AS c ON y.CustomerID = c.CustomerID WHERE     y.`Date` BETWEEN '201201' AND '201212'     AND c.`Segment` = 'LAM' ORDER BY     y.`Consumption` ASC LIMIT 1
SELECT AVG(Consumption) AS AverageMonthlyConsumption FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'SME' AND T1.`Date` BETWEEN '201301' AND '201312'
SELECT      c.CustomerID FROM      customers c INNER JOIN      yearmonth ym ON c.CustomerID = ym.CustomerID WHERE      c.Currency = 'CZK'      AND ym.`Date` BETWEEN '201101' AND '201112' GROUP BY      c.CustomerID ORDER BY      SUM(ym.Consumption) DESC LIMIT 1
SELECT COUNT(*) AS TotalCustomers FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'KAM' AND T1.`Date` BETWEEN '201201' AND '201212' AND T1.Consumption < 30000
SELECT SUM(CASE WHEN T2.Description = 'CZK' THEN T1.Consumption ELSE NULL END) - SUM(CASE WHEN T2.Description = 'EUR' THEN T1.Consumption ELSE NULL END) AS ConsumptionDifference FROM yearmonth T1 INNER JOIN customers T3 ON T1.CustomerID = T3.CustomerID INNER JOIN transactions_1k T4 ON T1.CustomerID = T4.CustomerID AND T1.Date = T4.`Date` INNER JOIN products T2 ON T4.ProductID = T2.ProductID WHERE T1.`Date` BETWEEN '2012-01-01' AND '2012-12-31'
SELECT strftime('%Y', DATE(Date)) AS Year FROM transactions_1k GROUP BY strftime('%Y', DATE(Date)) ORDER BY SUM(Amount) DESC LIMIT 1
SELECT      c.Segment FROM      customers c INNER JOIN      yearmonth ym ON      c.CustomerID = ym.CustomerID ORDER BY      ym.Consumption ASC LIMIT 1
SELECT strftime('%Y', Date) AS Year FROM yearmonth GROUP BY Year ORDER BY SUM(Consumption) DESC LIMIT 1
SELECT      dt.`Date` FROM      customers c INNER JOIN      yearmonth dt ON      c.CustomerID = dt.CustomerID WHERE      c.CustomerID IN (         SELECT CustomerID          FROM customers          WHERE Segment = 'SME'     )     AND dt.`Date` BETWEEN '201301' AND '201312' ORDER BY      dt.`Date` DESC LIMIT 1
SELECT SUM(t.Amount) - MAX(t.Amount) OVER (PARTITION BY t.`CustomerID` ORDER BY t.`CustomerID`) AS AnnualAverageDifference FROM transactions_1k t WHERE t.`Date` BETWEEN '201301' AND '201312' AND t.`CustomerID` IN ( SELECT `CustomerID` FROM transactions_1k GROUP BY `CustomerID` ORDER BY MIN(`Amount`) LIMIT 1 )
SELECT      customers.Segment FROM      transactions_1k INNER JOIN      customers ON transactions_1k.CustomerID = customers.CustomerID WHERE      customers.Currency = 'EUR' AND     transactions_1k.Date LIKE '%2012%' OR     transactions_1k.Date LIKE '%2013%' GROUP BY      customers.Segment ORDER BY      SUM(transactions_1k.Amount) / transactions_1k.Amount * 100 DESC LIMIT 1
SELECT SUM(Consumption) AS TotalConsumption FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT COUNT(CASE WHEN Country = 'CZE' THEN GasStationID ELSE NULL END) - COUNT(CASE WHEN Country = 'SVK' THEN GasStationID ELSE NULL END) AS Difference FROM gasstations WHERE Country IN ('CZE', 'SVK')
SELECT SUM(CASE WHEN CustomerID = 7 THEN Amount ELSE 0 END) - SUM(CASE WHEN CustomerID = 5 THEN Amount ELSE 0 END) AS ConsumptionDifference FROM transactions_1k WHERE Date LIKE '201304%'
SELECT SUM(CASE WHEN c.Currency = 'CZK' THEN t.Amount ELSE 0 END) - SUM(CASE WHEN c.Currency = 'EUR' THEN t.Amount ELSE 0 END) AS AmountOfDifference FROM customers c INNER JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE c.Segment = 'SME'
SELECT      cm.CustomerID FROM      yearmonth cm JOIN      customers c ON cm.CustomerID = c.CustomerID WHERE      c.CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM')      AND c.Currency = 'EUR'      AND cm.Date LIKE '201310%' ORDER BY      cm.Consumption DESC LIMIT 1
SELECT      c.CustomerID,      SUM(t.Amount) AS TotalAmount FROM      customers c INNER JOIN      transactions_1k t ON      c.CustomerID = t.CustomerID WHERE      t.`Date` BETWEEN '2012-08-01' AND '2012-08-31' GROUP BY      c.CustomerID ORDER BY      TotalAmount DESC LIMIT 1
SELECT SUM(yearmonth.Consumption) AS TotalConsumption FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Segment = 'KAM' AND yearmonth.`Date` LIKE '201305%'
SELECT CAST(COUNT(CASE WHEN T1.Amount > 46.73 THEN 1 END) AS REAL) * 100.0 / COUNT(T1.Amount) AS percentage FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Segment = 'LAM'
SELECT      Country,      COUNT(GasStationID) AS GasStationCount  FROM      gasstations  WHERE      Segment = 'Value for money'  GROUP BY      Country  ORDER BY      GasStationCount DESC  LIMIT 1
SELECT      (SUM(CASE WHEN customers.Currency = 'EUR' THEN transactions_1k.Amount ELSE 0 END) * 100.0 /       SUM(CASE WHEN customers.Currency = 'EUR' THEN transactions_1k.Amount ELSE 0 END)) AS EuroPaymentPercentage FROM      customers INNER JOIN      transactions_1k ON customers.CustomerID = transactions_1k.CustomerID WHERE      customers.Segment = 'KAM'
SELECT (COUNT(CASE WHEN Consumption > 528.3 THEN 1 END) * 100.0 / COUNT(*)) AS ConsumptionPercentage FROM yearmonth JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE yearmonth.`Date` = '201202'
SELECT  (SUM(CASE WHEN gs.Country = 'SK' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS PremiumGasStationPercentage  FROM    gasstations gs  WHERE   gs.Segment = 'Premium'
SELECT CustomerID FROM yearmonth WHERE `Date` = '201309' ORDER BY Consumption DESC LIMIT 1
SELECT c.Segment FROM yearmonth AS y INNER JOIN customers AS c ON y.CustomerID = c.CustomerID INNER JOIN transactions_1k AS t ON y.CustomerID = t.CustomerID WHERE y.`Date` = '201309' GROUP BY c.Segment ORDER BY SUM(t.Amount) ASC LIMIT 1
SELECT MIN(transactions_1k.Amount) AS least_amount FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID INNER JOIN yearmonth ON transactions_1k.`Date` = yearmonth.`Date` WHERE yearmonth.`Date` = '201206' AND customers.Segment = 'SME'
SELECT MAX(Consumption) AS MaxConsumption FROM yearmonth WHERE Date LIKE '2012%'
SELECT SUM(Consumption) / 12 AS MaxMonthlyConsumption FROM yearmonth INNER JOIN customers ON yearmonth.CustomerID = customers.CustomerID WHERE customers.Currency = 'EUR'
SELECT p.Description FROM yearmonth AS ym INNER JOIN transactions_1k AS t ON ym.CustomerID = t.CustomerID INNER JOIN products AS p ON t.ProductID = p.ProductID WHERE ym.`Date` LIKE '201309%'
SELECT DISTINCT g.Country FROM yearmonth AS ym INNER JOIN customers AS c ON ym.CustomerID = c.CustomerID INNER JOIN gasstations AS g ON ym.CustomerID = g.GasStationID WHERE ym.`Date` = '201306'
SELECT DISTINCT T2.ChainID  FROM customers AS T1  INNER JOIN gasstations AS T2  ON T1.CustomerID = T2.GasStationID  WHERE T1.Currency = 'EUR'
SELECT p.Description FROM customers c INNER JOIN transactions_1k t ON c.CustomerID = t.CustomerID INNER JOIN products p ON t.ProductID = p.ProductID WHERE c.Currency = 'EUR' AND t.Price > 0.0
SELECT AVG(T2.Price) AS AveragePrice FROM transactions_1k AS T2 INNER JOIN yearmonth AS T3 ON T2.CustomerID = T3.CustomerID AND T2.Date = T3.`Date` WHERE T3.`Date` LIKE '2012-01%'
SELECT COUNT(*) FROM customers INNER JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE customers.Currency = 'EUR' AND yearmonth.Consumption > 1000
SELECT p.Description FROM transactions_1k tg  INNER JOIN gasstations gc ON tg.GasStationID = gc.GasStationID  INNER JOIN products p ON tg.ProductID = p.ProductID  WHERE gc.Country = 'CZE'
SELECT transactions_1k.`Date` FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.ChainID = 11
SELECT COUNT(*) FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE' AND transactions_1k.Price > 1000
SELECT COUNT(*) FROM transactions_1k t INNER JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE' AND t.`Date` > '2012-01-01'
SELECT AVG(Price) AS AveragePrice FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE gasstations.Country = 'CZE'
SELECT AVG(t.Price) AS AveragePrice FROM transactions_1k t INNER JOIN customers c ON t.CustomerID = c.CustomerID WHERE c.Currency = 'EUR'
SELECT c.CustomerID FROM transactions_1k t1 INNER JOIN customers c ON t1.CustomerID = c.CustomerID WHERE t1.`Date` = '2012-08-25' GROUP BY t1.`CustomerID` ORDER BY SUM(t1.Amount) DESC LIMIT 1
SELECT gasstations.Country FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.`Date` = '2012-08-25' ORDER BY transactions_1k.TransactionID ASC LIMIT 1
SELECT customers.Currency FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.`Date` = '2012-08-24' AND transactions_1k.`Time` = '16:25:00'
SELECT customers.Segment FROM transactions_1k INNER JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE transactions_1k.`Date` = '2012-08-23' AND transactions_1k.`Time` = '21:20:00'
SELECT COUNT(*) FROM transactions_1k WHERE Date = '2012-08-26' AND Time < '13:00:00'
SELECT Segment FROM customers ORDER BY CustomerID ASC LIMIT 1
SELECT gs.Country FROM transactions_1k AS t1  INNER JOIN customers AS c ON t1.CustomerID = c.CustomerID  INNER JOIN gasstations AS gs ON t1.GasStationID = gs.GasStationID  WHERE t1.`Date` = '2012-08-24' AND t1.`Time` = '12:42:00'
SELECT p.`ProductID` FROM transactions_1k t1 INNER JOIN products p ON t1.`ProductID` = p.`ProductID` WHERE strftime('%Y-%m', t1.`Date`) = '2012-08' AND strftime('%H:%M:%S', t1.`Time`) = '21:20:00'
SELECT      SUM(transactions_1k.Amount) AS total_spent,      transactions_1k.`Date` FROM      transactions_1k WHERE      transactions_1k.`Date` = '2012-08-24'      AND transactions_1k.Amount = 124.05
SELECT COUNT(*) FROM transactions_1k JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.`Date` = '2012-08-26' AND transactions_1k.`Time` BETWEEN '08:00:00' AND '09:00:00' AND gasstations.Country = 'CZE'
SELECT c.Currency FROM yearmonth AS t INNER JOIN customers AS c ON t.CustomerID = c.CustomerID WHERE t.`Date` LIKE '201306'
SELECT gasstations.Country FROM transactions_1k INNER JOIN gasstations ON transactions_1k.GasStationID = gasstations.GasStationID WHERE transactions_1k.`CardID` = 667467
SELECT      customers.Segment  FROM      transactions_1k  INNER JOIN      customers ON transactions_1k.CustomerID = customers.CustomerID  WHERE      transactions_1k.`Date` = '2012-08-24'      AND transactions_1k.Amount = 548.4
SELECT      (CAST(SUM(CASE WHEN c.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100.0 / COUNT(*)) AS EurCustomerPercentage FROM      customers c INNER JOIN      transactions_1k t1k  ON      c.CustomerID = t1k.CustomerID WHERE      t1k.`Date` = '2012-08-25'
SELECT AVG(Consumption) AS AverageConsumption FROM yearmonth WHERE CustomerID = 2012 AND Date = '2012-08-25'
SELECT g.GasStationID FROM transactions_1k AS t INNER JOIN gasstations AS g ON t.GasStationID = g.GasStationID ORDER BY t.Amount DESC LIMIT 1
SELECT      COUNT(CASE WHEN products.Description = 'Premium' THEN 1 END) * 100.0 / COUNT(products.ProductID) AS Percentage FROM      products INNER JOIN      gasstations  ON      products.ProductID = gasstations.GasStationID WHERE      gasstations.Country = 'SVK'
SELECT SUM(t1.Amount) AS TotalAmount FROM transactions_1k t1 JOIN customers c ON t1.CustomerID = c.CustomerID WHERE t1.`Date` = '2012-01' AND c.CustomerID = 38508
SELECT p.Description FROM transactions_1k AS t INNER JOIN products AS p ON t.ProductID = p.ProductID GROUP BY p.ProductID, p.Description ORDER BY SUM(t.Amount) DESC LIMIT 5
SELECT      c.CustomerID,      SUM(t.Price) / SUM(t.Amount) AS AveragePricePerItem,      c.Currency FROM      transactions_1k t INNER JOIN      customers c ON t.CustomerID = c.CustomerID GROUP BY      c.CustomerID ORDER BY      AveragePricePerItem DESC LIMIT 1
SELECT gs.Country FROM transactions_1k t INNER JOIN gasstations gs ON t.GasStationID = gs.GasStationID WHERE t.ProductID = 2 GROUP BY gs.Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT tm.`Date` FROM transactions_1k AS t INNER JOIN yearmonth AS tm ON t.`CustomerID` = tm.`CustomerID` WHERE tm.`Date` = '201208' AND t.`Price` = 430.72 AND t.`Amount` > 0 AND t.`ProductID` = 2