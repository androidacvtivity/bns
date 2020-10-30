CREATE PROC ContactCreateOrUpdate
@ConatctID int,
@Name varchar(50),
@Mobile varchar(50),
@Address varchar(250)
AS
BEGIN
IF(@ConatctID=0)
	BEGIN
	INSERT INTO Contact(Name,Mobile,Address)
	VALUES(@Name,@Mobile,@Address)
	END
ELSE
	BEGIN
	UPDATE Contact
	SET
		Name = @Name,
		Mobile = @Mobile,
		Address = @Address
	WHERE ContactID= @ConatctID
	END

END;










  SELECT *
  
  FROM REGISTRU
  ORDER BY 
  DATA_REG DESC
  
  ;