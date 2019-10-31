CREATE PROC USP_GetAccountByUsername2
@username nvarchar(100),
@DisplayName nvarchar(100)
AS
	BEGIN
		
		SELECT * FROM Account a WHERE a.UserName = @username
	END
GO

EXEC USP_GetAccountByUsername2 @username ='admin', @DisplayName = 'admin'

select * from Account
