-- Arbori de decizie refacuti pentru legile "rosii" (frecvente la masa).
-- Se incarca DUPA seed-trees-all.sql si inlocuieste arborii pentru:
--   2, 13, 14, 25, 27, 30, 32, 45, 50, 54, 64
-- Regel 31 NU este atinsa: era deja corecta si a servit ca model.
--
-- Principii aplicate (7 sept 2026):
--  1. Radacina intreaba un FAPT OBSERVABIL la masa, nu "care sectiune se aplica".
--  2. Sub-cazurile atarna sub parintele lor, nu la acelasi nivel cu el.
--  3. Ramurile unei intrebari sunt exclusive si acopera toate cazurile.
--  4. Rezultatele sunt scurte, reformulate; sensul e cel din textul german,
--     care ramane neatins in tabelul rules.
--  5. referenced_rules pastreaza trimiterile din textul legii.

DELETE FROM decision_nodes
 WHERE rule_number IN ('2','13','14','25','27','30','32','45','50','54','64');

-- ===================================================================
-- REGEL 2 — Boards  (nu e decizie, e cautare: numar de board -> teiler/gefahr)
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90000,'2',NULL,'Was brauchst du für dieses Board?','Ce îți trebuie pentru board-ul acesta?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type) VALUES
(90001,'2',90000,'Teiler (wer gibt)','Împărțitorul (cine dă)',1,
 'Nord bei Board 1, 5, 9, 13 — Ost bei 2, 6, 10, 14 — Süd bei 3, 7, 11, 15 — West bei 4, 8, 12, 16. Der Zyklus wiederholt sich für jede weitere Gruppe von 16 Boards.',
 'Nord la board 1, 5, 9, 13 — Est la 2, 6, 10, 14 — Sud la 3, 7, 11, 15 — Vest la 4, 8, 12, 16. Ciclul se repetă pentru fiecare grup următor de 16 board-uri.','info'),
(90002,'2',90000,'Gefahrenlage','Vulnerabilitatea (zona)',1,
 'Keiner in Gefahr bei Board 1, 8, 11, 14 — nur N-S bei 2, 5, 12, 15 — nur O-W bei 3, 6, 9, 16 — beide in Gefahr bei 4, 7, 10, 13. Der Zyklus wiederholt sich alle 16 Boards.',
 'Nimeni în zonă la board 1, 8, 11, 14 — doar N-S la 2, 5, 12, 15 — doar E-V la 3, 6, 9, 16 — ambele în zonă la 4, 7, 10, 13. Ciclul se repetă la fiecare 16 board-uri.','info'),
(90003,'2',90000,'Das Board weicht von den Vorgaben ab','Board-ul nu respectă schema',1,
 'Ein solches Board soll nicht verwendet werden. Wird es dennoch verwendet, gelten für diesen Durchgang die auf dem Board markierten Bedingungen.',
 'Un asemenea board nu trebuie folosit. Dacă totuși se folosește, în turul acela sunt valabile condițiile marcate pe board.','info');

-- ===================================================================
-- REGEL 13 — Falsche Kartenanzahl
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90010,'13',NULL,'Wann wurde die falsche Kartenanzahl bemerkt?','Când s-a observat numărul greșit de cărți?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90011,'13',90010,'Vor der ersten Ansage','Înainte de prima declarație','Hat ein Spieler eine Karte eines anderen gesehen?','A văzut vreun jucător o carte a altuia?',0),
(90014,'13',90010,'Während Lizitation oder Spiel','În timpul licitației sau al jocului','Kann die Partie nach dem Urteil des Turnierleiters richtig gestellt und normal fertig gespielt werden?','După aprecierea arbitrului, poate fi partida îndreptată și jucată normal până la capăt?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90012,'13',90011,'Nein','Nu',1,
 'Der Turnierleiter stellt die Austeilung richtig und lässt das Board normal spielen.',
 'Arbitrul îndreaptă distribuția și lasă board-ul să fie jucat normal.','no_correction',NULL),
(90013,'13',90011,'Ja','Da',1,
 'Das Board wird gespielt und abgerechnet. Meint der Turnierleiter danach, dass die spielfremde Information das Ergebnis beeinflusst hat, weist er ein Berichtigtes Ergebnis zu; er kann einen schuldigen Spieler bestrafen.',
 'Board-ul se joacă și se punctează. Dacă arbitrul apreciază apoi că informația din afara jocului a influențat rezultatul, atribuie Scor Corectat; poate sancționa un jucător vinovat.','apply_rule','["12C1(b)"]'),
(90015,'13',90014,'Ja','Da',1,
 'Die Partie wird ohne Ansageänderung zu Ende gespielt. Am Ende kann der Turnierleiter ein Berichtigtes Ergebnis zuweisen.',
 'Partida se joacă până la capăt fără schimbarea declarațiilor. La final, arbitrul poate atribui Scor Corectat.','no_correction',NULL),
(90016,'13',90014,'Nein','Nu',1,
 'Der Turnierleiter weist ein Berichtigtes Ergebnis zu; er kann einen schuldigen Spieler bestrafen.',
 'Arbitrul atribuie Scor Corectat; poate sancționa un jucător vinovat.','apply_rule','["12C1(b)"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90017,'13',90010,'Eine überzählige Karte wurde gefunden','S-a găsit o carte în plus',1,
 'Jede überzählige Karte, die nicht zur Austeilung gehört, wird entfernt, sobald sie gefunden wird. Lizitation und Spiel gehen ohne weitere Korrektur weiter. Ein Berichtigtes Ergebnis nur, wenn eine solche Karte zu einem vergangenen Stich gespielt worden ist.',
 'Orice carte în plus, care nu aparține distribuției, se scoate imediat ce e găsită. Licitația și jocul continuă fără altă corecție. Scor Corectat doar dacă o astfel de carte a fost jucată la o levată deja consumată.','no_correction',NULL),
(90018,'13',90010,'Erst nach Spielende','Abia după terminarea jocului',1,
 'Das Ergebnis wird gestrichen und ein Berichtigtes Ergebnis zugewiesen. Über einen schuldigen Teilnehmer kann eine Ordnungsstrafe verhängt werden.',
 'Rezultatul se anulează și se atribuie Scor Corectat. Participantului vinovat i se poate aplica o penalizare de ordine.','apply_rule','["86B","14"]');

