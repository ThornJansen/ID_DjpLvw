CREATE MATERIALIZED VIEW grade5 AS (
	SELECT * FROM CourseRegistrations WHERE Grade >= 5
);

CREATE INDEX grade5_sr_idx ON grade5 (StudentRegistrationId);

CREATE MATERIALIZED VIEW AllStudentsDegrees AS (
	SELECT srd.StudentId, srd.DegreeId, srd.StudentRegistrationId, Degrees.TotalECTS
	FROM StudentRegistrationsToDegrees as srd
	INNER JOIN Degrees ON srd.DegreeId = Degrees.DegreeId
);

CREATE MATERIALIZED VIEW CompletedDegrees2 AS (
	SELECT asd.StudentId, asd.DegreeId, asd.StudentRegistrationId, asd.TotalECTS
	FROM AllStudentsDegrees AS asd
	INNER JOIN grade5 AS cr ON asd.StudentRegistrationId = cr.StudentRegistrationId
	INNER JOIN CourseOffers as co ON cr.CourseOfferId = co.CourseOfferId
	INNER JOIN Courses ON co.CourseId = Courses.CourseId	
	GROUP BY asd.StudentId, asd.DegreeId, asd.TotalECTS, asd.StudentRegistrationId
	HAVING SUM(Courses.ECTS) < asd.TotalECTS
);

CREATE MATERIALIZED VIEW ActiveDegrees AS (	
	SELECT asd.StudentId, asd.DegreeId, asd.StudentRegistrationId
	FROM AllStudentsDegrees AS asd
	EXCEPT
	SELECT cd.StudentId, cd.DegreeId, cd.StudentRegistrationId
	FROM CompletedDegrees AS cd
);
