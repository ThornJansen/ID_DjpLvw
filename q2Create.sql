CREATE MATERIALIZED VIEW grade5 AS (SELECT * FROM CourseRegistrations WHERE Grade >= 5);
CREATE INDEX grade5_sr_idx ON grade5 (StudentRegistrationId);
