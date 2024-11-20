--! select stored procedure
DELIMITER //
CREATE PROCEDURE get_employees()
BEGIN
  SELECT * FROM employees;
END //
DELIMITER ;