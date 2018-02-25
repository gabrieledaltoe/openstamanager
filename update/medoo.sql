UPDATE `zz_widgets` SET `query` = 'SELECT CONCAT_WS(" ", REPLACE(REPLACE(REPLACE(FORMAT(SUM((SELECT SUM(subtotale+iva-sconto) FROM co_righe_documenti WHERE iddocumento=co_documenti.id)+iva_rivalsainps+rivalsainps+bollo-ritenutaacconto), 2), ",", "#"), ".", ","), "#", "."), "€") AS dato FROM co_documenti WHERE idtipodocumento IN(SELECT id FROM co_tipidocumento WHERE dir=''entrata'') AND idstatodocumento = (SELECT id FROM co_statidocumento WHERE descrizione=''Emessa'') AND data >= ''|period_start|'' AND data <= ''|period_end|'' AND 1=1' WHERE `zz_widgets`.`name` = 'Crediti da clienti';

UPDATE `zz_widgets` SET `query` = 'SELECT COUNT(co_documenti.id) AS dato FROM co_scadenziario INNER JOIN (((co_documenti INNER JOIN an_anagrafiche ON co_documenti.idanagrafica=an_anagrafiche.idanagrafica) INNER JOIN co_pagamenti ON co_documenti.idpagamento=co_pagamenti.id) INNER JOIN co_tipidocumento ON co_documenti.idtipodocumento=co_tipidocumento.id) ON co_scadenziario.iddocumento=co_documenti.id WHERE ABS(pagato) < ABS(da_pagare) AND idstatodocumento=(SELECT id FROM co_statidocumento WHERE descrizione=''Emessa'') AND scadenza >= ''|period_start|'' AND scadenza <= ''|period_end|'' ORDER BY scadenza ASC' WHERE `zz_widgets`.`name` = 'Scadenze';

UPDATE `zz_widgets` SET `query` = 'SELECT COUNT(id) AS dato FROM co_preventivi WHERE idstato=(SELECT id FROM co_statipreventivi WHERE descrizione=''In lavorazione'')' WHERE `zz_widgets`.`name` = 'Preventivi in lavorazione';

UPDATE `zz_widgets` SET `query` = 'SELECT COUNT(id) AS dato FROM co_ordiniservizio_pianificazionefatture WHERE idcontratto IN( SELECT id FROM co_contratti WHERE idstato IN(SELECT id FROM co_staticontratti WHERE descrizione IN(''Bozza'', ''Accettato'', ''In lavorazione'', ''In attesa di pagamento'')) ) AND co_ordiniservizio_pianificazionefatture.iddocumento=0' WHERE `zz_widgets`.`name` = 'Rate contrattuali';
