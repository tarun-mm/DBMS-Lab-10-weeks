DELIMITER $$ 

CREATE FUNCTION no_of_tckts(U_ID varchar(255)) 

RETURNS VARCHAR(50) 

DETERMINISTIC 

BEGIN 

	DECLARE result VARCHAR(50); 

    DECLARE ticket_count int; 

     

    SELECT count(PNR) into ticket_count 

	FROM Ticket 

	WHERE User_ID = U_ID AND  

    MONTH(Travel_date) = MONTH(sysdate()) AND  

	YEAR(Travel_date) = YEAR(sysdate()); 

     

	IF ticket_count > 3 THEN 

		SET result = 'cannot purchase tickets current limit is over”'; 

	ELSE 

		SET result = 'can purchase tickets'; 

	END IF; 

		RETURN result; 

END; $$ 

DELIMITER ; 

  

SELECT User_ID, no_of_tckts(User_ID) FROM train_user; 