-- ===================================================================
-- REGEL 14 — Fehlende Karte
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90020,'14',NULL,'Wann wurde der Kartenmangel bemerkt?','Când s-a observat lipsa cărții?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90021,'14',90020,'Vor dem Aufdecken des ersten Ausspiels','Înainte de întoarcerea primei ieșiri','Wird die fehlende Karte gefunden?','Se găsește cartea lipsă?',0),
(90024,'14',90020,'Ab dem Aufdecken des ersten Ausspiels','De la întoarcerea primei ieșiri încolo','Wo wird die fehlende Karte gefunden?','Unde se găsește cartea lipsă?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90022,'14',90021,'Ja','Da',1,
 'Die Karte wird dem mangelhaften Blatt hinzugefügt. Lizit und Spiel gehen normal weiter, ohne Änderung bereits gemachter Ansagen.',
 'Cartea se adaugă la mâna incompletă. Licitația și jocul continuă normal, fără schimbarea declarațiilor deja făcute.','no_correction',NULL),
(90023,'14',90021,'Nein','Nu',1,
 'Der Turnierleiter rekonstruiert die Austeilung aus einem anderen Kartenpaket. Es wird angenommen, dass das rekonstruierte Blatt von Anfang an vollständig war; bereits gemachte Ansagen bleiben.',
 'Arbitrul reconstituie distribuția dintr-un alt pachet. Se consideră că mâna reconstituită a fost completă de la început; declarațiile deja făcute rămân.','no_correction',NULL),
(90025,'14',90024,'Unter den gespielten Karten','Printre cărțile jucate',1,
 'Regel 67 ist anzuwenden (Karte zu einem falschen Stich).',
 'Se aplică Legea 67 (carte la o levată greșită).','apply_rule','["67"]'),
(90026,'14',90024,'Anderswo','În altă parte',1,
 'Die Karte wird dem mangelhaften Blatt beigefügt. Es gilt, dass sie immer in diesem Blatt war: sie kann eine Strafkarte werden, und ihr Nichtspielen kann eine Revoke sein. Korrekturen und Strafen können anzuwenden sein.',
 'Cartea se adaugă la mâna incompletă. Se consideră că a fost dintotdeauna în acea mână: poate deveni carte de penalitate, iar nejucarea ei poate fi renunț. Se pot aplica corecții și penalizări.','apply_rule','["14B4","50","64"]'),
(90027,'14',90024,'Gar nicht','Nu se găsește deloc',1,
 'Die Austeilung wird aus einem anderen Kartenpaket rekonstruiert. Korrekturen und Strafen können anzuwenden sein.',
 'Distribuția se reconstituie dintr-un alt pachet. Se pot aplica corecții și penalizări.','apply_rule','["14B4"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90028,'14',90020,'Frage zur Information','Întrebare despre informație',1,
 'Das Hinzufügen einer Karte ist für den Partner des Spielers, dessen Blatt eine falsche Kartenanzahl hatte, unerlaubte Information.',
 'Adăugarea unei cărți este informație nepermisă pentru partenerul jucătorului a cărui mână avea numărul greșit de cărți.','apply_rule','["16C"]');

-- ===================================================================
-- REGEL 25 — Erlaubte und unerlaubte Ansageänderung
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90030,'25',NULL,'Warum soll die Ansage geändert werden?','De ce se cere schimbarea declarației?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90031,'25',90030,'Unbeabsichtigt: Versprecher oder mechanischer Fehler','Neintenționat: lapsus sau greșeală mecanică','Wie steht die Lizitation jetzt?','Cum stă licitația acum?',0),
(90035,'25',90030,'Beabsichtigt so gesagt, wird jetzt bereut','Intenționat spusă așa, acum regretată','Nimmt der linke Gegner die Ersatzansage an?','Adversarul din stânga acceptă declarația de înlocuire?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90032,'25',90031,'Der Partner hat noch nicht angesagt','Partenerul încă nu a declarat',1,
 'Der Spieler darf die unbeabsichtigte Ansage durch die beabsichtigte ersetzen. Die zweite Ansage gilt; es gibt keine Ausspielbeschränkung nach Regel 26. Es spielt keine Rolle, wie er auf den Fehler aufmerksam geworden ist.',
 'Jucătorul poate înlocui declarația neintenționată cu cea intenționată. A doua declarație rămâne valabilă; nu există restricție de ieșire după Legea 26. Nu contează cum a devenit atent la greșeală.','no_correction','["26"]'),
(90033,'25',90031,'Der Partner hat schon angesagt','Partenerul a declarat deja',1,
 'Eine Änderung ist nicht mehr möglich. Achtung: ein Wechsel der Absicht (mangelnde Konzentration) berechtigt ohnehin nicht zur Änderung — nur ein mechanischer Fehler oder ein Zungenfehler.',
 'Schimbarea nu mai este posibilă. Atenție: schimbarea intenției (lipsa de concentrare) oricum nu dă dreptul la modificare — doar greșeala mecanică sau lapsusul.','info',NULL),
(90034,'25',90031,'Die Lizitation endete, bevor sie den Partner erreicht hat','Licitația s-a încheiat înainte să ajungă la partener',1,
 'Die Ansage kann bis zum Ende der Lizitationsphase geändert werden.',
 'Declarația poate fi schimbată până la sfârșitul fazei de licitație.','apply_rule','["17D"]'),
(90036,'25',90035,'Ja, er nimmt sie an','Da, o acceptă',1,
 'Die erste Ansage ist zurückgenommen, die zweite gilt, das Lizit geht weiter. Regel 26 kann anzuwenden sein.',
 'Prima declarație e retrasă, a doua rămâne valabilă, licitația continuă. Legea 26 poate fi aplicabilă.','no_correction','["26"]'),
