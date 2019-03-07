SELECT c.CourseName, cr.Grade FROM grade5 AS cr INNER JOIN CourseOffers AS co ON cr.courseOfferId = co.courseOfferId INNER JOIN Courses AS c ON c.CourseId = co.CourseId INNER JOIN StudentRegistrationsToDegrees AS srtd ON srtd.StudentRegistrationId = cr.StudentRegistrationId WHERE srtd.StudentId = %1% AND srtd.DegreeId = %2% ORDER BY co.Year, co.Quartile, co.CourseOfferId;
SELECT 0;
SELECT 0;
SELECT (1.0 * count(case when Students.Gender='F' then 1 end))/count(Students.Gender) AS percentage FROM StudentRegistrationsToDegrees as srd INNER JOIN Students ON srd.StudentId = Students.StudentId INNER JOIN Degrees ON srd.DegreeId = Degrees.DegreeId WHERE Degrees.Dept = %1% GROUP BY Degrees.Dept;
SELECT CourseId, 1.0 * StudentsPassed/StudentAmount AS percentagePassing FROM (SELECT CourseId, COUNT(StudentRegistrationId) AS StudentsPassed FROM (SELECT CourseId, StudentRegistrationId, Grade FROM (SELECT CourseOfferId, CourseId FROM CourseOffers) as co NATURAL JOIN CourseRegistrations WHERE Grade IS NOT NULL) as corGrades WHERE Grade >= %1% GROUP BY CourseId) as passed NATURAL JOIN (SELECT CourseId, COUNT(StudentRegistrationId) AS StudentAmount FROM (SELECT CourseId, StudentRegistrationId, Grade FROM (SELECT CourseOfferId, CourseId FROM CourseOffers) as coo NATURAL JOIN CourseRegistrations WHERE Grade IS NOT NULL) as corrGrades GROUP BY CourseId) as amount GROUP BY CourseId, StudentsPassed, StudentAmount ORDER BY CourseId;
SELECT 0;
SELECT 0;
SELECT 0;
