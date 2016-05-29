DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sve_rezervacije`(idK INT)
BEGIN

SELECT R.ImeObjekta, R.Opis, Z.Ocena, Z.VremeOd, Z.VremeDo
FROM sto S, restoran R, rezervacija Z
WHERE Z.IDKorisnikFK = idK
AND  Z.IDStoFK = S.IDSto
AND S.IDRestoranFK = R.IDRestoran
;
END$$
DELIMITER ;

CALL sve_rezervacije(1);