(90037,'25',90035,'Nein','Nu',1,
 'Die unzulässige Ersatzansage wird gestrichen. Die ursprüngliche Ansage gilt, das Lizit geht weiter. Regel 26 kann anzuwenden sein.',
 'Declarația de înlocuire nepermisă se anulează. Rămâne valabilă declarația inițială, licitația continuă. Legea 26 poate fi aplicabilă.','apply_rule','["26"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90038,'25',90030,'Eine Änderung wurde gestattet — was darf der linke Gegner?','S-a permis o schimbare — ce poate face adversarul din stânga?',1,
 'Der linke Gegner darf eine Ansage, die er vor der Änderung gemacht hat, zurückziehen. Die Information aus dieser zurückgezogenen Ansage ist für seine Seite erlaubt, für die Gegner unerlaubt.',
 'Adversarul din stânga poate retrage o declarație făcută înainte de schimbare. Informația din declarația retrasă este permisă pentru linia lui și nepermisă pentru adversari.','apply_rule','["16C"]'),
(90039,'25',90030,'Was gilt für zurückgezogene oder gestrichene Ansagen?','Ce se aplică declarațiilor retrase sau anulate?',1,
 'Regel 16C ist auf alle zurückgezogenen oder gestrichenen Ansagen anzuwenden.',
 'Legea 16C se aplică tuturor declarațiilor retrase sau anulate.','apply_rule','["16C"]');

-- ===================================================================
-- REGEL 27 — Ungenügendes Gebot
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90050,'27',NULL,'War das ungenügende Gebot auch außer der Reihe?','Licitația insuficientă a fost și peste rând?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90051,'27',90050,'Ja','Da',1,
 'Nicht Regel 27, sondern Regel 31 ist anzuwenden.',
 'Nu se aplică Legea 27, ci Legea 31.','apply_rule','["31"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90052,'27',90050,'Nein','Nu','Hat der linke Gegner das ungenügende Gebot angenommen (er hat darüber angesagt)?','Adversarul din stânga a acceptat licitația insuficientă (a declarat peste ea)?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type) VALUES
(90053,'27',90052,'Ja, angenommen','Da, acceptată',1,
 'Das ungenügende Gebot gilt als zulässig. Das Lizit geht ohne Korrektur weiter.',
 'Licitația insuficientă se consideră valabilă. Licitația continuă fără corecție.','no_correction');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90054,'27',90052,'Nein','Nu','Wodurch ersetzt der schuldige Spieler sein Gebot?','Cu ce înlocuiește jucătorul vinovat licitația?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90055,'27',90054,'Durch das niedrigste genügende Gebot in derselben Denomination','Cu cea mai mică licitație suficientă în aceeași denominație',1,
 'Das Lizit geht normal weiter. Regel 26B und 16C sind nicht anzuwenden. Nach dem Spiel bleibt die Schadenprüfung nach Regel 27D möglich.',
 'Licitația continuă normal. Legile 26B și 16C nu se aplică. După joc rămâne posibilă verificarea prejudiciului conform Legii 27D.','no_correction','["26B","16C","27D"]'),
(90056,'27',90054,'Durch eine vergleichbare Ansage','Cu o declarație comparabilă',1,
 'Das Lizit wird ohne weitere Korrektur fortgesetzt. Regel 16C ist nicht anzuwenden. Nach dem Spiel bleibt die Schadenprüfung nach Regel 27D möglich.',
 'Licitația continuă fără altă corecție. Legea 16C nu se aplică. După joc rămâne posibilă verificarea prejudiciului conform Legii 27D.','no_correction','["23A","16C","27D"]'),
(90057,'27',90054,'Durch ein anderes genügendes Gebot oder Pass','Cu altă licitație suficientă sau cu pas',1,
 'Der Partner des schuldigen Spielers muss immer passen, wenn er an der Reihe ist anzusagen. Die Ausspielbeschränkungen nach Regel 26B können anzuwenden sein.',
 'Partenerul jucătorului vinovat trebuie să paseze de fiecare dată când îi vine rândul să declare. Restricțiile de ieșire după Legea 26B pot fi aplicabile.','partner_must_pass','["26B","72C"]'),
(90058,'27',90054,'Er versucht zu kontrieren oder rekontrieren','Încearcă să contreze sau să recontreze',1,
 'Diese Ansage wird gestrichen. Er muss sie durch eine oben zugelassene Ansage ersetzen, und sein Partner muss danach immer passen, wenn er an der Reihe ist. Regel 26B kann anzuwenden sein.',
 'Declarația se anulează. Trebuie înlocuită cu una dintre cele permise mai sus, iar partenerul trebuie apoi să paseze de fiecare dată când îi vine rândul. Legea 26B poate fi aplicabilă.','partner_must_pass','["27B1(b)","26B","72C"]'),
(90059,'27',90054,'Durch ein weiteres ungenügendes Gebot','Cu încă o licitație insuficientă',1,
 'Der linke Gegner kann auch dieses ungenügende Gebot annehmen. Andernfalls entscheidet der Turnierleiter nach Regel 27B3 (Ansage gestrichen, Partner muss passen).',
 'Adversarul din stânga poate accepta și această licitație insuficientă. Altfel, arbitrul decide după Legea 27B3 (declarație anulată, partenerul trebuie să paseze).','apply_rule','["27A","27B3"]'),
(90060,'27',90054,'Er hat schon ersetzt, bevor der Turnierleiter entschieden hat','A înlocuit deja, înainte ca arbitrul să decidă',1,
 'Die voreilige Ersatzansage gilt, wenn sie zulässig ist und das ungenügende Gebot nicht angenommen wird. Der Turnierleiter wendet dann die passende Bestimmung dieser Regel auf die Ersatzansage an. Ausnahme: der Fall Kontra/Rekontra (27B3).',
 'Declarația de înlocuire pripită rămâne valabilă dacă e permisă și dacă licitația insuficientă nu e acceptată. Arbitrul aplică apoi prevederea potrivită din această lege asupra declarației de înlocuire. Excepție: cazul contră/recontră (27B3).','apply_rule','["27A","27B3"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90061,'27',90050,'Nach dem Spiel: wurde die nicht-schuldige Seite geschädigt?','După joc: a fost prejudiciată linia nevinovată?',1,
 'Wenn nach Anwendung von Regel 27B1 ohne die Hilfe des Regelverstoßes leicht ein anderes Ergebnis zustande gekommen wäre und die nicht-schuldige Seite geschädigt wurde, weist der Turnierleiter ein Berichtigtes Ergebnis zu und rekonstruiert das wahrscheinliche Ergebnis.',
 'Dacă, după aplicarea Legii 27B1, fără ajutorul abaterii s-ar fi ajuns ușor la alt rezultat și linia nevinovată a fost prejudiciată, arbitrul atribuie Scor Corectat și reconstituie rezultatul probabil.','apply_rule','["27B1","12B1"]');

