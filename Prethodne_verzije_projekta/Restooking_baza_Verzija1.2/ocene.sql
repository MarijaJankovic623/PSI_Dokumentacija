
DELIMITER $$
CREATE TRIGGER ocene
    AFTER UPDATE ON rezervacija
    FOR EACH ROW 
BEGIN
IF STRCMP(NEW.Status,'Ostvarena') = 0
THEN
BEGIN
DECLARE IDR int;
DECLARE  BP int;
DECLARE  O float;


SET IDR := (
SELECT S.IDRestoranFK
FROM sto S
WHERE S.IDSto = NEW.IDStoFK);



SET BP := (
SELECT R.BrojPosetilaca
FROM restoran R
WHERE R.IDRestoran = IDR);


SET O := (
SELECT  R.Ocena
FROM restoran R
WHERE R.IDRestoran = IDR);


SET O = O + NEW.Ocena;

SET BP = BP + 1;

SET O = O / BP;

UPDATE restoran SET BrojPosetilaca = BP, Ocena = O WHERE IDRestoran = IDR;
END;
END IF;
END$$
DELIMITER ;