-- ===================================================================
-- REGEL 30 — Pass außer der Reihe
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90070,'30',NULL,'War der Pass künstlich, oder ein Pass auf eine künstliche Ansage?','Pasul a fost artificial, sau un pas la o declarație artificială?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90071,'30',90070,'Ja','Da',1,
 'Nicht Regel 30, sondern Regel 31 ist anzuwenden.',
 'Nu se aplică Legea 30, ci Legea 31.','apply_rule','["31"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90072,'30',90070,'Nein','Nu','Wer war an der Reihe anzusagen?','Cine era la rând să declare?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90073,'30',90072,'Der rechte Gegner','Adversarul din dreapta',1,
 'Der schuldige Spieler muss passen, wenn er das nächste Mal an der Reihe ist anzusagen.',
 'Jucătorul vinovat trebuie să paseze data următoare când îi vine rândul să declare.','partner_must_pass','["72C"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90074,'30',90072,'Der Partner — oder der linke Gegner, und der Schuldige hat noch nicht lizitiert','Partenerul — sau adversarul din stânga, iar vinovatul încă nu a licitat','Wer ist jetzt an der Reihe anzusagen?','Cine este acum la rând să declare?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90075,'30',90074,'Der Partner des schuldigen Spielers','Partenerul jucătorului vinovat',1,
 'Er kann jede regelkonforme Ansage machen. Regel 16C2 ist anzuwenden.',
 'Poate face orice declarație conformă. Se aplică Legea 16C2.','no_correction','["16C2"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90076,'30',90074,'Der schuldige Spieler','Jucătorul vinovat','Ist seine Ansage eine vergleichbare Ansage?','Este declarația lui o declarație comparabilă?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90077,'30',90076,'Ja','Da',1,
 'Keine weitere Korrektur. Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.',
 'Fără altă corecție. Legea 26B nu se aplică, dar vezi Legea 23C.','no_correction','["23A","23C","26B"]'),
(90078,'30',90076,'Nein','Nu',1,
 'Der Partner des schuldigen Spielers muss passen, wenn er das nächste Mal an der Reihe ist anzusagen.',
 'Partenerul jucătorului vinovat trebuie să paseze data următoare când îi vine rândul să declare.','partner_must_pass','["23A","16C","26B","72C"]'),
(90079,'30',90072,'Der linke Gegner, und der Schuldige hat bereits lizitiert','Adversarul din stânga, iar vinovatul a licitat deja',1,
 'Der Pass außer der Reihe gilt als Änderung einer Ansage. Regel 25 ist anzuwenden.',
 'Pasul peste rând se consideră schimbare de declarație. Se aplică Legea 25.','apply_rule','["25"]');

-- ===================================================================
-- REGEL 32 — Kontra oder Rekontra außer der Reihe
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90090,'32',NULL,'War das (Re-)Kontra überhaupt zulässig?','Contra/recontra a fost în principiu permisă?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90091,'32',90090,'Nein, es war unzulässig','Nu, a fost nepermisă',1,
 'Regel 36 ist anzuwenden (unzulässiges Kontra oder Rekontra).',
 'Se aplică Legea 36 (contră sau recontră nepermisă).','apply_rule','["36"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90092,'32',90090,'Ja','Da','Hat der nächste Gegner hinter dem schuldigen Spieler es angenommen?','Următorul adversar, în spatele jucătorului vinovat, a acceptat-o?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90093,'32',90092,'Ja, angenommen','Da, acceptată',1,
 'Das (Re-)Kontra gilt, das Lizit geht ohne Korrektur weiter.',
 'Contra/recontra rămâne valabilă, licitația continuă fără corecție.','no_correction','["29A"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90094,'32',90092,'Nein','Nu','Wer war an der Reihe anzusagen?','Cine era la rând să declare?',0),
(90095,'32',90094,'Der rechte Gegner','Adversarul din dreapta','Was tut dieser Gegner jetzt?','Ce face acum acest adversar?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90096,'32',90095,'Er passt','Pasează',1,
 'Der schuldige Spieler muss sein (Re-)Kontra wiederholen. War es zulässig, gibt es keine weitere Korrektur; andernfalls ist Regel 36 anzuwenden.',
 'Jucătorul vinovat trebuie să repete contra/recontra. Dacă era permisă, nu mai există altă corecție; altfel se aplică Legea 36.','repeat_bid','["36"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90097,'32',90095,'Er bietet, kontriert oder rekontriert','Licitează, contrează sau recontrează','Ist die neue Ansage des schuldigen Spielers eine vergleichbare Ansage?','Este noua declarație a jucătorului vinovat o declarație comparabilă?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90098,'32',90097,'Ja','Da',1,
 'Keine weitere Korrektur. Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.',
 'Fără altă corecție. Legea 26B nu se aplică, dar vezi Legea 23C.','no_correction','["23A","23C","26B"]'),
(90099,'32',90097,'Nein','Nu',1,
 'Der Partner des schuldigen Spielers muss passen, wenn er das nächste Mal an der Reihe ist anzusagen. Regel 16C, 26B und 72C können anzuwenden sein.',
 'Partenerul jucătorului vinovat trebuie să paseze data următoare când îi vine rândul. Legile 16C, 26B și 72C pot fi aplicabile.','partner_must_pass','["23A","16C","26B","72C"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90100,'32',90094,'Der Partner','Partenerul','Wer ist jetzt an der Reihe anzusagen?','Cine este acum la rând să declare?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90101,'32',90100,'Der Partner des schuldigen Spielers','Partenerul jucătorului vinovat',1,
 'Er kann jede regelkonforme Ansage machen, aber Regel 16C2 ist anzuwenden.',
 'Poate face orice declarație conformă, dar se aplică Legea 16C2.','no_correction','["16C2"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90102,'32',90100,'Der schuldige Spieler','Jucătorul vinovat','Ist seine Ansage eine vergleichbare Ansage?','Este declarația lui o declarație comparabilă?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90103,'32',90102,'Ja','Da',1,
 'Keine weitere Korrektur — der Turnierleiter entscheidet wie nach Regel 32A2(a). Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.',
 'Fără altă corecție — arbitrul decide ca după Legea 32A2(a). Legea 26B nu se aplică, dar vezi Legea 23C.','no_correction','["32A2(a)","23A","23C","26B"]'),
(90104,'32',90102,'Nein','Nu',1,
 'Der Partner des schuldigen Spielers muss passen, wenn er das nächste Mal an der Reihe ist — der Turnierleiter entscheidet wie nach Regel 32A2(b).',
 'Partenerul jucătorului vinovat trebuie să paseze data următoare când îi vine rândul — arbitrul decide ca după Legea 32A2(b).','partner_must_pass','["32A2(b)","23A","16C","26B","72C"]'),
(90105,'32',90094,'Der linke Gegner','Adversarul din stânga',1,
 'Spätere Ansagen gelten als Änderung einer Ansage. Regel 25 ist anzuwenden.',
 'Declarațiile ulterioare se consideră schimbare de declarație. Se aplică Legea 25.','apply_rule','["25"]');

-- ===================================================================
-- REGEL 45 — Gespielte Karte
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90110,'45',NULL,'Was ist passiert?','Ce s-a întâmplat?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90111,'45',90110,'Es ist strittig, ob eine Karte schon gespielt ist','Se discută dacă o carte e deja jucată','Um wessen Karte geht es?','Despre cartea cui e vorba?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90112,'45',90111,'Karte eines Gegenspielers','Cartea unui apărător',1,
 'Sie gilt als zum aktuellen Stich gespielt, wenn sie so gehalten wurde, dass der Partner die Bildseite sehen konnte. Hat der Spieler schon eine regelkonforme Karte zu diesem Stich gespielt, siehe Regel 45E.',
 'Se consideră jucată la levata curentă dacă a fost ținută astfel încât partenerul să-i poată vedea fața. Dacă jucătorul a jucat deja o carte conformă la această levată, vezi Legea 45E.','info','["45E"]'),
(90113,'45',90111,'Karte aus dem Blatt des Alleinspielers','Carte din mâna declarantului',1,
 'Sie gilt als gespielt, wenn sie mit der Bildseite nach oben den Tisch berührt oder beinahe berührt hat, oder wenn sie einige Zeit so gehalten wurde, dass sie als gespielt zu erkennen war.',
 'Se consideră jucată dacă, cu fața în sus, a atins sau aproape a atins masa, sau dacă a fost ținută un timp într-o poziție din care se putea recunoaște ca jucată.','info',NULL),
(90114,'45',90111,'Karte des Strohmanns','Cartea mortului',1,
 'Sie ist gespielt, wenn der Alleinspieler sie absichtlich berührt hat — außer um die Karten zu ordnen oder um eine Karte darüber oder darunter zu erreichen.',
 'Este jucată dacă declarantul a atins-o intenționat — cu excepția cazului în care aranjează cărțile sau ajunge la o carte de deasupra ori de dedesubt.','info',NULL),
(90115,'45',90111,'Eine Karte wurde genannt oder bezeichnet','O carte a fost numită sau desemnată',1,
 'Eine Karte ist gespielt, wenn ein Spieler sie als die Karte nennt oder bezeichnet, die er spielen will. Der Alleinspieler kann eine unbeabsichtigte Bezeichnung einer Strohmann-Karte ändern, bis er das nächste Mal spielt — nur bei einem Versprecher, nicht bei Unkonzentriertheit oder neuem Plan.',
 'O carte este jucată dacă jucătorul o numește sau o desemnează drept cea pe care vrea s-o joace. Declarantul poate schimba desemnarea neintenționată a unei cărți a mortului până joacă data următoare — doar la lapsus, nu la neatenție sau plan nou.','info','["47","47D","16C1"]'),
(90116,'45',90111,'Es ist eine Strafkarte','Este o carte de penalitate',1,
 'Eine große oder kleine Strafkarte kann gespielt werden müssen. Regel 50 ist anzuwenden.',
 'O carte de penalitate mare sau mică poate trebui jucată. Se aplică Legea 50.','apply_rule','["50"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90117,'45',90110,'Der Strohmann hat eine nicht genannte Karte gelegt','Mortul a pus o carte care nu a fost numită','Wurde darauf aufmerksam gemacht, bevor beide Seiten zum nächsten Stich gespielt haben?','S-a semnalat înainte ca ambele linii să joace la levata următoare?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90118,'45',90117,'Ja','Da',1,
 'Die Karte muss zurückgenommen werden. Ein Gegenspieler kann eine Karte zurücknehmen, die er nach dem Fehler gespielt hat. Ändert der rechte Gegner des Alleinspielers sein Spiel, darf auch der Alleinspieler eine danach gespielte Karte zurücknehmen.',
 'Cartea trebuie retrasă. Un apărător poate retrage o carte jucată după greșeală. Dacă adversarul din dreapta declarantului își schimbă jocul, și declarantul poate retrage o carte jucată după aceea.','apply_rule','["16C"]'),
(90119,'45',90117,'Nein, es ist zu spät','Nu, e prea târziu',1,
 'Das Spiel geht normal weiter, ohne Änderung der gespielten Karten. War die falsch gelegte Karte die erste des Stichs, kann eine Revoke vorliegen, wenn nicht Farbe bekannt wurde. Wurde sie zu einem laufenden Stich zugegeben und der Strohmann hat dadurch revoked, siehe Regel 64B3 und 64C.',
 'Jocul continuă normal, fără schimbarea cărților jucate. Dacă acea carte a fost prima levatei, poate exista renunț dacă nu s-a răspuns la culoare. Dacă a fost adăugată la o levată în curs și mortul a renunțat astfel, vezi Legile 64B3 și 64C.','apply_rule','["64A","64B7","64B3","64C"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90120,'45',90110,'Am Stich liegt eine fünfte Karte','La levată e a cincea carte','Wer hat die fünfte Karte zugegeben?','Cine a pus a cincea carte?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90121,'45',90120,'Ein Gegenspieler','Un apărător',1,
 'Die Karte wird eine Strafkarte und unterliegt Regel 50 — es sei denn, sie wurde nach dem Urteil des Turnierleiters ausgespielt; dann ist Regel 53 oder 56 anzuwenden.',
 'Cartea devine carte de penalitate și intră sub Legea 50 — cu excepția cazului în care, după aprecierea arbitrului, a fost o ieșire; atunci se aplică Legea 53 sau 56.','apply_rule','["50","53","56"]'),
(90122,'45',90120,'Der Alleinspieler (aus der Hand oder vom Strohmann)','Declarantul (din mână sau din mort)',1,
 'Die Karte wird ohne weitere Korrektur ins Blatt zurückgegeben — es sei denn, sie wurde nach dem Urteil des Turnierleiters ausgespielt; dann ist Regel 55 anzuwenden.',
 'Cartea se întoarce în mână fără altă corecție — cu excepția cazului în care, după aprecierea arbitrului, a fost o ieșire; atunci se aplică Legea 55.','no_correction','["55"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type) VALUES
(90123,'45',90110,'Der Strohmann hat von sich aus eine Karte berührt oder bezeichnet','Mortul a atins sau a desemnat singur o carte',1,
 'Der Strohmann darf das nicht. Der Turnierleiter ist unverzüglich zu rufen; das Spiel wird fortgesetzt. Nach dem Spiel weist der Turnierleiter ein Berichtigtes Ergebnis zu, wenn der Strohmann dem Alleinspieler ein Spiel nahegelegt hat und die Gegenspieler dadurch geschädigt wurden.',
 'Mortul nu are voie. Arbitrul trebuie chemat imediat; jocul continuă. După joc, arbitrul atribuie Scor Corectat dacă mortul i-a sugerat declarantului un joc și apărătorii au fost prejudiciați astfel.','apply_rule'),
(90124,'45',90110,'Frage zum Umdrehen der Karten','Întrebare despre întoarcerea cărților',1,
 'Kein Spieler soll seine Karte umdrehen, bevor alle vier Spieler zum Stich gespielt haben.',
 'Niciun jucător nu trebuie să-și întoarcă cartea înainte ca toți patru să fi jucat la levată.','info'),
(90125,'45',90110,'Wie wird eine Karte überhaupt gespielt?','Cum se joacă, de fapt, o carte?',1,
 'Jeder Spieler außer dem Strohmann spielt eine Karte, indem er sie aus seinem Blatt nimmt und mit der Bildseite nach oben vor sich auf den Tisch legt. Der Alleinspieler spielt eine Karte des Strohmanns, indem er sie nennt; der Strohmann legt sie dann auf. Das erste Ausspiel erfolgt verdeckt, wenn der Zuständige Verband nichts anderes anordnet.',
 'Fiecare jucător în afară de mort joacă o carte scoțând-o din mână și punând-o cu fața în sus în fața lui pe masă. Declarantul joacă o carte a mortului numind-o; mortul o pune apoi jos. Prima ieșire se face acoperită, dacă federația competentă nu dispune altfel.','info');

-- ===================================================================
-- REGEL 50 — Vorgehen bei Strafkarten
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90140,'50',NULL,'Die Strafkarte bleibt mit der Bildseite nach oben vor ihrem Besitzer liegen, bis eine Korrektur gewählt ist. Worum geht es jetzt?','Cartea de penalitate rămâne cu fața în sus în fața posesorului până se alege o corecție. Despre ce e vorba acum?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90141,'50',90140,'Vorgehen mit der Strafkarte','Procedura cu cartea de penalitate','Wie wurde die Karte sichtbar?','Cum a devenit cartea vizibilă?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90142,'50',90141,'Eine einzelne kleine Karte, unabsichtlich sichtbar geworden','O singură carte mică, devenită vizibilă neintenționat',1,
 'Kleine Strafkarte. Der Gegenspieler darf keine andere kleine Karte dieser Farbe spielen, solange er die Strafkarte nicht gespielt hat; eine Figur dieser Farbe darf er stattdessen spielen. Sein Partner unterliegt keinen Ausspielbeschränkungen.',
 'Carte de penalitate mică. Apărătorul nu poate juca altă carte mică din acea culoare cât timp nu a jucat cartea de penalitate; în locul ei poate juca o figură din aceeași culoare. Partenerul lui nu are restricții de ieșire.','restriction','["50E"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90143,'50',90141,'Eine Figur, oder absichtlich sichtbar geworden, oder mehrere Strafkarten','O figură, sau devenită vizibilă intenționat, sau mai multe cărți de penalitate','Große Strafkarte. Wer ist als Nächstes am Zug?','Carte de penalitate mare. Cine urmează la joc?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90144,'50',90143,'Der Spieler mit der Strafkarte selbst','Chiar jucătorul cu cartea de penalitate','Hat er eine vorrangige Pflicht — Farbe bekennen oder eine Ausspiel- bzw. Spielbeschränkung?','Are o obligație prioritară — să răspundă la culoare, ori o restricție de ieșire sau de joc?',0),
(90147,'50',90143,'Sein Partner ist am Ausspiel','Partenerul lui este la ieșire','Was wählt der Alleinspieler?','Ce alege declarantul?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90145,'50',90144,'Nein','Nu',1,
 'Die große Strafkarte muss bei der ersten regelkonformen Gelegenheit gespielt werden — beim Ausspielen, Zugeben, Abwerfen oder Schnappen. Hat der Gegenspieler mehrere spielbare Strafkarten, entscheidet der Alleinspieler, welche gespielt wird.',
 'Cartea de penalitate mare trebuie jucată la prima ocazie conformă — la ieșire, la răspuns, la debarasare sau la tăiere. Dacă apărătorul are mai multe cărți de penalitate jucabile, declarantul alege care se joacă.','restriction',NULL),
(90146,'50',90144,'Ja','Da',1,
 'Die Pflicht, Farbe zu bekennen oder einer Beschränkung zu folgen, hat Vorrang. Die Strafkarte bleibt mit der Bildseite nach oben liegen und wird bei der nächsten regelkonformen Gelegenheit gespielt.',
 'Obligația de a răspunde la culoare sau de a respecta o restricție are prioritate. Cartea de penalitate rămâne cu fața în sus și se joacă la următoarea ocazie conformă.','restriction',NULL),
(90148,'50',90147,'Die Farbe der Strafkarte verlangen oder verbieten','Să ceară sau să interzică culoarea cărții de penalitate',1,
 'Der Partner darf erst ausspielen, nachdem der Alleinspieler gewählt hat. Wählt der Alleinspieler Verlangen oder Verbieten, ist die Karte keine Strafkarte mehr und wird wieder ins Blatt genommen. Das Verbot gilt, solange dieser Gegenspieler am Ausspiel bleibt.',
 'Partenerul nu poate ieși înainte ca declarantul să aleagă. Dacă declarantul cere sau interzice culoarea, cartea nu mai e carte de penalitate și se ia înapoi în mână. Interdicția ține cât timp acel apărător rămâne la ieșire.','apply_rule','["51","59"]'),
(90149,'50',90147,'Darauf verzichten','Să renunțe la alegere',1,
 'Der Gegenspieler kann jede beliebige Karte ausspielen; die Strafkarte bleibt als solche auf dem Tisch liegen. Regel 50D ist weiterhin anzuwenden, solange die Strafkarte besteht.',
 'Apărătorul poate ieși cu orice carte; cartea de penalitate rămâne ca atare pe masă. Legea 50D continuă să se aplice cât timp există cartea de penalitate.','apply_rule','["50D"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90150,'50',90140,'Frage zur Information aus der Strafkarte','Întrebare despre informația din cartea de penalitate','Wo ist die Strafkarte jetzt?','Unde este acum cartea de penalitate?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90151,'50',90150,'Sie liegt noch auf dem Tisch','Încă este pe masă',1,
 'Jede Information aus der Strafkarte und aus der Pflicht, sie zu spielen, ist erlaubte Information für alle Spieler.',
 'Orice informație din cartea de penalitate și din obligația de a o juca este informație permisă pentru toți jucătorii.','info',NULL),
(90152,'50',90150,'Sie wurde wieder ins Blatt genommen','A fost luată înapoi în mână',1,
 'Die Information daraus ist unerlaubt für den Partner des Spielers, der die Strafkarte hatte — aber erlaubt für den Alleinspieler.',
 'Informația din ea este nepermisă pentru partenerul jucătorului care avea cartea de penalitate — dar permisă pentru declarant.','apply_rule','["16C","50D2(a)"]'),
(90153,'50',90150,'Sie wurde gespielt','A fost jucată',1,
 'Die Information aus den Umständen, unter denen sie entstanden ist, ist unerlaubt für den Partner des Spielers, der die Strafkarte hatte.',
 'Informația din împrejurările în care a apărut este nepermisă pentru partenerul jucătorului care avea cartea de penalitate.','apply_rule','["50E1"]'),
(90154,'50',90150,'Nach dem Spiel: wurde die nicht-schuldige Seite geschädigt?','După joc: a fost prejudiciată linia nevinovată?',1,
 'Meint der Turnierleiter, dass das Ergebnis ohne die Hilfe der Strafkarte leicht anders hätte sein können und die nicht-schuldige Seite dadurch geschädigt wurde, weist er ein Berichtigtes Ergebnis zu.',
 'Dacă arbitrul apreciază că fără ajutorul cărții de penalitate rezultatul ar fi putut fi ușor altul și linia nevinovată a fost prejudiciată astfel, atribuie Scor Corectat.','apply_rule','["12B1"]');

-- ===================================================================
-- REGEL 54 — Aufgedecktes Ausspiel außer der Reihe
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90170,'54',NULL,'Spielt der Partner des schuldigen Spielers gerade verdeckt aus, lässt der Turnierleiter dieses verdeckte Ausspiel zurückgehen. Wer hat das erste Ausspiel außer der Reihe aufgedeckt?','Dacă partenerul jucătorului vinovat iese chiar atunci acoperit, arbitrul retrage acea ieșire acoperită. Cine a făcut prima ieșire peste rând, descoperită?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90171,'54',90170,'Ein Spieler der Alleinspieler-Seite','Un jucător din linia declarantului',1,
 'Regel 24 ist anzuwenden (erstes Ausspiel von der falschen Seite).',
 'Se aplică Legea 24 (prima ieșire din partea greșită).','apply_rule','["24"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90172,'54',90170,'Ein Gegenspieler','Un apărător','Hätte der Alleinspieler irgendeine Karte des Strohmanns sehen können? (Karten, die schon während des Lizits sichtbar wurden und Regel 24 unterliegen, zählen nicht.)','Ar fi putut declarantul să vadă vreo carte a mortului? (Cărțile devenite vizibile în timpul licitației, care intră sub Legea 24, nu se pun la socoteală.)',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type) VALUES
(90173,'54',90172,'Ja','Da',1,
 'Der Alleinspieler MUSS das Ausspiel annehmen. Der vermutete Alleinspieler wird zum Alleinspieler.',
 'Declarantul TREBUIE să accepte ieșirea. Presupusul declarant devine declarant.','apply_rule');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90174,'54',90172,'Nein','Nu','Was wählt der Alleinspieler?','Ce alege declarantul?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90175,'54',90174,'Sein eigenes Blatt aufdecken','Să-și descopere propria mână',1,
 'Der Alleinspieler wird zum Strohmann, der Strohmann wird zum Alleinspieler. Beginnt er aufzudecken und werden dabei Karten sichtbar, muss er sein ganzes Blatt aufdecken.',
 'Declarantul devine mort, iar mortul devine declarant. Dacă începe să descopere și devin vizibile cărți, trebuie să-și descopere toată mâna.','info',NULL),
(90176,'54',90174,'Das Ausspiel annehmen','Să accepte ieșirea',1,
 'Das regelwidrige Ausspiel wird angenommen; der Strohmann wird nach Regel 41 aufgedeckt. Die zweite Karte des Stichs kommt aus dem Blatt des Alleinspielers. Spielt er die zweite Karte vom Strohmann, darf sie nur zur Berichtigung einer Revoke zurückgenommen werden.',
 'Ieșirea neregulamentară se acceptă; mortul se descoperă conform Legii 41. A doua carte a levatei vine din mâna declarantului. Dacă joacă a doua carte din mort, ea poate fi retrasă doar pentru îndreptarea unui renunț.','apply_rule','["53","41"]'),
(90177,'54',90174,'Das Ausspiel ablehnen','Să refuze ieșirea',1,
 'Der Gegenspieler muss seine aufgedeckte Karte zurücknehmen. Sie wird zur Strafkarte; Regel 50 ist anzuwenden.',
 'Apărătorul trebuie să-și retragă cartea descoperită. Ea devine carte de penalitate; se aplică Legea 50.','apply_rule','["50"]');

-- ===================================================================
-- REGEL 64 — Vorgehen bei einer etablierten Revoke
-- ===================================================================
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_ro,is_leaf) VALUES
(90190,'64',NULL,'Hat die schuldige Seite den Revokestich oder einen der nachfolgenden Stiche gewonnen?','Linia vinovată a câștigat levata renunțului sau vreuna dintre levatele următoare?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90191,'64',90190,'Nein','Nu',1,
 'Kein automatischer Stichtransfer. Prüfe aber die Entschädigung nach Regel 64C.',
 'Fără transfer automat de levate. Verifică totuși despăgubirea conform Legii 64C.','no_correction','["64C"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90192,'64',90190,'Ja','Da','Liegt einer dieser Ausnahmefälle vor?','Există vreunul dintre aceste cazuri de excepție?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90193,'64',90192,'Ja — einer davon trifft zu','Da — se potrivește unul dintre ele',1,
 'Kein automatischer Stichtransfer. Ausnahmen: weitere Revoke desselben Spielers in derselben Farbe; Revoke durch Nichtspielen einer Strafkarte oder einer Strohmann-Karte; erst bemerkt, nachdem ein Spieler der nicht-schuldigen Seite im nächsten Board angesagt hat; erst nach Rundenende bemerkt; Revoke im zwölften Stich; beide Seiten haben im selben Board revoked; die Revoke wurde nach Regel 62C3 berichtigt. Prüfe die Entschädigung nach Regel 64C.',
 'Fără transfer automat de levate. Excepțiile: alt renunț al aceluiași jucător în aceeași culoare; renunț prin nejucarea unei cărți de penalitate sau a unei cărți a mortului; observat abia după ce un jucător al liniei nevinovate a declarat la board-ul următor; observat abia după încheierea turului; renunț la a douăsprezecea levată; ambele linii au renunțat în același board; renunțul a fost îndreptat conform Legii 62C3. Verifică despăgubirea conform Legii 64C.','no_correction','["64C","62C3"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90194,'64',90192,'Nein — keiner davon','Nu — niciunul','Wer hat den Revokestich gewonnen? (Ein im Strohmann gewonnener Stich gilt hier nicht als vom Alleinspieler gewonnen.)','Cine a câștigat levata renunțului? (O levată câștigată în mort nu se consideră aici câștigată de declarant.)',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90195,'64',90194,'Der schuldige Spieler','Jucătorul vinovat',1,
 'Am Ende des Spiels werden ZWEI Stiche an die nicht-schuldige Seite transferiert: der Revokestich und ein weiterer — Letzterer nur, wenn die schuldige Seite nach dem Revokestich noch einen oder mehrere Stiche gewonnen hat.',
 'La sfârșitul jocului se transferă DOUĂ levate liniei nevinovate: levata renunțului și încă una — a doua doar dacă linia vinovată a mai câștigat una sau mai multe levate după levata renunțului.','apply_rule','["64C"]'),
(90196,'64',90194,'Nicht der schuldige Spieler','Nu jucătorul vinovat',1,
 'Am Ende des Spiels wird EIN Stich an die nicht-schuldige Seite transferiert, sofern die schuldige Seite den Revokestich oder einen der nachfolgenden Stiche gewonnen hat.',
 'La sfârșitul jocului se transferă O levată liniei nevinovate, cu condiția ca linia vinovată să fi câștigat levata renunțului sau vreuna dintre cele următoare.','apply_rule','["64C"]');

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,question_de,question_ro,is_leaf) VALUES
(90197,'64',90190,'Entschädigung prüfen (Regel 64C)','Verificarea despăgubirii (Legea 64C)','Welcher Fall liegt vor?','Care este cazul?',0);

INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES
(90198,'64',90197,'Die nicht-schuldige Seite ist nicht ausreichend entschädigt','Linia nevinovată nu a fost despăgubită suficient',1,
 'Der Turnierleiter weist ein Berichtigtes Ergebnis zu. Das gilt auch für Revokes, bei denen es keinen automatischen Stichtransfer gibt.',
 'Arbitrul atribuie Scor Corectat. Aceasta se aplică și renunțurilor pentru care nu există transfer automat de levate.','apply_rule',NULL),
(90199,'64',90197,'Wiederholte Revokes desselben Spielers in derselben Farbe','Renunțuri repetate ale aceluiași jucător în aceeași culoare',1,
 'Der Turnierleiter adjustiert das Ergebnis, wenn die nicht-schuldige Seite ohne die weiteren Revokes wahrscheinlich mehr Stiche erzielt hätte.',
 'Arbitrul ajustează rezultatul dacă linia nevinovată ar fi obținut probabil mai multe levate fără renunțurile ulterioare.','apply_rule','["64B2"]'),
(90200,'64',90197,'Beide Seiten haben im selben Board revoked','Ambele linii au renunțat în același board',1,
 'Ist nach dem Urteil des Turnierleiters ein Teilnehmer geschädigt worden, weist er ein Berichtigtes Ergebnis so zu, als hätte keine Revoke stattgefunden.',
 'Dacă, după aprecierea arbitrului, un participant a fost prejudiciat, acesta atribuie Scor Corectat ca și cum niciun renunț nu ar fi avut loc.','apply_rule','["64B7"]');
