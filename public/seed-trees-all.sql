-- Decision trees for Laws 1-93 (except 31, which is in seed-rule31.sql)

-- Law 1
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1000,'1',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1001,'1',1000,'A. Rang der Karten und Farben','A. Rang der Karten und Farben','A. Rangul Cărților și Culorilor',1,'Rang der Karten und Farben
Sportbridge wird mit einem Paket von 52 Karten gespielt, und zwar je 13 Karten in jeder der
vier Farben. Die Reihenfolge der Farben ist (absteigend) Pik (♠), Herz (♥), Karo (♦) und Treff
(♣). Die Reihenfolge der Karten ist (absteigend) As, König, Dame, Bube, 10, 9, 8, 7, 6, 5, 4,
3, 2.','Rangul Cărților și Culorilor

Bridge-ul este jucat cu un pachet de 52 cărţi, compus din 13 cărţi pentru fiecare din
cele 4 culori. Ordinea descrescătoare a culorilor este pică (♠), cupă (♥), caro (♦),
treflă (♣). Ordinea descrescătoare a cărţilor dintr-o culoare este As, Rigă, Damă,
Valet, 10, 9, 8, 7, 6, 5, 4, 3, 2.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1002,'1',1000,'B. Bildseite der Karten','B. Bildseite der Karten','B. Fața Cărților',1,'Bildseite der Karten
Der Zuständige Verband kann verlangen, dass die Bildseiten der Karten symmetrisch sind.','Fața Cărților

Autoritatea Regulatoare poate cere ca fața fiecărei cărți să fie simetrică.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1003,'1',1000,'C. Rückseite der Karten','C. Rückseite der Karten','C. Spatele Cărților',1,'Rückseite der Karten
Die Rückseiten aller 52 Karten sollen identisch sein. Sie können Wörter, Logos oder Bilder
enthalten, das Gesamtbild soll aber zentrisch symmetrisch sein.','Spatele Cărților

Spatele tuturor celor 52 de cărți dintr-un pachet trebuie să fie identic. Acesta poate
include cuvinte, o siglă sau o imagine, dar imaginea folosită trebuie să aibă un centru
de simetrie.','apply_rule','[]');

-- Law 2
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1004,'2',NULL,1,'Für jede Austeilung, die in einem Durchgang zu spielen ist, gibt es ein Board mit einem
Kartenpaket. Die Boards sind nummeriert, und jedes hat vier Fächer für die vier Hände, die
als Nord, Ost, Süd und West bezeichnet sind. Teiler und Gefahrenlage sind folgendermaßen
festgelegt:

Nord Teiler:

Boards 1

5

9 13

Ost Teiler:

Boards 2

6 10 14

Süd Teiler:

Boards 3

7 11 15

West Teiler:

Boards 4

8 12 16

Keiner in Gefahr:

Boards 1

8 11 14

nur N-S in Gefahr: Boards 2

5 12 15

nur O-W in Gefahr: Boards 3

6

9 16

beide in Gefahr:

Boards 4

7 10 13

Dieselbe Reihenfolge wird für jede weitere Gruppe von 16 Boards wiederholt.

Es soll kein Board verwendet werden, das diesen Vorgaben nicht entspricht. Wird es aber
doch verwendet, gelten in diesem Durchgang die darauf markierten Bedingungen.','Pentru fiecare donă care trebuie jucată pe parcursul unei sesiuni se asigură un etui
conținând un pachet de cărți. Fiecare etui este numerotat şi are 4 buzunare pentru
depozitarea celor 4 mâini, intitulate Nord, Est, Sud și Vest. Distribuitorul şi
vulnerabilitatea sunt stabilite în felul următor:

Distribuitor Nord

Etuiurile

Est
Sud
Vest

Vulnerabil Nimeni

Etuiurile

Nord-Sud
Est-Vest
Toţi
2
4
2
4
6
8
5
7
13
10 14
11 15
12 16
11 14
12 15
16
10 13

Aceeaşi secvenţă se repetă pentru etuiurile 17-32 şi pentru fiecare grup subsecvent
de 16 etuiuri.

Orice etui care nu respectă aceste condiţii nu trebuie utilizat. Dacă totuşi un astfel de
etui este folosit pentru sesiunea respectivă, se respectă condiţiile înscrise pe acesta.','apply_rule','[]');

-- Law 3
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1005,'3',NULL,1,'An jedem Tisch spielen vier Spieler, und die Tische sind in einer Reihenfolge, die der
Turnierleiter festlegt, nummeriert. Er legt eine Richtung als Nord fest; die anderen
Windrichtungen stehen zu Nord in der üblichen Beziehung.','La fiecare masă joacă 4 jucători, iar mesele sunt numerotate într-o ordine stabilită de
arbitru. Acesta desemnează direcţia Nord, determinând automat celelalte 3 puncte
cardinale prin relația lor cu Nordul.','apply_rule','[]');

-- Law 4
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1006,'4',NULL,1,'Die vier Spieler an einem Tisch bilden zwei Partnerschaften oder Seiten, Nord-Süd gegen
Ost-West. In Paar- oder Teamturnieren treten die Teilnehmer als Paare bzw. Teams an und
behalten während eines Durchgangs dieselben Partnerschaften bei (außer mit Erlaubnis des
Turnierleiters). In Individualturnieren tritt jeder Spieler für sich an, und die Partnerschaften
wechseln während eines Durchgangs.','Cei 4 jucători de la fiecare masă formează două perechi sau axe, Nord-Sud contra
Est-Vest. În concursurile de perechi sau echipe, concurenţii se înscriu ca pereche,
respectiv ca echipă, şi perechile se mențin pe tot parcursul unei sesiuni (pot exista
excepții autorizate de arbitru). În concursurile individuale, fiecare jucător se înscrie
separat şi perechile se schimbă pe parcursul sesiunii.','apply_rule','[]');

-- Law 5
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1007,'5',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1008,'5',1007,'A. Startposition','A. Startposition','A. Poziția Inițială',1,'Startposition
Der Turnierleiter weist jedem Teilnehmer (Spieler, Paar oder Team) eine Startposition für den
Durchgang zu. Wenn es keine andere Weisung gibt, können die Spieler eines jeden Paars oder
Teams selbst entscheiden, wer welchen der ihnen zugewiesenen Plätze einnimmt. Ein Spieler
darf die einmal eingenommene Position innerhalb eines Durchganges nur auf Anweisung oder
mit Erlaubnis des Turnierleiters wechseln.','Poziția Inițială

Arbitrul desemnează o poziţie inițială pentru fiecare concurent (individ, pereche sau
echipă) la începutul fiecărei sesiuni. În absența altor instrucțiuni, membrii fiecărei
perechi sau echipe decid între ei cum își împart locurile care le-au fost desemnate.
Odată ce un jucător şi-a ales poziţia, aceasta nu mai poate fi schimbată în sesiunea
respectivă decât la indicaţia sau cu permisiunea arbitrului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1009,'5',1007,'B. Platzwechsel','B. Platzwechsel','B. Schimbarea Poziției Inițiale sau a Mesei',1,'Platzwechsel
Die Spieler ändern im Einklang mit den Anweisungen des Turnierleiters ihre ursprüngliche
Windrichtung oder begeben sich an einen anderen Tisch. Der Turnierleiter ist dafür
verantwortlich, seine Anweisungen klar durchzusagen. Jeder Spieler ist dafür verantwortlich,
zum angeordneten Zeitpunkt entsprechend diesen Anweisungen den neuen Platz richtig
einzunehmen.','Schimbarea Poziției Inițiale sau a Mesei

Jucătorii își schimbă poziţia iniţială sau se deplasează la o altă masă în conformitate
cu instrucţiunile arbitrului. Arbitrul are sarcina de a anunţa clar instrucţiunile.
Jucătorii au răspunderea de a se deplasa la mese când şi cum le este indicat de
către arbitru şi de a se așeza în locul corect după fiecare shimbare.','apply_rule','[]');

-- Law 6
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1010,'6',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1011,'6',1010,'A. Mischen','A. Mischen','A. Amestecarea Cărților',1,'Mischen
Vor Beginn des Spiels wird jedes Kartenpaket gründlich gemischt. Wenn ein Gegner es
wünscht, darf er abheben.','Amestecarea Cărților

Fiecare pachet se amestecă minuțios înainte de începerea jocului. Pachetul este
tăiat la solicitarea oricăruia dintre oponenți.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1012,'6',1010,'B. Teilen','B. Teilen','B. Distribuirea Cărților',1,'Teilen
Die Karten müssen mit der Bildseite nach unten geteilt werden, eine nach der anderen, in vier
Hände zu je 13 Karten; jede Hand wird dann mit der Bildseite nach unten in eines der vier
Fächer des Boards gesteckt. Zwei aufeinander folgende Karten dürfen nicht in dasselbe Blatt
geteilt werden. Es wird empfohlen, die Karten im Uhrzeigersinn in Kreis zu teilen.','Distribuirea Cărților

Cărţile trebuie distribuite cu faţa în jos, câte o carte pe rând, în 4 mâini de câte 13
cărţi fiecare; fiecare mână este apoi aşezată cu faţa în jos într-unul din cele 4
buzunare ale etuiului. Nu se vor plasa într-o aceeași mână două cărți adiacente în
pachet. Se recomandă ca distribuirea cărţilor să se facă în sensul acelor de
ceasornic.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1013,'6',1010,'C. Anwesenheit beider Paare','C. Anwesenheit beider Paare','C. Prezența unui Reprezentant al Fiecărei Axe',1,'Anwesenheit beider Paare
Ein Mitglied jeder Seite sollte während des Mischens und Teilens anwesend sein, wenn der
Turnierleiter nichts anderes anordnet.','Prezența unui Reprezentant al Fiecărei Axe

În timpul amestecării şi distribuirii cărţilor ar trebui să fie prezent minim un membru al
fiecărei axe, exceptând cazul când arbitrul dă alte dispoziţii.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1014,'6',1010,'D. Neuerliches Mischen und Teilen','D. Neuerliches Mischen und Teilen','D. Reamestecarea și Redistribuirea Cărților',1,'Neuerliches Mischen und Teilen
1. Wenn sich, bevor zum ersten Mal lizitiert wird, herausstellt, dass die Karten falsch geteilt
worden sind, oder dass ein Spieler während des Mischens und Teilens die Bildseite einer
Karte eines anderen Spielers gesehen haben könnte, muss neu gemischt und geteilt werden.
Wenn danach ein Spieler vor dem Ende eines Boards zufällig eine Karte eines anderen
Spielers sieht, ist Regel 16D anzuwenden (siehe aber Regel 24).
2. Wenn der Zweck eines Turniers nicht das neuerliche Spiel vergangener Partien ist, darf
kein Ergebnis stehen bleiben, wenn die Karten ohne Mischen von einem sortierten Paket6.1
geteilt worden sind, oder wenn die Partie von einem anderen Durchgang übernommen worden
ist. (Diese Vorschrift soll nicht verhindern, dass Boards zwischen Tischen ausgetauscht
werden, wo dies gewünscht ist.)

3. Der Turnierleiter kann aus jedem Grund, der mit diesen Regeln vereinbar ist, neuerliches
Mischen und Teilen anordnen (siehe aber Regeln 22B und 86A).','Reamestecarea și Redistribuirea Cărților

1. Dacă se stabileşte înainte de începerea licitaţiei pe o donă că aceasta a fost
incorect distribuită sau că în timpul amestecării și distribuirii un jucător ar fi putut
să vadă fața unei cărți aparţinând altui jucător, se va realiza o nouă amestecare şi
distribuire. Mai târziu, se aplică Legea 16D în cazul în care un jucător vede
accidental o carte a altui jucător înainte de terminarea jocului în donă (dar vezi
Legea 24).

2. Exceptând situaţia când scopul turneului este de a rejuca done din trecut, nu se
poate păstra niciun rezultat când cărţile au fost distribuite fără să fie amestecate
dintr-un pachet sortat1 sau când dona a fost importată dintr-o altă sesiune.
(Aceste prevederi nu afectează eventualele aranjamente de schimbare a etuiurilor
între mese.)

3. Arbitrul poate solicita reamestecarea și redistribuirea cărților pentru orice motiv

compatibil cu Legile (dar vezi Legea 22B și Legea 86A).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1015,'6',1010,'E. Mischen und Teilen im Ermessen des Turnierleiters','E. Mischen und Teilen im Ermessen des Turnierleiters','E. Opțiunile Arbitrului de Amestecare și Distribuire a Cărților',1,'Mischen und Teilen im Ermessen des Turnierleiters
1. Der Turnierleiter kann anordnen, dass an jedem Tisch unmittelbar vor Spielbeginn
gemischt und geteilt werde.

2. Der Turnierleiter kann selbst vor dem Turnier mischen und teilen.

3. Der Turnierleiter kann das Mischen und Teilen vor dem Turnier von seinen Gehilfen oder
anderen Personen in seinem Auftrag erledigen lassen.

4. Der Turnierleiter kann eine andere Methode des Teilens (auch im Vorhinein) anordnen, die
dieselben völlig zufälligen Verteilungen wie oben A. und B. herstellt.','Opțiunile Arbitrului de Amestecare și Distribuire a Cărților

1. Arbitrul poate dispune ca amestecarea şi distribuirea cărților să se realizeze la

fiecare masă înainte de începerea jocului.

2. Arbitrul poate amesteca şi distribui el însuşi cărţile înainte de concurs.

3. Arbitrul își poate insărcina asistenții sau alte persoane autorizate cu amestecarea

şi distribuirea cărţilor înainte de concurs.

4. Arbitrul poate alege o altă metodă de distribuire sau predistribuire a cărţilor care
să producă aceleaşi rezultate complet aleatoare ca şi cele preconizate în punctele
A şi B de mai sus.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1016,'6',1010,'F. Duplizieren der Boards','F. Duplizieren der Boards','F. Duplicarea Etuiurilor',1,'Duplizieren der Boards
Wenn es die Turnierdurchführung erfordert, können nach Anordnung des Turnierleiters eine
oder mehrere exakte Kopien jeder Austeilung angefertigt werden. In diesem Fall soll es
normalerweise zu keinem neuerlichen Mischen und Teilen (siehe oben D.) kommen, doch ist
der Turnierleiter befugt, das dennoch anzuordnen.','Duplicarea Etuiurilor

Arbitrul poate dispune, când condiţiile jocului o cer, realizarea uneia sau mai multor
copii exacte ale fiecărei done originale. În acest caz, în mod normal nu va exista o
redistribuire a unei done (deşi arbitrul are puterea să o impună).','apply_rule','[]');

-- Law 7
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1017,'7',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1018,'7',1017,'A. Auflegen des Boards','A. Auflegen des Boards','A. Plasarea Etuiului pe Masă',1,'Auflegen des Boards
Wenn ein Board gespielt werden soll, wird es in die Tischmitte gelegt; dort muss es richtig
ausgerichtet liegen bleiben, bis das Spiel beendet ist.','Plasarea Etuiului pe Masă

Când un etui trebuie jucat, el este aşezat în centrul mesei, unde rămâne, corect
orientat, până când jocul ia sfârşit.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1019,'7',1017,'B. Herausnehmen der Karten','B. Herausnehmen der Karten','B. Scoaterea Cărților din Etui',1,'Herausnehmen der Karten
1. Jeder Spieler nimmt das Blatt, das seiner Windrichtung entspricht, aus dem Board.

2. Jeder Spieler zählt seine Karten mit der Bildseite nach unten, um sicher zu gehen, dass er
dreizehn hat. Danach, und bevor er ansagt, muss er unbedingt die Bildseiten ansehen.

3. Während des Spiels behält jeder Spieler seine Karten und achtet darauf, dass sie nicht mit
den Karten anderer Spieler vermengt werden. Kein Spieler darf während und nach dem Spiel
andere Karten als die seinen ohne Erlaubnis des Turnierleiters oder eines Gegners berühren
(aber der Alleinspieler kann die Karten des Strohmanns nach Regel 45 spielen).','Scoaterea Cărților din Etui

1. Fiecare jucător își ia cărţile din buzunarul corespunzător punctului său cardinal.

2. Fiecare jucător îşi numără cărţile cu faţa în jos pentru a se asigura că are exact
13; apoi, înainte de a face vreo declaraţie, trebuie să examineze fața cărţilor sale.

1 Un „pachet sortat” este un pachet de cărţi neamestecate faţă de situaţia lor anterioară.
3. În timpul jocului, fiecare jucător rămâne în posesia propriilor cărţi, nepermițând
amestecarea acestora cu cele ale altui jucător. Niciun jucător nu va atinge alte
cărţi în afară de ale sale (dar declarantul poate atinge cărţile mortului pentru a le
juca, conform Legii 45) în timpul sau la sfârşitul jocului, decât cu permisiunea unui
adversar sau a arbitrului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1020,'7',1017,'C. Zurückgeben der Karten ins Board','C. Zurückgeben der Karten ins Board','C. Reintroducerea Cărților în Etui',1,'Zurückgeben der Karten ins Board
Nach Ende des Spiels hat jeder Spieler seine ursprünglichen 13 Karten zu mischen und
danach in dasjenige Fach des Boards zurückzugeben, das seiner Windrichtung entspricht.

6.1 Ein „sortiertes Kartenpaket“ ist eines, dessen Reihenfolge nicht zufällig verändert worden ist.
Danach darf kein Blatt aus dem Board genommen werden, wenn nicht ein Spieler jeder Seite
oder der Turnierleiter anwesend ist.','Reintroducerea Cărților în Etui

După ce jocul ia sfârşit, fiecare jucător ar trebui să-și reamestece cele 13 cărţi şi apoi
să le reaşeze în buzunarul corespunzător punctului său cardinal. Ulterior, nicio mână
nu mai poate fi scoasă din etui, decât în prezenţa unui membru al fiecărei axe sau a
arbitrului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1021,'7',1017,'D. Verantwortung für die Ordnung am Tisch','D. Verantwortung für die Ordnung am Tisch','D. Responsabilitatea pentru Corectitudinea Procedurilor',1,'Verantwortung für die Ordnung am Tisch
Jeder Teilnehmer, der während eines Durchganges an einem Tisch bleibt, ist in erster Linie
für korrekte Spielbedingungen verantwortlich.','Responsabilitatea pentru Corectitudinea Procedurilor

Jucătorii care rămân la aceeași masă pe întreg parcursul unei sesiuni sunt principalii
responsabili pentru menținerea condiţiilor adecvate de joc la acea masă.','apply_rule','[]');

-- Law 8
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1022,'8',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1023,'8',1022,'A. Bewegung der Boards und Spieler','A. Bewegung der Boards und Spieler','A. Deplasarea Etuiurilor şi a Jucătorilor',1,'Bewegung der Boards und Spieler
1. Der Turnierleiter gibt den Spielern Anweisungen zum rechten Weitergeben der Boards und
Weitergehen der Teilnehmer an den nächsten Tisch.

2. Wenn der Turnierleiter nichts anderes anordnet, ist der Nordspieler an jedem Tisch dafür
verantwortlich, dass die an seinem Tisch soeben gespielten Boards für die nächste Runde an
den richtigen Tisch weiter gegeben werden.','Deplasarea Etuiurilor şi a Jucătorilor

1. Arbitrul dă jucătorilor instrucţiuni privind deplasarea corectă a etuiurilor şi a

concurenților.

2. Dacă arbitrul nu decide altfel, Nordul de la fiecare masă este responsabil pentru
deplasarea etuiurilor jucate la masa sa către masa la care acestea vor fi jucate în
turul următor.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1024,'8',1022,'B. Ende der Runde','B. Ende der Runde','B. Terminarea Rundei',1,'Ende der Runde
1. Im allgemeinen endet eine Runde, wenn der Turnierleiter das Signal für den Start der
nächsten Runde gibt. Wenn aber ein Tisch das Spiel noch nicht beendet hat, dauert für diesen
Tisch die Runde an, bis die Spieler den Tisch verlassen haben.

2. Wenn der Turnierleiter von seinem Recht Gebrauch macht, ein Board später spielen zu
lassen, endet hinsichtlich dieses Boards die Runde für die betroffenen Spieler erst, wenn es
gespielt ist sowie Einigkeit über das Ergebnis erzielt und dieses eingetragen worden ist, oder
wenn der Turnierleiter das Board gestrichen hat.','Terminarea Rundei

1. În general, o rundă se termină atunci când arbitrul dă semnalul de începere a
rundei următoare; dacă însă la o masă nu s-a încheiat jocul până în acel moment,
runda continuă la masa respectivă până când are loc deplasarea jucătorilor.

2. Când arbitrul îşi exercită autoritatea de a amâna jucarea unei done, pentru acea
donă runda se termină pentru jucătorii implicaţi abia când dona va fi fost jucată şi
scorul consimțit şi înregistrat, sau când arbitrul anulează jucarea donei.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1025,'8',1022,'C. Ende der letzten Runde und des Durchgangs','C. Ende der letzten Runde und des Durchgangs','C. Terminarea Ultimei Runde și Terminarea Sesiunii',1,'Ende der letzten Runde und des Durchgangs
Die letzte Runde eines Durchgangs und der Durchgang selbst enden für jeden Tisch, wenn
alle für diesen Tisch vorgesehenen Boards gespielt und alle Ergebnisse ohne Widerspruch
eingetragen sind.','Terminarea Ultimei Runde și Terminarea Sesiunii

Ultima rundă a unei sesiuni și sesiunea propriu-zisă se termină pentru fiecare masă
atunci când toate donele prevăzute a se juca la acea masă au fost jucate şi toate
scorurile au fost introduse fără obiecţii.','apply_rule','[]');

-- Law 9
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1026,'9',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1027,'9',1026,'A. auf eine Regelwidrigkeit aufmerksam machen','A. auf eine Regelwidrigkeit aufmerksam machen','A. Atragerea Atenției asupra unei Neregularități',1,'auf eine Regelwidrigkeit aufmerksam machen
1. Wenn die Regeln es nicht verbieten, kann jeder Spieler während der Lizitphase auf eine
Regelwidrigkeit aufmerksam machen, auch wenn er nicht an der Reihe ist anzusagen.

2. Wenn die Regeln es nicht verbieten, kann der Alleinspieler oder jeder Gegenspieler auf
eine Regelwidrigkeit während der Spielphase aufmerksam machen. Für eine falsch gedrehte
Karte siehe Regel 65B3.

3. Jeder Spieler, auch der Strohmann, darf versuchen, eine Regelwidrigkeit zu verhindern (der
Strohmann unterliegt aber den Beschränkungen der Regeln 42 und 43).

4. Vor dem Ende des Spiels darf der Strohmann überhaupt nicht auf eine Regelwidrigkeit
aufmerksam machen (siehe aber Regel 20F5 bezüglich einer vermeintlich falschen Auskunft
des Alleinspielers).
5. Man ist nicht verpflichtet, auf einen Regelverstoß der eigenen Seite aufmerksam zu machen
(siehe aber Regel 20F5 bei einer vermeintlich falschen Auskunft des Partners).','Atragerea Atenției asupra unei Neregularități
1. Dacă legea nu interzice, orice jucător poate atrage atenţia asupra unei
neregularităţi din timpul licitaţiei, indiferent dacă este sau nu rândul lui de a
declara.

2. Dacă legea nu interzice, declarantul sau oricare dintre apărători poate atrage
atenţia asupra unei neregularităţi petrecute în timpul jocului de levată. Pentru o
carte orientată incorect, vezi Legea 65B3.

3. Orice jucător, inclusiv mortul, poate încerca să prevină o neregularitate (dar în

cazul mortului vezi Legile 42 și 43).

4. Mortul nu poate atrage atenția asupra unei neregularități înainte de terminarea
jocului (dar vezi Legea 20F5 pentru corectarea unei explicații aparent greșite a
declarantului).

5. Nu există nicio obligaţie de a atrage atenţia asupra unei infracţiuni comise de axa
proprie (dar vezi Legea 20F5 pentru corectarea unei explicaţii aparent greşite a
partenerului).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1028,'9',1026,'B. Nachdem auf eine Regelwidrigkeit aufmerksam gemacht worden ist','B. Nachdem auf eine Regelwidrigkeit aufmerksam gemacht worden ist','B. După ce s-a Atras Atenția asupra unei Neregularități',1,'Nachdem auf eine Regelwidrigkeit aufmerksam gemacht worden ist
1. (a) Der Turnierleiter hat sofort gerufen zu werden, wenn auf eine Regelwidrigkeit
aufmerksam gemacht worden ist.

(b) Jeder Spieler, auch der Strohmann, darf den Turnierleiter rufen, nachdem auf eine
Regelwidrigkeit aufmerksam gemacht worden ist.

(c) Kein Spieler verliert durch das Rufen des Turnierleiters irgendwelche Rechte, die er sonst
gehabt hätte.

(d) Die Rechte der Gegner werden nicht dadurch beeinträchtigt, dass ein Spieler auf eine
Regelwidrigkeit seiner Seite aufmerksam gemacht hat.

2. Kein Spieler darf irgend etwas tun, bevor der Turnierleiter alles über die Korrektur erklärt
hat.','După ce s-a Atras Atenția asupra unei Neregularități

1.

a) Arbitrul ar trebui chemat imediat ce este atrasă atenţia asupra unei

neregularităţi.

b) Orice jucător, inclusiv mortul, poate chema arbitrul după ce s-a atras atenţia

asupra unei neregularităţi.

c) Chemarea arbitrului nu anulează niciunul din drepturile unui jucător.

d) Faptul că un jucător atrage atenţia asupra unei neregularităţi comise de axa sa

nu afectează drepturile adversarilor.

2. Niciun jucător nu va acționa înainte ca arbitrul să fi explicat toate aspectele

rectificării.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1029,'9',1026,'C. Vorzeitiges Ausbessern einer Regelwidrigkeit','C. Vorzeitiges Ausbessern einer Regelwidrigkeit','C. Corectarea Prematură a unei Neregularități',1,'Vorzeitiges Ausbessern einer Regelwidrigkeit
Jedes vorzeitige Ausbessern einer Regelwidrigkeit durch einen schuldigen Spieler kann ihn
weiteren Korrekturen unterwerfen (siehe die Ausspielbeschränkungen in Regel 26B).','Corectarea Prematură a unei Neregularități

Orice corectare prematură a unei neregularităţi de către jucătorul vinovat îl poate
supune pe acesta la o rectificare ulterioară (vezi restricţiile de atac din Legea 26B) .','apply_rule','[]');

-- Law 10
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1030,'10',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1031,'10',1030,'A. Recht, eine Korrektur festzulegen','A. Recht, eine Korrektur festzulegen','A. Dreptul de a Decide o Rectificare',1,'Recht, eine Korrektur festzulegen
Allein der Turnierleiter ist berechtigt, gegebenenfalls Korrekturen festzulegen. Spieler haben
nicht das Recht, selbstständig Korrekturen festzulegen (oder zu erlassen – siehe Regel 81C5).','Dreptul de a Decide o Rectificare

Numai arbitrul are dreptul de a decide când se impun rectificări. Jucătorii nu au
dreptul de a impune (sau suprima – vezi Legea 81C5) rectificări din proprie iniţiativă.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1032,'10',1030,'B. Aufhebung von Festlegung oder Erlassung einer Korrektur','B. Aufhebung von Festlegung oder Erlassung einer Korrektur','B. Anularea Impunerii sau Suprimării unei Rectificări',1,'Aufhebung von Festlegung oder Erlassung einer Korrektur
Wenn Spieler ohne Anweisung des Turnierleiters eine Korrektur festgelegt oder erlassen
haben, kann der Turnierleiter das bestätigen oder aufheben.','Anularea Impunerii sau Suprimării unei Rectificări
Arbitrul poate permite sau anula orice impunere sau suprimare a unei rectificări
făcută de jucători fără avizul său.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1033,'10',1030,'C. Wahlmöglichkeit nach einer Regelwidrigkeit','C. Wahlmöglichkeit nach einer Regelwidrigkeit','C. Opțiuni după Comiterea unei Neregularități',1,'Wahlmöglichkeit nach einer Regelwidrigkeit
1. Wenn diese Regeln nach einer Regelwidrigkeit eine Wahlmöglichkeit bieten, muss der
Turnierleiter alle Möglichkeiten erklären.

2. Wenn ein Spieler nach einer Regelwidrigkeit eine Wahlmöglichkeit hat, muss er sich
unbedingt ohne Beratung mit seinem Partner entscheiden.

3. Wenn diese Regeln der nicht-schuldigen Seite nach einer Regelwidrigkeit eines Gegners
eine Wahlmöglichkeit lassen, ist es völlig korrekt, die vorteilhafteste Aktion zu wählen.

4. Vorbehaltlich Regel 16C2 handelt die schuldige Seite völlig korrekt, wenn sie nach der
Korrektur eines Regelverstoßes jede Ansage und jedes Spiel zu ihrem Vorteil wählt, auch
wenn sie dadurch von ihrem Regelverstoß zu profitieren scheint (siehe aber die Regeln 27 und
72C).','Opțiuni după Comiterea unei Neregularități

1. Când aceste Legi oferă o alegere după comiterea unei neregularităţi, arbitrul va

explica toate opțiunile disponibile.

2. Dacă un jucător are de făcut o alegere după comiterea unei neregularităţi, el

trebuie să aleagă fără să-şi consulte partenerul.

3. Când aceste Legi oferă axei nevinovate opţiuni după o neregularitate comisă de
un adversar, este adecvat ca axa nevinovată să aleagă varianta cea mai
avantajoasă.

4. Exceptând situaţiile prevăzute de Legea 16C2, după

rectificarea unei
neregularităţi, este adecvat ca jucătorii axei vinovate să declare şi să joace într-o
manieră avantajoasă pentru axa lor, chiar dacă astfel par să profite de propria lor
infracţiune (dar vezi Legile 27 şi 72C).','apply_rule','[]');

-- Law 11
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1034,'11',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1035,'11',1034,'A. Aktion der nicht-schuldigen Seite','A. Aktion der nicht-schuldigen Seite','A. Acțiuni ale Axei Nevinovate',1,'Aktion der nicht-schuldigen Seite
Der Anspruch auf Korrektur einer Regelwidrigkeit kann verloren gehen, wenn ein Spieler der
nicht-schuldigen Seite irgendeine Aktion setzt, bevor der Turnierleiter gerufen worden ist.
Wenn eine Seite aus einer nachfolgenden Aktion eines Gegners, der die entsprechenden
Regeln nicht kennt, einen Vorteil gezogen hat, berichtigt der Turnierleiter nur das Score
dieser Seite, indem er den dadurch erzielten Vorteil wieder wegnimmt. Der anderen Seite
bleibt das Tischergebnis.','Acțiuni ale Axei Nevinovate

Dreptul la rectificarea unei neregularităţi poate fi pierdut dacă oricare membru al axei
nevinovate acţionează în vreun fel înainte de a chema arbitrul. Dacă o axă a avut de
câștigat de pe urma acţiunii subsecvente a unui adversar, efectuată în necunoştinţă
de cauză faţă de prevederile legii, arbitrul ajustează scorul numai pentru acea axă,
înlăturând orice avantaj astfel dobândit. Pentru cealaltă axă se păstrează rezultatul
obținut la masă.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1036,'11',1034,'B. Strafe nach Verlust des Anspruchs auf Korrektur','B. Strafe nach Verlust des Anspruchs auf Korrektur','B. Penalizare după Pierderea Dreptului la Rectificare',1,'Strafe nach Verlust des Anspruchs auf Korrektur
Auch wenn auf Grund dieser Regel der Anspruch auf Korrektur verloren gegangen ist, kann
der Turnierleiter eine Ordnungsstrafe (siehe Regel 90) verhängen.','Penalizare după Pierderea Dreptului la Rectificare

Chiar după pierderea dreptului la rectificare prin aplicarea acestei legi, arbitrul poate
dicta o penalizare procedurală (vezi Legea 90) .','apply_rule','[]');

-- Law 12
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1037,'12',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1038,'12',1037,'A. Befugnis, ein Berichtigtes Ergebnis zuzuweisen','A. Befugnis, ein Berichtigtes Ergebnis zuzuweisen','A. Puterea de a Acorda un Scor Ajustat',1,'Befugnis, ein Berichtigtes Ergebnis zuzuweisen
Der Turnierleiter kann aufgrund eines, innerhalb des Zeitraums der Regel 92B gestellten,
Antrags eines Spielers oder aus eigenem Antrieb ein Berichtigtes Ergebnis zuweisen, wenn
diese Regeln es ihm gestatten (im Teamturnier siehe Regel 86B). Dazu zählt:

1. Der Turnierleiter kann zugunsten eines nicht-schuldigen Teilnehmers ein Berichtigtes
Ergebnis zuweisen, wenn nach seinem Urteil diese Regeln für einen bestimmten Verstoß
keine Korrektur vorsehen.

2. Der Turnierleiter weist ein „Künstliches Berichtigtes Ergebnis“ (KBE) zu, wenn keine
Korrektur ein normales Spiel des Boards zulässt (siehe unten C2).

3. Der Turnierleiter kann ein Berichtigtes Ergebnis zuweisen, wenn eine falsche Korrektur
einer Regelwidrigkeit erfolgt ist.','Puterea de a Acorda un Scor Ajustat

La solicitarea unui jucător în perioada stabilită prin Legea 92B sau din proprie
iniţiativă, arbitrul poate acorda un scor ajustat când aceste Legi îl împuternicesc să o
facă (în jocul pe echipe vezi Legea 86B). Aceasta include:

1. Arbitrul poate acorda un scor ajustat în favoarea părții nevinovate când consideră
că aceste Legi nu prescriu o rectificare pentru tipul particular de infracţiune
comisă.
2. Arbitrul acordă un scor ajustat artificial dacă nu este posibilă nicio rectificare care

să permită jocul normal al donei (vezi C2 mai jos).

3. Arbitrul poate acorda un scor ajustat dacă a existat o rectificare incorectă a unei

neregularităţi.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1039,'12',1037,'B. Zweck der Berichtigung','B. Zweck der Berichtigung','B. Obiectivele Ajustării Scorului',1,'Zweck der Berichtigung
1. Die Zuweisung eines Berichtigten Ergebnisses hat den Zweck, den Schaden, den eine
nicht-schuldige Seite erlitten hat, auszugleichen und den Vorteil, den eine schuldige Seite
durch ihren Regelverstoß erlangt hat, zu beseitigen. Ein Schaden liegt vor, wenn auf Grund
einer Regelwidrigkeit eine nicht-schuldige Seite ein schlechteres Tischergebnis erzielt hat, als
ohne diese Regelwidrigkeit zu erwarten gewesen wäre.

2. Der Turnierleiter darf keinesfalls ein Berichtigtes Ergebnis zuweisen, nur weil er glaubt,
dass die von diesen Regeln vorgeschriebene Korrektur für eine Seite zu harsch oder zu
vorteilhaft ist.','Obiectivele Ajustării Scorului

1. Obiectivul ajustării scorului este de a repara prejudiciul suferit de partea
nevinovată şi de a anula orice avantaj obţinut de partea vinovată prin propria
infracţiune. Prejudiciu există atunci când, din cauza unei infracţiuni, partea
nevinovată obţine la masă un rezultat mai puţin favorabil decât rezultatul scontat
în cazul în care infracţiunea nu s-ar fi comis.

2. Arbitrul nu poate acorda un scor ajustat pe motiv că rectificarea prevăzută de
aceste Legi este fie prea severă, fie prea avantajoasă pentru una dintre părți.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1040,'12',1037,'C. Zuweisen eines Berichtigten Ergebnisses','C. Zuweisen eines Berichtigten Ergebnisses','C. Acordarea unui Scor Ajustat',1,'Zuweisen eines Berichtigten Ergebnisses
1. (a) Wenn der Turnierleiter nach diesen Regeln ein Berichtigtes Ergebnis zuweisen darf und
ein „Zugewiesenes Berichtigtes Ergebnis“ (ZBE) zuweisen kann, dann tut er es. Dieses
Ergebnis ersetzt das Tischergebnis.

(b) Der Turnierleiter soll so gut wie möglich das wahrscheinliche Ergebnis des Boards, das
ohne den Regelverstoß entstanden wäre, als ZBE zuweisen.
(c) Ein ZBE kann gewichtet werden, um die Wahrscheinlichkeiten verschiedener möglicher
Ergebnisse widerzuspiegeln. Dabei dürfen nur jene Ergebnisse berücksichtigt werden, die
regelkonform hätten erreicht werden können.

(d) Wenn die Möglichkeiten zahlreich oder nicht offensichtlich sind, kann der Turnierleiter
ein KBE zuweisen (siehe unten C2).

(e) Wenn die nicht-schuldige Seite (zeitlich) nach der Regelwidrigkeit zu ihrem Schaden
beigetragen hat:

- durch einen äußerst schwerwiegenden Fehler, der mit der Regelwidrigkeit in keinem
Zusammenhang steht, oder

- durch eine riskante Aktion, wobei sie hoffen konnte, durch die Korrektur zu einem guten
Ergebnis zu kommen, wenn diese Aktion erfolglos bleibt;

dann gilt:

(i) Die schuldige Seite erhält das Ergebnis, das sie durch die Korrektur ihres Regelverstoßes
erhalten hätte.

(ii) Die nicht-schuldige Seite wird für den selbst zugefügten Teil des Schadens nicht
entschädigt.

2. (a) Wenn auf Grund einer Regelwidrigkeit kein Ergebnis erzielt werden kann [siehe auch
C1(d)], weist der Turnierleiter entsprechend der Verantwortung für die Regelwidrigkeit ein
KBE zu:

unter-Schnitt (höchstens 40% der erzielbaren Matchpunkte im Paarturnier) für einen
schuldigen Teilnehmer, Schnitt (50% im Paarturnier) für einen teilschuldigen Teilnehmer,
über-Schnitt (wenigstens 60% im Paarturnier) für einen gänzlich unschuldigen Teilnehmer.

(b) Wenn der Turnierleiter bei Abrechnung in IMP ein KBE zuweist, wird unter-Schnitt mit -
3 IMP und über-Schnitt mit +3 IMP gewertet. Mit Zustimmung des Zuständigen Verbandes
kann der Turnierveranstalter dies im Einklang mit den Regeln 78D, 86B3 und 12C2(d)
ändern.

(c) Die Zuteilung nach Absatz (a) wird für einen nicht-schuldigen Teilnehmer, der im
Durchgang mehr als 60% der verfügbaren Matchpunkte erreicht hat, sowie für einen
schuldigen Teilnehmer, der im Durchgang weniger als 40% der verfügbaren Matchpunkte
erreicht hat, dahin gehend geändert, dass ein solcher Teilnehmer das Ergebnis zugewiesen
bekommt, das er auf den anderen Boards dieses Durchgangs erzielt hat. Dies gilt analog für
die Zuteilung von IMPs.

(d) Der Zuständige Verband kann eine Regelung für den Fall treffen, dass ein Teilnehmer auf
mehreren Boards eines Durchgangs kein Ergebnis erzielt hat. Die Scores auf jedem
nachfolgenden Board können in verbandseigenen Bestimmungen abweichend von Absatz (a)
und (b) festgelegt werden.
3. In Individualturnieren wendet der Turnierleiter die Korrekturen, die diese Regeln
vorschreiben, sowie die Bestimmungen über Berichtigte Ergebnisse auf beide Spieler der
schuldigen Seite an, auch wenn vielleicht nur einer der beiden an der Regelwidrigkeit Schuld
trägt. Über den Partner des schuldigen Spielers darf der Turnierleiter aber keine
Ordnungsstrafe verhängen, wenn ihn nach seiner Meinung keine Schuld trifft.

4. Wenn der Turnierleiter in einem KO-Kampf auf einem Board Berichtigte Ergebnisse
zuweist, deren Summe nicht null ist, dann wird das Score jedes Teilnehmers auf diesem
Board getrennt berechnet, und beiden das arithmetische Mittel zugewiesen.','Acordarea unui Scor Ajustat

1.

a) Când, după producerea unei neregularităţi, arbitrul este împuternicit de aceste
legi să ajusteze un scor şi poate acorda un scor ajustat înlocuitor, el va
proceda astfel. Un astfel de scor înlocuieşte scorul obţinut în timpul jocului.

b) În acordarea unui scor ajustat înlocuitor, arbitrul ar trebui să urmărească să
recupereze pe cât posibil rezultatul probabil al donei în cazul în care
infracţiunea nu s-ar fi comis.

c) Un scor ajustat înlocuitor poate fi ponderat, reflectând probabilitățile unui
număr de rezultate posibile, dar incluzând numai rezultate care ar fi putut fi
obținute în mod legal.

d) Dacă posibilităţile sunt numeroase sau neevidente, arbitrul poate acorda un

scor ajustat artificial (vezi C2 mai jos).

e) Dacă, ulterior comiterii unei neregularităţi, partea nevinovată a contribuit la
propriul prejudiciu printr-o eroare extrem de
importantă (nelegată de
infracţiune) sau printr-o acţiune foarte riscantă, despre al cărei posibil rezultat
nefavorabil ar fi putut să spere că va fi rectificat de către arbitru, atunci:

i. Părţii vinovate i se acordă scorul ajustat corespunzător rectificării

infracţiunii sale.

ii. Părții nevinovate nu i se compensează această parte a prejudiciului,

care este autodeterminată.

2.

a) Când, din cauza unei neregularități, nu se poate obține un rezultat [vezi și
C1d)], arbitrul acordă un scor ajustat artificial în funcţie de responsabilitatea
pentru comiterea neregularităţii: medie minus (maxim 40% din numărul de
puncte de meci disponibile într-un concurs de perechi) unui concurent direct
vinovat, medie (50% la perechi) unui concurent doar parțial vinovat, și medie
plus (minim 60% la perechi) unui concurent complet nevinovat.

b) Când arbitrul alege să acorde un scor ajustat artificial de medie plus sau
medie minus în concursuri de tip IMP, acest scor este de +3 IMP-uri, respectiv
-3 IMP-uri. Cu aprobarea Autorității Regulatoare, aceste scoruri pot fi
modificate de Organizatorul Turneului, după cum prevăd Legile 78D, 86B3 și
punctul d) de mai jos.

c) Prevederea precedentă este modificată în cazul concurenţilor nevinovaţi care
obţin un scor pe sesiune mai mare de 60% din totalul punctelor de meci (sau
echivalentul în IMP-uri) şi în cazul concurenţilor vinovaţi care obţin un scor pe
sesiune mai mic de 40% din totalul punctelor de meci (sau echivalentul în
IMP-uri). Acestor concurenţi li se acordă procentajul obţinut (sau echivalentul
în IMP-uri) pe celelalte done ale aceleiași sesiuni.

d) Autoritatea Regulatoare poate specifica tratamentul situațiilor în care un
concurent nu reușește să obțină un rezultat pe mai multe done din aceeași
sesiune. Scorurile acordate pe fiecare donă următoare pot diferi, conform unei
asemenea reglementări, de cele prescrise la punctele a) și b) de mai sus.

3. În concursurile individuale, arbitrul aplică rectificările din aceste Legi şi prevederile
privind acordarea de scoruri ajustate în mod egal pentru ambii membri ai axei
vinovate, chiar dacă numai unul dintre ei e responsabil de neregularitatea
produsă. Dar arbitrul nu va acorda o penalizare procedurală
împotriva
jucătorului vinovat, dacă estimează că acesta este complet
partenerului
nevinovat.

4. Când arbitrul acordă scoruri ajustate necompensate în meciuri de tip knockout,
scorul fiecărui concurent pe acea donă este calculat separat şi ambii concurenți
primesc media celor două scoruri.','apply_rule','[]');

-- Law 13
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1041,'13',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1042,'13',1041,'A. vor der ersten Ansage','A. vor der ersten Ansage','A. Înaintea Oricărei Declarații',1,'vor der ersten Ansage
Wenn kein Spieler mit einer falschen Kartenanzahl angesagt hat, dann gilt:

1. Der Turnierleiter muss die Austeilung richtig stellen und, wenn dann kein Spieler eine
Karte eines anderen gesehen hat, anordnen, dass das Board normal gespielt werde.

2. Wenn der Turnierleiter feststellt, dass sich in einem oder mehreren Fächern des Boards eine
falsche Kartenanzahl befunden hat und ein Spieler eine oder mehrere Karten eines anderen
gesehen hat, dann lässt er das Board spielen und abrechnen. Wenn er dann meint, dass die
spielfremde Information das Ergebnis beeinflusst hat, soll er ein Berichtigtes Ergebnis
zuweisen [siehe Regel 12C1(b)]; er kann einen schuldigen Spieler bestrafen.','Înaintea Oricărei Declarații

Dacă niciun jucător cu un număr incorect de cărți nu a făcut vreo declarație, atunci:

1. Arbitrul va corecta discrepanţa şi, dacă niciun jucător nu a văzut vreo altă carte a

altui jucător, va cere ca dona să fie jucată normal.

2. Când arbitrul determină că unul sau mai multe buzunare ale etuiului au conţinut
un număr incorect de cărţi şi un jucător a văzut una sau mai multe cărţi
aparţinând mâinii altui jucător, arbitrul permite jucarea donei. Dacă apoi consideră
că informația ilicită a afectat rezultatul, arbitrul ajustează scorul [vezi Legea
12C1b)] și poate penaliza un concurent vinovat.

2 Această Lege se aplică în cazul în care există una sau mai multe mâini care conțin peste 13 cărți. Vezi Legea 14 pentru
cazuri care implică un pachet de cărți incomplet.','apply_rule','["12C1(b)"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1043,'13',1041,'B. Während Lizitation oder Spiel bemerkt','B. Während Lizitation oder Spiel bemerkt','B. Descoperit în Timpul Licitației sau Jocului',1,'Während Lizitation oder Spiel bemerkt
Wenn der Turnierleiter feststellt, dass das Blatt eines Spielers ursprünglich mehr als 13
Karten umfasst hat, und das eines anderen entsprechend weniger, und ein Spieler mit einer
falschen Kartenanzahl angesagt hat, dann gilt:

1. Wenn die Partie nach dem Urteil des Turnierleiters richtig gestellt und gespielt werden
kann, dann kann die Partie ohne Ansageänderung so gespielt werden. Am Ende des Spiels
kann der Turnierleiter ein Berichtigtes Ergebnis zuweisen.

2. Andernfalls soll der Turnierleiter ein Berichtigtes Ergebnis zuweisen [siehe Regel
12C1(b)]; er kann einen schuldigen Spieler bestrafen.','Descoperit în Timpul Licitației sau Jocului

Când arbitrul determină că un jucător a deținut inițial mai mult de 13 cărți și un alt
jucător a deținut mai puține, și că un jucător cu o mână incorectă a făcut o declarație:

1. Dacă arbitrul consideră că dona poate fi corectată şi jucată, dona poate fi jucată
fără vreo schimbare de declaraţie. La sfârşitul jocului, arbitrul poate acorda un
scor ajustat.

2. Altfel, când s-a făcut o declaraţie cu un număr incorect de cărți, arbitrul acordă un

scor ajustat [vezi Legea 12C1b)] şi poate penaliza un concurent vinovat.','apply_rule','["12C1(b)"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1044,'13',1041,'C. Überzählige Karte','C. Überzählige Karte','C. Carte în Plus',1,'Überzählige Karte
Jede überzählige Karte, die nicht zur Austeilung gehört, wird entfernt, sobald sie gefunden
worden ist. Lizitation und Spiel werden ohne weitere Korrektur fortgesetzt. Ein Berichtigtes
Ergebnis darf nur dann zugewiesen werden, wenn eine solche Karte zu einem vergangenen
Stich gespielt worden ist.','Carte în Plus

Orice carte în plus care nu aparţine donei este scoasă din joc. Licitaţia şi jocul
continuă fără nicio rectificare. Nu se poate acorda un scor ajustat decât dacă se
descoperă că o astfel de carte a fost jucată la o levată deja încheiată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1045,'13',1041,'D. nach Spielende','D. nach Spielende','D. Joc Terminat',1,'nach Spielende
Wird nach Spielende festgestellt, dass das Blatt eines Spielers ursprünglich mehr als 13
Karten umfasst hat, und das eines anderen entsprechend weniger, muss das Ergebnis

13.1 Diese Regel gilt für den Fall, dass sich in einem oder mehreren Blätter mehr als 13 Karten befinden.
Siehe Regel 14 bei einem Kartenpaket mit zu wenigen Karten.
gestrichen und ein berichtigtes Ergebnis zugewiesen werden (Regel 86B kann anzuwenden
sein). Über einen schuldigen Teilnehmer kann eine Ordnungsstrafe verhängt werden.','Joc Terminat

Când se constată după sfârşitul jocului că mâna unui jucător conţinea inițial mai mult
de 13 cărţi, iar mâna altui jucător mai puţine, rezultatul trebuie anulat şi se acordă un
scor ajustat (se poate aplica Legea 86B). Un concurent vinovat este pasibil de
penalizare procedurală.','apply_rule','["14", "86B"]');

-- Law 14
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1046,'14',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1047,'14',1046,'A. Mangel vor der Spielphase bemerkt','A. Mangel vor der Spielphase bemerkt','A. Mână Incompletă Descoperită Înaintea Începerii Jocului',1,'Mangel vor der Spielphase bemerkt
Wenn sich vor dem Aufdecken des ersten Ausspiels herausstellt, dass eines oder mehrere
Blätter aus weniger als dreizehn Karten besteht, und kein Blatt mehr als dreizehn aufweist,
sucht der Turnierleiter die fehlende Karte, und:

1. wenn sie gefunden wird, wird sie dem mangelhaften Blatt hinzugefügt.

2. wenn sie nicht gefunden werden kann, rekonstruiert der Turnierleiter die Austeilung aus
einem anderen Kartenpaket.

3. Lizit und Spiel gehen normal weiter, ohne Änderung bereits gemachter Ansagen; es wird
angenommen, dass das rekonstruierte Blatt von Anfang an aus allen Karten bestanden hat.','Mână Incompletă Descoperită Înaintea Începerii Jocului

Când se descoperă înainte de un atac inițial pe față că una sau mai multe mâini
conțin mai puţin de 13 cărţi, fără ca vreo mână să aibă mai mult de 13, arbitrul caută
orice carte lipsă şi:

1. Când cartea este găsită, este reîncadrată în mâna incompletă.

2. Când cartea nu poate fi găsită, arbitrul reconstruieşte dona utilizând alt pachet de

cărţi.

3. Licitaţia şi jocul continuă normal, fără a schimba vreuna din declaraţiile făcute,

considerându-se că mâna reîntregită a avut de la început toate cărţile.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1048,'14',1046,'B. Mangel erst später bemerkt','B. Mangel erst später bemerkt','B. Mână Incompletă Descoperită Ulterior',1,'Mangel erst später bemerkt
Wenn sich ab dem Aufdecken des ersten Ausspiels (bis zum Ablauf der Korrekturphase)
herausstellt, dass eines oder mehrere Blätter aus weniger als dreizehn Karten besteht, und kein
Blatt mehr als dreizehn aufweist, sucht der Turnierleiter die fehlende Karte, und:

1. wenn die Karte unter den gespielten gefunden wird, ist Regel 67 anzuwenden.

2. wenn die Karte anderswo gefunden wird, wird sie dem mangelhaften Blatt beigefügt.
Korrekturen und/oder Strafen können zu verhängen sein (siehe unten B4).

3. wenn die Karte nicht gefunden werden kann, wird die Austeilung aus einem anderen
Kartenpaket rekonstruiert. Korrekturen und/oder Strafen können zu verhängen sein (siehe
unten B4.).

4. Es wird angenommen, dass sich eine Karte, die nach Regel 14B einem Blatt hinzugefügt
worden ist, immer in diesem Blatt befunden hat. Sie kann eine Strafkarte werden, und ihr
Nichtspielen kann eine Revoke sein.','Mână Incompletă Descoperită Ulterior

Când se descoperă oricând după un atac inițial pe față (și până la sfârșitul Perioadei
de Corecție) că una sau mai multe mâini conțin mai puţin de 13 cărţi, fără ca vreo
mână să aibă mai mult de 13, arbitrul caută orice carte lipsă şi:

1. Când cartea este găsită printre cărţile jucate, se aplică Legea 67.

2. Când cartea este găsită în altă parte, este reîncadrată în mâna incompletă. Pot fi

necesare rectificări şi/sau penalizări (vezi B4 mai jos).
3. Când cartea nu poate fi găsită, arbitrul reconstruieşte dona utilizând alt pachet de

cărţi. Pot fi necesare rectificări şi/sau penalizări (vezi B4 mai jos).

4. Se consideră că o carte reîncadrată într-o mână în condiţiile Paragrafului B al
acestei Legi a aparținut de la început mâinii incomplete. Ea poate deveni carte
penalizată şi omisiunea de a o fi jucat poate constitui o renonsă.','apply_rule','["67", "14B"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1049,'14',1046,'C. Information vom Hinzufügen einer Karte','C. Information vom Hinzufügen einer Karte','C. Informația despre Reîncadrarea Cărții Lipsă',1,'Information vom Hinzufügen einer Karte
Das Hinzufügen einer Karte ist für den Partner des Spielers, dessen Blatt eine falsche
Kartenanzahl hatte, eine unerlaubte Information.','Informația despre Reîncadrarea Cărții Lipsă

Informaţia despre reîncadrarea unei cărţi în mâna incompletă este neautorizată
pentru partenerul jucătorului a cărui mână a conţinut un număr incorect de cărţi.','apply_rule','[]');

-- Law 15
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1050,'15',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1051,'15',1050,'A. Karten aus einem falschen Board','A. Karten aus einem falschen Board','A. Cărți dintr-un Etui Greșit',1,'Karten aus einem falschen Board
1. Eine Ansage eines Spielers, der Karten aus einem falschen Board hält, wird (zusammen mit
allen nachfolgenden) gestrichen.

2. (a) Wenn der Partner des Schuldigen nach einer solchen Ansage angesagt hat, muss der
Turnierleiter ein Berichtigtes Ergebnis zuweisen.
(b) Andernfalls sieht der schuldige Spieler sein richtiges Blatt an und sagt danach nochmals
an. Das Lizit geht von da an normal weiter.

(c) Regel 16 ist auf alle zurückgenommenen oder gestrichenen Ansagen anzuwenden.

3. Wenn der schuldige Spieler auf dem Board, aus dem er seine Karten irrtümlich genommen
hat, seine Ansage wiederholt, kann der Turnierleiter das Board normal spielen lassen; er soll
aber ein berichtigtes Score zuweisen, wenn die Ansage des schuldigen Spielers von der
ursprünglichen, gestrichenen Ansage abweicht15.1.

4. Eine Ordnungsstrafe (Regel 90) kann zusätzlich zu diesen Korrekturen verhängt werden.','Cărți dintr-un Etui Greșit

1. O declarație este anulată (împreună cu orice declarație subsecventă) dacă este

făcută de un jucător cu cărți extrase dintr-un etui greșit.

2.

a) Dacă partenerul jucătorului vinovat a făcut o declarație sebsecventă, arbitrul

va acorda un scor ajustat.

b) Altfel, jucătorul examinează mâna corectă și declară din nou, licitația

continuând normal din acest moment.

c) Se aplică Legea 16C oricărei declarații retrase sau anulate.

3. Dacă ulterior jucătorul vinovat își repetă declarația pe dona din care și extras
accidental cărțile, arbitrul poate permite ca dona să se joace normal, dar va
acorda un scor ajustat dacă declarația jucătorului vinovat diferă3 de declarația
anulată.

4. Se poate dicta o penalizare procedurală (Legea 90) în plus față de rectificările de

mai sus.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1052,'15',1050,'B. Falsches Board (nach Beginn der Lizitationsphase)15.2','B. Falsches Board (nach Beginn der Lizitationsphase)15.2','B. Donă Greșită Descoperită în Timpul Licitației sau Jocului4',1,'Falsches Board (nach Beginn der Lizitationsphase)15.2
Wenn der Turnierleiter nach Beginn der Lizitationsphase bemerkt, dass ein Teilnehmer ein
Board spielt, das er in dieser Runde nicht spielen sollte, dann gilt:

1. wenn einer oder mehrere Spieler an diesem Tisch das Board schon gespielt haben – egal,
ob gegen die richtigen Gegner oder nicht –, wird das Board für beide Seiten gestrichen.

2. wenn keiner der vier Spieler das Board schon gespielt hat, soll der Turnierleiter die Partie
fertig spielen lassen; das Ergebnis gilt. Er kann beide Paare anhalten, später auch das richtige
Board gegen einander zu spielen.

3. Der Turnierleiter soll jedem Teilnehmer, dem die Möglichkeit genommen worden ist, ein
gültiges Ergebnis auf diesem Board zu erzielen, ein KBE [siehe Regel 12C2(a)] zuweisen.','Donă Greșită Descoperită în Timpul Licitației sau Jocului4

Dacă, după începerea perioadei de licitație, arbitrul descoperă că un concurent joacă
o altă donă decât cea destinată lui pentru turul respectiv, atunci:

1. Dacă unul sau mai mulți jucători de la masă au jucat deja dona, cu adversarii

corecți sau nu, dona este anulată pentru ambele părți.

2. Dacă niciunul din cei 4 jucători nu a jucat deja dona, arbitrul va cere completarea
licitației și jocului. Scorul rămâne valabil și arbitrul poate cere celor două perechi
să joace dona corectă dintre ele mai târziu.

3 O declarație înlocuitoare diferă dacă semnificația sa este mult diferită sau dacă este o declarație psihică.
4 Această lege se aplică numai concursurilor de perechi și individuale – vezi Legea 86B pentru concursuri de echipe.
3. Arbitrul va acorda un scor ajustat artificial [vezi Legea 12C2a)] oricărui concurent

privat de posibilitatea de a obține un scor valid.','apply_rule','[]');

-- Law 16
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1053,'16',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1054,'16',1053,'A. Verwendung von Informationen durch die Spieler','A. Verwendung von Informationen durch die Spieler','A. Utilizarea Informațiilor de către Jucători',1,'Verwendung von Informationen durch die Spieler
1. Ein Spieler darf in Lizitation und Spiel eine Information verwenden, wenn sie:

(a) von den regelkonformen Ansagen und Spielen des aktuellen Boards stammt
(einschließlich regelwidriger Ansagen und Spiele, die angenommen worden sind) und nicht
von Unerlaubter Information aus einer anderen Quelle beeinflusst ist; oder

(b) wenn sie Erlaubte Information aus einer zurückgenommenen Aktion ist (siehe unten C.);
oder

(c) in irgendeiner Regel oder verbandseigenen Bestimmung als erlaubt bezeichnet ist oder aus
den regelkonformen Abläufen stammt, wie sie in diesen Regeln und in verbandseigenen
Bestimmungen festgelegt sind und diese nichts anderes festlegen; oder

(d) der Spieler besessen hat, bevor er seine Karten aus dem Board genommen hat (Regel 7B),
wenn die Regeln ihre Verwendung nicht ausschließen.

15.1 Eine Ansage mit deutlich anderer Bedeutung sowie ein Bluff weichen von der ursprünglichen
Ansage ab.
15.2 Diese Regel gilt nur in Paar- und Individualturnieren; im Teamturnier siehe Regel 86B.
2. Spieler dürfen auch ihre Einschätzung ihres eigenen Scores, der Eigenheiten ihrer Gegner,
sowie die Durchführungsbestimmungen (verbandseigene Bestimmungen und Ausschreibung)
für dieses Turnier berücksichtigen.','Utilizarea Informațiilor de către Jucători

1. Un jucător poate utiliza informaţii în licitaţie sau joc, dacă:

a) Ele derivă din declaraţii sau jocuri legale din dona respectivă (inclusiv
declaraţii sau jocuri ilegale dar acceptate) şi nu sunt afectate de informaţii
neautorizate dintr-o altă sursă; sau

b) Sunt informaţii autorizate provenind din acţiuni retrase (vezi C); sau

c) Sunt informaţii specificate în orice lege sau regulament ca fiind autorizate sau,
când nu este specificat altfel, derivă din proceduri legale autorizate în aceste
legi sau în regulamente (dar vezi B1 mai jos); sau

d) Sunt informaţii pe care jucătorul le poseda înainte de a-şi scoate cărţile din

etui (Legea 7B) şi a căror utilizare nu este interzisă de Legi.

2. Jucătorii pot de asemenea să țină cont de propriile estimări asupra scorului lor, de

caracteristicile adversarilor şi de orice cerinţă din regulamentului turneului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1055,'16',1053,'B. Spielfremde Information vom Partner','B. Spielfremde Information vom Partner','B. Informație Ilicită de la Partener',1,'Spielfremde Information vom Partner
1. Jede spielfremde Information vom Partner, die eine Ansage oder ein Spiel nahelegt, ist
Unerlaubt. Dazu zählen Bemerkungen, Fragen, Antworten auf Fragen, unerwartete Alerts
oder Nichtalerts, klares Zögern, ungewöhnliche Hast, besondere Betonung, Tonfall, Mimik,
Gestik, Bewegung oder auffälliges Verhalten.

(a) Ein Spieler darf überhaupt keine Ansage und kein Spiel wählen, das durch die Unerlaubte
Information aufweisbar gegenüber einer anderen Ansage oder einem anderen Spiel nahegelegt
wird, sofern diese eine logische Alternative zur gewählten Aktion sind.

(b) Eine logische Alternative ist eine Aktion, die ein signifikanter Anteil der Spieler dieser
Klasse bei Verwendung der Methoden der Partnerschaft ernsthaft in Erwägung ziehen würde,
wobei einige sich dafür entscheiden könnten.

2. Wenn ein Spieler glaubt, dass ein Gegner eine solche Information geliefert hat und daraus
leicht ein Schaden entstehen könnte, kann er sich das Recht vorbehalten, den Turnierleiter
später zu rufen (wenn der Zuständige Verband das nicht verboten hat und stattdessen verlangt,
dass der Turnierleiter gerufen werde); die Gegner haben den Turnierleiter sofort zu rufen,
wenn sie bestreiten, dass eine Unerlaubte Information übermittelt worden hätte sein können.

3. Wenn ein Spieler einen gewichtigen Grund hat anzunehmen, dass ein Gegner anstelle einer
logischen Alternative eine Aktion gewählt hat, die durch eine Unerlaubte Information
nahegelegt worden ist, soll er den Turnierleiter bei Spielende rufen16.1. Der Turnierleiter muss
ein Berichtigtes Ergebnis zuweisen (siehe Regel 12C1), wenn er zur Auffassung gelangt, dass
ein schuldiger Spieler durch einen Regelverstoß einen Vorteil erlangt hat.','Informație Ilicită de la Partener

1. Orice informație ilicită de la partener care poate sugera o declarație sau un joc
este neautorizată. Aceasta include remarci, întrebări, răspunsuri la întrebări,
alerte neașteptate sau lipsa unor alerte, ezitări clare, viteză ieșită din comun,
accentuarea unor acțiuni, intonație, gesturi, mișcări sau manierisme.

a) Un jucător nu poate alege o declarație sau un joc demonstrabil sugerat de
informația neautorizată în raport cu altă declarație sau alt joc care constituie o
alternativă logică.

b) O alternativă logică este o acțiune pe care o proporție semnificativă de jucători
de nivelul jucătorului în cauză, folosind metodele parteneriatului, ar lua-o în
considerare, și unii ar și alege-o.

2. Când un jucător consideră că un adversar a furnizat o astfel de informație şi că ar
putea exista un prejudiciu, el poate anunța, dacă nu este interzis de Autoritatea
Regulatoare (care poate cere ca arbitrul să fie chemat imediat), că-şi rezervă
dreptul de a chema arbitrul mai târziu (adversarii ar trebui să cheme arbitrul
imediat dacă contestă faptul că a fost furnizată o informaţie neautorizată).

3. Când un jucător are motive serioase să creadă că un adversar care avea o
alternativă logică a ales o acţiune sugerată de o astfel de informaţie, ar trebui să
cheme arbitrul la terminarea jocului5. Arbitrul va acorda un scor ajustat (vezi
Legea 12C1) dacă apreciază că o infracțiune a rezultat într-un avantaj pentru
partea vinovată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1056,'16',1053,'C. Information aus zurück genommenen Ansagen und Spielen','C. Information aus zurück genommenen Ansagen und Spielen','C. Informație Provenită din Declarații sau Jocuri Retrase',1,'Information aus zurück genommenen Ansagen und Spielen
Wenn eine Ansage oder ein Spiel im Einklang mit diesen Regeln zurück genommen worden
ist, dann gilt:

1. Für eine nicht-schuldige Seite sind alle Informationen aus einer (eigenen oder
gegnerischen) zurück genommenen Aktion erlaubt.

2. Für eine schuldige Seite sind alle Informationen aus einer (eigenen oder gegnerischen)
zurück genommenen Aktion unerlaubt. Ein Spieler der schuldigen Seite darf keine Ansage
und kein Spiel wählen, das aufweisbar einer anderen Ansage oder einem anderen Spiel
gegenüber durch die Unerlaubte Information nahegelegt wird, sofern diese eine logische
Alternative zur gewählten Aktion sind.

3. Der Turnierleiter soll ein berichtigtes Ergebnis zuweisen (siehe Regel 12C1), wenn er zur
Auffassung kommt, dass ein Verstoß gegen Absatz C2 die nicht-schuldige Seite geschädigt
hat.

16.1 Den Turnierleiter früher oder später zu rufen, ist kein Regelverstoß.','Informație Provenită din Declarații sau Jocuri Retrase

Când s-a retras o declaraţie sau un joc, conform pevederilor acestor legi:

1. Pentru axa nevinovată, orice informaţie provenind dintr-o acţiune retrasă este
autorizată, indiferent dacă este vorba de o acţiune proprie sau a adversarilor.

2. Pentru axa vinovată, informaţia provenind din propria sa acţiune retrasă sau din
acţiuni retrase ale axei nevinovate este neautorizată. Un jucător al axei vinovate
nu poate alege o declarație sau un joc demonstrabil sugerat de informația
neautorizată în raport cu altă declarație sau alt joc care constituie o alternativă
logică.

3. Arbitrul va acorda un scor ajustat (vezi Legea 12C1) dacă apreciază că o

încălcare a punctului C2 a prejudiciat axa nevinovată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1057,'16',1053,'D. Spielfremde Information aus anderen Quellen','D. Spielfremde Information aus anderen Quellen','D. Informație Ilicită din Alte Surse',1,'Spielfremde Information aus anderen Quellen
1. Wenn ein Spieler zufällig spielfremde Information zu einem Board erhält, das er spielt oder
noch spielen wird, indem er zum Beispiel ein falsches Blatt ansieht; von einem anderen Tisch
Ansagen, Ergebnisse oder Bemerkungen hört; Karten auf einem anderen Tisch sieht; oder
eine Karte eines anderen Spielers an seinem eigenen Tisch vor Beginn der Lizitation sieht
(siehe auch Regel 13A), soll der Turnierleiter sofort – am besten von dem Spieler, der die
Information bekommen hat - verständigt werden.

2. Wenn der Turnierleiter entscheidet, dass die Information wahrscheinlich ein normales Spiel
beeinflusst, kann er vor der ersten Ansage:

(a) die Positionen der Spieler am Tisch so ändern, dass der Spieler mit Information über ein
Blatt dieses hält, sofern Art und Ausrechnung des Bewerbs das zulassen;

(b) das Board für diese Teilnehmer aufmischen lassen, wenn die Art des Bewerbs das zulässt;

(c) das Board zu Ende spielen lassen. Wenn er danach glaubt, dass das Ergebnis von der
spielfremden Information beeinflusst worden ist, weist er ein Berichtigtes Ergebnis zu.

(d) ein Berichtigtes Ergebnis zuweisen (im Teamturnier siehe Regel 86B).

3. Wenn eine solche spielfremde Information nach der ersten Ansage, aber vor Beendigung
des Boards erhalten worden ist, geht der Turnierleiter nach Regel 16D2(c) oder 16D2(d) vor.','Informație Ilicită din Alte Surse

1. Când un jucător intră accidental în posesia unei informaţii ilicite despre o donă pe
care o joacă sau pe care o va juca, de exemplu privind spre o mână care nu-i
aparţine; auzind declarații, rezultate sau comentarii; văzând cărţile de la o altă
masă; sau văzând o carte aparţinând altui jucător de la propria masă înainte de
începerea licitaţiei (vezi și Legea 13A), arbitrul trebuie înștiințat imediat, preferabil
de către beneficiarul informaţiei.

2. Dacă arbitrul consideră că este probabil ca informaţia să afecteze jocul normal al

donei, el poate, înainte să se fi făcut vreo declaraţie:

a) Să schimbe poziţiile jucătorilor la masă, dacă genul de concurs sau de calcul
al scorului o permit, astfel încât posesorul informaţiei despre o anumită mână
să dețină chiar acea mână;

b) Dacă formatul competiţiei o permite, să dispună redistribuirea donei pentru

concurenţii respectivi;

c) Să permită jucarea donei, fiind pregătit să acorde un scor ajustat dacă

apreciază că informaţia ilicită a afectat rezultatul;

d) Să acorde un scor ajustat (pentru concursuri de echipe vezi Legea 86B).

3. Dacă o astfel de informaţie ilicită parvine după ce a fost făcută prima declaraţie şi
înainte de terminarea jocului, arbitrul procedează ca în 2c) sau 2d) de mai sus.

5 Nu este o infracțiune să chemi arbitrul mai devreme sau mai târziu.','apply_rule','[]');

-- Law 17
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1058,'17',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1059,'17',1058,'A. Beginn','A. Beginn','A. Începerea Perioadei de Licitație',1,'Beginn
Die Lizitationsphase auf einem Board beginnt für eine Seite, wenn einer der Partner seine
Karten aus dem Board nimmt.','Începerea Perioadei de Licitație

Perioada de licitație a unei done incepe pentru o axă când oricare din cei doi
parteneri își scoate cărţile din etui.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1060,'17',1058,'B. erste Ansage','B. erste Ansage','B. Prima Declarație',1,'erste Ansage
Der Spieler, der auf dem Board als Teiler gekennzeichnet ist, macht die erste Ansage.','Prima Declarație

Jucătorul marcat pe etui ca distribuitor face prima declaraţie.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1061,'17',1058,'C. nachfolgende Ansagen','C. nachfolgende Ansagen','C. Succesiunea Declarațiilor',1,'nachfolgende Ansagen
Der Spieler links vom Teiler macht die zweite Ansage, und danach sagt jeder Spieler der
Reihe nach im Uhrzeigersinn an.','Succesiunea Declarațiilor

Jucătorul din stânga distribuitorului face a doua declaraţie, iar apoi fiecare declară pe
rând, în sensul acelor de ceasornic.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1062,'17',1058,'D. Ende','D. Ende','D. Terminarea Perioadei de Licitație',1,'Ende
1. Die Lizitationsphase endet, wenn nach dem Ende der Lizitation (Regel 22A) einer der
Gegenspieler ein erstes Ausspiel aufdeckt. (Geschieht dies außer der Reihe, siehe Regel 54.)
Der Zeitraum zwischen dem Ende der Lizitation und dem Ende der Lizitationsphase heißt
„Klärungsphase“.

2. Wenn kein Spieler geboten hat (siehe Regel 22B), endet die Lizitationsphase, wenn alle
vier Blätter ins Board zurückgesteckt worden sind.

3. Wenn auf eine Ansage drei Pass gefolgt sind, endet die Lizitation dann nicht, wenn
irgendein Pass außer der Reihe war und dadurch ein Spieler um sein Recht auf eine Ansage
gebracht worden ist. In diesem Fall geht das Lizit an den ausgelassenen Spieler zurück, alle
nachfolgenden Pass werden gestrichen und das Lizit geht normal weiter. Regel 16C ist auf die
gestrichenen Ansagen anzuwenden, wobei jeder Spieler, der außer der Reihe gepasst hat, als
schuldig gilt.','Terminarea Perioadei de Licitație

1. Perioada de licitație se termină când, după terminarea licitației conform Legii 22A,
oricare apărător face un atac inițial pe față. (Dacă atacul este peste rând, vezi
Legea 54.) Intervalul dintre terminarea licitației și terminarea perioadei de licitație
reprezintă Perioada de Clarificare.

2. Dacă niciun jucător nu face un anunț (vezi Legea 22B) perioada de licitație se

termină când toate cele 4 mâini au fost reintroduse în etui.

3. Când o declarație a fost urmată de 3 declarații de pas, licitația nu se termină dacă
oricare dintre acestea a fost peste rând, privând un jucător de dreptul de a
declara. În această situație licitația revine la jucătorul care și-a pierdut rândul,
toate pas-urile ulterioare sunt anulate și licitația continuă normal. Se aplică Legea
16C declarațiilor anulate, orice jucător care a pasat peste rând fiind vinovat.','apply_rule','[]');

-- Law 18
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1063,'18',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1064,'18',1063,'A. Korrekte Form','A. Korrekte Form','A. Forma Corectă',1,'Korrekte Form
Ein Gebot bezeichnet eine Anzahl Stiche über sechs, von eins bis sieben, und eine
Denomination. (Pass, Kontra und Rekontra sind Ansagen, aber keine Gebote.)','Forma Corectă

Un anunţ specifică un număr de levate între 1 şi 7 (levate în plus faţă de 6) şi o
denominaţie. (Pas, contra și recontra sunt declaraţii dar nu anunţuri).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1065,'18',1063,'B. ein Gebot überbieten','B. ein Gebot überbieten','B. Anunț Următor',1,'ein Gebot überbieten
Ein Gebot überbietet ein früheres, wenn es entweder dieselbe Anzahl Stiche über sechs in
einer höheren Denomination bezeichnet, oder eine größere Anzahl Stiche über sechs in
irgendeiner Denomination.','Anunț Următor

Un anunț succede regulamentar un anunț precedent dacă desemnează fie acelaşi
număr de levate într-o denominaţie de rang superior, fie un număr mai mare de
levate în orice denominaţie.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1066,'18',1063,'C. genügendes Gebot','C. genügendes Gebot','C. Anunț Suficient',1,'genügendes Gebot
Ein Gebot ist genügend, wenn es das letztvorangegangene überbietet.','Anunț Suficient

Un anunţ care succede regulamentar ultimul anunţ precedent se numeşte suficient.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1067,'18',1063,'D. ungenügendes Gebot','D. ungenügendes Gebot','D. Anunț Insuficient',1,'ungenügendes Gebot
Ein Gebot, das das letztvorangegangene nicht überbietet, ist ungenügend. Es ist ein
Regelverstoß, ein ungenügendes Gebot abzugeben (zur Korrektur siehe Regel 27).','Anunț Insuficient
Un anunț care nu succede regulamentar ultimul anunţ precedent este insuficient.
Este o infracțiune să faci un anunț insuficient (vezi Legea 27 pentru rectificare).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1068,'18',1063,'E. Rangordnung der Denominationen','E. Rangordnung der Denominationen','E. Rangul Denominațiilor',1,'Rangordnung der Denominationen
Der Rang der Denominationen in absteigender Reihenfolge ist: Ohne, Pik, Herz, Karo, Treff.','Rangul Denominațiilor

Rangul denominaţiilor în ordine descrescătoare este: fără atu, pică, cupă, caro, treflă.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1069,'18',1063,'F. andere Methoden','F. andere Methoden','F. Alte Metode',1,'andere Methoden
Ein Zuständiger Verband kann andere Methoden zulassen, Ansagen zu machen.','Alte Metode

Autoritățile Regulatoare pot autoriza alte metode de a efectua declarații.','apply_rule','[]');

-- Law 19
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1070,'19',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1071,'19',1070,'A. Kontra','A. Kontra','A. Contre',1,'Kontra
1. Ein Spieler darf nur das letztvorangegangene Gebot kontrieren. Dieses Gebot muss weiters
von einem Gegner gemacht worden sein, und es darf dazwischen keine anderen Ansagen als
Pass gegeben haben.

2. Beim Kontrieren soll ein Spieler weder die Zahl der Stiche (über sechs) noch die
Denomination nennen. Die einzige korrekte Form ist das einzelne Wort „Kontra“.

3. Wenn ein Spieler beim Kontrieren das Gebot, die Zahl der Stiche (über sechs) oder die
Denomination falsch nennt, wird angenommen, dass er das tatsächlich gemachte Gebot
kontriert hat. (Regel 16 – Unerlaubte Information – kann anzuwenden sein.)','Contre

1. Un jucător nu poate contra decât ultimul anunţ precedent. Acest anunţ trebuie să
fi fost făcut de un adversar și trebuie să nu fi fost urmat de nicio declaraţie diferită
de pas.

2. Când contrează, un jucător nu trebuie să precizeze numărul de levate sau

denominaţia. Singura formă corectă este cuvântul “Contra”.

3. Dacă, atunci când contrează, un jucător precizează incorect anunţul, numărul de
levate sau denominaţia, se consideră că a contrat anunţul aşa cum a fost el făcut.
(Se poate aplica Legea 16 pentru informaţii neautorizate.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1072,'19',1070,'B. Rekontra','B. Rekontra','B. Recontre',1,'Rekontra
1. Ein Spieler darf nur das letztvorangegangene Kontra rekontrieren. Dieses Kontra muss
weiters von einem Gegner gemacht worden sein, und es darf dazwischen keine anderen
Ansagen als Pass gegeben haben.

2. Beim Rekontrieren soll ein Spieler weder die Zahl der Stiche (über sechs) noch die
Denomination nennen. Die einzige korrekte Form ist das einzelne Wort „Rekontra“.
3. Wenn ein Spieler beim Rekontrieren das Gebot, die Zahl der Stiche (über sechs) oder die
Denomination falsch nennt, wird angenommen, dass er das tatsächlich gemachte Gebot
rekontriert hat. (Regel 16 – Unerlaubte Information – kann anzuwenden sein.)','Recontre

1. Un jucător nu poate recontra decât ultima contră precedentă. Aceasta trebuie să fi
fost declarată de un adversar şi trebuie să nu fi fost urmată de nicio declaraţie
diferită de pas.

2. Când recontrează, un jucător nu trebuie să precizeze numărul de levate sau

denominaţia. Singura formă corectă este cuvântul “Recontra”.

3. Dacă, atunci când recontrează, un jucător precizează incorect anunţul, numărul
de levate sau denominaţia, se consideră că a recontrat anunţul aşa cum a fost el
făcut. (Se poate aplica Legea 16 pentru informaţii neautorizate.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1073,'19',1070,'C. Kontra und Rekontra erloschen','C. Kontra und Rekontra erloschen','C. După Contra sau Recontra',1,'Kontra und Rekontra erloschen
Jedes Kontra oder Rekontra erlischt durch ein nachfolgendes regelkonformes Gebot.','După Contra sau Recontra

După contra sau recontra poate urma orice anunţ regulamentar.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1074,'19',1070,'D. Berechnung des Ergebnisses','D. Berechnung des Ergebnisses','D. Calcularea Scorului unui Contract Contrat sau Recontrat',1,'Berechnung des Ergebnisses
Wenn nach einem kontrierten oder rekontrierten Gebot nicht ein regelkonformes Gebot
abgegeben wird, erhöht sich Punktezuteilung für das Ergebnis gemäß Regel 77.','Calcularea Scorului unui Contract Contrat sau Recontrat

Dacă un anunţ contrat sau recontrat nu este urmat de niciun anunţ regulamentar,
valoarea scorului creşte aşa cum prevede Legea 77.','apply_rule','[]');

-- Law 20
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1075,'20',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1076,'20',1075,'A. Ansage (akustisch) nicht gut verstanden','A. Ansage (akustisch) nicht gut verstanden','A. Declarație Neidentificată Clar',1,'Ansage (akustisch) nicht gut verstanden
Ein Spieler kann unverzüglich Aufklärung verlangen, wenn er sich nicht sicher ist, welche
Ansage gemacht worden ist.','Declarație Neidentificată Clar

Un jucător poate cere o clarificare imediată dacă nu este sigur ce declaraţie a fost
făcută.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1077,'20',1075,'B. Wiederholung der Lizitation während der Lizitationsphase','B. Wiederholung der Lizitation während der Lizitationsphase','B. Recapitularea Licitației în Timpul Perioadei de Licitație',1,'Wiederholung der Lizitation während der Lizitationsphase
Während der Lizitationsphase kann sich ein Spieler alle vorangegangenen Ansagen
wiederholen lassen, wenn er an der Reihe ist anzusagen und nicht auf Pass gesetzt ist. Alerts
haben dabei ebenfalls wiederholt zu werden. Ein Spieler darf keinesfalls eine teilweise
Wiederholung verlangen, noch die Wiederholung vorzeitig abbrechen.','Recapitularea Licitației în Timpul Perioadei de Licitație

În timpul perioadei de licitaţie, un jucător are dreptul să ceară repetarea tuturor
declaraţiilor anterioare când este rândul său de a declara, mai puțin dacă este obligat
de lege să paseze. Alertele ar trebui incluse în răspunsul la o asemenea cerere. Un
jucător nu poate cere o repetare parțială a declaraţiilor precedente şi nu poate opri
recapitularea înainte ca aceasta să se fi terminat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1078,'20',1075,'C. Wiederholung der Lizitation nach dem abschließenden Pass','C. Wiederholung der Lizitation nach dem abschließenden Pass','C. Recapitulare după Pas-ul Final',1,'Wiederholung der Lizitation nach dem abschließenden Pass
1. Nach dem abschließenden Pass haben beide Gegenspieler das Recht zu fragen, wer zum
ersten Stich auszuspielen hat. (siehe Regeln 47E und 41)

2. Der Alleinspieler20.1 und jeder der beiden Gegenspieler können sich die gesamte Lizitation
wiederholen lassen, wenn sie das erste Mal an der Reihe sind zu spielen. (siehe Regel 41B
und 41C). Wie oben in B darf ein Spieler weder eine teilweise Wiederholung verlangen noch
die Wiederholung abbrechen.','Recapitulare după Pas-ul Final

1. După pas-ul final, oricare apărător are dreptul să întrebe dacă este rândul lui să

atace (vezi Legile 47E şi 41).

2. Declarantul6 sau oricare apărător, la primul său rând de a juca, poate cere
repetarea tuturor declaraţiior anterioare (vezi Legile 41B şi 41C). Ca la paragraful
B, jucătorul nu poate cere o repetare parţială şi nu poate opri prematur
recapitularea.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1079,'20',1075,'D. Wer die Lizitation wiederholen soll','D. Wer die Lizitation wiederholen soll','D. Cine Poate Recapitula Licitația',1,'Wer die Lizitation wiederholen soll
Die Lizitation darf nur von einem Gegner des Spielers, der es verlangt hat, wiederholt
werden.','Cine Poate Recapitula Licitația

Cererii de recapitulare a licitaţiei i se va răspunde doar de către un adversar.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1080,'20',1075,'E. Fehlerberichtigung','E. Fehlerberichtigung','E. Corectarea Erorilor în Recapitulare',1,'Fehlerberichtigung
Alle Spieler, auch der Strohmann oder ein Spieler, der auf Pass gesetzt ist, sind für eine
prompte Berichtigung aller Fehler in der Wiederholung verantwortlich (siehe Regel 12C1,
wenn eine fehlerhafte Wiederholung zu Schaden führt).

20.1 Der Alleinspieler spielt zum ersten Mal vom Strohmann, wenn er nicht ein Ausspiel außer der
Reihe annimmt.','Corectarea Erorilor în Recapitulare

Toţi jucătorii, inclusiv mortul sau un jucător obligat de lege să paseze, au
responsabilitatea corectării imediate a unei greşeli în recapitulare. (vezi Legea 12C1
când o recapitulare incorectă produce prejudiciu).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1081,'20',1075,'F. Auskünfte über Ansagen','F. Auskünfte über Ansagen','F. Explicarea Declarațiilor',1,'Auskünfte über Ansagen
1. Während der Lizitation und vor dem abschließenden Pass kann jeder Spieler eine Erklärung
der gegnerischen Lizitation verlangen20.2, wenn er an der Reihe ist. Er hat ein Recht auf
Information über die Bedeutung

- der tatsächlichen Ansagen;

- relevanter alternativer Ansagen, die nicht gewählt worden sind

- Schlussfolgerungen aus der getroffenen Wahl einer Ansage, sofern diese Teil der
Partnerschaftsübereinkunft sind.

Wenn der Turnierleiter nichts anderes anordnet, sollen die Auskünfte vom Partner des
Spielers, der die betreffende Ansage gemacht hat, gegeben werden. Der Partner eines
Spielers, der gefragt hat, darf keine Ergänzungsfrage stellen, bis er selbst an der Reihe ist
anzusagen oder zu spielen. Regel 16 kann anzuwenden sein. Der Zuständige Verband kann
verbandseigene Bestimmungen über schriftliche Auskünfte erlassen.

2. Nach dem abschließenden Pass und während der Spielphase kann jeder Gegenspieler eine
Erklärung der gegnerischen Lizitation verlangen, wenn er selbst an der Reihe ist zu spielen.
Der Alleinspieler kann eine Erklärung einer Ansage der Gegenspieler sowie ihrer Ausspiel-
und Markierungs-Vereinbarungen verlangen, wenn er an der Reihe ist, aus seinem Blatt oder
vom Strohmann zu spielen. Erklärungen sollten analog zu Ziffer 1 vom Partner des Spielers
gegeben werden, dessen Aktion erklärt wird.

3. Unter Ziffer 1 und 2 oben kann ein Spieler auch nach der Bedeutung einer einzelnen
Ansage fragen, doch kann Regel 16B1 anzuwenden sein.

4. (a) Wenn ein Spieler während der Lizitation bemerkt, dass seine eigene Auskunft irrig oder
unvollständig war, muss er unbedingt den Turnierleiter vor dem Ende der Klärungsphase
rufen. Er kann sich entscheiden, den Turnierleiter früher zu rufen, ist dazu aber nicht
verpflichtet. (Hinsichtlich einer Richtigstellung während der Spielphase siehe Regel 75B2.)

(b) Wenn der Turnierleiter gerufen worden ist, wendet er Regel 21B oder 40B3 an.

5. (a) Der Partner eines Spielers, der eine falsche Auskunft gegeben hat, darf während der
Lizitation den Fehler nicht berichtigen. Er darf auch nicht irgendwie andeuten, dass ein Fehler
gemacht worden ist. Als „falsche Auskunft“ gilt hier auch ein fehlendes Alert oder eine
fehlende Direktauskunft, die die verbandseigenen Bestimmungen vorschreiben, oder ein Alert
oder eine Direktauskunft, die die verbandseigenen Bestimmungen nicht vorschreiben.

(b) Der Spieler muss bei der ersten legalen Gelegenheit den Turnierleiter rufen und seine
Gegner informieren, dass seiner Meinung nach eine Auskunft seines Partners irrig war (siehe
Regel 75B); das ist:

(i) für einen Gegenspieler am Ende des Spiels.

20.2 sofern dieser Spieler nicht auf Pass gesetzt ist
(ii) für den Alleinspieler oder Strohmann nach dem die Lizitation abschließenden Pass.

6. Wenn nach dem Urteil des Turnierleiters ein Spieler eine Aktion auf eine falsche Auskunft
eines Gegners gegründet hat, siehe Regel 21 bzw. 47E.','Explicarea Declarațiilor

1. În timpul licitaţiei şi înaintea pas-ului final, orice jucător poate cere7, la rândul său
de a declara, o explicare a licitației adversarilor. El are dreptul să afle despre
declaraţiile făcute, despre declaraţii alternative relevante care nu au fost făcute şi
despre inferențe provenite din acțiunea aleasă, când acestea fac obiectul
înţelegerilor între parteneri. Dacă arbitrul nu dispune altfel, răspunsurile trebuie
oferite de partenerul jucătorului care a făcut declaraţia în cauză. Partenerul
jucătorului care întreabă nu poate pune întrebări suplimentare până la rândul său
de a licita sau juca. Se poate aplica Legea 16 şi Autoritatea Regulatoare poate
reglementa furnizarea în scris a explicațiilor.

2. După pas-ul final şi pe toată durata jocului, oricare apărător, la rândul lui de a
juca, poate cere explicarea licitației adverse. La rândul lui de a juca, din mână sau

6 Primul rând de a juca al declarantului este de la mort, mai puțin când el acceptă un atac inițial peste rând.
7 Mai puțin dacă acel jucător este obligat de lege să paseze.
de la mort, declarantul poate cere explicarea unei declaraţii adverse sau a
înţelegerilor apărătorilor privind jocul cărților. Explicaţiile se dau așa cum e
specificat la punctul 1 și de către partenerul jucătorului a cărui acţiune este
explicată.

3. În situaţiile 1 şi 2 de mai sus, un jucător poate cere explicaţii despre o singură

declaraţie, dar se poate aplica legea 16B1.

4.

a) Dacă un jucător realizează în timpul licitației că propria explicație a fost
eronată sau incompletă, el trebuie să cheme arbitrul înainte de sfârșitul
Perioadei de Clarificare și să își corecteze explicația. Poate alege să cheme
arbitrul mai devreme, dar nu are obligația să o facă. (Pentru o corecție în
timpul perioadei de joc, vezi Legea 75B2.)

b) Când este chemat, arbitrul aplică Legea 21B sau Legea 40B3.

5.

a) Un jucător al cărui partener a dat o explicaţie greşită nu poate corecta eroarea
în timpul licitaţiei şi nici nu poate indica în vreun fel că s-a făcut o greşeală.
Termenul “explicaţie greşită” include lipsa unei alerte sau a unui anunţ verbal
cerut de regulament sau o alertă (sau anunţ verbal) efectuată când
regulamentul nu o cere.

b) Jucătorul trebuie să cheme arbitrul şi să-și informeze adversarii că, în opinia
sa, explicaţia partenerului său a fost greşită (vezi Legea 75B), dar numai cu
prima ocazie legală, care este:

i. Pentru un apărător, la sfârșitul jocului.

ii. Pentru declarant sau mort, după pas-ul final al licitației.

6. Dacă arbitrul consideră că un jucător şi-a bazat o acţiune pe o informație greșită

primită de la un adversar, vezi, după caz, Legea 21 sau Legea 47E.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1082,'20',1075,'G. Regelwidriges Vorgehen','G. Regelwidriges Vorgehen','G. Procedură Incorectă',1,'Regelwidriges Vorgehen
1. Ein Spieler darf keine Frage stellen, wenn der einzige Zweck ein Nutzen für den Partner ist.

2. Ein Spieler darf keine Frage stellen, wenn es sein einziger Zweck ist, von einem Gegner
eine falsche Auskunft zu bekommen.

3. Wenn der Zuständige Verband es nicht gestattet hat, darf kein Spieler seine eigene
Konventionskarte oder seine Systemaufzeichnungen während der Lizitationsphase und des
Spiels ansehen [siehe aber Regel 40B2(b)].','Procedură Incorectă

1. Un jucător nu poate pune o întrebare cu singurul scop de a-și ajuta partenerul.

2. Un jucător nu poate pune o întrebare cu singurul scop de a provoca un răspuns

incorect al unui adversar.

3. Mai puțin când Autoritatea Regulatoare o permite, un jucător nu-şi poate consulta
propria fişă de convenţii sau propriile note de sistem în timpul perioadei de licitaţie
sau de joc [dar vezi Legea 40B2b)].','apply_rule','[]');

-- Law 21
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1083,'21',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1084,'21',1083,'A. eigenes Missverständnis','A. eigenes Missverständnis','A. Declarație sau Joc Bazat pe Propria Înțelegere Greșită',1,'eigenes Missverständnis
Einem Spieler, der auf Basis seines eigenen Missverständnisses etwas tut, steht keine
Korrektur und keine Entschädigung zu.','Declarație sau Joc Bazat pe Propria Înțelegere Greșită
Nu se cuvine nicio rectificare sau compensație unui jucător care acționează bazat pe
propria sa înțelegere greșită.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1085,'21',1083,'B. Ansage nach falscher Auskunft','B. Ansage nach falscher Auskunft','B. Declarație Bazată pe Dezinformare de către un Adversar',1,'Ansage nach falscher Auskunft
1. (a) Ein Spieler kann bis zum Ende der Lizitationsphase (siehe Regel 17D) eine Ansage
ohne weitere Korrektur für seine Seite ändern, wenn sein Partner danach noch nicht angesagt
hat und nach dem Urteil des Turnierleiters die Ansage leicht hätte durch eine falsche
Auskunft eines Gegners beeinflusst sein können. Wenn nicht prompt alertiert worden ist, wo
der Zuständige Verband dies verlangt, gilt das als falsche Auskunft.

(b) Der Turnierleiter hat eher falsche Auskunft als falsche Ansage anzunehmen, wenn es
keine gegenteiligen Beweise gibt.

2. Wenn sich ein Spieler entschließt, eine Ansage wegen einer falschen Auskunft zu ändern
(wie es Ziffer 1 vorsieht), kann sein linker Gegner eine allfällige danach gemachte Ansage
ändern, wobei Regel 16C anzuwenden ist.

3. Wenn es für eine Änderung einer Ansage zu spät ist und die schuldige Seite nach dem
Urteil des Turnierleiters aus der Regelwidrigkeit einen Vorteil gezogen hat, weist er ein
Berichtigtes Ergebnis zu.','Declarație Bazată pe Dezinformare de către un Adversar

1.

a) Până la sfârşitul perioadei de licitaţie (vezi Legea 17D) şi cu condiţia ca
partenerul său să nu fi făcut o declaraţie subsecventă, un jucător poate să
schimbe o declaraţie fără alte rectificări pentru axa sa, când arbitrul consideră
că decizia de a face declaraţia respectivă ar fi putut în bună masură să fie
influenţată de dezinformarea jucătorului de către un adversar. Lipsa alertei
imediate, când alerta este cerută de Autoritatea Regulatoare, este considerată
dezinformare.

b) Arbitrul va presupune că s-a produs o explicaţie greşită mai degrabă decât o

declaraţie greşită, în lipsa unor dovezi contrare.

2. Când un jucător alege să-şi schimbe o declaraţie din cauza unei dezinformări
(conform punctului 1 de mai sus), adversarul său din stânga poate, la rândul său,
să-și schimbe orice declaraţie subsecventă, dar se aplică Legea 16C.

3. Când este prea târziu ca să se schimbe o declaraţie şi arbitrul consideră că
partea vinovată a obţinut un avantaj de pe urma neregularităţii, se acordă un scor
ajustat.','apply_rule','[]');

-- Law 22
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1086,'22',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1087,'22',1086,'A. wenigstens ein Spieler geboten hat, und auf das letzte Gebot dreimal in der Reihe gepasst','A. wenigstens ein Spieler geboten hat, und auf das letzte Gebot dreimal in der Reihe gepasst','A. După ce unul sau mai mulţi jucători au făcut anunţuri, după ultimul anunț',1,'wenigstens ein Spieler geboten hat, und auf das letzte Gebot dreimal in der Reihe gepasst
worden ist. Das letzte Gebot wird zum Kontrakt (siehe aber Regel 19D).','După ce unul sau mai mulţi jucători au făcut anunţuri, după ultimul anunț
există 3 pas-uri consecutive în rotaţie. Ultimul anunţ devine contractul (dar
vezi legea 19D).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1088,'22',1086,'B. alle vier Spieler gepasst haben (siehe aber Regel 25). Die Blätter werden ohne Spiel ins','B. alle vier Spieler gepasst haben (siehe aber Regel 25). Die Blätter werden ohne Spiel ins','B. Toți cei 4 jucători pasează (dar vezi Legea 25). Mâinile sunt reintroduse în etui',1,'alle vier Spieler gepasst haben (siehe aber Regel 25). Die Blätter werden ohne Spiel ins
Board zurückgesteckt. Es darf nicht neu geteilt werden.','Toți cei 4 jucători pasează (dar vezi Legea 25). Mâinile sunt reintroduse în etui

fără joc. Nu se vor redistribui cărţile.','apply_rule','[]');

-- Law 23
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1089,'23',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1090,'23',1089,'A. Definition','A. Definition','A. Definiție',1,'Definition
Eine Ansage, die eine zurückgezogene Ansage ersetzt, ist eine vergleichbare Ansage, wenn
sie:

1. dieselbe oder eine ähnliche Bedeutung hat wie die, die der zurückgezogenen Ansage
beizulegen ist; oder

2. eine Teilmenge der möglichen Bedeutungen, die der zurückgezogenen Ansage beizulegen
sind, definiert; oder

3. denselben Zweck (z. B. eine Frageansage oder ein Relais) hat wie derjenige, der der
zurückgezogenen Ansage beizulegen ist.','Definiție

O declarație care înlocuiește o declarație retrasă este comparabilă, dacă:

1. Are aceeași semnificație sau una similară cu cea a declarației retrase, sau

2. Desemnează un subset al posibilelor semnificații ale declarației retrase, sau

3. Are același scop (de exemplu, o interogare sau un releu) cu cel al declarației

retrase.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1091,'23',1089,'B. keine Korrektur','B. keine Korrektur','B. Nicio Rectificare',1,'keine Korrektur
Wenn eine Ansage gestrichen wird (wie etwa nach Regel 29B) und sich der schuldige Spieler,
wenn er dann an der Reihe ist, entschließt, die regelwidrige durch eine vergleichbare Ansage
zu ersetzen, gehen Lizitation und Spiel ohne weitere Korrektur weiter. Regel 16C2 ist nicht
anzuwenden, siehe aber unten 23C.','Nicio Rectificare

Când este anulată o declarație (ca prin Legea 29B) și jucătorul vinovat alege, la
rândul său, să înlocuiască neregularitatea cu o declarație comparabilă, licitația și
jocul continuă fără alte rectificări. Nu se aplică Legea 16C2, dar vezi C mai jos.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1092,'23',1089,'C. nicht-schuldige Seite geschädigt','C. nicht-schuldige Seite geschädigt','C. Axa Nevinovată este Prejudiciată',1,'nicht-schuldige Seite geschädigt
Wenn der Turnierleiter nach einer vergleichbaren Ersatzansage [siehe Regeln 27B1(b),
30B1(b)(i), 31A2(a) und 32A2(a)] am Ende des Spiels entscheidet, dass das Ergebnis auf dem
Board ohne Hilfe durch den Regelverstoß leicht hätte anders sein können und die nicht-
schuldige Seite infolge dessen geschädigt worden ist, muss er ein Berichtigtes Ergebnis
zuweisen [siehe Regel 12C1(b)].','Axa Nevinovată este Prejudiciată

Dacă, în urma înlocuirii unei declarații cu o declarație comparabilă [vezi Legile
27B1b), 30B1b)i, 31A2a) și 32A2a)], arbitrul apreciază la sfârșitul jocului că fără
ajutorul infracțiunii rezultatul donei ar fi putut în bună măsură să fie altul, și prin
urmare axa nevinovată este prejudiciată, el va acorda un scor ajustat [vezi Legea
12C1b)].','apply_rule','[]');

-- Law 24
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1093,'24',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1094,'24',1093,'A. kleine Karte, die nicht vorzeitig ausgespielt worden ist','A. kleine Karte, die nicht vorzeitig ausgespielt worden ist','A. Carte Mică Neatacată Prematur',1,'kleine Karte, die nicht vorzeitig ausgespielt worden ist
Wenn es sich um eine einzelne kleine Karte handelt, die nicht vorzeitig ausgespielt worden
ist, gibt es keine weitere Korrektur (siehe aber unten Punkt E.).','Carte Mică Neatacată Prematur

Dacă este vorba de o singură carte de rang inferior unui onor şi care nu a fost
atacată prematur, nu există altă rectificare (dar vezi E mai jos).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1095,'24',1093,'B. Einzelne Figur oder vorzeitig ausgespielte Karte','B. Einzelne Figur oder vorzeitig ausgespielte Karte','B. Onor sau Carte Atacată Prematur',1,'Einzelne Figur oder vorzeitig ausgespielte Karte
Wenn es sich um eine einzelne Figur oder eine vorzeitig ausgespielte Karte handelt, muss der
Partner des schuldigen Spielers passen, wenn er das nächste Mal an der Reihe ist anzusagen
(siehe Regel 72C, wenn der Pass die nicht-schuldige Seite schädigt).','Onor sau Carte Atacată Prematur

Dacă este vorba de o singură carte care este onor sau care a fost atacată prematur,
partenerul jucătorului vinovat trebuie să paseze la următorul său rând de a declara
(când pas-ul prejudiciază axa nevinovată, vezi Legea 72C).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1096,'24',1093,'C. zwei oder mehr sichtbare Karten','C. zwei oder mehr sichtbare Karten','C. Două sau Mai Multe Cărți Expuse',1,'zwei oder mehr sichtbare Karten
Wenn zwei oder mehr Karten aufgedeckt sind, muss der Partner des schuldigen Spielers
passen, wenn er das nächste Mal an der Reihe ist anzusagen (siehe Regel 72C, wenn der Pass
die nicht-schuldige Seite schädigt).','Două sau Mai Multe Cărți Expuse

Dacă două sau mai multe cărţi sunt astfel expuse, partenerul jucătorului vinovat
trebuie să paseze la următorul său rând de a declara (când pas-ul prejudiciază axa
nevinovată, vezi Legea 72C).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1097,'24',1093,'D. Alleinspieler oder Strohmann','D. Alleinspieler oder Strohmann','D. Declarant sau Mort',1,'Alleinspieler oder Strohmann
Wenn der schuldige Spieler Alleinspieler oder Strohmann wird, werden die Karten wieder ins
Blatt zurückgenommen.','Declarant sau Mort

Dacă jucătorul vinovat devine declarant sau mort, cărţile expuse sunt ridicate şi
reîncadrate în mâna acestuia.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1098,'24',1093,'E. Gegenspieler','E. Gegenspieler','E. Apărători',1,'Gegenspieler
Wenn am Ende des Lizits der schuldige Spieler ein Gegenspieler wird, wird jede aufgedeckte
Karte zur Strafkarte (siehe Regeln 50 und 51).','Apărători

Dacă jucătorul vinovat devine apărător, fiecare carte expusă devine carte penalizată
(vezi Legile 50 și 51).','apply_rule','[]');

-- Law 25
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1099,'25',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1100,'25',1099,'A. Unbeabsichtigte Ansage','A. Unbeabsichtigte Ansage','A. Declarație Neintenționată',1,'Unbeabsichtigte Ansage
1. Wenn ein Spieler bemerkt, dass er nicht die Ansage gemacht hat, die er beabsichtigt hatte,
darf er die unbeabsichtigte Ansage durch die beabsichtigte ersetzen, solange sein Partner nicht
angesagt hat. Die zweite (beabsichtigte) Ansage gilt und unterliegt den darauf zutreffenden
Regeln; es gibt keine Ausspielbeschränkung nach Regel 26.

2. Wenn der Spieler ursprünglich die abgegebene Ansage machen wollte, gilt diese. Eine
Ansageänderung kann wegen eines mechanischen oder Zungenfehlers gestattet werden, nicht
aber wegen mangelnder Konzentration hinsichtlich der die Aktion leitenden Absicht.

3. Wenn die Umstände von Punkt A1 zutreffen, darf ein Spieler seine Ansage ändern, egal
wie er auf seinen Fehler aufmerksam geworden sein mag.

4. Wenn sein Partner angesagt hat, ist eine Änderung nicht mehr möglich.

5. Wenn die Lizitation endet, bevor sie seinen Partner erreicht hat, kann die Ansage bis zum
Ende der Lizitationsphase (siehe Regel 17D) geändert werden.

6. Wenn eine Änderung gestattet worden ist, kann der linke Gegner eine Ansage, die er vor
der Änderung gemacht hat, zurückziehen. Die Information aus dieser zurückgezogenen
Ansage ist für seine Seite erlaubte, für seine Gegner unerlaubte Information.','Declarație Neintenționată

1. Dacă un jucător descoperă că nu a făcut declarația pe care intenționa să o facă,
el poate, înainte ca partenerul său să declare, să-și înlocuiască declarația
neintenționată cu cea pe care intenționa să o facă. Cea de-a doua declaraţie (cea
intenţionată) rămâne valabilă şi face obiectul Legii corespunzătoare, dar nu se
aplică restricțiile de atac din Legea 26.

2. Dacă intenția primară a jucătorului a fost să facă declarația selectată sau rostită,
prima declarație rămâne valabilă. Se permite o schimbare de declarație din cauza
unei erori mecanice sau în vorbire, dar nu din cauza unei lipse de concentrare cu
privire la scopul acțiunii.

3. Un jucător are voie să înlocuiască o declarație neintenționată dacă se îndeplinesc
condițiile de la punctul A1 de mai sus, indiferent de modul în care el a devenit
conștient de eroare.

4. Nu se mai poate face nicio înlocuire când partenerul jucătorului a făcut o

declarație subsecventă.

5. Dacă licitaţia se termină înainte de a veni rândul partenerului, nu se mai poate

face nicio înlocuire după terminarea perioadei de licitaţie (vezi Legea 17D).

6. Dacă este permisă o înlocuire, adversarul din stânga îşi poate retrage orice
declaraţie subsecventă declarației înlocuite. Informaţia din declaraţia retrasă este
autorizată pentru axa sa și neautorizată pentru adversari.','apply_rule','["26", "17D"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1101,'25',1099,'B. Beabsichtigte Ansage','B. Beabsichtigte Ansage','B. Declarație Intenționată',1,'Beabsichtigte Ansage
1. Eine Ersatzansage, die nicht nach Regel 25A zulässig ist, kann vom linken Gegner
angenommen werden. (Sie ist angenommen, wenn er darüber absichtlich lizitiert.) Die erste
Ansage ist dann zurückgenommen, die zweite gilt und das Lizit geht weiter. (Regel 26 kann
anzuwenden sein.)

2. Abgesehen von Punkt B1, wird eine unzulässige Ersatzansage gestrichen. Die
ursprüngliche Ansage gilt, und das Lizit geht weiter. (Regel 26 kann anzuwenden sein.)

3. Regel 16C ist auf alle zurückgezogenen oder gestrichenen Ansagen anzuwenden.','Declarație Intenționată

1. O declarație înlocuitoare nepermisă de paragraful A poate fi acceptată de
adversarul din stânga al jucătorului vinovat. (Este acceptată dacă adversarul din
stânga declară intenţionat peste aceasta.) În acest caz prima declarație este
retrasă, a doua declarație rămâne valabilă și licitația continuă (se poate aplica
Legea 26).

2. Exceptând cazul de la punctul B1, o înlocuire nepermisă de A este anulată.
Declaraţia iniţială rămâne valabilă şi licitaţia continuă (se poate aplica Legea 26).

3. Se aplică Legea 16C oricărei declarații retrase sau anulate.','apply_rule','["25A", "26", "16C"]');

-- Law 26
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1102,'26',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1103,'26',1102,'A. keine Ausspielbeschränkungen','A. keine Ausspielbeschränkungen','A. Nicio Restricție',1,'keine Ausspielbeschränkungen
Wenn die Ansage eines schuldigen Spielers zurückgezogen und durch eine vergleichbare
Ansage (siehe Regel 23A) ersetzt worden ist, gibt es für seine Seite keine
Ausspielbeschränkungen. Regel 16C ist nicht anzuwenden, siehe aber Regel 23C.','Nicio Restricție

Când o declarație retrasă a unui jucător vinovat este înlocuită cu o declarație
comparabilă (vezi Legea 23A) și jucătorul devine apărător, nu există restricții de atac
pentru axa sa. Nu se aplică Legea 16C, dar vezi Legea 23C.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1104,'26',1102,'B. Ausspielbeschränkungen','B. Ausspielbeschränkungen','B. Restricții de Atac',1,'Ausspielbeschränkungen
Wenn die Ansage eines schuldigen Spielers zurückgezogen und nicht durch eine
vergleichbare Ansage ersetzt worden ist, und er zum Gegenspieler wird, dann gilt:

Wenn der Partner des schuldigen Spielers zum ersten Mal auszuspielen hat (was das erste
Ausspiel der Partie sein kann, aber nicht sein muss), kann der Alleinspieler das Ausspiel einer
einzelnen beliebigen Farbe, die der schuldige Spieler nicht in der regelkonformen Lizitation
gezeigt hat, verbieten. Ein solches Verbot gilt, solange der Partner des schuldigen Spielers am
Ausspiel bleibt.','Restricții de Atac

Când o declarație retrasă a unui jucător vinovat nu este înlocuită cu o declarație
comparabilă și jucătorul devine apărător, declarantul poate, cu prima ocazie când
partenerul jucătorului vinovat este la atac (care poate fi atacul inițial), să-i interzică
acestuia să atace orice culoare (dar numai una) care nu a fost specificată de
jucătorul vinovat în licitația legală. Interdicţia continuă atât timp cât partenerul
jucătorului vinovat reţine mâna.','apply_rule','[]');

-- Law 27
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1105,'27',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1106,'27',1105,'A. angenommen','A. angenommen','A. Anunț Insuficient Acceptat',1,'angenommen
1. Jedes ungenügende Gebot kann vom linken Gegner des schuldigen Spielers angenommen
(als zulässig behandelt) werden. Es ist angenommen, wenn dieser Gegner ansagt.

2. Wenn ein Spieler ein ungenügendes Gebot außer der Reihe abgibt, ist Regel 31
anzuwenden.','Anunț Insuficient Acceptat

1. Orice anunţ insuficient poate fi acceptat (tratat ca legal) de către adversarul din

stânga jucătorului vinovat. El este acceptat dacă acest adversar declară.

2. Dacă un jucător face un anunţ insuficient peste rând se aplică Legea 31.','apply_rule','["31"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1107,'27',1105,'B. nicht angenommen','B. nicht angenommen','B. Anunț Insuficient Neacceptat',1,'nicht angenommen
Wird ein ungenügendes Gebot nicht angenommen (siehe Punkt A), muss es durch eine
zulässige Ansage ersetzt werden (siehe aber unten Ziffer 3). Dann gilt:

1. (a) Wenn die Ersatzansage das niedrigste genügende Gebot ist, das sich auf dieselbe(n)
Denomination(en) bezieht wie die zurückgezogene Ansage, geht das Lizit normal weiter. Die
Regeln 26B und 16C sind nicht anzuwenden, siehe aber unten Punkt D.

(b) wenn anders als gemäß (a) das ungenügende Gebot durch eine vergleichbare Ansage
(siehe Regel 23A) ersetzt wird, wird das Lizit ohne weitere Korrektur fortgesetzt. Regel 16C
ist nicht anzuwenden, siehe aber unten Punkt D.

2. Wird das ungenügende Gebot anders als oben in Punkt B1 beschrieben durch ein
genügendes Gebot oder Pass ersetzt, muss der Partner des Schuldigen immer passen, wenn er
an der Reihe ist anzusagen. Die Ausspielbeschränkungen gemäß Regel 26B können
anzuwenden sein, und siehe Regel 72C.

3. Wenn der schuldige Spieler anders, als in Regel 27B1(b) beschrieben, versucht zu
kontrieren oder rekontrieren, wird diese Ansage gestrichen. Der schuldige Spieler muss sie
durch eine oben zugelassene Ansage ersetzen und sein Partner muss danach immer passen,
wenn er an der Reihe ist anzusagen. Die Ausspielbeschränkungen gemäß Regel 26B können
anzuwenden sein, und siehe Regel 72C.
4. Wenn der schuldige Spieler versucht, sein ungenügendes Gebot durch ein anderes
ungenügendes Gebot zu ersetzen, kann sein linker Gegner dieses ungenügende Gebot
annehmen (siehe oben Regel 27A). Andernfalls entscheidet der Turnierleiter nach Regel
27B3.','Anunț Insuficient Neacceptat

Dacă un anunţ insuficient în rotaţie nu este acceptat (vezi A), el trebuie înlocuit printr-
o declaraţie legală (dar vezi 3 mai jos). Atunci:

1.

a) Dacă anunţul insuficient este corectat prin anunţul suficient la nivelul cel mai
jos care specifică aceeaşi denominaţie cu cea specificată de anunțul retras,
licitaţia continuă fără altă rectificare. Nu se aplică Legile 26B și 16C, dar vezi
D mai jos.

b) Exceptând cazul a), dacă anunțul insuficient este corectat printr-o declarație
comparabilă (vezi Legea 23A), licitaţia continuă fără altă rectificare. Nu se
aplică Legea 16C, dar vezi D mai jos.

2. Exceptând cazurile de la B1, dacă anunțul insuficient este corectat printr-un anunț
suficient sau pas, partenerul jucătorului vinovat trebuie să paseze ori de câte ori îi
vine rândul să declare. Se aplică restricţiile de atac din Legea 26B, şi vezi Legea
72C.

3. Exceptând cazurile de la B1b), dacă jucătorul vinovat încearcă să-și înlocuiască
anunțul insuficient cu contra sau recontra, această declarație este anulată. Ea
trebuie înlocuită conform cerințelor de mai sus și partenerul jucătorului vinovat
trebuie să paseze ori de câte ori îi vine rândul să declare. Se aplică restricţiile de
atac din Legea 26B, şi vezi Legea 72C.

4. Dacă jucătorul vinovat încearcă să-și înlocuiască anunţul insuficient cu un alt
anunţ insuficient, arbitrul procedează ca la punctul 3 dacă adversarul din stânga
nu acceptă noul anunţ insuficient conform paragrafului A1.','apply_rule','["26B", "16C", "23A", "72C", "27B1(b)", "27A", "27B3"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1108,'27',1105,'C. voreilige Ersatzansage','C. voreilige Ersatzansage','C. Înlocuire Prematură',1,'voreilige Ersatzansage
Wenn der schuldige Spieler sein ungenügendes Gebot ersetzt, bevor der Turnierleiter eine
Entscheidung getroffen hat, gilt die Ersatzansage, wenn sie zulässig ist und das ungenügende
Gebot nicht wie oben in Regel 27A beschrieben angenommen wird (siehe aber oben B3). Der
Turnierleiter wendet die entsprechende Bestimmung dieser Regel auf die Ersatzansage an.','Înlocuire Prematură
Dacă jucătorul vinovat își corectează anunţul insuficient înainte ca arbitrul să impună
o rectificare, înlocuirea, când este legală, rămâne valabilă, mai puțin când anunţul
insuficient este acceptat conform A1 (dar vezi B3 mai sus). Arbitrul aplică secţiunea
relevantă a acestei legi declarației înlocuitoare.','apply_rule','["27A"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1109,'27',1105,'D. nicht-schuldige Seite geschädigt','D. nicht-schuldige Seite geschädigt','D. Axa Nevinovată este Prejudiciată',1,'nicht-schuldige Seite geschädigt
Wenn nach Anwendung von Regel 27B1 der Turnierleiter nach dem Spiel entscheidet, dass
ohne die Hilfe des Regelverstoßes leicht ein anderes Ergebnis zustande gekommen wäre und
die nicht-schuldige Seite dadurch geschädigt worden ist (siehe Regel 12B1), muss er ein
berichtigtes Ergebnis zuweisen. Er soll dabei versuchen, das ohne das ungenügende Gebot
wahrscheinliche Ergebnis auf dem Board zu rekonstruieren.','Axa Nevinovată este Prejudiciată

Dacă, după ce a aplicat B1, arbitrul apreciază la sfârşitul jocului că fără ajutorul
infracţiunii rezultatul donei ar putut în bună măsură să fie altul, şi prin urmare axa
nevinovată este prejudiciată (vezi Legea 12B1), el va acorda un scor ajustat. În
ajustare, arbitrul ar trebui să urmărească să recupereze pe cât posibil rezultatul
probabil al donei în cazul în care anunțul insuficient nu s-ar fi produs.','apply_rule','["27B1", "12B1"]');

-- Law 28
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1110,'28',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1111,'28',1110,'A. rechter Gegner auf Pass gesetzt','A. rechter Gegner auf Pass gesetzt','A. Adversarul din Dreapta este Obligat să Paseze',1,'rechter Gegner auf Pass gesetzt
Eine Ansage gilt als in der Reihe abgegeben, wenn der rechte Gegner an der Reihe ist
anzusagen und dieser auf Pass gesetzt ist.','Adversarul din Dreapta este Obligat să Paseze

O declarație se consideră a fi la rând când este făcută de un jucător la rândul
adversarului său din dreapta, dacă acel adversar este obligat de lege să paseze.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1112,'28',1110,'B. Der Spieler, der an der Reihe ist, sagt an','B. Der Spieler, der an der Reihe ist, sagt an','B. Declarație a Jucătorului Corect care Anulează o Declarație Peste Rând',1,'Der Spieler, der an der Reihe ist, sagt an
Wenn der Spieler, der an der Reihe ist, ansagt, bevor eine Korrektur für eine gegnerische
Ansage außer der Reihe festgesetzt ist, gilt diese Ansage als in der Reihe. Das Recht auf
Korrektur der Ansage außer der Reihe ist erloschen. Das Lizit geht normal weiter. Regel 26
ist nicht anzuwenden, siehe aber Regel 16C2.','Declarație a Jucătorului Corect care Anulează o Declarație Peste Rând

O declaraţie se consideră a fi la rând când este făcută de un jucător la rândul său,
înainte de aplicarea rectificării pentru o declaraţie peste rând a unui adversar.
Efectuarea unei asemenea declaraţii anulează dreptul
la rectificarea pentru
declaraţia peste rând. Licitaţia continuă ca şi cum adversarul nu ar fi declarat în turul
respectiv. Nu se aplică Legea 26, dar vezi Legea 16C2.','apply_rule','[]');

-- Law 29
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1113,'29',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1114,'29',1113,'A. Verlust des Anspruchs auf Korrektur','A. Verlust des Anspruchs auf Korrektur','A. Pierderea Dreptului la Rectificare',1,'Verlust des Anspruchs auf Korrektur
Nach einer Ansage außer der Reihe kann sich der linke Gegner des schuldigen Spielers
entscheiden anzusagen; der Anspruch auf jedwede Korrektur geht damit verloren.','Pierderea Dreptului la Rectificare

După o declaraţie peste rând, adversarul din stânga al jucătorului vinovat poate alege
să declare, pierzând astfel dreptul la orice rectificare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1115,'29',1113,'B. Ansage außer der Reihe gestrichen','B. Ansage außer der Reihe gestrichen','B. Declarație Peste Rând Anulată',1,'Ansage außer der Reihe gestrichen
Wenn Punkt A nicht zutrifft, wird eine Ansage außer der Reihe gestrichen; das Lizit geht an
den Spieler zurück, der an der Reihe war anzusagen. Die schuldige Seite unterliegt den
Bestimmungen der Regeln 30, 31 oder 32.','Declarație Peste Rând Anulată

Când nu se aplică A, o declaraţie peste rând este anulată şi licitaţia revine la
jucătorul care era la rând. Axa vinovată este supusă prevederilor Legilor 30, 31 sau
32.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1116,'29',1113,'C. künstliche Ansage außer der Reihe','C. künstliche Ansage außer der Reihe','C. Declarația Peste Rând Este Artificială',1,'künstliche Ansage außer der Reihe
Auf eine künstliche Ansage außer der Reihe sind die Bestimmungen der Regeln 30, 31 und 32
nicht auf die Denomination der Ansage, sondern auf die durch diese bezeichnete(n)
Denomination(en) anzuwenden.','Declarația Peste Rând Este Artificială

Dacă o declaraţie peste rând este artificială, prevederile Legilor 30, 31 sau 32 se
aplică denominației (denominaţiilor) specficate, nu celei numite.','apply_rule','[]');

-- Law 30
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1117,'30',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1118,'30',1117,'A. wenn der rechte Gegner an der Reihe war anzusagen','A. wenn der rechte Gegner an der Reihe war anzusagen','A. La Rândul Adversarului din Dreapta',1,'wenn der rechte Gegner an der Reihe war anzusagen
Nach einem Pass außer der Reihe, wenn der rechte Gegner des schuldigen Spielers an der
Reihe war anzusagen, muss der schuldige Spieler passen, wenn er das nächste Mal an der
Reihe ist anzusagen; Regel 72C kann anzuwenden sein.','La Rândul Adversarului din Dreapta

Dacă jucătorul vinovat pasează când era rândul adversarului său din dreapta,
jucătorul vinovat trebuie să paseze la următorul său rând de a declara și se poate
aplica Legea 72C.','apply_rule','["72C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1119,'30',1117,'B. wenn der Partner oder der linke Gegner an der Reihe war anzusagen','B. wenn der Partner oder der linke Gegner an der Reihe war anzusagen','B. La Rândul Partenerului sau al Adversarului din Stânga',1,'wenn der Partner oder der linke Gegner an der Reihe war anzusagen
1. Wenn der linke Gegner des schuldigen Spielers an der Reihe war anzusagen und der
schuldige Spieler noch nicht lizitiert hat, oder wenn der Partner des schuldigen Spielers an der
Reihe war, dann gilt:

(a) der Partner des schuldigen Spielers kann jede regelkonforme Ansage machen, wenn er an
der Reihe ist, aber Regel 16C2 ist anzuwenden.

(b) der schuldige Spieler kann, wenn er an der Reihe ist, jede regelkonforme Ansage machen,
und:

(i) wenn es sich um eine vergleichbare Ansage handelt (siehe Regel 23A), gibt es keine
weitere Korrektur. Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.

(ii) wenn es sich nicht um eine vergleichbare Ansage handelt (siehe Regel 23A), muss der
Partner des schuldigen Spielers passen, wenn er das nächste Mal an der Reihe ist anzusagen.
Regel 16C, 26B und 72C können anzuwenden sein.

2. Wenn der linke Gegner des schuldigen Spielers an der Reihe war anzusagen und der
schuldige Spieler bereits lizitiert hat, gilt der Pass außer der Reihe als Änderung einer Ansage
(siehe Regel 25).','La Rândul Partenerului sau al Adversarului din Stânga

1. Dacă jucătorul vinovat pasează când era rândul partenerului, sau al adversarului

său din stânga fără ca jucătorul vinovat să mai fi declarat în donă, atunci:

a) Când îi vine rândul, partenerul jucătorului vinovat poate face orice declarație

legală, dar se aplică Legea 16C2.

b) Când îi vine rândul, jucătorul vinovat poate face orice declarație legală și:

i. Când declarația este comparabilă (vezi Legea 23A), nu există nicio altă

rectificare. Nu se aplică Legea 26B, dar vezi Legea 23C.

ii. Când declarația nu este comparabilă (vezi Legea 23A), partenerul
jucătorului vinovat trebuie să paseze la următorul său rând de a
declara. Se aplică Legile 16C, 26B și 72C.

2. Dacă jucătorul vinovat a mai declarat în donă, un pas la rândul adversarului său

din stânga este tratat ca o schimbare de declarație. Se aplică Legea 25.','apply_rule','["16C2", "23A", "26B", "23C", "16C", "72C", "25"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1120,'30',1117,'C. künstlicher Pass','C. künstlicher Pass','C. Când Pas-ul Este Artificial',1,'künstlicher Pass
Wenn ein Pass außer der Reihe künstlich ist, oder ein Pass einer künstlichen Ansage ist, ist
nicht Regel 30, sondern Regel 31 anzuwenden.','Când Pas-ul Este Artificial

Când un pas peste rând este artificial sau este pas al unei declaraţii artificiale a
partenerului se aplică Legea 31, nu Legea 30.','apply_rule','["30", "31"]');

-- Law 32
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1121,'32',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1122,'32',1121,'A. rechter Gegner an der Reihe','A. rechter Gegner an der Reihe','A. La Rândul Adversarului din Dreapta',1,'rechter Gegner an der Reihe
Wenn der schuldige Spieler angesagt hat, während sein rechter Gegner an der Reihe war
anzusagen, dann gilt:

1. Wenn dieser Gegner passt, muss der schuldige Spieler sein (Re-)Kontra wiederholen; wenn
das (Re-)Kontra zulässig war, gibt es keine weitere Korrektur, andernfalls ist Regel 36
anzuwenden.

2. Wenn dieser Gegner bietet, kontriert oder rekontriert, kann der schuldige Spieler jede
regelkonforme Ansage machen, und

(a) wenn es sich um eine vergleichbare Ansage handelt (siehe Regel 23A), gibt es keine
weitere Korrektur. Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.

31.1 Eine regelwidrige Ansage des rechten Gegners unterliegt der üblichen Korrektur.
(b) wenn es sich nicht um eine vergleichbare Ansage handelt (siehe Regel 23A), muss der
Partner des schuldigen Spielers passen, wenn er das nächste Mal an der Reihe ist anzusagen.
Regel 16C, 26B und 72C können anzuwenden sein.','La Rândul Adversarului din Dreapta

Dacă jucătorul vinovat contrează sau recontrează când era rândul adversarului său
din dreapta, atunci:

1. Dacă acel adversar pasează, jucătorul vinovat trebuie să își repete contra sau
recontra peste rând, și nu există alte rectificări decât dacă aceasta este
inadmisibilă, caz în care se aplică Legea 36.

2. Dacă acel adversar anunță, contrează sau recontrează, jucătorul vinovat poate

face orice declarație legală:

a) Când declarația este comparabilă (vezi Legea 23A), nu există nicio altă

rectificare. Nu se aplică Legea 26B, dar vezi Legea 23C.

8 O declarație ilegală a adversarului din dreapta este rectificată ca de obicei.
b) Când declarația nu este comparabilă (vezi Legea 23A), partenerul jucătorului
vinovat trebuie să paseze la următorul său rând de a declara. Se aplică Legile
16C, 26B și 72C.','apply_rule','["36", "23A", "26B", "23C", "16C", "72C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1123,'32',1121,'B. Partner an der Reihe','B. Partner an der Reihe','B. La Rândul Partenerului',1,'Partner an der Reihe
Wenn ein Spieler außer der Reihe kontriert oder rekontriert hat, während sein Partner an der
Reihe war anzusagen, dann

1. kann der Partner des schuldigen Spielers jede regelkonforme Ansage machen, aber Regel
16C2 ist anzuwenden;

2. kann der schuldige Spieler jede regelkonforme Ansage machen, wenn er an der Reihe ist
anzusagen, und der Turnierleiter entscheidet nach Absatz A2(a) bzw. A2(b).','La Rândul Partenerului

Dacă jucătorul vinovat contrează sau recontrează când era rândul partenerului său,
atunci:

1. Partenerul jucătorului vinovat poate face orice declarație legală, dar se aplică

Legea 16C2.

2. Când îi vine rândul, jucătorul vinovat poate face orice declarație legală și arbitrul

procedează ca la punctele A2a) sau A2b) de mai sus.','apply_rule','["16C2"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1124,'32',1121,'C. linker Gegner an der Reihe','C. linker Gegner an der Reihe','C. Declarații Ulterioare la Rândul Adversarului din Stânga',1,'linker Gegner an der Reihe
Spätere Ansagen, wenn der linke Gegner an der Reihe ist anzusagen, gelten als Änderung
einer Ansage, auf die Regel 25 anzuwenden ist.','Declarații Ulterioare la Rândul Adversarului din Stânga

Declarațiile ulterioare făcute la rândul adversarului din stânga sunt tratate ca
schimbări de declarație și se aplică Legea 25.','apply_rule','["25"]');

-- Law 33
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1125,'33',NULL,1,'Eine Ansage, die gleichzeitig mit der des Spielers, der an der Reihe war anzusagen, gemacht
wird, gilt als nachfolgend.','O declaraţie făcută simultan cu una a jucătorului care era la rând se consideră a fi o
declaraţie subsecventă.','apply_rule','[]');

-- Law 34
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1126,'34',NULL,1,'Wenn nach einer Ansage drei oder mehrere aufeinanderfolgende Pass abgegeben worden
sind, wobei wenigstens einer außer der Reihe war, ist Regel 17D3 anzuwenden.','Când o declaraţie este urmată de 3 pas-uri consecutive, dintre care unul sau mai
multe peste rând, se aplică Legea 17D3.','apply_rule','[]');

-- Law 35
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1127,'35',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1128,'35',1127,'A. Ein Kontra oder Rekontra, das gegen Regel 19 verstößt. Regel 36 ist anzuwenden.','A. Ein Kontra oder Rekontra, das gegen Regel 19 verstößt. Regel 36 ist anzuwenden.','A. O contra sau o recontra nepermisă de Legea 19. Se aplică Legea 36.',1,'Ein Kontra oder Rekontra, das gegen Regel 19 verstößt. Regel 36 ist anzuwenden.','O contra sau o recontra nepermisă de Legea 19. Se aplică Legea 36.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1129,'35',1127,'B. Ein Gebot, Kontra oder Rekontra eines Spielers, der auf Pass gesetzt ist. Regel 37 ist','B. Ein Gebot, Kontra oder Rekontra eines Spielers, der auf Pass gesetzt ist. Regel 37 ist','B. Un anunț, o contra sau o recontra aparținând unui jucător obligat să paseze. Se',1,'Ein Gebot, Kontra oder Rekontra eines Spielers, der auf Pass gesetzt ist. Regel 37 ist
anzuwenden.','Un anunț, o contra sau o recontra aparținând unui jucător obligat să paseze. Se

aplică Legea 37.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1130,'35',1127,'C. Ein Gebot von mehr als sieben. Regel 38 ist anzuwenden.','C. Ein Gebot von mehr als sieben. Regel 38 ist anzuwenden.','C. Un anunț peste palierul de 7. Se aplică Legea 38.',1,'Ein Gebot von mehr als sieben. Regel 38 ist anzuwenden.','Un anunț peste palierul de 7. Se aplică Legea 38.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1131,'35',1127,'D. Eine Ansage nach dem abschließenden Pass. Regel 39 ist anzuwenden.','D. Eine Ansage nach dem abschließenden Pass. Regel 39 ist anzuwenden.','D. O declarație după pas-ul final al licitației. Se aplică Legea 39.',1,'Eine Ansage nach dem abschließenden Pass. Regel 39 ist anzuwenden.','O declarație după pas-ul final al licitației. Se aplică Legea 39.','apply_rule','[]');

-- Law 36
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1132,'36',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1133,'36',1132,'A. linker Gegner sagt vor der Korrektur an','A. linker Gegner sagt vor der Korrektur an','A. Adversarul din Stânga Jucătorului Vinovat Declară Înainte de Rectificare',1,'linker Gegner sagt vor der Korrektur an
Wenn der linke Gegner des schuldigen Spielers vor der Korrektur eines unzulässigen Kontras
oder Rekontras ansagt, werden die unzulässige und alle nachfolgenden Ansagen gestrichen.
Das Lizit geht an den Spieler zurück, der an der Reihe war anzusagen, und geht weiter, als
hätte es keine Regelwidrigkeit gegeben. Die Ausspielbeschränkungen nach Regel 26B sind
nicht anzuwenden.','Adversarul din Stânga Jucătorului Vinovat Declară Înainte de Rectificare
Dacă adversarul din stânga jucătorului vinovat declară înainte de rectificarea unei
contra sau recontra inadmisibile, declaraţia inadmisibilă şi toate declaraţiile ulterioare
se anulează. Licitaţia revine la jucătorul care era la rând şi continuă ca şi cum nu s-ar
fi produs nicio neregularitate. Nu se aplică restricţiile de atac din Legea 26B.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1134,'36',1132,'B. linker Gegner sagt nicht vor der Korrektur an','B. linker Gegner sagt nicht vor der Korrektur an','B. Adversarul din Stânga Jucătorului Vinovat Nu Declară Înainte de Rectificare',1,'linker Gegner sagt nicht vor der Korrektur an
Wenn Punkt A nicht zutrifft, dann gilt:

1. Jedes Kontra oder Rekontra, das nicht Regel 19 entspricht, wird gestrichen.

2. Der schuldige Spieler muss es durch eine zulässige Ansage ersetzen, das Lizit geht weiter,
und der Partner des schuldigen Spielers muss immer passen, wenn er an der Reihe ist
anzusagen.

3. Regel 72C kann anzuwenden sein. Die Ausspielbeschränkungen nach Regel 26B können
anzuwenden sein.

4. Wenn die Ansage außer der Reihe war, geht das Lizit an den Spieler zurück, der an der
Reihe war anzusagen, der schuldige Spieler kann jede regelkonforme Ansage machen, wenn
er an der Reihe ist, und sein Partner muss immer passen, wenn er an der Reihe ist anzusagen.
Regel 72C kann anzuwenden sein. Die Ausspielbeschränkungen nach Regel 26B können
anzuwenden sein.','Adversarul din Stânga Jucătorului Vinovat Nu Declară Înainte de Rectificare

Când nu se aplică A:

1. Orice contra sau recontra nepermisă de Legea 19 se anulează.

2. Jucătorul vinovat trebuie să facă o declaraţie înlocuitoare legală, licitaţia continuă,
și partenerul jucătorului vinovat trebuie să paseze ori de câte ori îi vine rândul să
declare.

3. Se poate aplica Legea 72C. Se pot aplica restricţiile de atac din Legea 26B.

4. Dacă declaraţia este și peste rând, licitaţia revine la jucătorul care era la rând,
jucătorul vinovat poate face orice declaraţie legală la rândul său, şi partenerul lui
trebuie să paseze ori de câte ori îi vine rândul să declare. Se poate aplica Legea
72C. Se pot aplica restricţiile de atac din Legea 26B.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1135,'36',1132,'C. Regelwidrigkeit erst nach der Lizitationsphase bemerkt','C. Regelwidrigkeit erst nach der Lizitationsphase bemerkt','C. Neregularitate Descoperită După Perioada de Licitație',1,'Regelwidrigkeit erst nach der Lizitationsphase bemerkt
Wenn die Aufmerksamkeit erstmals auf ein unzulässiges (Re-)Kontra gelenkt wird, nachdem
das erste Ausspiel aufgedeckt worden ist, wird der Endkontakt abgerechnet, wie wenn es die
unzulässige Ansage nicht gegeben hätte.','Neregularitate Descoperită După Perioada de Licitație

Când se atrage atenția asupra unei contre sau recontre inadmisibile abia după un
atac inițial pe față, scorul contractului final este calculat ca și cum declarația
inadmisibilă n-ar fi existat.','apply_rule','[]');

-- Law 37
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1136,'37',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1137,'37',1136,'A. linker Gegner sagt vor der Korrektur an','A. linker Gegner sagt vor der Korrektur an','A. Adversarul din Stânga Jucătorului Vinovat Declară Înainte de Rectificare',1,'linker Gegner sagt vor der Korrektur an
Wenn die unzulässige Ansage ein Gebot, Kontra oder Rekontra eines Spielers, der auf Pass
gesetzt ist, war (nicht aber ein Verstoß gegen Regel 19A1 oder 19B1) und der linke Gegner
des schuldigen Spielers ansagt, bevor der Turnierleiter eine Korrektur angeordnet hat, dann
stehen diese und alle nachfolgenden Ansagen. Wenn der schuldige Spieler den Rest der
Lizitation zu passen hatte, muss er immer noch passen, wenn er wieder an die Reihe kommt.
Die Ausspielbeschränkungen von Regel 26B sind nicht anzuwenden.','Adversarul din Stânga Jucătorului Vinovat Declară Înainte de Rectificare

Dacă declaraţia inadmisibilă este un anunţ, o contra sau o recontra aparținând unui
jucător obligat de lege să paseze (dar nu o acţiune contrară Legii 19A1 sau Legii
19B1) şi adversarul din stânga jucătorului vinovat declară înainte ca arbitrul să
impună o rectificare, acea declaraţie şi toate declaraţiile ulterioare rămân valabile.
Dacă jucătorul vinovat trebuia să paseze până la sfârşitul licitaţiei, el trebuie în
continuare să paseze în tururile următoare. Nu se aplică restricţiile de atac din Legea
26B.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1138,'37',1136,'B. linker Gegner sagt nicht vor der Korrektur an','B. linker Gegner sagt nicht vor der Korrektur an','B. Adversarul din Stânga Jucătorului Vinovat Nu Declară Înainte de Rectificare',1,'linker Gegner sagt nicht vor der Korrektur an
Wenn Punkt A nicht zutrifft, dann gilt:

1. Jedes Gebot, Kontra oder Rekontra eines Spielers, der auf Pass gesetzt ist, wird gestrichen.

2. Es wird durch Pass ersetzt, das Lizit geht weiter, und beide Spieler der schuldigen Seite
müssen immer passen, wenn sie an der Reihe sind anzusagen. Regel 72C und die
Ausspielbeschränkungen nach Regel 26B können anzuwenden sein.','Adversarul din Stânga Jucătorului Vinovat Nu Declară Înainte de Rectificare

Când nu se aplică A:

1. Orice anunţ, contra sau recontra de către un jucător obligat de lege să paseze se

anulează.

2. Declaraţia înlocuitoare este pas, licitaţia continuă şi ambii jucători ai axei vinovate
trebuie să paseze ori de câte ori le vine rândul să declare. Se poate aplica Legea
72C. Se pot aplica restricţiile de atac din Legea 26B.','apply_rule','[]');

-- Law 38
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1139,'38',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1140,'38',1139,'A. Spiel unzulässig','A. Spiel unzulässig','A. Joc Nepermis',1,'Spiel unzulässig
Ein Kontrakt von mehr als sieben kann nie gespielt werden.','Joc Nepermis

Nu se poate niciodată juca un contract peste palierul de 7.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1141,'38',1139,'B. Gebot und nachfolgende Ansagen gestrichen','B. Gebot und nachfolgende Ansagen gestrichen','B. Anunț și Declarații Subsecvente Anulate',1,'Gebot und nachfolgende Ansagen gestrichen
Ein Gebot von mehr als sieben wird gestrichen, ebenso alle nachfolgenden Ansagen.','Anunț și Declarații Subsecvente Anulate

Un anunț peste palierul de 7 este anulat împreună cu toate declarațiile subsecvente.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1142,'38',1139,'C. schuldige Seite muss passen','C. schuldige Seite muss passen','C. Axa Vinovată Trebuie să Paseze',1,'schuldige Seite muss passen
Es muss durch Pass ersetzt werden; das Lizit geht weiter, wenn es noch nicht zu Ende ist, und
beide Spieler der schuldigen Seite müssen immer passen, wenn sie an der Reihe sind
anzusagen.','Axa Vinovată Trebuie să Paseze

Declarația înlocuitoare este pas; licitația continuă dacă nu s-a încheiat deja, și ambii
jucători ai axei vinovate trebuie să paseze ori de câte ori le vine rândul să declare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1143,'38',1139,'D. Regel 26B und 72C','D. Regel 26B und 72C','D. Posibilitatea de a Aplica Legile 26B și 72C',1,'Regel 26B und 72C
Regel 72C und die Ausspielbeschränkungen von Regel 26B können anzuwenden sein, nicht
aber, wenn der linke Gegner des schuldigen Spielers nach dem Regelverstoß und vor der
Korrektur angesagt hat.','Posibilitatea de a Aplica Legile 26B și 72C

Se pot aplica Legea 72C şi restricţiile de atac din Legea 26B, mai puțin dacă
adversarul din stânga jucătorului vinovat a declarat după infracţiune și înainte de
rectificarea acesteia, caz în care nu se mai face recurs la aceste Legi.','apply_rule','[]');

-- Law 39
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1144,'39',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1145,'39',1144,'A. Ansagen gestrichen','A. Ansagen gestrichen','A. Declarații Anulate',1,'Ansagen gestrichen
Alle Ansagen nach dem abschließenden Pass sind gestrichen.','Declarații Anulate

Toate declaraţiile făcute după pas-ul final al licitaţiei sunt anulate.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1146,'39',1144,'B. Pass eines Gegenspielers oder Ansage der Seite des Alleinspielers','B. Pass eines Gegenspielers oder Ansage der Seite des Alleinspielers','B. Pas al unui Apărător sau Orice Declarație a Declarantului sau Mortului',1,'Pass eines Gegenspielers oder Ansage der Seite des Alleinspielers
Wenn der linke Gegner des schuldigen Spielers vor der Korrektur ansagt, oder wenn der
Regelverstoß ein Pass eines Gegenspielers oder irgendeine Ansage des zukünftigen
Alleinspielers oder Strohmanns ist, gibt es keine weitere Korrektur.','Pas al unui Apărător sau Orice Declarație a Declarantului sau Mortului

Dacă adversarul din stânga jucătorului vinovat declară după infracţiune și înainte de
rectificarea acesteia, sau dacă infracțiunea este un pas al unui apărător sau orice
declaraţie a viitorului declarant sau mort, nu există nicio altă rectificare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1147,'39',1144,'C. andere Aktion eines Gegenspielers','C. andere Aktion eines Gegenspielers','C. Altă Acțiune a unui Apărător',1,'andere Aktion eines Gegenspielers
Wenn der linke Gegner des schuldigen Spielers nicht nach dem Regelverstoß angesagt hat
und der Regelverstoß ein Gebot, Kontra oder Rekontra eines Gegenspielers ist, können die
Ausspielbeschränkungen von Regel 26B anzuwenden sein.','Altă Acțiune a unui Apărător

Dacă adversarul din stânga jucătorului vinovat nu declară după infracţiune și
infracțiunea este un anunț, o contra sau o recontra a unui apărător, atunci se pot
aplica restricțiile de atac din Legea 26B.','apply_rule','[]');

-- Law 40
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1148,'40',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1149,'40',1148,'A. Systemabmachungen der Spieler','A. Systemabmachungen der Spieler','A. Înțelegeri Sistemice',1,'Systemabmachungen der Spieler
1. (a) Vereinbarungen über die Methoden, die eine Partnerschaft verwendet, können explizit
durch Ausmachen oder implizit durch gemeinsame Erfahrung oder Wissen der Spieler
entstehen.

(b) Jede Partnerschaft ist verpflichtet, ihre Partnerschaftsvereinbarungen den Gegnern zur
Verfügung zu stellen. Der Zuständige Verband legt fest, wie das zu geschehen hat.

2. Jede Information, die dem Partner durch eine solche Vereinbarung übermittelt wird, muss
ausschließlich von den Ansagen, Spielzügen und Bedingungen der aktuellen Partie stammen.
Jeder Spieler darf die regelkonforme Lizitation, und soweit diese Regeln es nicht verbieten,
die Karten, die er gesehen hat, berücksichtigen. Er darf auch Informationen, deren
Verwendung sonst in diesen Regeln zugestanden wird, verwenden (siehe Regel 73C).

3. Ein Spieler kann jede Ansage und jeden Spielzug ohne vorherige Ankündigung wählen,
sofern eine solche Ansage bzw. ein solcher Spielzug nicht durch eine nicht offengelegte
Partnerschaftsvereinbarung geschützt ist (siehe Regel 40C1).

4. Die vereinbarte Bedeutung einer Ansage oder eines Spiels darf in einer Partnerschaft nicht
spielerbezogen unterschiedlich sein. (Dieses Verbot schränkt nicht Stil oder Blattbeurteilung
ein, sondern nur die Methode.)','Înțelegeri Sistemice

1.

a) Înţelegerile între parteneri privind metodele adoptate de parteneriat pot fi
atinse explicit, prin discuţii, sau implicit, prin experienţa de axă sau
cunoașterea jucătorilor.
b) Fiecare parteneriat are datoria de a-și pune înțelegerile parteneriale la
dispoziția adversarilor. Autoritatea Regulatoare stabileşte modul în care se
realizează acest lucru.

2. Informaţia transmisă partenerului prin aceste înţelegeri trebuie să provină din
declaraţii, jocuri şi condiţii specifice donei respective. Fiecare jucător are dreptul
să țină cont de licitaţia legală şi, când aceste legi nu dictează altfel, de cărţile
văzute. El are dreptul să folosească informaţii specificate oriunde în aceste legi ca
fiind autorizate (vezi Legea 73C).

3. Un jucător poate face orice declaraţie sau orice joc fără o notificare prealabilă atât
timp cât acea declaraţie sau acel joc nu se bazează pe o înţelegere partenerială
nedezvăluită (vezi legea 40C1).

4. Semnificația agreată a unei declarații sau a unui joc nu va diferi în funcție de care
dintre parteneri declară sau joacă (această cerință nu limitează stilul și judecata,
ci numai metodele).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1150,'40',1148,'B. Besondere Partnerschaftsvereinbarungen','B. Besondere Partnerschaftsvereinbarungen','B. Înțelegeri Speciale Între Parteneri',1,'Besondere Partnerschaftsvereinbarungen
1. (a) Eine Abmachung zwischen Partnern, egal ob explizit oder implizit, ist eine
Partnerschaftsvereinbarung.

(b) Ein Zuständiger Verband kann nach seinem Ermessen gewisse
Partnerschaftsvereinbarungen als „spezielle Partnerschaftsvereinbarungen“ bezeichnen. Eine
spezielle Partnerschaftsvereinbarung ist eine, deren Bedeutung nach Ansicht des Zuständigen
Verbandes von einem signifikanten Teil der Spieler in einem Turnier nicht sofort verstanden
werden muss.

(c) Wenn der Zuständige Verband es nicht anders festlegt, stellt jede Ansage mit einer
künstlichen Bedeutung eine spezielle Partnerschaftsvereinbarung dar.

2. (a) Der Zuständige Verband:

(i) ist ohne jede Einschränkung ermächtigt, jedwede spezielle Partnerschaftsvereinbarung
zuzulassen, zu verbieten, oder bedingt zuzulassen.

(ii) kann eine Konventionskarte, mit oder ohne Zusatzblätter, vorschreiben, auf der die
Partnerschaftsvereinbarungen im voraus anzugeben sind, sowie die Verwendung dieser
Konventionskarte regeln.

(iii) kann Alertprozeduren und/oder andere Methoden vorschreiben, wie die Methoden einer
Partnerschaft offenzulegen sind.

(iv) kann verbieten, dass eine Partnerschaft ihre Vereinbarungen während Lizitation oder
Spiel abhängig von Regelverstößen ihrer Gegner ändert.

(v) kann den Bluff künstlicher Ansagen beschränken.

(b) Wenn der Zuständige Verband es nicht anders festlegt, darf ein Spieler seine eigene
Konventionskarte vom Beginn der Lizitationsphase bis zum Ende des Spiels überhaupt nicht
ansehen; abweichend davon dürfen aber die Spieler der Seite des Alleinspielers (und nur
diese) ihre eigene Konventionskarte während der Klärungsphase ansehen.

(c) Wenn der Zuständige Verband es nicht anders festlegt, darf ein Spieler die
Konventionskarte seiner Gegner ansehen:

(i) vor dem Beginn der Lizitation,

(ii) während der Klärungsphase,

(iii) während Lizitation und Spiel, jedoch nur wenn er selbst an der Reihe ist, und

(iv) nach einer gegnerischen Bitte um Auskunft nach Regel 20F, um die Bedeutung einer
Ansage oder eines Spiels seines Partners richtig erklären zu können.

(d) Wenn der Zuständige Verband nichts anderes verfügt, stehen einem Spieler während der
Lizitationsphase und des Spiels keine Hilfen für Gedächtnis, Berechnungen, Lizit- oder
Spieltechnik zu.
3. (a) Wenn eine Seite dadurch geschädigt worden ist, dass ihre Gegner die Bedeutung einer
Ansage oder eines Spieles nicht diesen Regeln gemäß offengelegt haben, dann steht ihr eine
Korrektur in Form eines Berichtigten Scores zu.

(b) Wiederholte Verstöße gegen die Verpflichtung, Partnerschaftsvereinbarungen
offenzulegen, können bestraft werden.

4. Wenn eine Seite dadurch geschädigt worden ist, dass ihre Gegner eine spezielle
Partnerschaftsvereinbarung verwendet haben, die nicht mit den verbandseigenen
Bestimmungen für dieses Turnier in Einklang steht, ist ein berichtigtes Ergebnis zuzuweisen.
Über eine Seite, die gegen solche verbandseigenen Bestimmungen verstoßen hat, kann eine
Ordnungsstrafe verhängt werden.

5. (a) Wenn ein Spieler die Bedeutung einer Ansage oder eines Spielzugs seines Partners auf
Grund einer Frage eines Gegners erklärt (siehe Regel 20), muss er alle besonderen
Informationen, die er aus Partnerschaftsvereinbarung oder –erfahrung hat, offenlegen. Er
braucht aber keine Schlüsse offenzulegen, die aus seinem Wissen und seiner Erfahrung
stammen, wie sie Bridgespielern allgemein bekannt sind.

(b) Der Turnierleiter weist ein Berichtigtes Ergebnis zu, wenn eine zurückgehaltene
Information für die Wahl einer Aktion des Gegners entscheidend war und dieser dadurch
geschädigt worden ist.','Înțelegeri Speciale Între Parteneri

1.

a) Un acord între parteneri, fie el explicit sau implicit, este o înțelegere

partenerială.

b) La discreţia Autorității Regulatoare, anumite înţelegeri parteneriale pot fi
desemnate ca „înţelegeri parteneriale speciale”. O înţelegere partenerială
specială este una a cărei semnificaţie, în opinia Autorităţii Regulatoare, ar
putea să nu fie uşor înţeleasă şi anticipată de un număr semnificativ de
jucători din turneu.

c) Dacă Autoritatea Regulatoare nu decide altfel, orice declarație artificială

constituie o înțelegere specială între parteneri.

2.

a) Autoritatea Regulatoare:

i. Este împuternicită fără restricţii să permită, să interzică, sau să permită

condiţionat orice înţelegere partenerială specială.

ii. Poate prescrie o fişă de convenţii, cu sau fără note suplimentare,
pentru înscrierea în avans a înţelegerilor parteneriale, şi poate
reglementa utilizarea acestei fişe.

iii. Poate prescrie procedura de alertare şi/sau alte metode de dezvăluire a

înţelegerilor parteneriale.

iv. Poate interzice acordurile prealabile ale unui parteneriat privind
varierea propriilor înțelegeri în timpul licitației sau jocului după o
neregularitate adversă.

v. Poate limita utilizarea declarațiilor artificiale psihice.
b) Dacă Autoritatea Regulatoare nu decide altfel, un jucător nu-și poate consulta
propria fişă de convenții din momentul în care a început perioada de licitaţie
până la sfârşitul jocului, cu excepţia că (doar) declarantul și mortul își pot
consulta propria fişă de convenții în timpul Perioadei de Clarificare.

c) Dacă Autoritatea Regulatoare nu decide altfel, un jucător poate consulta fişa

de convenții a adversarilor:

i.

Înainte de începerea licitației,

ii.

În timpul Perioadei de Clarificare,

iii.

În timpul licitației și jocului, dar numai când este rândul lui, și

iv. Când un adversar îi cere o explicație, în baza Legii 20F, cu scopul de a
descrie corect semnificația declarației sau jocului partenerului său.

d) Dacă Autoritatea Regulatoare nu decide altfel, un jucător nu poate folosi niciun
ajutor de memorie, calcul sau tehnică în timpul perioadei de licitație și jocului.

3.

a) O axă prejudiciată de faptul că adversarii nu au dezvăluit, conform cerințelor
acestor legi, semnificația unei declaraţii sau a unui joc este îndreptăţită la
rectificare prin acordarea unui scor ajustat.

b) Se pot penaliza violările repetate ale obligației de dezvăluire a înțelegerilor

parteneriale.

4. Când o axă este prejudiciată prin folosirea de către adversari a unei înţelegeri
parteneriale speciale care contravine regulamentului turneului respectiv, scorul va
fi ajustat. O axă vinovată de acest tip de infracţiune poate fi penalizată procedural.

5.

a) Când explică semnificaţia declaraţiei sau jocului partenerului în replică la o
întrebare a unui adversar (vezi Legea 20), un jucător va dezvălui toate
informaţiile speciale care i-au fost transmise prin înţelegere partenerială sau
prin experienţă partenerială, dar nu are datoria să dezvăluie concluzii rezultate
din cunoştinţele şi experienţa lui despre lucruri cunoscute în general jucătorilor
de bridge.

b) Arbitrul ajustează scorul dacă dintr-o explicaţie lipsește o informație crucială
pentru alegerea unei acţiuni de către un adversar, care este astfel prejudiciat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1151,'40',1148,'C. Abweichungen vom System und Bluffs','C. Abweichungen vom System und Bluffs','C. Deviere de la Sistem și Declarații Psihice',1,'Abweichungen vom System und Bluffs
1. Ein Spieler darf von den bekannt gegebenen Vereinbarungen seiner Partnerschaft
abweichen, solange sein Partner nicht mehr Grund als die Gegner hat, solch ein Abweichen zu
erwarten [siehe aber oben Absatz B2(a)(v)]. Wiederholtes Abweichen führt zu einer
impliziten Vereinbarung, die dann Teil der Methoden der Partnerschaft ist und im Einklang
mit den Bestimmungen über die Bekanntgabe des Systems offenzulegen ist. Wenn nach dem
Urteil des Turnierleiters nicht offengelegtes Wissen die Gegner geschädigt hat, soll er ein
berichtigtes Ergebnis zuweisen; er kann eine Ordnungsstrafe verhängen.

2. Vom oben in Punkt C1 beschriebenen Fall abgesehen, ist kein Spieler verpflichtet, seinen
Gegnern zu eröffnen, dass er von seinen bekannt gegebenen Methoden abgewichen ist.

3. Wenn der Zuständige Verband es nicht anders festlegt, darf ein Spieler während der
Lizitationsphase und der Spielphase keine Gedächtnisstützen, Rechenhilfen oder Hilfsmittel
für seine Spieltechnik verwenden','Deviere de la Sistem și Declarații Psihice

1. Un jucător se poate abate de la înţelegerile parteneriale anunţate de axa sa atât
timp cât partenerul său nu are mai multe motive de a fi conştient de această
abatere decât adversarii. Abaterile repetate duc la înţelegeri implicite, care devin
parte din metodele parteneriale şi trebuie dezvăluite conform reglementărilor
privind oferirea de informaţii despre sistem. Dacă arbitrul apreciază că există
informaţii nedezvăluite care au prejudiciat adversarii, el va ajusta scorul şi poate
dicta o penalizare procedurală.

2. Cu excepția cazurilor de la C1, niciun jucător nu are vreo obligație să divulge

adversarilor faptul că el s-a abătut de la metodele anunțate.','apply_rule','[]');

-- Law 41
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1152,'41',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1153,'41',1152,'A. verdecktes erstes Ausspiel','A. verdecktes erstes Ausspiel','A. Atac cu Cartea pe Spate',1,'verdecktes erstes Ausspiel
Nachdem auf ein Gebot, Kontra oder Rekontra drei Pass in der Reihe gefolgt sind, spielt der
Gegenspieler links vom vermuteten Alleinspieler verdeckt aus41.1. Dieses verdeckte Ausspiel
kann nur zurückgenommen werden, wenn der Turnierleiter es nach einer Regelwidrigkeit

41.1 Der Zuständige Verband kann anordnen, dass das erste Ausspiel offen erfolgt.
anordnet (siehe Regel 47E und 54); die zurückgenommene Karte wird dann wieder in das
Blatt des Gegenspielers aufgenommen.','Atac cu Cartea pe Spate

Când după un anunţ, o contra sau o recontra au urmat 3 pas-uri în rotație, apărătorul
din stânga presupusului declarant face atacul inițial cu cartea pe spate9. Atacul cu
cartea pe spate poate fi retras doar la instrucțiunile arbitrului după o neregularitate
(vezi Legile 47E și 54); cartea retrasă trebuie reîncadrată în mâna apărătorului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1154,'41',1152,'B. Wiederholung der Lizitation und Fragen','B. Wiederholung der Lizitation und Fragen','B. Recapitularea Licitației și Întrebări',1,'Wiederholung der Lizitation und Fragen
Bevor das verdeckte Ausspiel aufgedeckt wird, können sowohl der Partner des Ausspielers als
auch der vermutete Alleinspieler (nicht aber der vermutete Strohmann) eine Wiederholung der
Lizitation oder eine Auskunft über eine gegnerische Ansage verlangen (siehe Regel 20F2 und
20F3). Der Alleinspieler41.2 und jeder der beiden Gegenspieler können, wenn sie das erste Mal
zu spielen an der Reihe sind, eine Wiederholung der Lizitation verlangen; dieses Recht
erlischt, wenn er eine Karte spielt. Die Gegenspieler (für die allerdings Regel 16 gilt) und der
Alleinspieler haben während der ganzen Spielphase das Recht, Auskünfte zu verlangen, und
zwar jeder, wenn er zu spielen an der Reihe ist41.3.','Recapitularea Licitației și Întrebări

Înainte de întoarcerea pe faţă a cărţii de atac, partenerul jucătorului care atacă şi
presupusul declarant (dar nu şi presupusul mort) pot fiecare să ceară o recapitulare a
licitaţiei sau o explicaţie legată de o declaraţie adversă (vezi Legea 20F2 şi 20F3).
Declarantul10 sau oricare dintre apărători poate cere, la primul său rând de a juca, o
recapitulare a licitaţiei; acest drept expiră când el joacă o carte. Apărătorii (sub
incidenţa Legii 16) şi declarantul își păstrează dreptul de a cere explicaţii în timpul
jocului, fiecare la rândul său11 de a juca.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1155,'41',1152,'C. erstes Ausspiel aufgedeckt','C. erstes Ausspiel aufgedeckt','C. Întoarcerea pe Față a Cărții de Atac',1,'erstes Ausspiel aufgedeckt
Nach dieser Klärungsphase wird das erste Ausspiel aufgedeckt. Die Spielphase beginnt
unwiderruflich, und das Blatt des Strohmanns wird aufgelegt (siehe aber Regel 54A bei einem
aufgedeckten Ausspiel außer der Reihe). Nachdem es für die Wiederholung der Lizitation zu
spät ist (siehe Punkt B), können der Alleinspieler und jeder der beiden Gegenspieler, wenn sie
an der Reihe sind zu spielen, fragen, welcher Kontrakt gespielt wird, und ob, aber nicht von
wem, er allenfalls kontriert oder rekontriert worden ist.','Întoarcerea pe Față a Cărții de Atac

După Perioada de Clarificare, atacul este întors pe faţă, perioada de joc începe
irevocabil, şi mortul își etalează mâna (dar vezi Legea 54A pentru un atac iniţial
peste rând cu cartea pe faţă). După ce este prea târziu pentru repetarea licitației
(vezi B), declarantul sau oricare apărător, la rândul său de a juca, are dreptul să afle
ce contract se joacă şi dacă, dar nu şi de către cine, contractul este contrat sau
recontrat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1156,'41',1152,'D. Strohmann wird aufgedeckt','D. Strohmann wird aufgedeckt','D. Mâna Mortului',1,'Strohmann wird aufgedeckt
Nachdem das erste Ausspiel aufgedeckt worden ist, legt der Strohmann sein Blatt vor sich auf
den Tisch, mit der Bildseite nach oben, nach Farben sortiert, die Karten innerhalb der Farben
der Größe nach mit der kleinsten dem Alleinspieler am nächsten, und in von einander
getrennten Kolonnen mit den Schmalseiten Richtung Alleinspieler. Atout liegen vom
Strohmann aus gesehen rechts. Der Alleinspieler spielt sein eigenes Blatt und das des
Strohmanns.','Mâna Mortului

După ce atacul inițial devine vizibil, mortul îşi etalează mâna în faţa lui, pe masă,
sortată pe culori și în ordinea rangului cărţilor, cu cărţile cele mai mici înspre
declarant, şi în coloane distincte cu lungimea orientată către declarant. Atuurile sunt
aşezate în coloana din dreapta mortului. Declarantul joacă atât cărțile din mâna sa
cât şi pe cele din mâna mortului.','apply_rule','[]');

-- Law 42
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1157,'42',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1158,'42',1157,'A. absolute Rechte','A. absolute Rechte','A. Drepturi Absolute',1,'absolute Rechte
1. Der Strohmann darf in Gegenwart des Turnierleiters zu Tatsachen oder Rechtsfragen
Auskunft geben.

2. Er darf die gewonnenen und verlorenen Stiche mitzählen.

3. Er spielt die Karten des Strohmanns als Erfüllungsgehilfe des Alleinspielers nach dessen
Weisungen und sorgt dafür, dass der Strohmann Farbe bedient (siehe Regel 45F, wenn der
Strohmann eine Spieldurchführung nahelegt).

41.2 Der Alleinspieler spielt das erste Mal vom Strohmann, wenn er nicht ein Ausspiel außer der Reihe
angenommen hat.
41.3 Der Alleinspieler darf sowohl fragen, wenn er vom Strohmann zu spielen hat, als auch wenn er an
der Reihe ist, aus der Hand zu spielen.','Drepturi Absolute

9 Autoritatea Regulatoare poate dispune ca atacul inițial să se facă cu cartea pe față.
10 Primul rând de a juca al declarantului este de la mort, mai puțin când el acceptă un atac inițial peste rând.
11 Declarantul poate pune întrebări când e rândul său să joace din mână sau din mort.
1. Mortul are dreptul să dea informaţii, în prezenţa arbitrului, în ceea ce privește

faptele sau legea.

2. El poate să ţină socoteala levatelor pierdute și câştigate.

3. El manevrează cărțile din mort ca agent al declarantului, la indicaţiile acestuia, și
se asigură că mortul dă la culoare (vezi Legea 45F pentru joc sugerat de mort).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1159,'42',1157,'B. bedingte Rechte','B. bedingte Rechte','B. Drepturi Condiționate',1,'bedingte Rechte
Andere Rechte kann der Strohmann ausüben, wenn er nicht den Beschränkungen der Regel 43
unterliegt.

1. Der Strohmann darf den Alleinspieler (nicht aber einen Gegenspieler) fragen, wenn dieser
nicht Farbe bedient hat, ob er eine Karte der ausgespielten Farbe hat.

2. Er darf versuchen, eine Regelwidrigkeit zu verhindern.

3. Er darf nach Ende des Spiels die Aufmerksamkeit auf eine Regelwidrigkeit lenken.','Drepturi Condiționate

Mortul are și alte drepturi, dar supuse limitărilor din Legea 43.

1. Mortul poate să întrebe declarantul (dar nu şi pe un apărător), când acesta nu dă

la culoare la o levată, dacă are o carte în culoarea jucată.

2. El poate încerca să prevină orice neregularitate.

3. El poate atrage atenţia asupra unei neregularităţi, dar numai după ce jocul s-a

terminat.','apply_rule','[]');

-- Law 43
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1160,'43',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1161,'43',1160,'A. Beschränkungen des Strohmanns','A. Beschränkungen des Strohmanns','A. Limitări ale Drepturilor Mortului',1,'Beschränkungen des Strohmanns
1. Soweit es nicht durch Regel 42 gestattet ist, ist es dem Strohmann streng verboten:

(a) während des Spiels einen Ruf nach dem Turnierleiter einzuleiten, sofern nicht schon ein
anderer Spieler die Aufmerksamkeit auf einen Regelverstoß gelenkt hat;

(b) während des Spiels die Aufmerksamkeit auf einen Regelverstoß zu lenken;

(c) sich am Spiel zu beteiligen, oder den Alleinspieler über irgend etwas, das das Spiel
betrifft, zu informieren.

2. (a) Der Strohmann darf nicht mit dem Alleinspieler die Blätter austauschen.

(b) Der Strohmann darf nicht seinen Platz verlassen, um dem Alleinspieler beim Spielen
zuzusehen.

(c) Der Strohmann darf nicht auf die Bildseite einer Karte im Blatt eines Gegenspielers
schauen.

3. Ein Gegenspieler darf dem Strohmann nicht sein Blatt zeigen.','Limitări ale Drepturilor Mortului

1.

a) Mortul nu poate iniția chemarea arbitrului în timpul jocului, decât dacă un alt

jucător a atras atenția asupra neregularității.

b) Mortul nu poate să atragă atenţia asupra unei neregularităţi în timpul jocului.

c) Mortul trebuie să nu participe la joc şi nu are voie să comunice ceva despre

joc declarantului.

2.

a) Mortul și declarantul nu-și pot vedea reciproc mâna.

b) Mortul nu-și poate părăsi locul pentru a privi jocul declarantului.

c) Mortul nu se poate uita la o carte din mâna unui apărător.

3. Un apărător nu are voie să-și arate mâna către mort.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1162,'43',1160,'B. Bei einem Verstoß','B. Bei einem Verstoß','B. Limitări Încălcate',1,'Bei einem Verstoß
1. Der Strohmann kann für Verstöße gegen die in Punkt A1 und A2 festgelegten
Beschränkungen nach Regel 90 bestraft werden.

2. Wenn der Strohmann nach einem Verstoß gegen die Beschränkungen von Punkt A2:

(a) den Alleinspieler warnt, nicht von der falschen Seite zu spielen, kann jeder der beiden
Gegenspieler entscheiden, aus welchem Blatt der Alleinspieler zu spielen hat.

(b) als erster den Alleinspieler fragt, ob ein Spiel aus seiner Hand eine Revoke darstellt, dann
muss der Alleinspieler eine regelkonforme Karte zugeben, wenn sein Spiel regelwidrig war,
und die Bestimmungen von Regel 64 werden angewandt, wie wenn eine etablierte Revoke
vorläge.

3. Wenn der Strohmann nach einem Verstoß gegen die Beschränkungen von Punkt A2 als
erster die Aufmerksamkeit auf eine gegnerische Regelwidrigkeit lenkt, gibt es keine
automatische Korrektur. Das Spiel wird fortgesetzt, wie wenn es keine Regelwidrigkeit
gegeben hätte. Wenn sich nach dem Spiel herausstellt, dass die Gegenspieler aus ihrer
Regelwidrigkeit einen Vorteil gezogen haben, weist der Turnierleiter nur ihnen ein
berichtigtes Ergebnis zu, um ihnen diesen Vorteil wieder zu nehmen. Die Seite des
Alleinspielers behält das Tischergebnis.','Limitări Încălcate

1. Mortul este pasibil de penalizare conform Legii 90 pentru orice încălcare a

limitărilor din A1 și A2.

2. Dacă, după ce încalcă limitările din A2, mortul:
a) Avertizează declarantul să nu joace din mâna greșită, orice apărător poate

alege mâna din care va juca declarantul.

b) Este primul care îl întreabă pe declarant dacă nu cumva jocul său din mână
constituie o renonsă, declarantul trebuie să furnizeze o carte corectă în loc,
dacă jocul său a fost ilegal, și se aplică Legea 64 ca și cum renonsa ar fi
consumată.

3. Dacă, după ce încalcă limitările din A2, mortul este primul care atrage atenția
asupra unei neregularități a unui apărător, nu are loc nicio rectificare imediată.
Jocul continuă ca și cum nu s-ar fi produs nicio neregularitate. La sfârșitul jocului,
dacă apărătorii au avut de câștigat din propria neregularitate, arbitrul ajustează
scorul numai pentru axa lor, înlăturând avantajul respectiv. Pentru cealaltă axă
rămâne valabil scorul obținut la masă.','apply_rule','[]');

-- Law 44
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1163,'44',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1164,'44',1163,'A. Ausspiel zu einem Stich','A. Ausspiel zu einem Stich','A. Atac în Cadrul unei Levate',1,'Ausspiel zu einem Stich
Der Spieler, der zu einem Stich ausspielt, kann jede Karte in seinem Blatt ausspielen (wenn er
nicht einer Beschränkung nach einem Regelverstoß seiner Seite unterliegt).','Atac în Cadrul unei Levate

Jucătorul care atacă în cadrul unei levate poate să joace orice carte pe care o are în
mână (mai puțin dacă are restricţii din cauza unei neregularităţi a axei sale).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1165,'44',1163,'B. nachfolgende Karten zu einem Stich','B. nachfolgende Karten zu einem Stich','B. Jocuri Subsecvente la o Levată',1,'nachfolgende Karten zu einem Stich
Nach dem Ausspiel spielt jeder Spieler der Reihe nach eine Karte, und diese vier Karten
ergeben einen Stich. (Für die Art, wie Karten zu spielen und Stiche anzuordnen sind, siehe
Regel 45 bzw. 65.)','Jocuri Subsecvente la o Levată

După atac, fiecare din ceilalţi jucători joacă o carte la rândul său, si cele patru cărţi
astfel jucate constituie o levată. (Pentru maniera de joc al cărţilor şi pentru aranjarea
levatelor vezi Legile 45, respectiv 65.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1166,'44',1163,'C. Pflicht Farbe zu bekennen','C. Pflicht Farbe zu bekennen','C. Obligația de a Da la Culoare',1,'Pflicht Farbe zu bekennen
Wenn ein Spieler zu einem Stich eine Karte zugibt, muss er wenn möglich Farbe bekennen.
Diese Verpflichtung hat Vorrang vor allen anderen Verpflichtungen nach diesen Regeln.','Obligația de a Da la Culoare

Fiecare jucător care joacă la o levată trebuie să dea la culoare, dacă este posibil.
Această obligaţie are prioritate față de toate celelalte cerințe ale acestor legi.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1167,'44',1163,'D. Unmöglichkeit, Farbe zu bekennen','D. Unmöglichkeit, Farbe zu bekennen','D. Inabilitatea de a Da la Culoare',1,'Unmöglichkeit, Farbe zu bekennen
Wenn ein Spieler nicht Farbe bekennen kann, kann er jede Karte zugeben (wenn er nicht einer
Beschränkung nach einem Regelverstoß seiner Seite unterliegt).','Inabilitatea de a Da la Culoare

Dacă un jucător nu poate da la culoare, el poate să joace orice carte (mai puțin dacă
are restricţii din cauza unei neregularităţi a axei sale).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1168,'44',1163,'E. Stiche mit Atout','E. Stiche mit Atout','E. Levate care Conțin Atuuri',1,'Stiche mit Atout
Ein Stich, in dem sich ein Atout befindet, wird von dem Spieler gewonnen, der das höchste
Atout gespielt hat.','Levate care Conțin Atuuri

O levată care conține cel puțin un atu este câștigată de jucătorul care a furnizat atuul
cel mai mare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1169,'44',1163,'F. Stiche ohne Atout','F. Stiche ohne Atout','F. Levate care Nu Conțin Atuuri',1,'Stiche ohne Atout
Ein Stich, in dem sich kein Atout befindet, wird von dem Spieler gewonnen, der die höchste
Karte der ausgespielten Farbe gespielt hat.','Levate care Nu Conțin Atuuri

O levată care nu conţine atuuri este câştigată de jucătorul care a furnizat cartea cea
mai mare în culoarea atacată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1170,'44',1163,'G. Ausspiel zu Stichen nach dem ersten','G. Ausspiel zu Stichen nach dem ersten','G. Atac la Levatele Subsecvente',1,'Ausspiel zu Stichen nach dem ersten
Zum nächsten Stich wird aus dem Blatt ausgespielt, das den vorherigen gewonnen hat.','Atac la Levatele Subsecvente

Atacul la levata următoare se face din mâna jucătorului care a câştigat ultima levată.','apply_rule','[]');

-- Law 45
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1171,'45',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1172,'45',1171,'A. Spiel einer Karte aus einem Blatt','A. Spiel einer Karte aus einem Blatt','A. Jocul unei Cărți din Mână',1,'Spiel einer Karte aus einem Blatt
Jeder Spieler außer dem Strohmann spielt eine Karte, indem er sie aus seinem Blatt nimmt
und sie mit der Bildseite nach oben45.1 unmittelbar vor sich auf den Tisch legt.','Jocul unei Cărți din Mână

Fiecare jucător, exceptând mortul, joacă o carte detaşând-o din mâna sa şi aşezând-
o în dreptul lui pe masă, cu faţa în sus12.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1173,'45',1171,'B. Spiel einer Karte des Strohmanns','B. Spiel einer Karte des Strohmanns','B. Jocul unei Cărți de la Mort',1,'Spiel einer Karte des Strohmanns
Der Alleinspieler spielt eine Karte des Strohmanns, indem er sie nennt; danach nimmt der
Strohmann die Karte und legt sie mit der Bildseite nach oben auf den Tisch. Wenn nötig, kann
der Alleinspieler eine Karte des Strohmanns auch spielen, indem er sie selbst nimmt.

45.1 Das erste Ausspiel erfolgt verdeckt, wenn der Zuständige Verband nichts anders anordnet.','Jocul unei Cărți de la Mort

Declarantul joacă o carte de la mort numind-o, după care mortul ia cartea şi o aşază
cu faţa în sus pe masă. Când joacă de la mort, declarantul poate, dacă este necesar,
să-și ia singur cartea dorită.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1174,'45',1171,'C. Karte gilt als gespielt','C. Karte gilt als gespielt','C. Carte Considerată Jucată',1,'Karte gilt als gespielt
1. Eine Karte eines Gegenspielers, die so gehalten worden ist, dass es für seinen Partner
möglich war, die Bildseite zu sehen, gilt als zum aktuellen Stich gespielt. (Wenn der Spieler
bereits eine regelkonforme Karte zu diesem Stich gespielt hat, siehe Regel 45E.)

2. Eine Karte aus dem Blatt des Alleinspielers gilt als gespielt, wenn sie

(a) mit der Bildseite nach oben gehalten worden ist, wobei sie den Tisch berührt oder beinahe
berührt hat; oder

(b) einige Zeit in einer derartigen Position gehalten worden ist, dass sie als gespielt zu
erkennen war.

3. Eine Karte des Strohmanns ist gespielt, wenn der Alleinspieler sie absichtlich berührt hat,
außer um die Karten zu ordnen, oder eine Karte über oder unter den berührten zu erreichen.

4. (a) Eine Karte ist gespielt, wenn sie ein Spieler als die Karte, die er zu spielen beabsichtigt,
nennt oder sonst wie bezeichnet (siehe aber Regel 47).

(b) Der Alleinspieler kann eine unbeabsichtigte Bezeichnung einer Karte des Strohmanns so
lange ändern, bis er das nächste Mal eine Karte aus seinem Blatt oder dem des Strohmanns
spielt. Eine Änderung der Bezeichnung kann gestattet werden, wenn er sich nur versprochen
hat, nicht aber wenn er unkonzentriert war oder einen neuen Plan gemacht hat. Wenn ein
Gegenspieler in der Reihe eine Karte gespielt hat, die vor der Änderung zulässig war, kann er
diese Karte in sein Blatt zurücknehmen und durch eine andere ersetzen (siehe Regel 47D und
16C1).

5. Eine (große oder kleine) Strafkarte kann gespielt werden müssen (siehe Regel 50).','Carte Considerată Jucată

1. O carte a unui apărător ţinută în aşa fel încât este posibil ca partenerul său să o
vadă trebuie jucată la levata în curs (dacă apărătorul a jucat deja o carte legală la
levata curentă, vezi Legea 45E).

2. Declarantul trebuie să joace o carte din mână dacă aceasta este:

a) ţinută cu faţa în sus, atingând sau aproape atingând masa; sau

b) menținută într-o poziție care sugerează că a fost jucată.

3. O carte a mortului trebuie jucată dacă a fost atinsă deliberat de către declarant,
altfel decât cu intenţia de a aranja cărţile mortului sau de a ajunge la o carte de
deasupra sau dedesubtul cărţii sau cărților atinse.

4.

a) O carte trebuie jucată dacă un jucător o numeşte sau o desemnează în vreun

fel ca fiind cea pe care şi-a propus să o joace (dar vezi Legea 47).

b) Declarantul poate corecta o desemnare neintenționată a unei cărți de la mort
cât timp el nu a jucat din nou fie din mână, fie de la mort. O asemenea
schimbare este permisă în cazul unei erori în vorbire, dar nu pentru o pierdere
de concentrare sau o răzgândire. Dacă un adversar a jucat, la rândul său, o
carte legală înaintea schimbării desemnării, acest adversar poate să-şi retragă
cartea astfel jucată, să o reaşeze în mână şi să o înlocuiască cu alta (vezi
Legile 47D şi 16C1).

5. O carte penalizată, majoră sau minoră, ar putea trebui jucată (vezi Legea 50).','apply_rule','["45E", "47", "47D", "16C1", "50"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1175,'45',1171,'D. Strohmann nimmt eine nicht genannte Karte','D. Strohmann nimmt eine nicht genannte Karte','D. Mortul Joacă o Carte pe care Declarantul Nu a Cerut-o',1,'Strohmann nimmt eine nicht genannte Karte
1. Wenn der Strohmann eine Karte, die der Alleinspieler nicht genannt hat, in die Position
einer gespielten Karte legt, muss die Karte zurückgenommen werden, wenn die
Aufmerksamkeit darauf gelenkt worden ist, bevor beide Seiten zum nächsten Stich gespielt
haben. Ein Gegenspieler kann dann eine Karte in sein Blatt zurücknehmen, die er nach dem
Fehler, aber bevor die Aufmerksamkeit darauf gelenkt worden ist, gespielt hat. Wenn der
rechte Gegner des Alleinspielers sein Spiel ändert, kann auch der Alleinspieler eine danach
gespielte Karte zurücknehmen. (siehe Regel 16C)

2. Wenn es zu spät ist, die vom Strohmann falsch gespielte Karte zurück zu nehmen (siehe
oben), geht das Spiel normal und ohne Änderung der zu diesem oder einem folgenden Stich
gespielten Karten weiter. Wenn die falsch gelegte Karte die erste des Stiches war, kann eine
Revoke vorliegen, wenn nicht eine Karte der Farbe der falsch gelegten Karte zugegeben
worden ist (siehe Regel 64A, 64B7 und 64C). Wenn die falsch gelegte Karte zu einem Stich
zugegeben worden ist, der bereits im Gange war, und der Strohmann dadurch eine Revoke
begangen hat, siehe Regel 64B3 und 64C.','Mortul Joacă o Carte pe care Declarantul Nu a Cerut-o

1. Dacă mortul poziționează ca fiind jucată o carte pe care declarantul nu a numit-o,
cartea trebuie retrasă dacă se atrage atenţia asupra ei înainte ca ambele axe să fi

12 Atacul inițial se face cu cartea mai întâi pe spate, în caz că Autoritatea Regulatoare nu decide altfel.
jucat la levata următoare, şi un apărător poate să retragă şi să reaşeze în mână o
carte jucată după eroare dar înainte să se fi atras atenţia asupra ei; dacă
adversarul din dreapta declarantului își schimbă cartea jucată, declarantul îşi
poate retrage şi el cartea jucată consecutiv la levata respectivă (vezi Legea 16C).

2. Când este prea târziu pentru a schimba cartea jucată greșit de către mort (vezi
mai sus), jocul continuă normal fără modificarea cărților jucate la această levată
sau la orice levată următoare. Când cartea jucată greșit a fost prima carte a
levatei, jocul unei cărți de altă culoare în levata respectivă poate constitui o
renonsă (vezi Legile 64A, 64B7 și 64C). Când cartea a fost jucată greșit la o
levată deja începută și reprezintă o renonsă de la mort, vezi Legile 64B3 și 64C.','apply_rule','["16C", "64A", "64B7", "64C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1176,'45',1171,'E. fünfte Karte eines Stichs','E. fünfte Karte eines Stichs','E. A Cincea Carte Jucată la o Levată',1,'fünfte Karte eines Stichs
1. Eine fünfte Karte, die ein Gegenspieler zu einem Stich zugibt, wird eine Strafkarte und
unterliegt Regel 50, wenn sie nicht nach dem Urteil des Turnierleiters ausgespielt worden ist
und daher Regel 53 oder 56 anzuwenden ist.

2. Eine fünfte Karte, die der Alleinspieler aus seinem Blatt oder vom Strohmann zu einem
Stich zugibt, wird ohne weitere Korrektur wieder in das Blatt zurückgegeben, wenn sie nicht
nach dem Urteil des Turnierleiters ausgespielt worden ist und daher Regel 55 anzuwenden ist.','A Cincea Carte Jucată la o Levată

1. O a cincea carte furnizată la o levată de către un apărător devine carte
penalizată, supusă Legii 50, mai puțin dacă arbitrul consideră că a fost atacată,
caz în care se aplică Legea 53 sau 56.

2. Când declarantul furnizează o a cincea carte la o levată, din mână sau de la mort,
aceasta este reîncadrată în mâna respectivă fără altă rectificare, mai puțin dacă
arbitrul consideră că a fost atacată, caz în care se aplică Legea 55.','apply_rule','["50", "53", "56", "55"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1177,'45',1171,'F. Strohmann bezeichnet eine Karte','F. Strohmann bezeichnet eine Karte','F. Mortul Indică o Carte',1,'Strohmann bezeichnet eine Karte
Nachdem das Blatt des Strohmanns aufgedeckt worden ist, darf der Strohmann ohne
Anweisung des Alleinspielers keinesfalls eine Karte berühren oder bezeichnen (außer um sie
zu ordnen). Tut er es dennoch, hat der Turnierleiter unverzüglich gerufen und über die Aktion
informiert zu werden. Das Spiel wird fortgesetzt. Nach dem Spiel muss der Turnierleiter ein
berichtigtes Ergebnis zuweisen, wenn nach seinem Urteil der Strohmann dem Alleinspieler
ein Spiel nahegelegt hat und die Gegenspieler durch dieses geschädigt worden sind.','Mortul Indică o Carte

După ce își etalează mâna, mortul nu poate să atingă sau să indice vreo carte (mai
puțin în scopul aranjării) decât la instrucțiunile declarantului. Atunci când o face,
arbitrul trebuie chemat şi informat imediat. Jocul continuă. La sfârşitul jocului, arbitrul
va acorda un scor ajustat dacă apreciază că mortul i-a sugerat un joc declarantului şi
adversarii au fost prejudiciaţi de jocul sugerat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1178,'45',1171,'G. Umdrehen der Karten','G. Umdrehen der Karten','G. Întoarcerea pe Spate a Cărților',1,'Umdrehen der Karten
Kein Spieler soll seine Karte umdrehen, bevor alle vier Spieler zum Stich gespielt haben.','Întoarcerea pe Spate a Cărților

Niciun jucător n-ar trebui să-și întoarcă propria carte pe spate înainte ca toţi cei patru
jucători să fi jucat la levata respectivă.','apply_rule','[]');

-- Law 46
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1179,'46',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1180,'46',1179,'A. korrekte Form','A. korrekte Form','A. Modul Corect de a Desemna o Carte a Mortului',1,'korrekte Form
Wenn der Alleinspieler eine Karte des Strohmanns verlangt, hat er sowohl Farbe als auch
Rang klar zu nennen.','Modul Corect de a Desemna o Carte a Mortului

Când cere jucarea unei cărți de la mort, declarantul ar trebui să precizeze clar atât
culoarea cât și rangul cărții dorite.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1181,'46',1179,'B. unvollständige oder ungültige Bezeichnung','B. unvollständige oder ungültige Bezeichnung','B. Desemnare Incompletă sau Invalidă',1,'unvollständige oder ungültige Bezeichnung
Wenn der Alleinspieler die vom Strohmann zu spielende Karte unvollständig oder ungültig
bezeichnet, dann gelten die nachstehenden Beschränkungen (wenn die Absicht des
Alleinspielers nicht unwiderleglich eine andere war):

1. (a) Wenn der Alleinspieler „hoch“ oder etwas Gleichbedeutendes sagt, wird angenommen,
dass er die höchste Karte der gespielten Farbe verlangt hat.

(b) Wenn der Alleinspieler den Strohmann anweist zu „stechen“, wird angenommen, dass er
die niedrigste Karte der gespielten Farbe verlangt hat, von der bekannt ist, dass sie den Stich
gewinnen wird.

(c) Wenn der Alleinspieler „klein“ oder etwas Gleichbedeutendes sagt, wird angenommen,
dass er die niedrigste Karte der gespielten Farbe verlangt hat.

2. Wenn der Alleinspieler eine Farbe, aber keinen Rang genannt hat, wird angenommen, dass
er die niedrigste Karte der genannten Farbe verlangt hat.

3. Wenn der Alleinspieler einen Rang, aber keine Farbe genannt hat, dann

(a) wird beim Ausspiel angenommen, dass er die Farbe weiterspielt, in der der Strohmann den
vorangegangenen Stich gewonnen hat, sofern eine solche Karte vorhanden ist.
(b) muss der Alleinspieler in allen anderen Fällen eine Karte dieses Ranges spielen, wenn das
regelkonform möglich ist; gibt es aber zwei oder mehrere solche Karten, muss er angeben,
welche er gemeint hat.

4. Wenn der Alleinspieler eine Karte verlangt, die sich nicht im Blatt des Strohmanns
befindet, ist dieses Abrufen nichtig, und der Alleinspieler kann jede regelkonforme Karte
verlangen.

5. Wenn der Alleinspieler ein Spiel bezeichnet, ohne Farbe oder Rang zu nennen (wie zum
Beispiel „irgend etwas“ oder „egal“), kann jeder der beiden Gegenspieler bestimmen, welche
Karte vom Strohmann zu spielen ist.','Desemnare Incompletă sau Invalidă

În cazul unei desemnări incomplete sau invalide, se aplică următoarele restricţii (mai
puțin când intenţia declarantului este incontestabil diferită):

1.
a) Dacă declarantul cere „mare” sau un termen asemănător, se consideră că a

cerut cea mai mare carte din culoarea atacată.

b) Dacă îi indică mortului să „câștige” levata, se consideră că a cerut cea mai

mică carte despre care se ştie că va câştiga levata.

c) Dacă cere „mic” sau un termen asemănător, se consideră că a cerut cea mai

mică carte din culoarea atacată.

2. Dacă declarantul numește o culoare dar nu şi un rang, se consideră că a cerut

cea mai mică carte din culoarea indicată.

3. Dacă declarantul numește un rang dar nu și o culoare:

a) Când e la atac, se consideră că declarantul continuă culoarea cu care mortul a
câştigat levata precedentă, cu condiţia să existe o carte de acel rang în acea
culoare.

b) În toate celelalte cazuri, declarantul trebuie să joace o carte de rangul
respectiv de la mort, dacă poate să o facă legal; dar dacă există două sau mai
multe asemenea cărţi, declarantul trebuie să o indice pe cea dorită.

4. Dacă declarantul cere o carte care nu se află la mort, cererea este invalidă şi

declarantul poate să ceară orice carte legală.

5. Dacă declarantul indică un joc fără a desemna nici culoarea nici rangul (ca, de
exemplu, zicând “joacă orice” sau ceva similar), oricare apărător poate desemna
cartea jucată de la mort.','apply_rule','[]');

-- Law 47
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1182,'47',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1183,'47',1182,'A. Im Zuge einer Korrektur','A. Im Zuge einer Korrektur','A. În Cursul unei Rectificări',1,'Im Zuge einer Korrektur
Eine bereits gespielte Karte kann zurückgenommen werden, wenn es die Korrektur nach einer
Regelwidrigkeit erfordert. (Die zurückgenommene Karte eines Gegenspielers kann zur
Strafkarte werden, siehe Regel 50.)','În Cursul unei Rectificări

O carte jucată poate fi retrasă când rectificarea unei neregularități o cere (dar cartea
retrasă de un apărător poate deveni carte penalizată, vezi Legea 49).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1184,'47',1182,'B. Korrektur eines regelwidrigen Spiels','B. Korrektur eines regelwidrigen Spiels','B. Pentru a Corecta un Joc Ilegal',1,'Korrektur eines regelwidrigen Spiels
Eine bereits gespielte Karte kann zurückgenommen werden, um ein regelwidriges Spiel
richtig zu stellen (für Gegenspieler, siehe abgesehen für den in dieser Regel behandelten Fall
Regel 49 – Strafkarte). Für gleichzeitiges Spiel siehe Regel 58.','Pentru a Corecta un Joc Ilegal

O carte jucată poate fi retrasă pentru a corecta un joc ilegal (pentru apărători, cu
excepțiile prevăzute în această Lege, vezi Legea 49 – carte penalizată). Pentru joc
simultan, vezi Legea 58.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1185,'47',1182,'C. Änderung einer unbeabsichtigten Bezeichnung','C. Änderung einer unbeabsichtigten Bezeichnung','C. Pentru a Schimba o Desemnare Neintenționată',1,'Änderung einer unbeabsichtigten Bezeichnung
Eine bereits gespielte Karte kann nach einer Änderung einer Bezeichnung gemäß Regel
45C4(b) zurückgenommen und ohne weitere Korrektur dem Blatt wieder hinzugefügt werden.','Pentru a Schimba o Desemnare Neintenționată

O carte jucată poate fi retrasă şi reîncadrată în mână fără altă rectificare după o
schimbare de desemnare permisă de Legea 45C4b).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1186,'47',1182,'D. Gegner hat sein Spiel geändert','D. Gegner hat sein Spiel geändert','D. După o Carte Înlocuită de un Adversar',1,'Gegner hat sein Spiel geändert
Nachdem ein Gegner sein Spiel geändert hat, kann eine gespielte Karte ohne weitere
Korrektur ins Blatt zurückgenommen und durch eine andere Karte ersetzt werden. (Regel 16C
und 62C2 können anzuwenden sein.)','După o Carte Înlocuită de un Adversar
După ce un adversar își schimbă cartea jucată, o carte jucată poate fi retrasă şi
reîncadrată în mână fără altă rectificare şi se poate juca o altă carte în loc. (Se aplică
Legile 16C şi 62C2.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1187,'47',1182,'E. Änderung wegen falscher Auskunft','E. Änderung wegen falscher Auskunft','E. Carte Înlocuită După o Dezinformare',1,'Änderung wegen falscher Auskunft
1. Ein Ausspiel außer der Reihe (oder Spiel einer Karte) wird ohne weitere Korrektur
zurückgenommen, wenn ein Spieler von seinem Gegner fälschlich informiert worden ist, dass
er an der Reihe wäre zu spielen (siehe Regel 16C). In diesem Fall darf ein Ausspiel oder Spiel
vom linken Gegner überhaupt nicht angenommen werden. Regel 63A1 ist nicht anzuwenden.

2. (a) Ein Spieler darf ohne weitere Korrektur eine Karte zurücknehmen, die er wegen einer
falschen Auskunft über eine Ansage oder ein Spiel des Gegners und vor deren Richtigstellung
gespielt hat, aber nur, wenn danach keine Karte gespielt worden ist (siehe Regel 16C). Ein
erstes Ausspiel darf nicht zurückgenommen werden, nachdem der Strohmann irgendeine
Karte aufgedeckt hat.

(b) Wenn es für eine Korrektur nach (a) zu spät ist, kann der Turnierleiter ein Berichtigtes
Ergebnis zuweisen.','Carte Înlocuită După o Dezinformare

1. Un atac (sau joc) peste rând este retras fără altă rectificare dacă jucătorul a fost
informat greşit de către un adversar că era rândul său să atace sau joace (vezi
Legea 16C). Un astfel de atac sau joc nu poate fi acceptat de adversarul din
stânga, și nu se aplică Legea 63A1.

2.

a) Un jucător poate să-şi retragă fără altă rectificare cartea pe care a jucat-o din
cauza unei explicaţii greșite a unei declaraţii sau a unui joc advers și înainte
ca explicația să fie corectată, dar numai dacă nu s-a mai jucat nicio carte în
continuare (vezi Legea 16C). Un atac iniţial nu mai poate fi retras după ce
mortul şi-a etalat cel puţin o carte.

b) Când este prea târziu pentru a corecta un joc conform a), arbitrul poate acorda

un scor ajustat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1188,'47',1182,'F. sonstiges Zurückziehen','F. sonstiges Zurückziehen','F. Alte Retrageri',1,'sonstiges Zurückziehen
1. Ein Karte kann gemäß Regel 53B zurückgenommen werden.

2. Abgesehen von den in dieser Regel behandelten Fällen kann eine schon gespielte Karte
nicht zurückgenommen werden.','Alte Retrageri

1. O carte poate fi retrasă conform Legii 53B.

2. Exceptând situaţiile prevăzute în această Lege, o carte jucată nu poate fi retrasă.','apply_rule','[]');

-- Law 48
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1189,'48',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1190,'48',1189,'A. Karte des Alleinspielers wird sichtbar','A. Karte des Alleinspielers wird sichtbar','A. Declarantul Expune o Carte',1,'Karte des Alleinspielers wird sichtbar
Der Alleinspieler unterliegt keinen Beschränkungen, wenn er eine Karte sichtbar gemacht hat
(siehe aber Regel 45C2), und keine Karte des Alleinspielers oder Strohmanns wird je zur
Strafkarte. Der Alleinspieler muss Karten, die ihm unabsichtlich aus dem Blatt gefallen sind,
nicht spielen.','Declarantul Expune o Carte

Nu există restricţii pentru expunerea unei cărţi a declarantului (dar vezi Legea 45C2),
şi nicio carte din mâna declarantului sau a mortului nu devine vreodată carte
penalizată. Declarantul nu este obligat să joace o carte scăpată accidental din mână.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1191,'48',1189,'B. Alleinspieler deckt Karten auf','B. Alleinspieler deckt Karten auf','B. Declarantul își Arată Cărțile',1,'Alleinspieler deckt Karten auf
1. Wenn der Alleinspieler nach einem ersten Ausspiel außer der Reihe seine Karten aufdeckt,
ist Regel 54 anzuwenden.

2. Wenn der Alleinspieler zu einem anderen Zeitpunkt seine Karten aufdeckt, wird
angenommen, dass er einen Claim oder Verzicht gemacht hat (außer das war nachweislich
nicht seine Absicht), und Regel 68 ist dann anzuwenden.','Declarantul își Arată Cărțile

1. Când declarantul îşi etalează cărţile după un atac iniţial peste rând, se aplică

Legea 54.

2. Când declarantul îşi arată cărţile altcândva decât imediat după un atac iniţial
peste rând, se poate considera că a făcut o revendicare sau o concesiune de
levate (mai puțin când intenţia sa este demonstrabil alta), şi atunci se aplică
Legea 68.','apply_rule','[]');

-- Law 49
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1192,'49',NULL,1,'Wenn, abgesehen vom normalen Spielverlauf oder der Anwendung der Regeln, eine Karte
eines Gegenspielers in einer Position ist, dass sein Partner möglicherweise ihre Bildseite hätte
sehen können, oder wenn ein Gegenspieler eine Karte als in seinem Blatt befindlich nennt,
wird jede solche Karte zur Strafkarte (Regel 50); siehe aber Regel 68, wenn sich ein
Gegenspieler zum aktuellen, noch nicht fertig gespielten Stich geäußert hat, und Regel 68B2,
wenn ein Gegenspieler einem Verzicht seines Partners widerspricht.','Exceptând în cursul normal al jocului sau al aplicării legilor (vezi, de exemplu, Legea
47E), când o carte a unui apărător este poziționată astfel încât partenerul său ar
putea să o vadă, sau când un apărător numeşte o carte ca fiind în mâna sa, fiecare
asemenea carte devine carte penalizată (Legea 50); dar vezi Legea 68, când un
apărător face o afirmație despre levata în curs, şi vezi Legea 68B2 când partenerul
obiectează la concesia făcută de un apărător.','apply_rule','[]');

-- Law 50
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1193,'50',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1194,'50',1193,'A. eine Strafkarte bleibt aufgedeckt','A. eine Strafkarte bleibt aufgedeckt','A. Cartea Penalizată Rămâne Expusă',1,'eine Strafkarte bleibt aufgedeckt
Eine Strafkarte muss mit der Bildseite nach oben unmittelbar vor dem Spieler, dem sie gehört,
auf dem Tisch liegen bleiben, bis eine Korrektur gewählt worden ist.','Cartea Penalizată Rămâne Expusă

O carte penalizată trebuie să rămână expusă pe masă, în faţa jucătorului căruia îi
aparţine, până când a fost aleasă o rectificare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1195,'50',1193,'B. große oder kleine Strafkarte','B. große oder kleine Strafkarte','B. Carte Penalizată Majoră sau Minoră',1,'große oder kleine Strafkarte
Eine einzelne kleine Karte, die unabsichtlich sichtbar geworden ist (etwa, wenn zwei Karten
zu einem Stich gespielt werden, oder wenn eine Karte aus dem Blatt fällt), wird zur kleinen
Strafkarte. Jede Figur und jede absichtlich durch Spielen sichtbar gewordene Karte (etwa
durch ein Ausspiel außer der Reihe oder die Berichtigung einer Revoke) wird eine große
Strafkarte. Wenn ein Gegenspieler mehr als eine Strafkarte hat, werden sie alle große
Strafkarten.','Carte Penalizată Majoră sau Minoră

O singură carte de rang inferior unui onor şi expusă neintenţionat (ca, de exemplu,
jucând două cărţi la o levată, sau scăpând o carte accidental din mână) devine carte
penalizată minoră. Orice onor sau orice carte expusă printr-un joc deliberat (ca, de
exemplu, un atac peste rând, sau o renonsă corectată) devine carte penalizată
majoră; când un apărător are două sau mai multe cărţi penalizate, toate aceste cărţi
devin cărţi penalizate majore.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1196,'50',1193,'C. Vorgehen bei einer kleinen Strafkarte','C. Vorgehen bei einer kleinen Strafkarte','C. Utilizarea unei Cărți Penalizate Minore',1,'Vorgehen bei einer kleinen Strafkarte
Wenn ein Gegenspieler eine kleine Strafkarte hat, darf er keine andere kleine Karte dieser
Farbe spielen, solange er nicht die Strafkarte gespielt hat; er darf aber statt dieser eine Figur
spielen. Sein Partner unterliegt keinen Ausspielbeschränkungen, siehe aber unten Punkt E.','Utilizarea unei Cărți Penalizate Minore

Când un apărător are o carte penalizată minoră, el nu poate juca nicio altă carte de
rang inferior unui onor din acea culoare fără a fi jucat mai întâi cartea penalizată, dar
poate juca un onor. Partenerul jucătorului vinovat nu are restricţii de atac, dar vezi E
mai jos.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1197,'50',1193,'D. Vorgehen bei einer großen Strafkarte','D. Vorgehen bei einer großen Strafkarte','D. Utilizarea unei Cărți Penalizate Majore',1,'Vorgehen bei einer großen Strafkarte
Wenn ein Gegenspieler eine große Strafkarte hat, können sowohl er als auch sein Partner
Beschränkungen unterliegen, und zwar der schuldige Spieler, wenn er an der Reihe ist zu
spielen, und sein Partner, wenn er an der Reihe ist auszuspielen.

1. (a) Abgesehen von dem in (b) geregelten Fall, muss eine große Strafkarte bei der ersten
regelkonformen Gelegenheit gespielt werden, sei es beim Ausspielen, Zugeben, Abwerfen
oder beim Schnappen. Wenn ein Gegenspieler zwei oder mehr Strafkarten hat, die er
regelkonform spielen kann, entscheidet der Alleinspieler, welche gespielt werden soll.

(b) Die Verpflichtung, Farbe zu bekennen oder einer Ausspiel- oder Spielbeschränkung zu
folgen, hat Vorrang gegenüber der Verpflichtung, eine große Strafkarte zu spielen, doch muss
die Strafkarte mit der Bildseite nach oben auf dem Tisch liegen bleiben und bei der nächsten
regelkonformen Gelegenheit gespielt werden.

2. Wenn ein Gegenspieler am Ausspiel ist, während sein Partner eine große Strafkarte hat,
darf er nicht ausspielen, bevor der Alleinspieler eine der nachstehenden Möglichkeiten
gewählt hat (wenn er vorzeitig ausspielt, unterliegt er einer Korrektur nach Regel 49):

(a) Er kann das Ausspiel der Farbe der Strafkarte verlangen50.1 oder solange verbieten50.1, als
dieser Gegenspieler am Ausspiel bleibt (bei zwei oder mehr Strafkarten siehe Regel 51);
wenn sich der Alleinspieler für eine dieser beiden Möglichkeiten entscheidet, ist die Karte
keine Strafkarte mehr und wird wieder ins Blatt genommen.

(b) Er kann darauf verzichten, eine der in (a) genannten Möglichkeiten zu wählen. Dann kann
der Gegenspieler jede beliebige Karte ausspielen, und die Strafkarte bleibt als solche auf dem
Tisch liegen.50.2 In diesem Fall ist Regel 50D weiterhin anzuwenden, solange die Strafkarte
besteht.','Utilizarea unei Cărți Penalizate Majore

Când un apărător are o carte penalizată majoră, atât jucătorul vinovat cât şi
partenerul său pot fi supuşi restricţiilor, jucătorul vinovat oricând e la rând să joace,
partenerul oricând e la rând să atace.

1.

a) Exceptând cazul b) de mai jos, o carte penalizată majoră trebuie jucată cu
prima ocazie legală, care poate fi un atac, un joc la culoare, o defosă sau un
tai. Dacă un apărător are două sau mai multe cărţi penalizate care pot fi jucate
legal, declarantul desemnează cartea care trebuie jucată.

b) Obligaţia de a da la culoare sau de a se conforma unei restricţii de atac sau de
joc primează asupra obligaţiei de a juca o carte penalizată majoră, dar cartea
penalizată rămâne expusă pe masă și trebuie jucată la următoarea ocazie
legală.
2. Când un apărător e la atac în timp ce partenerul său are o carte penalizată
majoră, el nu poate ataca până ce declarantul nu alege una dintre opţiunile de
mai jos (dacă apărătorul atacă prematur, el se supune rectificărilor din Legea 49).
Declarantul poate alege:

a) Să îi ceară apărătorului să atace culoarea cărții penalizate, sau să îi interzică13
să atace această culoare cât timp păstrează atacul (pentru două sau mai
multe cărţi penalizate, vezi Legea 51); dacă declarantul alege una din aceste
opţiuni, cartea respectivă nu mai este penalizată şi este reîncadrată în mână.

b) Să nu ceară sau interzică un atac, caz în care apărătorul poate ataca orice
carte și cartea penalizată rămâne pe masă drept carte penalizată14. Dacă este
selectată această opţiune, Legea 50D continuă să se aplice atât timp cât
cartea rămâne penalizată.','apply_rule','["49", "51", "50D"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1198,'50',1193,'E. Information aus einer Strafkarte','E. Information aus einer Strafkarte','E. Informația Provenită dintr-o Carte Penalizată',1,'Information aus einer Strafkarte
1. Jede Information aus einer Strafkarte und die Verpflichtung, sie zu spielen, sind erlaubte
Information für alle Spieler, solange die Strafkarte auf dem Tisch liegt.

2. Eine Information, die aus einer Strafkarte stammt, die wieder ins Blatt zurückgenommen
wurde [wie gemäß Regel 50D2(a)], ist unerlaubt für den Partner der Spielers, der die
Strafkarte hatte (siehe Regel 16C), aber erlaubt für den Alleinspieler.

50.1 Wenn der Spieler nicht wie gewünscht ausspielen kann, siehe Regel 59.
50.2 Wenn der Partner des Spielers mit der Strafkarte am Ausspiel bleibt und die Strafkarte noch nicht
gespielt worden ist, gelten alle Auflagen und Wahlmöglichkeiten von Regel 50D2 wieder am nächsten
Stich.
3. Wenn eine Strafkarte gespielt worden ist, ist eine Information aus den Umständen, unter
denen sie entstanden ist, unerlaubt für den Partner der Spielers, der die Strafkarte hatte. (Für
eine noch nicht gespielte Strafkarte siehe oben Punkt E1.)

4. Wenn Punkt E1 angewandt worden ist und der Turnierleiter nach Ende des Spiels zur
Auffassung kommt, dass ohne die Hilfe der Strafkarte das Ergebnis des Boards leicht hätte
anders sein können und die nichtschuldige Seite in Folge dessen geschädigt worden ist (siehe
Regel 12B1), muss er ein Berichtigtes Ergebnis zuweisen. Dabei soll er sich bemühen, das
ohne die Strafkarte(n) wahrscheinliche Ergebnis auf dem Board möglichst genau zu
rekonstruieren.','Informația Provenită dintr-o Carte Penalizată

1. Informația provenită dintr-o carte penalizată și din obligația de a juca acea carte
este autorizată pentru toți jucătorii cât timp cartea penalizată rămâne pe masă.

2. Informația provenită dintr-o carte penalizată care a fost reîncadrată în mână
[conform Legii 50D2a)] este neautorizată pentru partenerul jucătorului care a avut
cartea penalizată (vezi Legea 16C), dar autorizată pentru declarant.

3. Odată jucată o carte penalizată, informația provenită din circumstanțele în care ea
a fost creată este neautorizată pentru partenerul jucătorului care a avut cartea.
(Pentru o carte penalizată care nu a fost încă jucată, vezi E1 mai sus.)

4. Dacă, după aplicarea punctului E1, arbitrul apreciază la sfârșitul jocului că fără
ajutorul cărții expuse rezultatul donei ar fi putut în bună măsură să fie altul, și prin
urmare axa nevinovată este prejudiciată (vezi Legea 12B1), el va acorda un scor
ajustat. În ajustare, el ar trebui să urmărească să recupereze pe cât posibil
rezultatul probabil al donei în lipsa efectului cărții sau cărților penalizate.','apply_rule','["50D2(a)", "16C", "59", "12B1"]');

-- Law 51
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1199,'51',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1200,'51',1199,'A. schuldiger Spieler an der Reihe','A. schuldiger Spieler an der Reihe','A. La Rândul Jucătorului Vinovat',1,'schuldiger Spieler an der Reihe
Wenn ein Gegenspieler an der Reihe ist zu spielen und dieser Spieler zwei oder mehr
Strafkarten hat, die regelkonform gespielt werden können, bestimmt der Alleinspieler, welche
Karte zu diesem Stich gespielt werden soll.','La Rândul Jucătorului Vinovat

Dacă, la rândul său de a juca, un apărător are două sau mai multe cărţi penalizate
care pot fi jucate legal, declarantul desemnează care din ele trebuie jucată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1201,'51',1199,'B. Partner des schuldigen Spielers an der Reihe','B. Partner des schuldigen Spielers an der Reihe','B. La Rândul de a Ataca al Partenerului Jucătorului Vinovat',1,'Partner des schuldigen Spielers an der Reihe
1. (a) Wenn ein Gegenspieler zwei oder mehr Strafkarten in einer Farbe hat, und der
Alleinspieler von dessen Partner das Ausspiel dieser Farbe verlangt51.1, dann sind die Karten
dieser Farbe keine Strafkarten mehr und werden wieder ins Blatt genommen; der
Gegenspieler kann zu diesem Stich jede regelkonforme Karte spielen.

(b) Wenn ein Gegenspieler zwei oder mehr Strafkarten in einer Farbe hat, und der
Alleinspieler dessen Partner das Ausspiel dieser Farbe verbietet51.1, dann nimmt der
Gegenspieler alle Karten dieser Farbe wieder ins Blatt zurück und kann zu diesem Stich jede
regelkonforme Karte spielen. Das Verbot besteht, solange der Spieler am Ausspiel bleibt.

2. (a) Wenn ein Gegenspieler Strafkarten in mehr als einer Farbe hat [siehe Regel 50D2(a)]
und sein Partner am Ausspiel ist, kann der Alleinspieler von dessen Partner das Ausspiel einer
jeden solchen Farbe verlangen51.1 [Punkt B1(a) ist dann anzuwenden].

(b) Wenn ein Gegenspieler Strafkarten in mehr als einer Farbe hat und sein Partner am
Ausspiel ist, kann der Alleinspieler dessen Partner verbieten51.1, eine oder mehrere dieser
Farben auszuspielen; der Gegenspieler nimmt dann alle Strafkarten in einer derart verbotenen
Farbe wieder in sein Blatt zurück und kann jede regelkonforme Karte zu diesem Stich spielen.
Das Verbot besteht, solange der Spieler am Ausspiel bleibt.

(c) Wenn ein Gegenspieler Strafkarten in mehr als einer Farbe hat und sein Partner am
Ausspiel ist, kann der Alleinspieler darauf verzichten, ein Ausspiel zu verlangen oder zu
verbieten. Dann kann der Partner des Schuldigen jede Karte ausspielen, und die Strafkarten

51.1 Wenn der Spieler nicht wie gewünscht ausspielen kann, siehe Regel 59.
bleiben als solche51.2 auf dem Tisch liegen. In diesem Fall sind Regel 50 und 51 weiterhin
anzuwenden, solange die Strafkarten bleiben.','La Rândul de a Ataca al Partenerului Jucătorului Vinovat

1.

a) Când un apărător are două sau mai multe cărţi penalizate în aceeaşi culoare
şi declarantul îi cere13 partenerului acestuia să atace acea culoare, cărțile din

13 Dacă jucătorul nu poate ataca așa cum i s-a cerut, vezi Legea 59.
14 Dacă partenerul apărătorului care are o carte penalizată rămâne la atac și cartea penalizată nu a fost încă jucată, la levata
următoare se aplică din nou toate cerințele și opțiunile Legii 50D2.
culoarea respectivă nu mai sunt cărţi penalizate şi sunt reîncadrate în mână;
apărătorul poate juca orice carte legală la levata respectivă.

b) Când un apărător are două sau mai multe cărţi penalizate în aceeaşi culoare
şi declarantul îi interzice13 partenerului acestuia să atace acea culoare, cărțile
din culoarea respectivă nu mai sunt cărţi penalizate şi sunt reîncadrate în
mână, şi apărătorul poate juca orice carte legală la levata respectivă.
Interdicţia continuă cât timp jucătorul rămâne la atac.

2.

a) Când un apărător are cărţi penalizate în mai multe culori [vezi Legea 50D2a)]
şi partenerul său este la atac, declarantul îi poate cere15 acestuia să atace o
anume culoare în care apărătorul are o carte penalizată (dar apoi se aplică
punctul B1a) de mai sus).

b) Când un apărător are cărţi penalizate în mai multe culori şi partenerul său este
la atac, declarantul îi poate interzice acestuia să atace una sau mai multe din
aceste culori; apoi apărătorul reîncadrează în mână fiecare carte penalizată
din culorile interzise de declarant și face orice joc legal la levata respectivă.
Interdicţia continuă cât timp jucătorul rămâne la atac.

c) Când un apărător are cărţi penalizate în mai multe culori şi partenerul său este
la atac, declarantul poate alege să nu ceară sau interzică un atac, caz în care
partenerul apărătorului poate ataca orice carte și cărțile penalizate rămân pe
masă drept cărți penalizate16. Dacă este selectată această opţiune, Legile 50
și 51 continuă să se aplice atât timp cât rămân cărți penalizate.','apply_rule','[]');

-- Law 52
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1202,'52',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1203,'52',1202,'A. Gegenspieler spielt eine Strafkarte nicht','A. Gegenspieler spielt eine Strafkarte nicht','A. Apărătorul Omite să Joace o Carte Penalizată',1,'Gegenspieler spielt eine Strafkarte nicht
Wenn ein Gegenspieler eine Strafkarte nicht ausspielt oder spielt, wozu er nach Regel 50 oder
51 verpflichtet wäre, darf er nicht aus eigenem Antrieb eine andere Karte, die er statt dessen
gespielt hat, zurücknehmen.','Apărătorul Omite să Joace o Carte Penalizată

Când un jucător omite să atace sau să joace o carte penalizată conform cerințelor
Legilor 50 și 51, el nu poate să-și retragă din proprie inițiativă o altă carte jucată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1204,'52',1202,'B. Gegenspieler spielt statt dessen eine andere Karte','B. Gegenspieler spielt statt dessen eine andere Karte','B. Apărătorul Joacă o Altă Carte',1,'Gegenspieler spielt statt dessen eine andere Karte
1. (a) Wenn ein Gegenspieler eine andere Karte gespielt oder ausgespielt hat, wenn ihn die
Regeln verpflichtet hätten, eine Strafkarte zu spielen, kann der Alleinspieler ein solches
Ausspiel oder Spiel annehmen.

(b) Der Alleinspieler muss ein solches Ausspiel oder Spiel annehmen, wenn er danach von
seiner eigenen Hand oder vom Strohmann gespielt hat.

(c) Wenn die gespielte Karte gemäß Absatz (a) oder (b) angenommen worden ist, bleibt jede
ungespielte Strafkarte eine Strafkarte.

2. Wenn der Alleinspieler die regelwidrig gespielte Karte nicht annimmt, muss der
Gegenspieler stattdessen die Strafkarte spielen. Jede im Zuge dieser Regelwidrigkeit
regelwidrig gespielte Karte des Gegenspielers wird zur großen Strafkarte.','Apărătorul Joacă o Altă Carte

1.

a) Dacă un apărător a atacat sau jucat o altă carte când era obligat de lege să

joace o carte penalizată, declarantul poate accepta acest atac sau joc.

b) Declarantul trebuie să accepte un asemenea atac sau joc dacă el a jucat în

continuare din mână sau de la mort.

c) Dacă o carte jucată este acceptată conform a) sau b), orice carte penalizată

nejucată rămâne carte penalizată.

15 Dacă jucătorul nu poate ataca așa cum i s-a cerut, vezi Legea 59.
16 Dacă partenerul apărătorului care are cărți penalizate rămâne la atac, la levata următoare se aplică din nou toate
cerințele și opțiunile Legii 51B2.
2. Dacă declarantul nu acceptă cartea atacată sau jucată ilegal, apărătorul trebuie
să joace în loc cartea penalizată. Orice carte atacată sau jucată ilegal de către
apărător în cursul neregularității devine carte penalizată majoră.','apply_rule','[]');

-- Law 53
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1205,'53',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1206,'53',1205,'A. Ausspiel außer der Reihe als korrekt behandelt','A. Ausspiel außer der Reihe als korrekt behandelt','A. Atac Peste Rând Tratat ca Atac Corect',1,'Ausspiel außer der Reihe als korrekt behandelt
Vor dem 13. Stich53.1 kann jedes Ausspiel außer der Reihe als korrekt behandelt werden
(siehe aber Regel 47E1). Es wird zum korrekten Ausspiel, wenn je nach dem der Alleinspieler
oder einer der Gegenspieler eine diesbezügliche Erklärung abgibt, oder aus dem nächsten
Blatt in der Reihe hinter dem regelwidrigen Ausspiel gespielt wird (siehe aber Punkt B.).
Wenn es nicht derart angenommen wird, ordnet der Turnierleiter an, dass vom korrekten Blatt
ausgespielt werde (und siehe Regel 47B).','Atac Peste Rând Tratat ca Atac Corect

Înainte de levata a treisprezecea17, orice atac peste rând cu cartea pe faţă poate fi
tratat ca un atac corect (dar vezi Legea 47E1). Devine un atac corect dacă
declarantul sau orice apărător, după caz, îl acceptă printr-o afirmaţie în acest sens,
sau dacă se joacă o carte din mâna de după cea din care s-a făcut atacul
neregulamentar (dar vezi B). Dacă nu există o asemenea acceptare sau joc, arbitrul
va cere ca atacul să se facă din mâna corectă (şi vezi Legea 47B).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1207,'53',1205,'B. Korrektes Ausspiel nach dem regelwidrigen','B. Korrektes Ausspiel nach dem regelwidrigen','B. Atac Corect Ulterior Atacului Neregulamentar',1,'Korrektes Ausspiel nach dem regelwidrigen
Vorbehaltlich Regel 53A gilt: Wenn ein Gegner des Spielers, der außer der Reihe ausgespielt
hat, auszuspielen an der Reihe war, dann kann dieser Gegner zu diesem Stich ausspielen,
ohne dass angenommen wird, er habe zum regelwidrigen Ausspiel zugegeben. Dann steht das
korrekte Ausspiel, und alle Karten, die fehlerhaft zu diesem Stich gespielt worden sind,
können zurückgenommen werden, doch gilt Regel 16C.

51.2 Wenn der Partner des Spielers mit der Strafkarte am Ausspiel bleibt und die Strafkarte noch nicht
gespielt worden ist, gelten alle Auflagen und Wahlmöglichkeiten von Regel 51B2 wieder am nächsten
Stich.
53.1 Ein Ausspiel außer der Reihe zum 13. Stich muss zurückgenommen werden.','Atac Corect Ulterior Atacului Neregulamentar

Sub rezerva Legii 53A, dacă un adversar al jucătorului care a atacat peste rând era
de drept la atac, acest adversar își poate face atacul cuvenit la levata la care s-a
comis infracţiunea fără să se considere că a jucat în continuarea atacului
neregulamentar. În această situaţie, atacul corect rămâne valabil şi toate cărţile
jucate eronat la această levată pot fi retrase, dar se aplică Legea 16C.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1208,'53',1205,'C. Falscher Gegenspieler spielt zum regelwidrigen Ausspiel des Alleinspielers','C. Falscher Gegenspieler spielt zum regelwidrigen Ausspiel des Alleinspielers','C. Apărătorul Greșit Joacă la Atacul Neregulamentar al Declarantului',1,'Falscher Gegenspieler spielt zum regelwidrigen Ausspiel des Alleinspielers
Wenn der Alleinspieler von seinem Blatt oder vom Strohmann außer der Reihe spielt, und der
Gegenspieler rechts vom regelwidrigen Ausspiel eine Karte spielt (siehe aber B), gilt das
Ausspiel und Regel 57 ist anzuwenden.','Apărătorul Greșit Joacă la Atacul Neregulamentar al Declarantului

Dacă declarantul atacă peste rând fie din mână, fie de la mort, și apărătorul aflat la
dreapta atacului neregulamentar joacă o carte (dar vezi B), atacul rămâne valabil și
se aplică Legea 57.','apply_rule','[]');

-- Law 54
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1209,'54',NULL,'Wer versucht, das erste Ausspiel zu machen?','Wer versucht, das erste Ausspiel zu machen?','Cine încearcă să facă atacul inițial?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,question_de,question_en,question_ro,is_leaf) VALUES (1360,'54',1209,'ein Verteidiger','ein Verteidiger','un apărător','Hätte der Alleinspieler eine Karte des Strohmanns sehen können? (außer Karten, die während der Lizitation nach Regel 24 sichtbar wurden)','Hätte der Alleinspieler eine Karte des Strohmanns sehen können? (außer Karten, die während der Lizitation nach Regel 24 sichtbar wurden)','Ar fi putut declarantul să vadă vreo carte de la mort? (exceptând cărțile expuse la licitație sub Legea 24)',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1212,'54',1360,'Ja','Ja','Da',1,'der Alleinspieler muss das Ausspiel annehmen
Wenn der Alleinspieler irgendwelche Karten des Strohmanns (außer solche, die während des
Lizits sichtbar geworden sind und Regel 24 unterliegen) gesehen haben könnte, muss er das
Ausspiel annehmen, und der vermutete Alleinspieler wird zum Alleinspieler.','Declarantul Trebuie să Accepte Atacul

Dacă este posibil ca declarantul să fi văzut orice carte de la mort (exceptând
eventualele cărţi expuse de mort în timpul licitaţiei şi pentru care s-a aplicat Legea
24), el trebuie să accepte atacul și presupusul declarant devine declarant.','apply_rule','["24"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,question_de,question_en,question_ro,is_leaf) VALUES (1361,'54',1360,'Nein','Nein','Nu','Was möchte der Alleinspieler tun?','Was möchte der Alleinspieler tun?','Ce alege declarantul?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1210,'54',1361,'A. der Alleinspieler deckt sein Blatt auf','A. der Alleinspieler deckt sein Blatt auf','A. Declarantul își Etalează Mâna',1,'der Alleinspieler deckt sein Blatt auf
Nach einem ersten Ausspiel außer der Reihe darf der Alleinspieler sein Blatt aufdecken; er
wird zum Strohmann. Wenn der Alleinspieler beginnt, sein Blatt aufzudecken, und dabei eine
oder mehrere Karten sichtbar werden, muss er sein ganzes Blatt aufdecken. Der Strohmann
wird zum Alleinspieler.','Declarantul își Etalează Mâna

După un atac iniţial peste rând cu cartea pe faţă, declarantul poate să-şi etaleze
mâna, devenind mort. Dacă declarantul începe să-şi etaleze mâna şi astfel expune
una sau mai multe cărţi, el trebuie să-şi etaleze toată mâna. Mortul devine declarant.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1211,'54',1361,'B. der Alleinspieler nimmt das Ausspiel an','B. der Alleinspieler nimmt das Ausspiel an','B. Declarantul Acceptă Atacul',1,'der Alleinspieler nimmt das Ausspiel an
Nach einem ersten Ausspiel außer der Reihe darf der Alleinspieler das regelwidrige Ausspiel
wie in Regel 53 beschrieben annehmen; der Strohmann wird im Einklang mit Regel 41
aufgedeckt.

1. Die zweite Karte des Stichs wird vom Blatt des Alleinspielers zugegeben.

2. Wenn der Alleinspieler die zweite Karte des Stichs vom Strohmann spielt, darf diese nur
zurückgenommen werden, um eine Revoke zu berichtigen.','Declarantul Acceptă Atacul

Când un apărător expune un atac inițial peste rând, declarantul poate accepta atacul
neregulamentar conform Legii 53, şi mortul se etalează conform Legii 41.

1. A doua carte a levatei se joacă din mâna declarantului.

17 Un atac peste rând la levata a treisprezecea trebuie retras.
2. Dacă declarantul joacă a doua carte a levatei de la mort, aceasta nu poate fi

retrasă decât pentru a corecta o renonsă.','apply_rule','["53","41"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1213,'54',1361,'D. der Alleinspieler lehnt das Ausspiel ab','D. der Alleinspieler lehnt das Ausspiel ab','D. Declarantul Refuză Atacul',1,'der Alleinspieler lehnt das Ausspiel ab
Der Alleinspieler kann verlangen, dass ein Gegenspieler sein aufgedecktes erstes Ausspiel
außer der Reihe zurücknimmt. Die zurückgenommene Karte wird zur Strafkarte und Regel 50
wird angewandt.','Declarantul Refuză Atacul

Declarantul îi poate cere unui apărător să-şi retragă atacul iniţial peste rând făcut cu
cartea pe faţă. Cartea retrasă devine carte penalizată majoră şi se aplică Legea 50D.','apply_rule','["50D"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1214,'54',1209,'der Alleinspieler oder der Strohmann','der Alleinspieler oder der Strohmann','declarantul sau mortul',1,'erstes Ausspiel von der falschen Seite
Wenn ein Spieler der Seite des Alleinspielers zum ersten Stich auszuspielen versucht, wird
Regel 24 angewandt.','Atac Inițial al Axei Greșite

Dacă declarantul sau mortul încearcă să facă un atac iniţial, se aplică Legea 24.','apply_rule','["24"]');

-- Cross-references (Law 54)
INSERT INTO rule_refs (from_rule, to_rule, context) VALUES
  ('54B', '53',  'Annahme des Ausspiels / Acceptance of the lead / Acceptarea atacului'),
  ('54B', '41',  'Aufdecken des Strohmanns / Dummy exposed / Etalarea mortului'),
  ('54C', '24',  'Sichtbare Karten während der Lizitation / Cards seen during bidding / Cărți văzute la licitație'),
  ('54D', '50D', 'Strafkarte / Penalty card / Carte penalizată'),
  ('54E', '24',  'Ausspiel von der falschen Seite / Lead from wrong side / Atac de la axa greșită');

-- Law 55
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1215,'55',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1216,'55',1215,'A. Ausspiel angenommen','A. Ausspiel angenommen','A. Atac Acceptat',1,'Ausspiel angenommen
Wenn der Alleinspieler außer der Reihe von seinem Blatt oder dem des Strohmanns
ausgespielt hat, kann jeder der beiden Gegenspieler das Ausspiel, wie in Regel 53 vorgesehen,
annehmen oder verlangen, dass es zurückgenommen werde (nach einer falschen Auskunft
siehe Regel 47E1). Wenn sich die Gegenspieler unterschiedlich entschieden haben, gilt die
Entscheidung des Spielers, der nach dem regelwidrigen Ausspiel zu spielen an der Reihe ist.','Atac Acceptat

Dacă declarantul atacă peste rând din mână sau de la mort, oricare apărător poate
accepta atacul conform Legii 53 sau poate cere retragerea lui (după dezinformare,
vezi Legea 47E1). Dacă apărătorii aleg diferit, primează opțiunea jucătorului care
urmează la rând după atacul neregulamentar.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1217,'55',1215,'B. der Alleinspieler muss das Ausspiel zurücknehmen','B. der Alleinspieler muss das Ausspiel zurücknehmen','B. Declarantul Trebuie să-și Retragă Atacul',1,'der Alleinspieler muss das Ausspiel zurücknehmen
1. Wenn der Alleinspieler aus seinem Blatt oder dem des Strohmanns ausgespielt hat,
während ein Gegenspieler zum Ausspiel an der Reihe war, und gemäß Regel 55A das
Ausspiel hat zurücknehmen müssen, fügt der Alleinspieler die Karte dem entsprechenden
Blatt wieder zu. Es gibt keine weitere Korrektur.

2. Wenn der Alleinspieler vom falschen Blatt ausgespielt hat, während er an der Reihe war,
von seinem Blatt oder dem des Strohmanns auszuspielen, und gemäß Regel 55A das Ausspiel
hat zurücknehmen müssen, nimmt er die fälschlich ausgespielte Karte wieder zurück und
spielt vom richtigen Blatt aus.','Declarantul Trebuie să-și Retragă Atacul

1. Dacă declarantul a atacat din mână sau de la mort când era rândul unui apărător
să atace, şi i s-a cerut să retragă atacul conform Legii 55A, el reîncadrează cartea
atacată eronat în mâna adecvată. Nu se aplică altă rectificare.

2. Dacă declarantul a atacat din mâna cealaltă când era rândul lui să atace din
mână sau de la mort, şi i s-a cerut să retragă atacul conform Legii 55A, el își
retrage cartea atacată eronat și trebuie să atace din mâna corectă.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1218,'55',1215,'C. Alleinspieler könnte Information erhalten haben','C. Alleinspieler könnte Information erhalten haben','C. Declarantul Ar Putea Obține Informații',1,'Alleinspieler könnte Information erhalten haben
Wenn der Alleinspieler eine Spieldurchführung wählt, die sich auf eine Information stützen
könnte, die er durch seinen Regelverstoß erhalten hat, ist Regel 16 anzuwenden.','Declarantul Ar Putea Obține Informații

Când declarantul adoptă o linie de joc care ar fi putut fi bazată pe o informaţie
obținută prin intermediul infracţiunii sale, se aplică Legea 16.','apply_rule','[]');

-- Law 56
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1219,'56',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1220,'56',1219,'A. das regelwidrige Ausspiel annehmen (Regel 53), oder','A. das regelwidrige Ausspiel annehmen (Regel 53), oder','A. Să accepte atacul neregulamentar conform Legii 53, sau',1,'das regelwidrige Ausspiel annehmen (Regel 53), oder','Să accepte atacul neregulamentar conform Legii 53, sau','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1221,'56',1219,'B. verlangen, dass der Gegenspieler sein aufgedecktes Ausspiel außer der Reihe','B. verlangen, dass der Gegenspieler sein aufgedecktes Ausspiel außer der Reihe','B. Să îi ceară apărătorului să-și retragă atacul peste rând. Cartea retrasă devine',1,'verlangen, dass der Gegenspieler sein aufgedecktes Ausspiel außer der Reihe
zurücknimmt. Die ausgespielte Karte wird zur großen Strafkarte und Regel 50 wird
angewandt.','Să îi ceară apărătorului să-și retragă atacul peste rând. Cartea retrasă devine

carte penalizată majoră și se aplică Legea 50D.','apply_rule','[]');

-- Law 57
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1222,'57',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1223,'57',1222,'A. vorzeitiges Ausspiel oder Spiel zum nächsten Stich','A. vorzeitiges Ausspiel oder Spiel zum nächsten Stich','A. Joc Prematur sau Atac Prematur la Levata Următoare',1,'vorzeitiges Ausspiel oder Spiel zum nächsten Stich
Wenn ein Gegenspieler zum nächsten Stich ausspielt, bevor sein Partner zum aktuellen Stich
gespielt hat, oder außer der Reihe spielt, bevor sein Partner gespielt hat, wird die so gespielte
Karte zur großen Strafkarte, und der Alleinspieler wählt eine der folgenden Möglichkeiten. Er
kann:

1. verlangen, dass der Partner des schuldigen Spielers seine höchste Karte der gespielten
Farbe zugibt, oder

2. verlangen, dass der Partner des schuldigen Spielers seine niedrigste Karte der gespielten
Farbe zugibt, oder

3. verlangen, dass der Partner des schuldigen Spielers eine Karte einer anderen, vom
Alleinspieler bestimmten Farbe zugibt, oder

4. dem Partner des schuldigen Spielers das Spiel einer Karte einer anderen, vom Alleinspieler
festzulegenden, Farbe verbieten.','Joc Prematur sau Atac Prematur la Levata Următoare

Când un apărător atacă la levata următoare înainte ca partenerul lui să fi jucat la
levata curentă, sau joacă peste rând înainte ca partenerul lui să fi jucat, cartea astfel
atacată sau jucată devine carte penalizată majoră, şi declarantul selectează una din
opţiunile următoare. El poate:

1. Să-i ceară partenerului jucătorului vinovat să-și joace cea mai mare carte din

culoarea atacată, sau

2. Să-i ceară partenerului jucătorului vinovat să-și joace cea mai mică carte din

culoarea atacată, sau

3. Să-i ceară partenerului jucătorului vinovat să joace o carte dintr-o altă culoare

specificată de declarant, sau

4. Să-i interzică partenerului jucătorului vinovat să joace o carte dintr-o altă culoare

specificată de declarant.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1224,'57',1222,'B. Partner des schuldigen Spielers kann die Korrekturverpflichtung nicht erfüllen','B. Partner des schuldigen Spielers kann die Korrekturverpflichtung nicht erfüllen','B. Partenerul Jucătorului Vinovat Nu Se Poate Conforma Rectificării',1,'Partner des schuldigen Spielers kann die Korrekturverpflichtung nicht erfüllen
Wenn der Partner des schuldigen Spielers der vom Alleinspieler gewählten Korrektur (siehe
oben Punkt A.) nicht Folge leisten kann, kann er gemäß Regel 59 eine beliebige Karte spielen.','Partenerul Jucătorului Vinovat Nu Se Poate Conforma Rectificării

Când partenerul jucătorului vinovat nu se poate conforma rectificării alese de
declarant el poate juca orice carte, conform Legii 59.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1225,'57',1222,'C. wenn der Alleinspieler oder Strohmann gespielt hat','C. wenn der Alleinspieler oder Strohmann gespielt hat','C. Declarantul sau Mortul a Jucat',1,'wenn der Alleinspieler oder Strohmann gespielt hat
1. Ein Gegenspieler, der vor seinem Partner gespielt hat, unterliegt keiner Korrektur, wenn
der Alleinspieler aus beiden Blättern gespielt hat. Eine Karte des Strohmanns gilt aber nicht
als gespielt, bevor nicht der Alleinspieler eine entsprechende Anweisung57.1 gegeben hat.

2. Ein Gegenspieler unterliegt keiner Korrektur, wenn er vor seinem Partner gespielt hat,
wenn der Strohmann vor seinem rechten Gegner aus eigenem Antrieb eine Karte ausgewählt
hat oder angedeutet hat, dass eine gespielt werden soll.

3. Ein vorzeitiges Spiel (nicht aber Ausspiel) des Alleinspielers aus einem der beiden Blätter
ist eine gespielte Karte und darf nicht zurückgenommen werden, wenn sie zulässig ist.','Declarantul sau Mortul a Jucat

1. Un apărător nu este supus unei rectificări pentru că a jucat înaintea partenerului
dacă declarantul a jucat din ambele mâini. Dar o carte a mortului nu se consideră
jucată până ce declarantul nu a cerut (sau indicat18 în vreun fel) jocul.

2. Un apărător nu este supus unei rectificări pentru că a jucat înaintea partenerului
dacă mortul a selectat din proprie inițiativă o carte sau a sugerat în mod ilegal
jocul unei cărți înainte ca adversarul său din dreapta să fi jucat.

3. Un joc prematur (nu și un atac) efectuat de declarant din orice mână este o carte

jucată care, dacă este legală, nu poate fi retrasă.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1226,'57',1222,'D. Vorzeitiges Spiel, wenn der rechte Gegner an der Reihe ist','D. Vorzeitiges Spiel, wenn der rechte Gegner an der Reihe ist','D. Joc Prematur la Rândul Adversarului din Dreapta',1,'Vorzeitiges Spiel, wenn der rechte Gegner an der Reihe ist
Wenn ein Gegenspieler versucht, eine Karte zu einem Stich zu spielen (nicht aber
auszuspielen), während sein rechter Gegner an der Reihe ist, kann Regel 16 anzuwenden sein.
Wenn seine Karte regelkonform zu diesem Stich gespielt werden kann, muss der schuldige
Spieler sie spielen, wenn er an der Reihe ist; andernfalls wird sie eine große Strafkarte.','Joc Prematur la Rândul Adversarului din Dreapta

Dacă un apărător încearcă să joace la o levată (nu să atace) când era rândul
adversarului său din dreapta, se aplică Legea 16. Când cartea lui poate fi jucată legal
la levata respectivă, el trebuie să o joace când îi vine rândul; altfel, cartea devine
carte penalizată majoră.

18 Ca printr-un gest sau o încuviințare','apply_rule','[]');

-- Law 58
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1227,'58',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1228,'58',1227,'A. gleichzeitiges Spiel von zwei Spielern','A. gleichzeitiges Spiel von zwei Spielern','A. Jocuri Simultane a Doi Jucători',1,'gleichzeitiges Spiel von zwei Spielern
Ein Ausspiel oder Spiel, das gleichzeitig mit dem regelkonformen Ausspiel oder Spiel eines
anderen Spielers erfolgt ist, gilt als nachfolgend.','Jocuri Simultane a Doi Jucători

Un atac sau joc făcut simultan cu atacul sau jocul legal al altui jucător se consideră a
fi un atac sau joc consecutiv.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1229,'58',1227,'B. gleichzeitige Karten aus einem Blatt','B. gleichzeitige Karten aus einem Blatt','B. Cărți Jucate Simultan din Aceeași Mână',1,'gleichzeitige Karten aus einem Blatt
Wenn ein Spieler zwei oder mehr Karten zugleich ausspielt oder spielt, dann gilt:

1. Wenn nur von einer Karte die Bildseite sichtbar war, ist diese gespielt; die anderen Karten
werden zurückgenommen, und es gibt keine weitere Korrektur (siehe Regel 47F).

2. Wenn von mehr als einer Karte die Bildseite sichtbar geworden ist, bestimmt der schuldige
Spieler, welche Karte er zu spielen wünscht; wenn er ein Gegenspieler ist, werden alle
anderen Karten zu Strafkarten (siehe Regel 50).

3. Wenn ein schuldiger Spieler eine sichtbare Karte zurückgenommen hat, kann ein Spieler
eine nach dieser gespielte Karte ohne weitere Korrektur zurücknehmen und durch eine andere
ersetzen (siehe aber Regel 16C).

4. Wenn das gleichzeitige Spiel nicht bemerkt wird, bevor beide Seiten zum nächsten Stich
gespielt haben, wird Regel 67 angewandt.

57.1 auch etwa durch eine Geste oder ein Nicken','Cărți Jucate Simultan din Aceeași Mână

Dacă un jucător atacă sau joacă două sau mai multe cărţi simultan:

1. Dacă numai o carte este vizibilă, acea carte este jucată; toate celelalte cărţi sunt

ridicate şi nu există altă rectificare (vezi Legea 47F).

2. Dacă mai multe cărți sunt vizibile, jucătorul vinovat desemnează cartea pe care
vrea să o joace; când el este apărător, toate celelalte cărți expuse devin
penalizate (vezi Legea 50).

3. După ce un jucător vinovat retrage o carte vizibilă, un adversar care a jucat în
continuare la levata respectivă își poate retrage cartea jucată și o poate înlocui cu
alta fără altă rectificare (dar vezi Legea 16C).

4. Dacă jocul simultan rămâne nedescoperit până când ambele axe au jucat la

levata următoare, se aplică Legea 67.','apply_rule','[]');

-- Law 59
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1230,'59',NULL,1,'Ein Spieler kann jede regelkonforme Karte spielen, wenn er nicht in der Lage ist, einer
Ausspiel- oder Spielverpflichtung auf Grund einer Korrektur nachzukommen, weil er
entweder keine Karte der verlangen Farbe hat, oder nur noch Karten der verbotenen Farben,
oder weil er Farbe bekennen muss.','Un jucător poate juca orice altă carte legală dacă nu poate să atace sau joace așa
cum i s-a cerut în cursul unei rectificări, fie pentru că nu deține nicio carte în culoarea
cerută, ori pentru că are numai cărți dintr-o culoare în care i s-a interzis să atace, ori
pentru că este obligat să dea la culoare.','apply_rule','[]');

-- Law 60
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1231,'60',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1232,'60',1231,'A. Spiel einer Karte nach einer Regelwidrigkeit','A. Spiel einer Karte nach einer Regelwidrigkeit','A. Carte Jucată După o Neregularitate',1,'Spiel einer Karte nach einer Regelwidrigkeit
1. Wenn ein Spieler der nicht-schuldigen Seite spielt, nachdem sein rechter Gegner außer der
Reihe oder vorzeitig gespielt hat und bevor eine Korrektur angeordnet worden ist, verliert er
den Anspruch auf eine Korrektur dieses Regelverstoßes.

2. Wenn der Anspruch auf Korrektur verloren gegangen ist, wird das regelwidrige Spiel
behandelt, als wäre es in der Reihe gewesen (außer wenn Regel 53B anzuwenden ist).

3. Wenn die schuldige Seite einer früheren Verpflichtung unterliegt, eine Strafkarte zu spielen
oder eine Ausspiel- oder Spielbeschränkung zu beachten, bleibt die Beschränkung bestehen,
wenn der betreffende Spieler später wieder an der Reihe ist.','Carte Jucată După o Neregularitate

1. Un membru al axei nevinovate care joacă o carte după ce adversarul său din
dreapta a atacat sau jucat peste rând sau prematur, dar înainte să se fi decis o
rectificare, pierde dreptul la o rectificare pentru acea infracțiune.

2. Odată pierdut dreptul la o rectificare, jocul ilegal este tratat ca și cum ar fi fost la

rând (mai puțin când se aplică Legea 53B).

3. Dacă axa vinovată avea obligația să joace o carte penalizată sau să se
conformeze unei restricții de atac sau joc, obligația se menține pentru tururile
următoare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1233,'60',1231,'B. Gegenspieler spielt vor einem korrigierten Ausspiel des Alleinspielers','B. Gegenspieler spielt vor einem korrigierten Ausspiel des Alleinspielers','B. Un Apărător Joacă Înainte de Atacul din Mâna Corectă Impus Declarantului',1,'Gegenspieler spielt vor einem korrigierten Ausspiel des Alleinspielers
Wenn ein Gegenspieler eine Karte spielt, nachdem der Alleinspieler ein Ausspiel außer der
Reihe hat zurücknehmen müssen, aber bevor dieser von der richtigen Hand gespielt hat, wird
die Karte des Gegenspielers eine große Strafkarte (Regel 50).','Un Apărător Joacă Înainte de Atacul din Mâna Corectă Impus Declarantului
Când un apărător joacă o carte după ce declarantului i s-a cerut să-şi retragă atacul
peste rând făcut din oricare mână, dar înainte ca declarantul să fi atacat din mâna
corectă, cartea apărătorului devine carte penalizată majoră (Legea 50).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1234,'60',1231,'C. Spiel der schuldigen Seite vor einer Korrektur','C. Spiel der schuldigen Seite vor einer Korrektur','C. Joc al Axei Vinovate Înainte de Deciderea unei Rectificări',1,'Spiel der schuldigen Seite vor einer Korrektur
Ein Spiel eines Spielers der schuldigen Seite, bevor eine Korrektur angeordnet worden ist,
ändert nichts an den Rechten seiner Gegner, und kann selbst einer Korrektur unterliegen.','Joc al Axei Vinovate Înainte de Deciderea unei Rectificări

Jocul unui membru al axei vinovate înainte de deciderea unei rectificări nu afectează
drepturile adversarilor, și poate face el însuşi obiectul unei rectificări.','apply_rule','[]');

-- Law 61
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1235,'61',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1236,'61',1235,'A. Definition der Revoke','A. Definition der Revoke','A. Definiția Renonsei',1,'Definition der Revoke
Eine Revoke liegt vor, wenn nicht gemäß Regel 44 Farbe bekannt worden ist, oder wenn ein
Spieler, der dazu in der Lage war, nicht eine Karte einer Farbe (aus)gespielt hat, zu der er
nach den Regeln oder aufgrund einer gegnerischen Entscheidung im Zuge einer Korrektur
verpflichtet war. (Wenn er dazu nicht in der Lage ist, siehe Regel 59.)','Definiția Renonsei

A nu da la culoare în conformitate cu Legea 44 sau a nu ataca sau juca, atunci când
este posibil, o carte sau o culoare cerută de lege sau de un adversar în cursul
rectificării unei neregularități constituie o renonsă. (Pentru inabilitatea de a se
conforma vezi Legea 59.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1237,'61',1235,'B. Recht, nach einer möglichen Revoke zu fragen','B. Recht, nach einer möglichen Revoke zu fragen','B. Dreptul de a Întreba despre o Posibilă Renonsă',1,'Recht, nach einer möglichen Revoke zu fragen
1. Der Alleinspieler darf einen Gegenspieler, der nicht Farbe bedient hat, fragen, ob er eine
Karte der ausgespielten Farbe hat.

2. (a) Der Strohmann darf den Alleinspieler fragen [siehe aber Regel 43B2(b)].

(b) Einen Gegenspieler darf der Strohmann überhaupt nicht fragen, und Regel 16B kann
anzuwenden sein.
3. Die Gegenspieler dürfen den Alleinspieler und einander fragen (wobei sie riskieren,
unerlaubte Information zu erzeugen).','Dreptul de a Întreba despre o Posibilă Renonsă

1. Declarantul poate întreba un apărător care nu a dat la culoare dacă are o carte în

culoarea atacată.

2.

a) Mortul îl poate întreba pe declarant [dar vezi Legea 43B2b)].

b) Mortul nu poate întreba un apărător și se aplică Legea 16B.

3. Apărătorii îl pot întreba pe declarant și se pot întreba unul pe altul (cu riscul de a

crea informație neautorizată).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1238,'61',1235,'C. kein Recht, Stiche anzusehen','C. kein Recht, Stiche anzusehen','C. Dreptul de a Inspecta Levatele',1,'kein Recht, Stiche anzusehen
Die Behauptung einer Revoke berechtigt nicht automatisch dazu, erledigte Stiche anzusehen
(siehe Regel 66C).','Dreptul de a Inspecta Levatele

Reclamarea unei renonse nu duce automat la inspecția levatelor anterioare (vezi
Legea 66C).','apply_rule','[]');

-- Law 62
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1239,'62',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1240,'62',1239,'A. Revoke muss berichtigt werden','A. Revoke muss berichtigt werden','A. Renonsa Trebuie Corectată',1,'Revoke muss berichtigt werden
Ein Spieler muss unbedingt eine Revoke berichtigen, wenn die Aufmerksamkeit auf die
Regelwidrigkeit gelenkt wird, bevor sie etabliert ist.','Renonsa Trebuie Corectată

Un jucător trebuie să-şi corecteze renonsa dacă se atrage atenția asupra
neregularității înainte ca renonsa să fie consumată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1241,'62',1239,'B. Berichtigung einer Revoke','B. Berichtigung einer Revoke','B. Corectarea unei Renonse',1,'Berichtigung einer Revoke
Um eine Revoke zu berichtigen, nimmt ein Spieler die gespielte Karte zurück und ersetzt sie
durch eine regelkonforme Karte.

1. Eine derart zurückgezogene Karte wird zur großen Strafkarte (Regel 50), wenn sie aus dem
verdeckten Blatt eines Gegenspielers gespielt worden ist.

2. Die Karte kann ohne weitere Korrektur ersetzt werden, wenn sie aus dem Blatt des
Alleinspielers [vorbehaltlich Regel 43B2(b)] oder vom Strohmann gespielt worden ist, oder
wenn es sich um eine aufgedeckte Karte eines Gegenspielers handelt.','Corectarea unei Renonse

Pentru a corecta o renonsă, jucătorul vinovat își retrage cartea jucată şi o înlocuieşte
cu o carte legală.
1. O carte astfel retrasă devine carte penalizată majoră (Legea 50) dacă a fost

jucată din mâna neexpusă a unui apărător.

2. Cartea poate fi înlocuită fără altă rectificare dacă a fost jucată din mâna
declarantului (dar vezi Legea 43B2b)), a mortului, sau dacă era o carte expusă a
unui apărător.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1242,'62',1239,'C. Anschließend gespielte Karten','C. Anschließend gespielte Karten','C. Cărți Jucate în Continuare',1,'Anschließend gespielte Karten
1. Jeder Spieler der nicht-schuldigen Seite darf eine Karte, die er nach der Revoke und bevor
die Aufmerksamkeit auf diese gelenkt worden ist, gespielt hat, zurücknehmen und seinem
Blatt wieder hinzufügen (siehe Regel 16C).

2. Nachdem ein nicht-schuldiger Spieler derart eine Karte zurückgenommen hat, kann auch
der Spieler der schuldigen Seite, der nach ihm an der Reihe ist, seine gespielte Karte
zurücknehmen; wenn er ein Gegenspieler ist, wird sie zur Strafkarte (siehe Regel 16C).

3. Wenn beide Seiten im selben Stich eine Revoke begangen haben und nur eine Seite zum
nächsten Stich gespielt hat, müssen beide Revokes berichtigt werden (siehe Regel 16C2).
Jeder Karte, die die Gegenspieler zurückgenommen haben, wird zur Strafkarte.','Cărți Jucate în Continuare

1. Fiecare membru al axei nevinovate își poate retrage și reîncadra în mână orice
carte jucată după renonsă dar înainte să se fi atras atenția asupra ei (vezi Legea
16C).

2. După ce un jucător nevinovat își retrage astfel cartea, jucătorul axei vinovate care
urmează la rând poate să-şi retragă şi el cartea jucată, care devine carte
penalizată dacă jucătorul este un apărător (vezi Legea 16C).

3. Dacă ambele axe fac renonsă la aceeași levată și numai o axă a jucat la levata
următoare, atunci ambele renonse trebuie corectate (vezi Legea 16C2). Fiecare
carte retrasă de apărători devine carte penalizată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1243,'62',1239,'D. Revoke im 12. Stich','D. Revoke im 12. Stich','D. Renonsă la Levata a Douăsprezecea',1,'Revoke im 12. Stich
1. Eine Revoke im zwölften Stich muss berichtigt werden, auch wenn sie bereits etabliert ist,
sofern sie bemerkt wird, bevor alle vier Blätter ins Board zurück gesteckt worden sind.

2. Wenn ein Gegenspieler im zwölften Stich eine Revoke begeht, bevor sein Partner gespielt
hat, ist Regel 16C anzuwenden.','Renonsă la Levata a Douăsprezecea

1. La a douăsprezecea levată, o renonsă, chiar și una consumată, trebuie corectată

dacă este descoperită înainte ca cele patru mâini să fie reintroduse în etui.

2. Dacă un apărător face o renonsă la a douăsprezecea levată înainte să-i fi venit

rândul partenerului său să joace la acea levată, se aplică Legea 16C.','apply_rule','[]');

-- Law 63
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1244,'63',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1245,'63',1244,'A. Revoke wird etabliert','A. Revoke wird etabliert','A. Renonsa Devine Consumată',1,'Revoke wird etabliert
Eine Revoke wird etabliert:
1. wenn der schuldige Spieler oder sein Partner zum nächsten Stich ausspielt oder spielt.
(Jedes solche Spiel, egal ob regelkonform oder regelwidrig, etabliert die Revoke.)

2. wenn der schuldige Spieler oder sein Partner eine Karte irgendwie bezeichnet, die zum
nächsten Stich gespielt werden soll.

3. wenn ein Mitglied der schuldigen Seite Stiche claimt oder konzediert, sei es mündlich,
durch Aufdecken des Blattes oder auf eine andere Weise.

4. wenn die schuldige Seite einem gegnerischen Claim oder Verzicht zustimmt (siehe Regel
69A) oder keinen Einwand erhebt, bevor die Runde zu Ende ist oder bevor sie auf dem
nächsten Board ansagt.','Renonsa Devine Consumată

O renonsă devine consumată:

1. Când jucătorul vinovat sau partenerul său atacă sau joacă la levata următoare

(orice asemenea joc, legal sau ilegal, duce la consumarea renonsei).

2. Când jucătorul vinovat sau partenerul său numeşte sau desemnează în orice fel o

carte pentru a fi jucată la levata următoare.

3. Când un membru al axei vinovate face o revendicare sau concesie de levate oral,

prin etalarea mâinii, sau în orice alt fel.

4. Când acordul cu o revendicare sau concesie adversă este stabilit (conform Legii
69A), fără ca axa vinovată să fi obiectat înainte de terminarea rundei sau înainte
de a face o declarație pe dona următoare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1246,'63',1244,'B. Revoke darf nicht mehr berichtigt werden','B. Revoke darf nicht mehr berichtigt werden','B. Renonsa Nu Poate Fi Corectată',1,'Revoke darf nicht mehr berichtigt werden
Ist eine Revoke einmal etabliert, darf sie nicht mehr berichtigt werden (ausgenommen gemäß
Regel 62D oder 62C3), und der Stich, in dem sie vorgefallen ist, steht wie gespielt.','Renonsa Nu Poate Fi Corectată
Odată consumată, o renonsă nu mai poate fi corectată (decât conform Legii 62D
pentru o renonsă la a douăsprezecea levată sau conform Legii 62C3), și levata la
care s-a petrecut renonsa rămâne așa cum s-a jucat.','apply_rule','[]');

-- Law 64
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1247,'64',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1248,'64',1247,'A. automatischer Stichtransfer','A. automatischer Stichtransfer','A. Ajustare Automată a Numărului de Levate',1,'automatischer Stichtransfer
Wenn eine Revoke etabliert ist:

1. und der Revokestich vom schuldigen Spieler64.1 gewonnen worden ist, wird am Ende des
Spiels der Revokestich und zusätzlich ein weiterer Stich, falls die schuldige Seite nach dem
Revokestich noch einen oder mehrere gewonnen hat, an die nicht-schuldige Seite transferiert.

2. und der Revokestich nicht vom schuldigen Spieler64.1 gewonnen worden ist, und die
schuldige Seite den Revokestich oder einen oder mehrere nachfolgende Stiche gewonnen hat,
wird am Ende des Spiels ein Stich an die nicht-schuldige Seite transferiert.','Ajustare Automată a Numărului de Levate

Când o renonsă este consumată:

1. Și levata la care s-a petrecut renonsa a fost câștigată de jucătorul vinovat19, la
sfârșitul jocului levata la care s-a petrecut renonsa este transferată axei
nevinovate împreună cu una din levatele câștigate ulterior de axa vinovată.

2. Și levata la care s-a petrecut renonsa nu a fost câștigată de jucătorul vinovat19,
atunci, dacă axa vinovată a câștigat acea levată sau oricare din levatele
următoare, la sfârșitul jocului se transferă o levată axei nevinovate.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1249,'64',1247,'B. kein automatischer Stichtransfer','B. kein automatischer Stichtransfer','B. Nicio Ajustare Automată',1,'kein automatischer Stichtransfer
Es gibt keinen automatischen Stichtransfer (siehe aber Regel 64C), wenn:

1. die schuldige Seite weder den Revokestich noch einen der nachfolgenden Stiche gewonnen
hat.

2. es sich um eine weitere Revoke desselben Spielers in derselben Farbe handelt, wenn die
erste Revoke bereits etabliert ist.

3. die Revoke dadurch begangen worden ist, dass eine Strafkarte oder eine Karte des
Strohmanns nicht gespielt worden ist.

4. die Aufmerksamkeit erstmals auf die Revoke gelenkt worden ist, nachdem ein Spieler der
nicht-schuldigen Seite im nächsten Board angesagt hat.

5. die Aufmerksamkeit erstmals nach dem Ende der Runde auf die Revoke gelenkt worden ist.

6. es eine Revoke im zwölften Stich ist.

64.1 Ein im Strohmann gewonnener Stich gilt in dieser Regel nicht als vom Alleinspieler gewonnen.
7. beide Seiten im selben Board eine etablierte Revoke begangen haben.

8. die Revoke gemäß Regel 62C3 berichtigt worden ist.','Nicio Ajustare Automată

Nu există nicio ajustare automată a numărului de levate pentru o renonsă consumată
(dar vezi Legea 64C) dacă:

1. Axa vinovată nu a câștigat nici levata de renonsă, nici vreo levată ulterioară.

2. Este o renonsă subsecventă în aceeași culoare făcută de același jucător, prima

renonsă fiind consumată.

3. Renonsa constă în a nu fi jucat o carte penalizată sau orice carte a mortului.

4. Atenția asupra renonsei a fost atrasă pentru prima oară după ce un membru al

axei nevinovate a făcut o declarație în dona următoare.

5. Atenția asupra renonsei a fost atrasă pentru prima oară după terminarea rundei.

6. Este o renonsă la a douăsprezecea levată.

7. Ambele axe au făcut renonsă în aceeași donă și ambele renonse s-au consumat.

8. Renonsa a fost corectată conform Legii 62C3.','apply_rule','["64C", "62C3"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1250,'64',1247,'C. Entschädigung','C. Entschädigung','C. Repararea Prejudiciului',1,'Entschädigung
1. Wenn nach dem Urteil des Turnierleiters nach einer etablierten Revoke, einschließlich
solcher, für die es keinen automatischen Stichtransfer gibt, die nicht-schuldige Seite durch
diese Regel nicht ausreichend entschädigt worden ist, weist er ein berichtigtes Ergebnis zu.

2. (a) Nach wiederholten Revokes desselben Spielers in derselben Farbe (siehe oben B2)
adjustiert der Turnierleiter das Ergebnis, wenn die nicht-schuldige Seite wahrscheinlich mehr
Stiche erzielt hätte, wenn eine oder mehrere der nachfolgenden Revokes nicht stattgefunden
hätten.

(b) Wenn beide Seiten im selben Board eine Revoke begangen haben (siehe oben B7) und
nach dem Urteil des Turnierleiters ein Teilnehmer geschädigt worden ist, soll er ein
berichtigtes Ergebnis so zuweisen, als hätte keine Revoke stattgefunden.','Repararea Prejudiciului

1. Când, după orice renonsă consumată, inclusiv cele care nu fac obiectul ajustării
numărului de levate, arbitrul apreciază că axa nevinovată este insuficient
compensată de această Lege pentru prejudiciul suferit, el va acorda un scor
ajustat.

2.

19 O levată câștigată la mort nu se consideră câștigată de declarant în sensul prezentei Legi.
a) După renonse repetate ale aceluiași jucător în aceeași culoare (vezi B2 mai
sus), arbitrul ajustează scorul când este probabil ca axa nevinovată să fi
câștigat mai multe levate dacă una sau mai multe din renonsele subsecvente
nu s-ar fi petrecut.

b) Când ambele axe au făcut renonsă în aceeași donă (vezi B7 mai sus) și
arbitrul apreciază că un concurent a fost prejudiciat, el va acorda un scor
ajustat bazat pe rezultatul probabil în absența tuturor renonselor.','apply_rule','[]');

-- Law 65
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1251,'65',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1252,'65',1251,'A. fertig gespielter Stich','A. fertig gespielter Stich','A. Levată Completă',1,'fertig gespielter Stich
Wenn zu einem Stich vier Karten gespielt worden sind, legt jeder Spieler seine eigene Karte
mit der Bildseite nach unten bei sich auf den Tisch.','Levată Completă

După ce s-au jucat 4 cărți la o levată, fiecare jucător își întoarce cartea cu fața în jos,
în dreptul lui, pe masă.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1253,'65',1251,'B. Stichbesitz verfolgen','B. Stichbesitz verfolgen','B. Cum se Ține Socoteala Levatelor',1,'Stichbesitz verfolgen
1. Wenn die eigene Seite den Stich gewonnen hat, wird die Karte mit der Schmalseite zum
Partner abgelegt.

2. Wenn die Gegner den Stich gewonnen haben, wird die Karte mit der Schmalseite zu den
Gegnern abgelegt.

3. Ein Spieler darf auf eine falsch gedrehte Karte aufmerksam machen; dieses Recht erlischt,
wenn seine Seite zum nächsten Stich ausspielt oder spielt. Geschieht es danach, kann Regel
16B anzuwenden sein.','Cum se Ține Socoteala Levatelor

1. Dacă axa jucătorului a câștigat levata, lungimea cărții e orientată către partener.

2. Dacă adversarii au câștigat levata, lungimea cărții e orientată către adversari.

3. Un jucător poate atrage atenția asupra unei cărți orientate incorect, dar acest
drept expiră când axa lui atacă sau joacă la levata următoare. Dacă se depășește
acest termen, se poate aplica Legea 16B.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1254,'65',1251,'C. Ordnung','C. Ordnung','C. Ordine',1,'Ordnung
Jeder Spieler legt seine Karten in einer ordentlichen, überlappenden Reihe in der Reihenfolge,
wie sie gespielt worden sind, ab, damit nach dem Ende des Spiels gegebenenfalls eine
Kontrolle möglich ist, wie viele Stiche jede Seite gewonnen hat, oder in welcher Reihenfolge
die Karten gespielt worden sind.','Ordine

Fiecare jucător îşi suprapune ordonat cărțile pe un rând, pe măsură ce acestea sunt
jucate, pentru a permite revederea jocului după terminarea acestuia, dacă este
necesar să se stabilească numărul de levate câştigate de fiecare axă sau ordinea în
care au fost jucate cărţile.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1255,'65',1251,'D. Einvernehmen über das Tischergebnis','D. Einvernehmen über das Tischergebnis','D. Acord Asupra Rezultatului Jocului',1,'Einvernehmen über das Tischergebnis
Ein Spieler hat die Reihenfolge seiner Karten nicht zu stören, bis über die Zahl der
gewonnenen Stiche Einvernehmen hergestellt worden ist. Wenn ein Spieler sich nicht daran
hält, gefährdet er sein Recht, den Besitz strittiger Stiche zu beanspruchen oder eine Revoke
geltend zu machen.','Acord Asupra Rezultatului Jocului

Jucătorii n-ar trebui să deranjeze ordinea cărţilor jucate înainte să cadă de acord
asupra numărului de levate câştigate. Un jucător care nu se conformează dispoziţiilor
acestei Legi îşi periclitează dreptul de a reclama posesia unor levate disputate sau
de a reclama (sau infirma) o renonsă.','apply_rule','[]');

-- Law 66
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1256,'66',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1257,'66',1256,'A. aktueller Stich','A. aktueller Stich','A. Levata Curentă',1,'aktueller Stich
Solange seine Seite nicht zum nächsten Stich ausgespielt oder gespielt hat, kann der
Alleinspieler oder jeder der Gegenspieler verlangen, dass die gerade gespielten Karten
aufgedeckt werden, solange er nicht seine eigene Karte mit der Bildseite nach unten auf den
Tisch gelegt hat.','Levata Curentă

Cât timp axa lui nu a atacat sau jucat la levata următoare, declarantul sau orice
apărător poate, înainte să-şi fi întors propria carte cu faţa în jos pe masă, să ceară ca
toate cărţile jucate în acea levată să fie menţinute vizibile.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1258,'66',1256,'B. eigene letzte Karte','B. eigene letzte Karte','B. Ultima Carte Proprie',1,'eigene letzte Karte
Solange seine Seite nicht zum nächsten Stich gespielt hat, kann der Alleinspieler und jeder
der Gegenspieler seine eigene letzte gespielte Karte ansehen; dabei darf die Karte aber nicht
hergezeigt werden.','Ultima Carte Proprie
Până când axa lui a atacat sau jucat la levata următoare, declarantul sau orice
apărător poate să-și inspecteze, dar nu să-și expună, ultima carte jucată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1259,'66',1256,'C. erledigte Stiche','C. erledigte Stiche','C. Levate Închise',1,'erledigte Stiche
Danach dürfen bis zum Ende des Spiels die Karten erledigter Stiche überhaupt nicht
angesehen werden (außer wenn der Turnierleiter das ausdrücklich anordnet; zum Beispiel
wenn es erforderlich ist, um eine behauptete Revoke festzustellen).','Levate Închise

Apoi, până la sfârșitul jocului, levatele închise nu mai pot fi inspectate (decât la
cererea explicită a arbitrului; de exemplu, pentru a verifica dacă s-a făcut o renonsă).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1260,'66',1256,'D. nach Ende des Spiels','D. nach Ende des Spiels','D. După Terminarea Jocului',1,'nach Ende des Spiels
Nach dem Ende des Spiels können die gespielten und ungespielten Karten angesehen werden,
um eine behauptete Revoke oder die Anzahl der gewonnenen Stiche zu überprüfen; kein
Spieler darf aber andere Karten als seine eigenen in die Hand nehmen. Wenn der Turnierleiter
nach einer solchen Behauptung die Tatsachen nicht mehr nachprüfen kann und nur eine Seite
ihre Karten vermischt hat, muss der Turnierleiter zugunsten der anderen Seite entscheiden.','După Terminarea Jocului

După sfârşitul jocului, se pot inspecta cărţile jucate sau nejucate pentru a rezolva
revendicările privind renonsele sau numărul de levate câştigate sau pierdute; dar
niciun jucător n-ar trebui să manevreze alte cărţi decât ale sale. Dacă arbitrul nu mai
reușește să stabilească faptele după o asemenea revendicare, și numai o axă și-a
amestecat cărțile, arbitrul decide în favoarea celeilalte axe.','apply_rule','[]');

-- Law 67
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1261,'67',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1262,'67',1261,'A. bevor beide Seiten zum nächsten Stich gespielt haben','A. bevor beide Seiten zum nächsten Stich gespielt haben','A. Înainte ca Ambele Axe să Joace la Levata Următoare',1,'bevor beide Seiten zum nächsten Stich gespielt haben
Wenn ein Spieler zu einem Stich keine oder mehr als eine Karte gespielt hat, muss der Fehler
unbedingt berichtigt werden, wenn die Aufmerksamkeit darauf gelenkt worden ist, bevor ein
Spieler jeder Seite zum nächsten Stich gespielt hat.

1. Wenn der Spieler keine Karte gespielt hat, gibt er eine Karte zu, die er regelkonform
spielen kann.

2. Wenn er mehr als eine Karte gespielt hat, sind Regel 45E (fünfte Karte) oder 58B
(gleichzeitiges Spiel) anzuwenden.','Înainte ca Ambele Axe să Joace la Levata Următoare

Când un jucător a omis să joace sau a jucat mai multe cărţi la o levată, eroarea
trebuie rectificată dacă se atrage atenţia asupra neregularităţii înainte ca un jucător al
fiecărei axe să fi jucat la levata următoare.

1. Pentru a rectifica omisiunea de a juca la o levată, jucătorul vinovat furnizează o

carte legală.

2. Pentru a rectifica jocul mai multor cărți la o levată, se va aplica Legea 45E (A
Cincea Carte Jucată la o Levată) sau Legea 58B (Cărți Jucate Simultan din
Aceeași Mână).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1263,'67',1261,'B. nachdem beide Seiten zum nächsten Stich gespielt haben','B. nachdem beide Seiten zum nächsten Stich gespielt haben','B. După ce Ambele Axe Joacă la Levata Următoare',1,'nachdem beide Seiten zum nächsten Stich gespielt haben
Wenn der Turnierleiter feststellt, dass ein schadhafter Stich vorliegt (weil ein Spieler zu
wenige oder zu viele Karten im Blatt, und eine entsprechend falsche Anzahl gespielter Karten
hat), und beide Seiten schon zum nächsten Stich gespielt haben, geht er folgendermaßen vor:

1. Wenn der schuldige Spieler keine Karte gespielt hat, hat der Turnierleiter anzuordnen, dass
er unverzüglich eine Karte aufdeckt und diese dann richtig unter die gespielten Karten
einordnet (diese Karte ändert nichts am Besitz des Stiches). Wenn
(a) der schuldige Spieler eine Karte der ausgespielten Farbe hat, muss er eine solche Karte
wählen; sein Fehler gilt als Revoke im schadhaften Stich, und gemäß Regel 64A2 wird ein
Stich transferiert.

(b) der schuldige Spieler keine Karte der ausgespielten Farbe hat, wählt er irgendeine Karte.
Sein Fehler gilt als Revoke im schadhaften Stich, und gemäß Regel 64A2 wird ein Stich
transferiert.

2. (a) Wenn der schuldige Spieler mehr als eine Karte zum schadhaften Stich gespielt hat,
sieht der Turnierleiter die gespielten Karten an und verlangt vom schuldigen Spieler, alle
zusätzlichen Karten67.1 ins Blatt zu nehmen, wobei er bei den gespielten Karten jene belässt,
die er beim Spiel zum schadhaften Stich aufgedeckt hat (wenn der Turnierleiter nicht
feststellen kann, welche Karte aufgedeckt worden ist, belässt er die höchste Karte, die
regelkonform hat zugegeben werden können, im Stich). Am Besitz des schadhaften Stiches
ändert sich nichts.

(b) Eine zurückgesteckte Karte gilt als ständig im Blatt des schuldigen Spielers befindlich;
das Nichtspielen zu einem früheren Stich kann eine Revoke darstellen.

3. Wenn der Turnierleiter feststellt, dass der schuldige Spieler zwar zum schadhaften Stich
gespielt hat, die Karte aber nicht zu den gespielten gegeben worden ist, findet der
Turnierleiter die gespielte Karte und legt sie richtig zu den gespielten Karten des schuldigen
Spielers. Der Turnierleiter soll ein berichtigtes Ergebnis zuweisen, wenn dieselbe Karte zu
einem späteren Stich gespielt worden ist und es zu spät ist, das regelwidrige Spiel zu
berichtigen.','După ce Ambele Axe Joacă la Levata Următoare

Când arbitrul determină că a existat o levată defectuoasă (prin faptul că un jucător
are prea puține sau prea multe cărți în mână și un număr incorect corespunzător de
cărți jucate), și ambele axe au jucat la levata următoare, el procedează astfel:

1. Când jucătorul vinovat a omis să joace o carte la levata defectuoasă, arbitrul îi va
cere imediat să expună o carte și apoi să o plaseze la locul ei printre cărțile jucate
(această carte nu afectează posesia levatei); dacă:

a) Jucătorul vinovat are o carte în culoarea atacată la levata defectuoasă, el
trebuie să aleagă o asemenea carte și să o plaseze printre cărțile jucate. Se
consideră că a făcut renonsă la levata defectuoasă și se supune pierderii unei
levate, transferată conform Legii 64A2.

b) Jucătorul vinovat nu are nicio carte în culoarea atacată la levata defectuoasă,
el alege orice carte și o plasează printre cărțile jucate. Se consideră că a făcut
renonsă la levata defectuoasă și se supune pierderii unei levate, transferată
conform Legii 64A2.
2.

a) Când jucătorul vinovat a jucat mai multe cărți la levata defectuoasă, arbitrul
inspectează cărțile jucate și îi cere jucătorului vinovat să-și reia în mână toate
cărțile în plus20, lăsând-o printre cele jucate pe cea vizibilă la levata
defectuoasă (dacă arbitrul nu poate stabili care a fost cartea vizibilă, jucătorul
vinovat lasă cea mai mare carte pe care ar fi putut să o joace legal la levata
respectivă). Posesia levatei defectuoase nu se schimbă

b) Se consideră că.orice carte reîncadrată în mână a aparținut încontinuu mâinii
jucătorului vinovat, și omisiunea de a fi jucat-o la o levată precedentă poate
constitui o renonsă.

3. Când arbitrul determină că jucătorul vinovat a jucat o carte la levata defectuoasă,
dar nu a plasat-o printre cărțile jucate, arbitrul găsește cartea și o plasează corect
printre cărțile jucate. Se va acorda un scor ajustat dacă aceeași carte a fost jucată
la o levată ulterioară și este prea târziu pentru a corecta jocul ilegal.','apply_rule','[]');

-- Law 68
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1264,'68',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1265,'68',1264,'A. Definition eines Claims','A. Definition eines Claims','A. Definiția Revendicării',1,'Definition eines Claims
Jede Aussage des Alleinspielers oder eines Gegenspielers, dass seine Seite eine bestimmte
Anzahl Stiche gewinnen wird, ist ein Claim dieser Stiche. Ein Spieler claimt auch, wenn er
anregt, das Spiel abzukürzen, oder seine Karten herzeigt (außer er hatte offensichtlich nicht
die Absicht zu claimen; wenn zum Beispiel ein Alleinspieler nach einem ersten Ausspiel
außer der Reihe seine Karten aufdeckt, ist Regel 54 und nicht 68 anzuwenden).','Definiția Revendicării

Orice afirmație a declarantului sau a unui apărător în sensul că o axă va câștiga un
anumit număr de levate este o revendicare a acelor levate. Un jucător revendică de
asemenea atunci când sugerează ca jocul să fie scurtat sau când îşi arată cărţile
(mai puțin când intenţia sa era demonstrabil alta decât să revendice – de exemplu,
dacă declarantul îşi etalează cărţile după un atac iniţial peste rând se va aplica
Legea 54, nu aceasta).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1266,'68',1264,'B. Definition eines Verzichts','B. Definition eines Verzichts','B. Definiția Concesiei',1,'Definition eines Verzichts
1. Jede Aussage des Alleinspielers oder eines Gegenspielers, dass eine Seite eine bestimmte
Anzahl Stiche verlieren wird, ist ein Verzicht auf diese Stiche; ein Claim einer Anzahl Stiche

67.1 Der Turnierleiter soll es nach Möglichkeit vermeiden, die gespielten Karten eines Gegenspielers
aufzudecken. Wenn aber eine zusätzliche Karte sichtbar geworden ist, die ins Blatt eines
Gegenspielers zurückzugeben ist, wird sie zur Strafkarte (siehe Regel 50).
ist ein Verzicht auf die restlichen. Ein Spieler verzichtet auf alle restlichen Stiche, wenn er
sein Blatt weggibt.

2. Unbeschadet Absatz B1 ist weder ein Claim noch ein Verzicht zustande gekommen, wenn
ein Gegenspieler versucht, auf einen oder mehrere Stiche zu verzichten, und sein Partner
sofort widerspricht. Unerlaubte Information kann vorliegen, weshalb der Turnierleiter sofort
zu rufen ist. Das Spiel geht weiter. Eine von einem Gegenspieler unter diesen Umständen
aufgedeckte Karte wird nicht zur Strafkarte, aber Regel 16 gilt für die Information aus dem
Aufdecken, und diese darf vom Partner des Spielers, der eine Karte aufgedeckt hat, überhaupt
nicht verwendet werden.','Definiția Concesiei

1. Orice afirmație a declarantului sau a unui apărător în sensul că o axă va pierde un
anumit număr de levate este o concesie a acelor levate; o revendicare a unui
anumit număr de levate este o concesie a eventualelor levate restante. Un jucător
concede toate levatele restante atunci când îşi abandonează mâna.

2. Indiferent de B1, dacă un apărător încearcă să conceadă una sau mai multe
levate şi partenerul său obiectează imediat, atunci n-a existat nici o concesie, nici
o revendicare. Poate exista informaţie neautorizată, de aceea arbitrul trebuie
chemat imediat. Jocul continuă. O carte expusă de un apărător în aceste condiții
nu este carte penalizată, dar informaţia rezultată din expunerea ei se supune
Legii 16C şi nu poate fi folosită de partenerul apărătorului care a expus cartea.

20 Arbitrul ar trebui să evite, pe cât posibil, să expună cărțile jucate de un apărător, dar dacă o carte în plus care trebuie
reîncadrată în mâna unui apărător a fost expusă, aceasta devine carte penalizată (vezi Legea 50).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1267,'68',1264,'C. Spielerklärung erforderlich','C. Spielerklärung erforderlich','C. Clarificări Necesare',1,'Spielerklärung erforderlich
Ein Claim soll sogleich von einer klaren Erklärung der Spieldurchführung oder des
Gegenspiels begleitet sein, mit der der Claimer die geclaimten Stiche zu gewinnen
beabsichtigt, einschließlich der Reihenfolge, in der die Karten gespielt werden. Der Spieler,
der claimt oder verzichtet, deckt sein Blatt auf.','Clarificări Necesare

O revendicare ar trebui să fie însoțită imediat de o precizare clară a liniei de joc sau
apărare prin care jucătorul își propune să câștige levatele revendicate, inclusiv
ordinea jucării cărților. Jucătorul care revendică sau concede își etalează mâna.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1268,'68',1264,'D. Spielunterbrechung','D. Spielunterbrechung','D. Întreruperea Jocului',1,'Spielunterbrechung
Nach jedem Claim oder Verzicht wird das Spiel unterbrochen.

1. Wenn dem Claim oder Verzicht zugestimmt wird, ist Regel 69 anzuwenden.

2. Wenn ein Spieler (auch der Strohmann) zweifelt, dann kann

(a) entweder der Turnierleiter sofort gerufen, und bis zu seinem Eintreffen nichts
unternommen werden; Regel 70 ist anzuwenden;

(b) oder das Spiel kann auf Wunsch eines Spielers der Seite, die nicht geclaimt (verzichtet)
hat, unter den nachstehenden Bedingungen fortgesetzt werden:

(i) alle vier Spieler müssen einverstanden sein; andernfalls wird der Turnierleiter gerufen, der
dann nach Absatz (a) vorgeht.

(ii) der vorherige Claim (Verzicht) ist nichtig und unterliegt nicht einer
Turnierleiterentscheidung. Die Regeln 16 und 50 sind nicht anzuwenden, und das danach
erzielte Ergebnis bleibt bestehen.','Întreruperea Jocului

După orice revendicare sau concesie, jocul este întrerupt.

1. Dacă revendicarea sau concesia este acceptată, se aplică Legea 69.

2. Dacă ea este pusă la îndoială de orice jucător (inclusiv mortul), ori

a) Arbitrul poate fi chemat imediat fără a acționa până la venirea acestuia, și se

aplică Legea 70; ori

b) La cererea celeilalte axe decât cea care a făcut revendicarea sau concesia,

jocul poate continua în următoarele condiții:

i.

Toți cei 4 jucători trebuie să fie de acord; altfel se cheamă arbitrul, care
procedează ca la a).

ii. Revendicarea sau concesia anterioară este nulă și nu face obiectul
unei decizii. Nu se aplică Legile 16 și 50, și scorul obținut în continuare
rămâne valabil.','apply_rule','[]');

-- Law 69
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1269,'69',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1270,'69',1269,'A. Zustimmung etabliert','A. Zustimmung etabliert','A. Stabilirea Acordului',1,'Zustimmung etabliert
Eine Zustimmung ist etabliert, wenn eine Seite dem Claim oder Verzicht eines Gegners
zustimmt und keinen Widerspruch erhebt, bevor sie auf dem nächsten Board ansagt oder die
Runde endet. Das Board wird abgerechnet, als wären die geclaimten oder konzedierten Stiche
im Spiel gewonnen oder verloren worden.','Stabilirea Acordului

Acordul este stabilit când o axă admite revendicarea sau concesia făcută de un
adversar şi nu obiectează la aceasta înainte să fi făcut o declaraţie în dona
următoare sau înaintea terminării rundei, în funcţie de care se întâmplă mai întâi.
Rezultatul se consemnează ca şi cum levatele revendicate sau cedate ar fi fost
câştigate sau pierdute jucând.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1271,'69',1269,'B. Zurücknahme einer etablierten Zustimmung','B. Zurücknahme einer etablierten Zustimmung','B. Retragerea unui Acord Stabilit',1,'Zurücknahme einer etablierten Zustimmung
Die Zustimmung zu einem Claim oder Verzicht (siehe Punkt A) kann innerhalb der
Korrekturphase (Regel 79C) zurück genommen werden:
1. wenn ein Spieler dem Verlust eines Stiches zugestimmt hat, den seine Seite tatsächlich
gewonnen hat; oder

2. wenn ein Spieler dem Verlust eines Stiches zugestimmt hat, den seine Seite wahrscheinlich
gewonnen hätte, wenn das Spiel fortgesetzt worden wäre. Das Board wird neu abgerechnet,
wobei ein solcher Stich seiner Seite zuerkannt wird.','Retragerea unui Acord Stabilit

Acordul cu o revendicare sau concesie (vezi A) poate fi retras în limitele Perioadei de
Corecţie stabilită prin Legea 79C:

1. Dacă un jucător a fost de acord cu pierderea unei levate pe care de fapt axa sa a

câștigat-o; sau

2. Dacă un jucător a fost de acord cu pierderea unei levate pe care probabil axa sa

ar fi câștigat-o dacă jocul ar fi continuat.

Scorul donei este reînregistrat cu o asemenea levată acordată axei sale.','apply_rule','[]');

-- Law 70
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1272,'70',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1273,'70',1272,'A. allgemeines Ziel','A. allgemeines Ziel','A. Obiectiv General',1,'allgemeines Ziel
Wenn der Turnierleiter über einen bestrittenen Claim oder Verzicht zu entscheiden hat,
entscheidet er so ausgewogen wie möglich für beide Seiten, doch ist jeder zweifelhafte Punkt
gegen den Claimer zu entscheiden. Der Turnierleiter geht dabei wie unten beschrieben vor.','Obiectiv General

Când decide asupra unei revendicări sau concesii contestate, arbitrul acordă un
rezultat echitabil pe cât posibil, dar orice aspect îndoielnic al unei revendicări va fi
rezolvat împotriva jucătorului care a făcut revendicarea. Arbitrul procedează după
cum urmează.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1274,'70',1272,'B. Spielerklärung wiederholt','B. Spielerklärung wiederholt','B. Repetarea Clarificării',1,'Spielerklärung wiederholt
1. Der Turnierleiter lässt den Claimer die Spielerklärung wiederholen, die er zum Zeitpunkt
seines Claims gemacht hat.

2. Danach hört er die Einwände der Gegner an (doch sind seine Überlegungen nicht auf diese
beschränkt).

3. Der Turnierleiter kann von den Spielern verlangen, ihre verbliebenen Karten offen auf den
Tisch zu legen.','Repetarea Clarificării

1. Arbitrul îi cere jucătorului care a făcut revendicarea să repete clarificările pe care

le-a făcut când a revendicat.

2. Apoi, arbitrul ascultă obiecțiile adversarilor

la

revendicarea

făcută

(dar

considerațiile sale nu sunt limitate la obiecțiile adversarilor).

3. Arbitrul poate cere jucătorilor să își expună pe masă cărțile restante.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1275,'70',1272,'C. ein Atout steht noch aus','C. ein Atout steht noch aus','C. Există un Atu Afară',1,'ein Atout steht noch aus
Wenn sich in einem gegnerischen Blatt noch ein Atout befindet, soll der Turnierleiter diesem
einen Stich zuerkennen, wenn:

1. der Claimer darüber nichts gesagt hat und

2. es nicht ganz unwahrscheinlich ist, dass der Claimer zum Zeitpunkt seines Claims auf
dieses Atout vergessen hat, und

3. durch irgendein normales70.1 Spiel dieses Atout einen Stich machen könnte.','Există un Atu Afară

Când un atu a rămas într-una din mâinile adversarilor, arbitrul va acorda una sau mai
multe levate adversarilor dacă:

1. Jucătorul care a revendicat nu a făcut nicio afirmație privind acel atu, și

2. Este cât de puțin probabil ca jucătorul care a revendicat să nu fi fost conștient, în

momentul revendicării, că mai există un atu la adversari, și

3. Acel atu poate câștiga o levată ca urmare a unui joc normal21 oarecare.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1276,'70',1272,'D. Überlegungen des Turnierleiters','D. Überlegungen des Turnierleiters','D. Considerațiile Arbitrului',1,'Überlegungen des Turnierleiters
1. Der Turnierleiter soll vom Claimer keine erfolgreiche Spieldurchführung akzeptieren, die
nicht in der ursprünglichen Spielerklärung enthalten ist, wenn es eine weniger erfolgreiche
normale70.1 Alternative gibt.

2. Der Turnierleiter akzeptiert nicht einen Teil eines Claims eines Gegenspielers, der davon
abhängt, dass sein Partner aus alternativen normalen70.1 Spieldurchführungen eine bestimmte
wählt.','Considerațiile Arbitrului

1. Arbitrul nu va accepta din partea jucătorului care a revendicat nicio linie de joc
câștigătoare necuprinsă în clarificarea inițială dacă există o altă linie normală21 de
joc care nu ar avea același succes.

2. Arbitrul nu acceptă nicio parte a revendicării unui apărător care depinde de
alegerea de către partenerul său a unui joc anume dintre mai multe jocuri
normale21 posibile.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1277,'70',1272,'E. keine Spielerklärung','E. keine Spielerklärung','E. Linie de Joc Neprecizată',1,'keine Spielerklärung
1. Der Turnierleiter soll vom Claimer keine Spieldurchführung akzeptieren, die er nicht gleich
erklärt hat und deren Erfolg davon abhängt, dass man eine bestimmte Karte bei einem

70.1 Für die Anwendung von Regel 70 und 71 gilt auch jedes (für einen Spieler dieser Stärke)
schlampige oder unterklassige Spiel als „normal“.
bestimmten Gegner findet, wenn nicht ein Gegner bereits vor dem Claim diese Farbe nicht
bedient hat, oder danach bei jeder normalen70.1 Spieldurchführung diese Farbe nicht bedienen
würde.

2. Der Zuständige Verband kann eine Reihenfolge (z. B. „von oben nach unten“) festlegen,
die der Turnierleiter beim Spiel einer Farbe vorauszusetzen hat, wenn das in der
Spielerklärung nicht klargestellt worden ist (immer jedoch unter Beachtung anderer Auflagen
der Regeln).','Linie de Joc Neprecizată

1. Arbitrul nu va accepta din partea jucătorului care a revendicat nicio linie de joc
neformulată al cărei succes depinde de găsirea unei cărți în mâna unui adversar
și nu a celuilalt, mai puțin dacă un adversar nu a dat la acea culoare înaintea
efectuării revendicării, sau urmează să nu dea la acea culoare în cursul oricărei
linii de joc normale21.

21 Pentru Legile 70 și 71, „normal” include un joc neglijent sau inferior pentru nivelul jucătorului implicat.
2. Autoritatea Regulatoare poate specifica o ordine (de exemplu, „de sus în jos”) în
care arbitrul va considera că este jucată o culoare dacă ordinea nu a fost
precizată în timpul revendicării (dar supunându-se tuturor celorlalte cerinţe ale
acestei Legi).','apply_rule','[]');

-- Law 71
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1278,'71',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1279,'71',1278,'A. den seine Seite tatsächlich gewonnen hat; oder','A. den seine Seite tatsächlich gewonnen hat; oder','A. Dacă un jucător a cedat o levată pe care de fapt axa sa a câștigat-o; sau',1,'den seine Seite tatsächlich gewonnen hat; oder','Dacă un jucător a cedat o levată pe care de fapt axa sa a câștigat-o; sau','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1280,'71',1278,'B. durch kein normales71.1 Spiel der verbleibenden Karten hätte verlieren können.','B. durch kein normales71.1 Spiel der verbleibenden Karten hätte verlieren können.','B. Dacă un jucător a cedat o levată care nu ar fi putut fi pierdută prin niciun joc',1,'durch kein normales71.1 Spiel der verbleibenden Karten hätte verlieren können.

Dann wird diesem Spieler ein solcher Stich zuerkannt, und das Ergebnis auf dem Board wird
neu berechnet.','Dacă un jucător a cedat o levată care nu ar fi putut fi pierdută prin niciun joc

normal22 al cărților restante.

Scorul donei este reînregistrat cu o asemenea levată acordată axei sale.','apply_rule','[]');

-- Law 72
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1281,'72',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1282,'72',1281,'A. Beachtung der Regeln','A. Beachtung der Regeln','A. Respectarea Legilor',1,'Beachtung der Regeln
Sportbridgeturniere sind unter genauer Beachtung der Regeln zu spielen. Hauptziel ist das
Erreichen eines höheren Ergebnisses als die anderen Teilnehmer, unter Beachtung der
regelkonformen Abläufe und ethischen Standards, die in diesen Regeln festgelegt sind.','Respectarea Legilor

Turneele de bridge ar trebui să se joace în strictă concordanță cu Legile. Scopul
principal este de a obține un scor mai mare decât ceilalți concurenți, respectând
totodată procedurile legale și standardele etice stabilite prin aceste legi.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1283,'72',1281,'B. Regelverstöße','B. Regelverstöße','B. Infracțiuni',1,'Regelverstöße
1. Ein Spieler darf keinesfalls vorsätzlich gegen eine Regel verstoßen, selbst wenn es eine
festgesetzte Korrektur gibt, die er bereit ist, auf sich zu nehmen.

2. Es gibt im allgemeinen keine Verpflichtung, die Aufmerksamkeit auf einen Regelverstoß
der eigenen Seite zu lenken (siehe aber Regel 20F bei falscher Auskunft, sowie Regel 62A
und 79A2).

3. Ein Spieler darf überhaupt nicht versuchen, einen Regelverstoß zu verbergen, indem er zum
Beispiel eine zweite Revoke begeht, eine Karte versteckt, die an einer Revoke beteiligt war,
oder vorzeitig seine Karten vermischt.','Infracțiuni

1. Un jucător trebuie să nu încalce intenționat o lege, chiar dacă este dispus să

accepte rectificarea prescrisă.

2. În general nu există obligația de a atrage atenția asupra unei infracțiuni comise de
propria axă (dar vezi Legea 20F pentru o explicație greșită și Legile 62A și 79A2).

3. Un jucător nu are dreptul să încerce să ascundă o infracțiune, ca de exemplu
făcând o a doua renonsă, ascunzând o carte implicată într-o renonsă sau
amestecând prematur cărțile.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1284,'72',1281,'C. Inkaufnehmen einer möglichen Schädigung','C. Inkaufnehmen einer möglichen Schädigung','C. Conștientizarea unui Posibil Prejudiciu',1,'Inkaufnehmen einer möglichen Schädigung
Wenn der Turnierleiter feststellt, dass ein schuldiger Spieler zum Zeitpunkt seiner
Regelwidrigkeit hätte wissen können, dass diese wohl die nicht-schuldige Seite schädigen
könnte, hat er anzuordnen, dass Lizit und Spiel fortgesetzt werden (wenn sie noch nicht
beendet sind). Am Ende des Spiels weist der Turnierleiter ein berichtigtes Ergebnis zu, wenn

71.1 Für die Anwendung von Regel 70 und 71 gilt auch jedes (für einen Spieler dieser Stärke)
schlampige oder unterklassige Spiel als „normal“.
er zur Auffassung kommt, dass die schuldige Seite durch die Regelwidrigkeit einen Vorteil
erlangt hat.','Conștientizarea unui Posibil Prejudiciu

Dacă arbitrul apreciază că un jucător vinovat ar fi putut fi conștient, în momentul
comiterii neregularității, că aceasta ar putea în bună măsură să prejudicieze axa
nevinovată, el va cere ca licitația și jocul să continue (dacă nu s-au terminat). La
sfârșitul jocului arbitrul acordă un scor ajustat dacă apreciază că axa vinovată a avut
de câștigat din neregularitatea sa.

22 Pentru Legile 70 și 71, „normal” include un joc neglijent sau inferior pentru nivelul jucătorului implicat.','apply_rule','[]');

-- Law 73
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1285,'73',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1286,'73',1285,'A. Angebrachter Informationsaustausch zwischen Partnern','A. Angebrachter Informationsaustausch zwischen Partnern','A. Comunicare Adecvată între Parteneri',1,'Angebrachter Informationsaustausch zwischen Partnern
1. Während Lizitation und Spiel darf der Informationsaustausch zwischen Partnern nur mittels
der Ansagen und gespielten Karten erfolgen, außer die Regeln genehmigen ausdrücklich
etwas anderes.

2. Ansagen und Spiel sind ohne unangebrachte Betonung, Verhaltensauffälligkeit und
Stimmmodulation, und ohne unangebrachtes Zögern oder Hast zu machen. Der Zuständige
Verband kann aber Pflichtpausen vorschreiben, etwa in der ersten Lizitrunde, nach einer
Sprunggebotwarnung, oder am ersten Stich.','Comunicare Adecvată între Parteneri

1. Comunicarea între parteneri în timpul licitației și jocului se va efectua numai prin
intermediul declarațiilor și cărților jucate, cu excepția cazurilor autorizate explicit
de aceste legi.

2. Declarațiile și jocurile ar trebui făcute fără nicio emfază, manierism sau inflexiune
necuvenită, și fără ezitare sau grabă excesivă. Dar Autoritățile Regulatoare pot
impune pauze obligatorii, precum la primul tur de licitație, sau după avertismentul
asupra unui anunț cu salt, sau la prima levată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1287,'73',1285,'B. Unangebrachter Informationsaustausch zwischen Partnern','B. Unangebrachter Informationsaustausch zwischen Partnern','B. Comunicare Neadecvată între Parteneri',1,'Unangebrachter Informationsaustausch zwischen Partnern
1. Die Partner dürfen nicht mit anderen Mitteln Informationen austauschen, wie etwa durch
die Art einer Ansage oder des Spiels einer Karte, durch spielfremde Bemerkungen oder
Gesten, gestellte oder nicht gestellte Fragen, Alerts oder Auskünfte, die gegeben oder nicht
gegeben werden.

2. Der schwerstmögliche Verstoß liegt vor, wenn eine Partnerschaft durch vorher
abgesprochene Methoden, die nicht durch diese Regeln gestattet sind, Informationen
austauscht.','Comunicare Neadecvată între Parteneri

1. Partenerii nu vor comunica prin mijloace ca felul în care sunt efectuate declarațiile
și jocurile, remarci sau gesturi ilicite, întrebări adresate sau neadresate, sau alerte
și explicații oferite sau neoferite.

2. Cel mai grav delict este ca o axă să schimbe informații prin metode de

comunicare prestabilite care nu sunt autorizate de aceste Legi.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1288,'73',1285,'C. Spieler erhält unerlaubte Information vom Partner','C. Spieler erhält unerlaubte Information vom Partner','C. Un Jucător Primește Informație Neautorizată de la Partener',1,'Spieler erhält unerlaubte Information vom Partner
1. Wenn einem Spieler eine unerlaubte Information von seinem Partner zur Verfügung steht,
wie etwa aus einer Bemerkung, Frage, Auskunft, Geste, Verhaltensauffälligkeit,
unangebrachte Betonung, Stimmmodulation, Hast oder Zögern, ein unerwartetes Alert oder
das Ausbleiben eines erwarteten Alerts, muss er mit größter Sorgfalt darauf achten, aus dieser
unerlaubten Information keinen Vorteil zu ziehen [siehe Regel 16B1(a)].

2. Ein Spieler, der gegen Punkt C1 verstößt, kann bestraft werden; sind die Gegner geschädigt
worden, siehe außerdem Regel 16B3.','Un Jucător Primește Informație Neautorizată de la Partener

1. Când un jucător beneficiază de informație neautorizată de la partener, provenind
de exemplu dintr-o remarcă, întrebare, explicație, gest, manierism, emfază,
inflexiune, grabă sau ezitare, o alertă neașteptată sau lipsa unei alerte, el trebuie
să aibă grijă să evite să profite de pe urma acelei informații neautorizate [vezi
Legea 16B1a)].

2. Se poate dicta o penalizare împotriva unui jucător care încalcă C1, dar dacă

adversarii sunt prejudiciați, vezi de asemenea Legea 16B3.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1289,'73',1285,'D. Unterschiede in Tempo oder Art und Weise','D. Unterschiede in Tempo oder Art und Weise','D. Variații de Tempo sau Manieră',1,'Unterschiede in Tempo oder Art und Weise
1. Es ist wünschenswert, wenn auch nicht immer erforderlich, dass die Spieler ein
gleichförmiges Tempo und unveränderliche Art und Weise beibehalten. Die Spieler sollten
aber besonders sorgsam sein, wenn Unterschiede ihrer Seite zum Vorteil gereichen könnten.
Andernfalls ist es kein Regelverstoß, unabsichtlich Tempo oder Art und Weise einer Ansage
oder eines Spiels zu variieren. Einen Schluss daraus darf nur ein Gegner ziehen, und das auf
eigene Gefahr.

2. Ein Spieler darf überhaupt nicht versuchen, einen Gegner mittels einer Frage, Bemerkung
oder Geste zu täuschen, noch durch die Hast oder das Zögern bei einer Ansage oder einem
Spiel (wie zum Beispiel durch Zögern beim Spiel eines Singles); noch durch die Art, in der
eine Ansage oder ein Spiel gemacht werden; oder durch zweckgerichtetes Abweichen vom
korrekten Ablauf (siehe auch Regel 73E2).','Variații de Tempo sau Manieră

1. Este de dorit, deși nu întotdeauna obligatoriu, ca jucătorii să mențină un tempo
constant și maniere fără variații. În orice caz, jucătorii ar trebui să aibă mare grijă
când aceste variații le-ar putea crea un avantaj. Altfel, să variezi neintenționat
tempo-ul sau maniera de efectuare a unei declarații sau joc nu este o infracțiune.
Inferențele provenite din asemenea variații sunt autorizate doar pentru adversari,
care pot acționa în baza acestora pe propriul risc.

2. Un jucător nu are dreptul să își inducă un adversar în eroare printr-o întrebare,
remarcă sau gest; prin graba sau ezitarea de a declara sau juca (precum ezitarea
înainte de a juca un singleton); prin maniera de a efectua o declarație sau joc; sau
prin orice abatere intenționată de la procedura corectă.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1290,'73',1285,'E. Täuschung','E. Täuschung','E. Inducere în Eroare',1,'Täuschung
1. Ein Spieler darf korrekterweise versuchen, einen Gegner durch eine Ansage oder ein Spiel
zu täuschen (solange die Täuschung nicht durch unangemessene Hast oder Zögern unterstützt
wird, und auch nicht durch eine nicht bekanntgegebene Partnerschaftsvereinbarung oder –
erfahrung) geschützt ist.

2. Wenn der Turnierleiter feststellt, dass ein unschuldiger Spieler aus einer gegnerischen
Frage, Bemerkung, Verhalten, Tempo oder dergleichen einen falschen Schluss gezogen hat,
wobei der Gegner keinen nachweislichen Bridgegrund für die Aktion hatte, und zum
Zeitpunkt der Aktion gewusst haben könnte, dass sie sich zu seinem Vorteil auswirken kann,
dann soll der Turnierleiter ein Berichtigtes Ergebnis zuweisen.','Inducere în Eroare
1. Un jucător poate să încerce să își inducă un adversar în eroare printr-o declarație
sau joc (cat timp inducerea în eroare nu este subliniată printr-o grabă sau ezitare
neobișnuită, nici protejată de o înțelegere sau experiență partenerială ascunsă).

2. Dacă arbitrul stabilește că un jucător nevinovat a tras o concluzie falsă dintr-o
întrebare, remarcă, manieră, tempo sau altele asemenea ale unui adversar a
cărui acțiune nu are în mod demonstrabil o justificare bridgistică, și care ar fi putut
fi conștient, la momentul acțiunii, că aceasta i-ar putea crea un avantaj, arbitrul va
acorda un scor ajustat.','apply_rule','[]');

-- Law 74
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1291,'74',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1292,'74',1291,'A. korrekte Einstellung','A. korrekte Einstellung','A. Atitudine Adecvată',1,'korrekte Einstellung
1. Ein Spieler hat jederzeit ein höfliches Verhalten an den Tag zu legen.

2. Ein Spieler hat sorgfältig jede Bemerkung oder spielfremde Handlung zu vermeiden, die
einen anderen Spieler ärgern oder diesem peinlich sein könnte, oder den Spielgenuss
beeinträchtigen könnte.

3. Jeder Spieler hat beim Lizitieren und Spielen gleichförmig und korrekt vorzugehen.','Atitudine Adecvată

1. Un jucător ar trebui să păstreze în orice moment o atitudine curtenitoare.

2. Un jucător ar trebui să evite cu grijă orice remarcă sau acţiune ilicită care ar putea

enerva sau jena un alt jucător sau ar putea interfera cu plăcerea de a juca.

3. Fiecare jucător ar trebui să urmeze o procedură uniformă şi corectă în declaraţii şi

joc.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1293,'74',1291,'B. Benehmen','B. Benehmen','B. Etichetă',1,'Benehmen
Aus Höflichkeit hat ein Spieler folgendes zu unterlassen:

1. dem Spiel nicht die nötige Aufmerksamkeit schenken.

2. unnötige Bemerkungen während Lizit und Spiel.

3. eine Karte heraus ziehen, bevor er zu spielen an der Reihe ist.

4. das Spiel unnötig fortsetzen (wenn er etwa weiß, dass alle Stiche sicher ihm gehören), um
einen Gegner durcheinander zu bringen.

5. den Turnierleiter auf eine, für diesen oder einen anderen Teilnehmer, unhöfliche Weise
rufen oder anreden.','Etichetă

Ca o chestiune de curtoazie un jucător ar trebui să se abțină de la:

1. A acorda insuficientă atenție jocului.

2. A face comentarii gratuite în timpul licitației și jocului.

3. A detașa o carte înainte să-i vină rândul să joace.

4. A prelungi inutil jocul (precum a continua să joace deși știe că va lua toate

levatele) în scopul de a dezorienta un adversar.

5. A chema și a se adresa arbitrului într-o manieră nepoliticoasă față de el sau de

alți concurenți.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1294,'74',1291,'C. Verstöße gegen den richtigen Ablauf','C. Verstöße gegen den richtigen Ablauf','C. Încălcări de Procedură',1,'Verstöße gegen den richtigen Ablauf
Verstöße gegen den richtigen Ablauf sind zum Beispiel:

1. verschiedene Bezeichnungen für dieselbe Ansage verwenden.

2. Zustimmung oder Missfallen über eine Ansage oder ein Spiel zum Ausdruck bringen.

3. die Absicht, den Stich, der gerade gespielt wird, zu gewinnen oder nicht zu gewinnen.

4. während Lizit oder Spiel durch Bemerkungen oder Verhalten die Aufmerksamkeit auf ein
bedeutsames Ereignis oder die zum Erfolg noch nötige Stichanzahl lenken.
5. während Lizitation oder Spiel aufmerksam auf einen anderen Spieler oder sein Blatt
schauen, zum Beispiel um seine Karten zu sehen, oder zu beobachten, wo er eine Karte
herauszieht (doch ist es zulässig, Informationen aus einer unabsichtlich gesehenen Karte74.1
eines Gegners zu verwerten).

6. offensichtliches Desinteresse an einem Spiel bekunden (zum Beispiel durch
Zusammenfalten des Blattes).

7. das normale Lizit- oder Spieltempo variieren, um einen Gegner durcheinander zu bringen.

8. den Tisch vor dem Ende der Runde unnötig verlassen.','Încălcări de Procedură

Următoarele sunt exemple de încălcări de procedură:

1. Folosirea unor denumiri diferite pentru aceeaşi declaraţie.

2. Manifestarea aprobării sau dezaprobării faţă de o declaraţie sau joc.

3. Manifestarea aşteptării sau intenţiei de a câştiga sau pierde o levată care nu s-a

încheiat.
4. Comentarii sau acţiuni în timpul licitaţiei sau jocului cu rolul de a atrage atenţia
asupra unui eveniment semnificativ sau asupra numărului de levate care mai
trebuie câștigate pentru atingerea scopului.

5. Studierea intenţionată a oricărui alt jucător în timpul licitaţiei sau jocului, sau a
mâinii altui jucător cu intenţia de a-i vedea cărţile sau de a observa locul de unde
scoate o carte (dar e adecvat să acţionezi în baza unei informaţii obţinute prin
vederea neintenţionată a unei cărți adverse23).

6. Manifestarea unei vădite lipse de interes pentru restul donei (de exemplu prin

strângerea cărţilor).

7. Variaţia tempo-ului normal de licitaţie sau joc cu scopul de a dezorienta un

adversar.

8. Părăsirea mesei fără motiv înainte de sfârşitul rundei.','apply_rule','[]');

-- Law 75
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1295,'75',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1296,'75',1295,'A. Fehler erzeugt unerlaubte Information','A. Fehler erzeugt unerlaubte Information','A. Greșeală care Cauzează Informație Neautorizată',1,'Fehler erzeugt unerlaubte Information
Unabhängig davon, ob eine Auskunft eine korrekte Wiedergabe einer
Partnerschaftsvereinbarung ist, weiß ein Spieler, der die Auskunft seines Partners gehört hat,
dass seine Ansage missverstanden worden ist. Dieses Wissen ist unerlaubte Information
(siehe Regel 16A), und der Spieler muss mit größter Sorgfalt vermeiden, daraus irgend einen
Vorteil zu ziehen (siehe Regel 73C); andernfalls hat der Turnierleiter ein Berichtigtes
Ergebnis zuzuweisen.','Greșeală care Cauzează Informație Neautorizată

Indiferent dacă explicația este sau nu o descriere corectă a înțelegerii parteneriale,
un jucător care a auzit explicația partenerului știe că declarația sa a fost interpretată
greșit. Această informație este neautorizată (vezi Legea 16A) și jucătorul trebuie să
aibă grijă să evite să profite de pe urma ei (vezi Legea 73C); altfel, arbitrul acordă un
scor ajustat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1297,'75',1295,'B. Falsche Auskunft','B. Falsche Auskunft','B. Explicație Greșită',1,'Falsche Auskunft
1. Wenn sich die Partnerschaftsvereinbarung von der Auskunft unterscheidet, stellt die
Auskunft einen Regelverstoß dar. Wenn dieser Regelverstoß die nicht-schuldige Seite
schädigt, soll der Turnierleiter ein Berichtigtes Ergebnis zuweisen.

2. Wenn ein Spieler seinen eigenen Fehler bemerkt, muss er den Turnierleiter rufen, bevor das
erste Ausspiel aufgedeckt wird (oder während des Spiels, wenn er den Fehler später bemerkt),
und den Fehler danach berichtigen. Der Spieler darf den Turnierleiter auch vor dem Ende der
Lizitation rufen, ist dazu aber nicht verpflichtet (siehe Regel 20F4).

3. Der Partner des Spielers darf während der Lizitation nichts tun, um die falsche Auskunft
richtig zu stellen; wenn er danach zum Gegenspieler wird, darf und muss er den Turnierleiter
erst nach Ende des Spiels rufen und die Auskunft richtig stellen. Wird der Partner des Spielers
Alleinspieler oder Strohmann, muss er nach dem abschließenden Pass den Turnierleiter rufen
und den Fehler danach berichtigen.','Explicație Greșită

1. Când înțelegerea partenerială diferă de explicația dată, explicația este o
infracțiune. Când această infracțiune duce la prejudicierea axei nevinovate,
arbitrul va acorda un scor ajustat.

2. Dacă un jucător își dă seama de propria greșeală, el trebuie să cheme arbitrul
înainte de expunerea atacului inițial (sau în timpul jocului, dacă își dă seama mai
târziu), și apoi să ofere o corecție. Jucătorul poate să cheme arbitrul și înainte de
sfârșitul licitației, dar nu are obligația să o facă (vezi Legea 20F4).

3. Partenerul jucătorului trebuie să nu facă nimic pentru a corecta explicația greșită
cât timp licitația continuă și, dacă ulterior devine apărător, trebuie să cheme
arbitrul și să corecteze explicația abia după terminarea jocului. Dacă partenerul
jucătorului devine declarant sau mort, el trebuie, după pas-ul final, să cheme
arbitrul și apoi să ofere o corecție.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1298,'75',1295,'C. Falsche Ansage','C. Falsche Ansage','C. Declarație Greșită',1,'Falsche Ansage
Wenn die Partnerschaftsvereinbarung richtig erklärt worden ist, und also nicht die Erklärung,
sondern die Ansage fehlerhaft war, liegt kein Regelverstoß vor. Die Erklärung darf nicht
sofort richtig gestellt werden (noch ist der Turnierleiter zu rufen), und es besteht keine

74.1 Siehe Regel 73D2, wenn ein Gegner seine Karten absichtlich hergezeigt haben könnte.
Verpflichtung, es später zu tun. Unabhängig von einem allfälligen Schaden bleibt das
Ergebnis stehen [siehe aber Regel 21B1(b)].','Declarație Greșită

23 Vezi Legea 73D2 când este posibil ca un jucător să își fi arătat intenționat cărțile.
Când înțelegerea partenerială a fost explicată corect, greșeala fiind declarația făcută
și nu explicația, nu există nicio infracțiune. Explicația nu trebuie corectată (și nici nu
trebuie anunțat arbitrul) imediat și nu există nicio obligație de a o face mai târziu.
Indiferent de prejudiciu, rezultatul rămâne valabil [dar vezi Legea 21B1b)].','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1299,'75',1295,'D. Vorgehen des Turnierleiters','D. Vorgehen des Turnierleiters','D. Decizia Arbitrului',1,'Vorgehen des Turnierleiters
1. Von den Spielern wird erwartet, dass sie ihre Partnerschaftsvereinbarungen genau
offenlegen (siehe Regel 20F1); geschieht das nicht, liegt falsche Auskunft vor.

2. Es gehört zu jeder Partnerschaftsvereinbarung, dass beide Spieler dieselbe wechselseitige
Übereinkunft haben, und es ist ein Regelverstoß, eine Vereinbarung zu beschreiben, wo diese
wechselseitige Übereinkunft nicht besteht. Wenn der Turnierleiter feststellt, dass die
irreführende Erklärung nicht auf einer Partnerschaftsvereinbarung beruht, wendet er Regel
21B an.

3. Wenn ein Regelverstoß gemäß Punkt B1 oder D2 vorliegt und die vereinbarte Bedeutung
der Ansage ausreichend bewiesen ist, weist der Turnierleiter ein Berichtigtes Ergebnis zu, und
zwar auf der Grundlage des wahrscheinlichen Ergebnisses, wenn die Gegner zeitgerecht die
korrekte Auskunft erhalten hätten. Wenn der Turnierleiter feststellt, dass die Ansage keine
vereinbarte Bedeutung hat, weist er ein berichtigtes Ergebnis zu, und zwar auf der Grundlage
des wahrscheinlichen Ergebnisses, wenn das den Gegnern mitgeteilt worden wäre.','Decizia Arbitrului

1. Este de așteptat ca jucătorii să își dezvăluie înțelegerile parteneriale cu acuratețe

(vezi Legea 20F1); eșecul de a o face constituie dezinformare.

2. În orice înțelegere partenerială este necesar ca ambii jucători să posede aceeași
înțelegere mutuală, și este o infracțiune să descrii o înțelegere unde nu există
aceeași înțelegere mutuală. Dacă arbitrul stabilește că explicația eronată nu se
baza pe o înțelegere partenerială, el aplică Legea 21B.

3. Când există o infracțiune (ca la B1 sau D2) și există suficiente dovezi asupra
semnificației stabilite a declarației, arbitrul acordă un scor ajustat bazat pe
rezultatul probabil în cazul în care adversarii ar fi primit la timp explicația corectă.
Dacă arbitrul stabilește că semnificația declarației nu a fost stabilită, el acordă un
scor ajustat bazat pe rezultatul probabil în cazul în care adversarii ar fi fost astfel
informați.','apply_rule','[]');

-- Law 76
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1300,'76',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1301,'76',1300,'A. Kontrolle','A. Kontrolle','A. Control',1,'Kontrolle
1. Zuschauer im Spielbereich unterliegen der Kontrolle des Turnierleiters im Rahmen der
Durchführungsbestimmungen des Turniers.

2. Zuständige Verbände und Turnierveranstalter, die die Möglichkeit bieten, das laufende
Spiel elektronisch zu übertragen, können in den Durchführungsbestimmungen die
Konditionen für eine solche Übertragung und das zulässige Verhalten der Zuschauer
festlegen. (Ein Zuschauer darf nicht an einen Spieler in einem Durchgang, in dem dieser
spielt, Informationen übermitteln.)','Control

1. Spectatorii din zona de joc24 se află sub autoritatea arbitrului în conformitate cu

regulamentul turneului.

2. Autorităţile Regulatoare şi Organizatorii de Turnee care oferă facilităţi de
transmitere electronică în direct a jocului pot stabili prin regulament termenii care
guvernează aceste transmisii şi pot prescrie reguli de conduită pentru spectatori.
(Un spectator nu are voie să comunice cu un jucător în cursul unei sesiuni în care
cel din urmă joacă.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1302,'76',1300,'B. Am Tisch','B. Am Tisch','B. La Masă',1,'Am Tisch
1. Ein Zuschauer darf überhaupt nicht in das Blatt von mehr als einem Spieler schauen, wenn
die Durchführungsbestimmungen das nicht ausdrücklich erlauben.

2. Ein Zuschauer darf während einer Austeilung keinesfalls irgendeine Reaktion auf Lizit
oder Spiel zeigen.

3. Während einer Runde muss ein Zuschauer alle Verhaltensauffälligkeiten und Bemerkungen
unterlassen und darf mit keinem Spieler sprechen.

4. Ein Zuschauer darf keinesfalls einen Spieler stören.

5. Ein Zuschauer an einem Tisch darf nicht die Aufmerksamkeit auf irgendeinen, das Spiel
betreffenden, Vorfall lenken.','La Masă

1. Un spectator nu se poate uita la mâinile mai multor jucători, decât când

regulamentul o permite.

2. Un spectator nu poate manifesta nicio reacție la licitație sau joc în timpul donei.

3. În timpul unei runde, un spectator trebuie să se abțină de la manierisme sau

remarci de orice fel și trebuie să nu converseze cu niciun jucător.

4. Un spectator trebuie să nu deranjeze vreun jucător.

24 Zona de joc include toate părţile incintei unde un jucător poate fi prezent în timpul participării sale la o sesiune. Poate fi
definită suplimentar prin reglementări.
5. Un spectator nu va atrage atenția asupra niciunui aspect al jocului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1303,'76',1300,'C. Teilnahme','C. Teilnahme','C. Participare',1,'Teilnahme
1. Ein Zuschauer darf sich im Spielbereich zu Regeln oder Tatsachen nur äußern, wenn ihn
der Turnierleiter dazu auffordert.

2. Zuständige Verbände und Turnierleiter können festlegen, wie bei Regelwidrigkeiten, die
von Zuschauern verursacht worden sind, vorzugehen ist.','Participare

1. Un spectator poate vorbi despre un fapt sau lege în zona de joc24 numai la

cererea arbitrului.

2. Autorităţile Regulatoare şi Organizatorii de Turnee pot specifica un mod de a

gestiona neregularitățile cauzate de spectatori.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1304,'76',1300,'D. Status','D. Status','D. Statut',1,'Status
Jede Person im Spielbereich76.1, die weder ein Spieler ist noch zum Turnierpersonal gehört,
hat den Status eines Zuschauers, wenn der Turnierleiter nichts anderes festlegt.','Statut

Orice persoană din zona de joc24, în afara jucătorilor și a oficialilor turneului, are
statut de spectator dacă arbitrul nu decide altfel.','apply_rule','[]');

-- Law 77
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1305,'77',NULL,1,'Stichergebnis
Der Seite des Alleinspielers werden für einen erfüllten Kontrakt gutgeschrieben:

Für jeden Stich über sechs, der angesagt und gemacht ist:

wenn die Atoutfarbe

unkontriert

kontriert

rekontriert

♣

20

40

80

♦

20

40

♥

30

60

♠

ist:

30

60

80

120

120

In einem Ohne-Kontrakt

 Für den ersten Stich über sechs, der angesagt und gemacht ist

unkontriert kontriert rekontriert

40

30

80

60

160

120

Für jeden weiteren Stich

Stich-Punkte von 100 oder mehr, die in einem Board erzielt werden, ergeben ein volles Spiel.

Stich-Punkte von weniger als 100 ergeben einen Teilkontrakt.

Prämien-Punkte
Es werden der Seite des Alleinspielers gutgeschrieben

für die Erfüllung eines Schlemms

nicht in Gefahr

in Gefahr

Kleinschlemm (12 Stiche) geboten und erfüllt

Großschlemm (13 Stiche) geboten und erfüllt

500

1000

750

1500

76.1 Zum Spielbereich gehören alle Teile des Veranstaltungsgebäudes, in denen sich ein Spieler
während eines Durchgangs, in dem er spielt, aufhalten darf. Die Durchführungsbestimmungen
können ihn darüber hinaus umschreiben.
Überstiche
Für jeden Überstich (Stiche über den Kontrakt hinaus)

unkontriert

kontriert

rekontriert

nicht in Gefahr

 in Gefahr

Stichwert

Stichwert

100

200

200

400

Prämien für volles Spiel, Teilkontrakt, erfüllten Kontrakt
Für das Erfüllen eines vollen Spiels in Gefahr

Für das Erfüllen eines vollen Spiels nicht in Gefahr

Für das Erfüllen eines Teilkontrakts

 500

 300

 50

Für das Erfüllen jedes kontrierten, aber nicht rekontrierten Kontrakts

 50

Für das Erfüllen jedes rekontrierten Kontrakts

 100

Punkte für Faller
Den Gegnern des Alleinspielers werden gutgeschrieben, wenn der Kontrakt nicht erfüllt
worden ist:

für Faller (Stiche, die dem Alleinspieler zur Erfüllung seines Kontrakts fehlen):

nicht in Gefahr

in Gefahr

Für den ersten Faller

unkontriert

kontriert

rekontriert

Für jeden weiteren Faller

unkontriert

kontriert

rekontriert

Bonus für jeden Faller ab dem vierten aufwärts

unkontriert

kontriert

rekontriert

50

100

200

50

200

400

0

100

200

100

200

400

100

300

600

0

0

0

Wenn alle vier Spieler passen (siehe Regel 22), erhält jede Seite als Ergebnis 0 (Null).','Puncte de levată
Sunt marcate de axa declarantului dacă contractul este realizat.

Dacă atuul este
Pentru fiecare levată în plus licitată şi făcută
 Necontrat
 Contrat
 Recontrat


40

40



60
30
120

La un contract de fără atu
Pentru prima levată în plus licitată şi făcută
Pentru fiecare levată suplimentară

Necontrat
30

Contrat
60

Recontrat
120

100 puncte de levată sau mai multe obţinute pe o donă reprezintă o MANȘĂ.
Mai puţin de 100 de puncte de levată reprezintă o PARȚIALĂ.

Bonificaţii
Sunt marcate de axa declarantului.

Şlemuri

Pentru realizarea unui şlem
Mic șlem (12 levate) licitat şi făcut
Mare șlem (13 levate) licitat şi făcut

Levate suplimentare

Pentru fiecare levată suplimentară
(făcută în plus faţă de contract)
 Necontrat

Nevulnerabil
1000

Vulnerabil
1500

Nevulnerabil

Vulnerabil

Valoarea levatei

Valoarea levatei
 Contrat
 Recontrat

Bonificaţii pentru manşă, parţială, contract realizat

Pentru realizarea manşei

Pentru realizarea unui scor parţial
Pentru realizarea unui contract

Penalizări pentru căderi
200

Vulnerabil
Nevulnerabil

Contrat
Recontrat
400
300
50
Sunt marcate de adversarii declarantului dacă contractul nu e realizat.
Levatele de cădere sunt levatele lipsă până la realizarea contractului.

Nevulnerabil

Vulnerabil

Necontrat Contrat

Recontrat Necontrat Contrat

Recontrat

Pentru prima levată de
cădere

fiecare
Pentru
de cădere suplimentară

levată

De la a patra levată de
cădere se adaugă
100
100
400
200
100
600
100
0
0

Dacă toţi cei 4 jucători pasează (vezi Legea 22) scorul ambelor axe este zero.','apply_rule','[]');

-- Law 78
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1306,'78',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1307,'78',1306,'A. Matchpunkte','A. Matchpunkte','A. Scorul în Puncte de Meci',1,'Matchpunkte
Die Grundlage für die Zuteilung von Matchpunkten an einen Teilnehmer bilden die
Ergebnisse der anderen Teilnehmer, die dasselbe Board gespielt haben und deren Ergebnisse
mit dem dieses Teilnehmers verglichen werden. Ein Teilnehmer erhält zwei Matchpunkte für
jedes Ergebnis, das schlechter als das seine ist, einen Matchpunkt für jedes gleich gute, und
null Matchpunkte für jedes bessere Ergebnis.','Scorul în Puncte de Meci

Când scorul se calculează în puncte de meci, fiecărui concurent i se atribuie, prin
comparație cu rezultatele altor concurenți care au jucat aceeași donă, 2 unități de
scor (puncte sau semipuncte de meci) pentru fiecare rezultat inferior rezultatului său,
1 unitate de scor pentru fiecare rezultat egal cu al său, și 0 unități de scor pentru
fiecare rezultat superior rezultatului său.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1308,'78',1306,'B. Internationale Matchpunkte (IMP)','B. Internationale Matchpunkte (IMP)','B. Scorul în IMP-uri',1,'Internationale Matchpunkte (IMP)
Bei einer Auswertung in Internationalen Matchpunkten (IMP) wird auf jedem Board die
Differenz zwischen den beiden verglichenen Ergebnissen nach der folgenden Skala in IMP
umgerechnet:

Differenz in Punkten IMP

0–10
20–40
50–80
90–120
130–160
170–210
220–260
270–310
320–360
370–420
430–490
500–590
600–740
750–890
900–1090
1100–1290
1300–1490
1500–1740
1750–1990
2000–2240
2250–2490
2500–2990
3000–3490
3500–3990
ab 4000

0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24','Scorul în IMP-uri

Când scorul se calculează în IMP-uri, pentru fiecare donă, diferența de puncte între
cele 2 rezultate care se compară este convertită în IMP-uri conform scalei de mai jos.

Diferenţa de puncte
0-10
20- 40

IMP-uri
 1

Diferența de puncte

IMP-uri

750-890
76

50- 80
90-120
130-160
170-210
220-260
270-310
320-360
370-420
430-490
500-590
600-740
 3
 5
 7
 9
11
900-1090
1100-1290
1300-1490
1500-1740
1750-1990
2000-2240
2250-2490
2500-2990
3000-3490
3500-3990
4000+
15
17
19
21
23','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1309,'78',1306,'C. Ausrechnung nach Totalpunkten','C. Ausrechnung nach Totalpunkten','C. Scorul în Puncte Totale',1,'Ausrechnung nach Totalpunkten
Bei Auswertung nach Totalpunkten bekommt jeder Teilnehmer das Nettoergebnis über alle
gespielten Boards.','Scorul în Puncte Totale

Când scorul se calculează în puncte totale, scorul fiecărui concurent este scorul net
total al tuturor donelor jucate.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1310,'78',1306,'D. Austragungsbedingungen','D. Austragungsbedingungen','D. Condiții de Concurs',1,'Austragungsbedingungen
Mit Zustimmung des Zuständigen Verbandes können andere Auswertungsmethoden (z. B.
Umrechnung in Siegpunkte) verwendet werden. Der Turnierveranstalter hat die
Austragungsbedingungen vor einem Bewerb bekannt zu geben. Diese sollten enthalten:
Teilnahmebedingungen, Auswertungsmethode, Ermittlung der Sieger, Reihung bei
Punktegleichstand und dergleichen. Die Austragungsbedingungen dürfen keinesfalls im
Widerspruch zu den Regeln oder verbandseigenen Bestimmungen stehen und müssen alle
Informationen enthalten, die der Zuständige Verband festgelegt hat. Sie sollen den
Teilnehmern zur Verfügung stehen.','Condiții de Concurs

Cu acordul Autorității Regulatoare se pot adopta alte metode de scor (de exemplu
conversia în Puncte de Victorie). Organizatorul Turneului ar trebui să publice în
avans Condițiile de Concurs pentru un turneu sau concurs. Acestea ar trebui să
precizeze condițiile de înscriere, metodele de scor, determinare a câștigătorilor,
departajare în caz de egalitate și altele asemenea. Condițiile nu pot intra în conflict
cu legea sau regulamentul și vor cuprinde orice informație specificată de Autoritatea
Regulatoare. Ele trebuie puse la dispoziția competitorilor.','apply_rule','[]');

-- Law 79
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1311,'79',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1312,'79',1311,'A. Einigkeit über die gewonnenen Stiche','A. Einigkeit über die gewonnenen Stiche','A. Acord asupra Levatelor Câștigate',1,'Einigkeit über die gewonnenen Stiche
1. Über die Anzahl der gewonnenen Stiche muss Einigkeit erzielt werden, bevor alle vier
Hände ins Board zurückgesteckt worden sind.

2. Ein Spieler darf keinesfalls wissentlich das Ergebnis für einen Stich, den seine Seite nicht
gewonnen hat, oder den Verzicht auf einen Stich, den seine Gegner nicht verlieren konnten,
annehmen.','Acord asupra Levatelor Câștigate

1. Se va cădea de acord asupra numărului de levate câștigate înainte de

reintroducerea celor 4 mâini în etui.

2. Un jucător trebuie să nu accepte în mod conștient scorul pentru o levată pe care
axa sa nu a câștigat-o sau concesia unei levate pe care adversarii n-o puteau
pierde.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1313,'79',1311,'B. Uneinigkeit über die gewonnenen Stiche','B. Uneinigkeit über die gewonnenen Stiche','B. Dezacord asupra Levatelor Câștigate',1,'Uneinigkeit über die gewonnenen Stiche
Bei Uneinigkeit muss der Turnierleiter gerufen werden, und dann gilt:

1. Der Turnierleiter stellt fest, ob es einen Claim oder Verzicht gegeben hat; diesfalls wendet
er Regel 69B oder 71 an.

2. Wenn Absatz B1 nicht zutrifft, entscheidet der Turnierleiter, welches Ergebnis einzutragen
ist.

3. Wenn der Turnierleiter nicht vor dem Ende der Runde gerufen wird, darf er das Ergebnis
für beide Seiten nur ändern, wenn er zu einer klaren Überzeugung hinsichtlich des
Tischergebnisses gekommen ist. Andernfalls soll er entweder das eingetragene Ergebnis
stehen lassen, oder das Ergebnis einer Seite reduzieren, ohne das der anderen zu erhöhen.','Dezacord asupra Levatelor Câștigate

Dacă survine un dezacord, trebuie chemat arbitrul, și apoi:

1. Arbitrul stabilește dacă a avut loc o revendicare sau concesie și, dacă da, aplică

Legea 69B sau Legea 71.

2. Dacă nu se aplică B1, arbitrul decide scorul care trebuie înregistrat.

3. Dacă arbitrul nu a fost chemat înainte de sfârșitul rundei, scorul poate fi schimbat
pentru ambele axe doar când el este ferm convins asupra rezultatului obținut la
masă. Altfel fie va lăsa valabil rezultatul înregistrat, fie va scădea scorul unei axe
fără a crește scorul celeilalte.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1314,'79',1311,'C. Fehler beim Eintragen','C. Fehler beim Eintragen','C. Eroare de Scor',1,'Fehler beim Eintragen
1. Ein Fehler beim Eintragen oder Berechnen eines Scores, über das Einigkeit bestanden hat,
egal ob ihn ein Spieler oder Mitarbeiter gemacht hat, kann bis zum Ende des vom
Turnierveranstalter festgelegten Zeitraumes berichtigt werden. Wenn der Turnierveranstalter
keinen späteren79.1 Zeitpunkt festsetzt, endet diese Korrekturphase 30 Minuten nach dem
Aushängen des offiziellen Ergebnisses.

2. Mit Zustimmung des Turnierveranstalters kann ein Eintragungsfehler auch nach dem Ende
der Korrekturphase richtiggestellt werden, wenn der Turnierleiter zweifelsfrei überzeugt ist,
dass die Eintragung falsch ist.','Eroare de Scor

1. O eroare de înregistrare sau calcul al scorului convenit, fie că aparține unui
jucător sau unui oficial, poate fi corectată până la expirarea perioadei specificate
de Organizatorul Turneului. Dacă acesta nu specifică un timp ulterior25, Perioada
de Corecție expiră la 30 de minute după punerea la dispoziție a rezultatului oficial.

2. Cu acordul Organizatorului Turneului, o eroare de scor poate fi corectată după
expirarea Perioadei de Corecție dacă arbitrul este convins că rezultatul înregistrat
este greșit.','apply_rule','[]');

-- Law 80
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1315,'80',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1316,'80',1315,'A. Zuständiger Verband','A. Zuständiger Verband','A. Autoritatea Regulatoare',1,'Zuständiger Verband
1. Der nach diesen Regeln Zuständige Verband ist:

(a) die World Bridge Federation für ihre eigenen Turniere und Veranstaltungen.

79.1 Ein früherer Zeitpunkt kann festgesetzt werden, wenn die Eigenart des Bewerbs das erfordert.
(b) der entsprechende Zonenverband für die Turniere und Veranstaltungen unter seiner Ägide.

(c) für alle anderen Turniere und Veranstaltungen der nationale Verband, unter dessen Ägide
sie stattfinden.

2. Der Zuständige Verband hat die Zuständigkeiten und Befugnisse, die ihm in diesen Regeln
eingeräumt sind.

3. Der Zuständige Verband kann seine Befugnisse delegieren (wobei er die
Letztverantwortung für ihre Ausübung beibehält) oder übertragen (womit er keine weitere
Verantwortung für ihre Ausübung hat).','Autoritatea Regulatoare

1. Conform acestor legi, Autoritatea Regulatoare este:

a) World Bridge Federation pentru propriile campionate și evenimente mondiale.

b) Autoritatea Zonală respectivă pentru turnee și evenimente organizate sub

auspiciile sale.

c) Organizația Națională de Bridge sub auspiciile căreia are loc turneul, pentru

orice alt turneu sau eveniment.

2. Autoritatea Regulatoare are responsabilităţile şi puterile specificate în aceste legi.

3. Autoritatea Regulatoare își poate delega puterile (rămânând responsabilă pentru
exercitarea acestora) sau le poate atribui (caz în care nu mai este responsabilă
pentru exercitarea lor).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1317,'80',1315,'B. Turnierveranstalter','B. Turnierveranstalter','B. Organizatorul Turneului',1,'Turnierveranstalter
1. Der Zuständige Verband kann eine „Turnierveranstalter“ genannte (physische oder
juridische) Person zur Kenntnis nehmen, die den Anforderungen des Zuständigen Verbandes
und dieser Regeln unterliegt, und für die Vorbereitung und Abwicklung eines Turniers oder
Bewerbs verantwortlich ist. Die Befugnisse und Pflichten des Turnierveranstalters können
delegiert werden, diesem bleibt aber die Verantwortung für ihre Wahrnehmung. Der
Zuständige Verband und der Turnierveranstalter können dieselbe Körperschaft sein.

2. Zu den Zuständigkeiten und Pflichten des Turnierveranstalters zählen:

(a) die Ernennung eines Turnierleiters. Wenn keiner ernannt worden ist, sollen die Spieler
jemanden beauftragen, seine Funktion auszuüben.

(b) die Vorbereitung des Turniers, einschließlich der Spielsäle, Ausrüstung und aller anderen
logistischen Erfordernisse.

(c) Datum und Uhrzeit jedes Durchgangs festzulegen.

(d) die Teilnahmebedingungen festzulegen.

(e) die Bedingungen für Lizit und Spiel im Einklang mit diesen Regeln festzulegen, sowie
allfällige besondere Spielbedingungen (z. B. Spiel mit Screens – Regelungen für die
Korrektur von Aktionen, die nicht auf die andere Screenseite übermittelt worden sind, dürfen
abgeändert werden).

(f) Durchführungsbestimmungen zu erlassen, die diese Regeln ergänzen, ihnen aber nicht
widersprechen dürfen.

(g) (i) für die Assistenten zu sorgen, die der Turnierleiter braucht.80.1

(ii) anderes Personal einzustellen und dessen Pflichten und Zuständigkeiten festzulegen.

(h) Möglichkeiten für die Anmeldungen zu schaffen.

(i) geeignete Spielbedingungen zu schaffen und diese den Teilnehmern mitzuteilen.

80.1 In manchen Jurisdiktionen ist es normal, dass der Turnierleiter für einige oder alle dieser Aufgaben
zuständig ist.
(j) dafür zu sorgen, dass die Ergebnisse gesammelt und ausgewertet werden, sowie eine
offizielle Reihung erstellt wird. 80.1

(k) geeignete Vorkehrungen für die Abwicklung von Berufungen nach Regel 93 zu treffen.

(l) dazu alle anderen Zuständigkeiten und Pflichten, die ihm in diesen Regeln übertragen sind.','Organizatorul Turneului

1. Autoritatea Regulatoare poate recunoaște o entitate desemnată ca „Organizatorul
Turneului” care, în conformitate cu cerințele Autorității Regulatoare și prevederile
acestor legi, este responsabilă pentru aranjarea şi pregătirea unui turneu sau
eveniment. Puterile și îndatoririle Organizatorului Turneului se pot delega, dar
acesta rămâne responsabil pentru execuția lor. Autoritatea Regulatoare poate fi
una și aceeași cu Organizatorul Turneului.

2. Puterile și îndatoririle Organizatorului Turneului includ:

a) Desemnarea arbitrului. Dacă nu este desemnat niciun arbitru, jucătorii ar

trebui să desemneze o persoană care va exercita atribuţiile arbitrului.

25 Se poate specifica și un timp anterior, dacă tipul de concurs o cere.
b) Să facă în avans aranjamente pentru desfăşurarea turneului, incluzând

incintele de joc, echipamentul şi toate celelalte necesităţi logistice.

c) Să stabilească data și ora fiecărei sesiuni.

d) Să stabilească condițiile de înscriere.

e) Să stabilească condiţiile de licitaţie şi joc conform acestor legi, precum și orice
alte condiţii speciale (ca de exemplu jocul la paravane – prevederile privind
rectificarea acţiunilor netransmise dincolo de paravan pot varia).

f) Să anunțe reglementările suplimentare dar nu în conflict cu aceste legi.

g)

i. Să aranjeze26 desemnarea asistenților arbitrului.

ii. Să desemneze restul personalului și să le stabilească îndatoririle și

responsabilitățile.

h) Să aranjeze26 acceptarea și afișarea înscrierilor.

i) Să asigure condiţii adecvate de joc şi să le anunţe participanţilor.

j) Să aranjeze26 colectarea scorurilor, calculul rezultatelor şi înregistrarea oficială

a acestora.

k) Să facă aranjamentele adecvate pentru desfășurarea apelurilor conform Legii

93.

l) Orice alte puteri și îndatoriri conferite de aceste legi.','apply_rule','[]');

-- Law 81
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1318,'81',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1319,'81',1318,'A. Offizieller Status','A. Offizieller Status','A. Statut Oficial',1,'Offizieller Status
Der Turnierleiter ist der offizielle Repräsentant der Turnierveranstalters.','Statut Oficial

Arbitrul este reprezentantul oficial al Organizatorului Turneului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1320,'81',1318,'B. Beschränkungen und Verantwortlichkeiten','B. Beschränkungen und Verantwortlichkeiten','B. Constrângeri și Responsabilități',1,'Beschränkungen und Verantwortlichkeiten
1. Der Turnierleiter ist für die technische Abwicklung des Turniers an Ort und Stelle
verantwortlich. Er hat die Vollmacht, alle Versäumnisse des Turnierveranstalters zu beheben.

2. Der Turnierleiter wendet diese Regeln und alle ergänzenden Bestimmungen, die aufgrund
einer Ermächtigung durch diese Regeln erlassen worden sind, an und ist an sie gebunden.','Constrângeri și Responsabilități

1. Arbitrul e responsabil de organizarea tehnică la faţa locului a turneului. El are

puterea să remedieze orice omisiuni ale Organizatorului Turneului.

2. Arbitrul aplică și este constrâns de aceste legi și de reglementările suplimentare

anunţate cu autoritatea conferită de aceste legi.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1321,'81',1318,'C. Pflichten und Rechte des Turnierleiters','C. Pflichten und Rechte des Turnierleiters','C. Îndatoririle și Puterile Arbitrului',1,'Pflichten und Rechte des Turnierleiters
Der Turnierleiter (und nicht die Spieler) ist dafür verantwortlich, Regelwidrigkeiten zu
korrigieren und Schaden auszugleichen. Zu seinen Pflichten und Rechten zählen
normalerweise auch die folgenden:

1. die Disziplin aufrecht zu erhalten und den geordneten Ablauf des Turniers sicher zu stellen.

2. Diese Regeln anzuwenden und auszulegen, und die Spieler von ihren Rechten und
Pflichten in Kenntnis zu setzen.

3. alle Fehler und Regelwidrigkeiten, die er wie auch immer bemerkt, innerhalb der Zeiträume
nach Regel 79C und 92B richtig zu stellen.

4. zutreffende Korrekturen anzuordnen und seine Rechte nach Regel 90 und 91 auszuüben.

5. Korrekturen nach seinem Ermessen und auf Antrag der nicht-schuldigen Seite aus gutem
Grund zu erlassen.

6. Streitigkeiten beizulegen.

7. alles Relevante einem zuständigen Komitee vorzulegen.

8. auf Wunsch des Turnierveranstalters die Resultate für die offiziellen Aufzeichnungen zu
melden, und alles andere, was ihm der Turnierveranstalter übertragen hat, zu erledigen.','Îndatoririle și Puterile Arbitrului

26 Este firesc în anumite jurisdicții ca arbitrul să își asume responsabilitatea pentru anumite sau toate sarcinile atribuite
aici Organizatorului Turneului.
Arbitrul (nu jucătorii) poartă reponsabilitatea rectificării neregularităţilor şi compensării
prejudiciului. Îndatoririle şi puterile arbitrului mai cuprind în mod normal următoarele:

1. Să mențină disciplina și să asigure buna desfășurare a jocului.

2. Să administreze şi să interpreteze aceste Legi şi să comunice jucătorilor

drepturile şi reponsabilităţile lor legale.

3. Să rectifice o eroare sau neregularitate de care află prin orice mijloc, în limita

perioadelor stabilite conform Legilor 79C și 92B.

4. Să decidă rectificări atunci când acestea sunt aplicabile și să-și exercite puterile

conferite de Legile 90 și 91.

5. Să renunțe la rectificări, la discreţia sa, la cererea axei nevinovate.

6. Să aplaneze conflictele.

7. Să înainteze orice problemă unei comisii adecvate.

8. Să raporteze rezultatele oficiale dacă Organizatorul Turneului o cere și să

gestioneze orice alte aspecte delegate lui de către Organizatorul Turneului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1322,'81',1318,'D. Delegation von Pflichten','D. Delegation von Pflichten','D. Delegarea Îndatoririlor',1,'Delegation von Pflichten
Der Turnierleiter kann alle und jede seiner Pflichten seinen Gehilfen delegieren, wird aber
dadurch nicht der Verantwortung für ihre korrekte Durchführung entbunden.','Delegarea Îndatoririlor

Arbitrul își poate delega oricare dintre îndatoriri asistenților, dar nu este astfel absolvit
de responsabilitatea îndeplinirii corecte a acestora.','apply_rule','[]');

-- Law 82
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1323,'82',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1324,'82',1323,'A. Pflicht des Turnierleiters','A. Pflicht des Turnierleiters','A. Datoria Arbitrului',1,'Pflicht des Turnierleiters
Der Turnierleiter ist verpflichtet, Fehler im Ablauf richtig zu stellen und den Fortgang des
Turniers in einer Weise zu gewährleisten, die diesen Regeln nicht widerspricht.','Datoria Arbitrului

Arbitrul este responsabil să rectifice erorile de procedură și să asigure derularea
jocului într-o manieră care nu contravine acestor legi.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1325,'82',1323,'B. Korrektur von Fehlern','B. Korrektur von Fehlern','B. Rectificarea unei Erori',1,'Korrektur von Fehlern
Um einen Fehler im Ablauf richtig zu stellen, kann der Turnierleiter:

1. ein berichtigtes Ergebnis zuweisen, wo diese Regeln das zulassen.

2. das Spiel eines Boards verlangen, verschieben oder streichen.

3. alle anderen Befugnisse ausüben, die ihm diese Regeln einräumen.','Rectificarea unei Erori

Pentru a rectifica o eroare de procedură arbitrul poate:

1. Să acorde un scor ajustat conform prevederilor acestor legi.

2. Să ceară, să amâne sau să anuleze jocul unei done.

3. Să-și exercite orice altă putere conferită de aceste legi.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1326,'82',1323,'C. Fehler des Turnierleiters','C. Fehler des Turnierleiters','C. Eroare de Arbitraj',1,'Fehler des Turnierleiters
Wenn der Turnierleiter eine Entscheidung getroffen hat, die er nachträglich als falsch erkennt,
und wenn keine Korrektur ein normales Spiel des Boards ermöglicht, hat er ein berichtigtes
Ergebnis zuzuweisen und dabei beide Seiten als nicht-schuldig zu betrachten.','Eroare de Arbitraj

Dacă s-a dat o decizie pe care arbitrul o apreciază ulterior ca fiind incorectă, şi dacă
nicio rectificare nu permite obținerea unui scor normal pe donă, el va acorda un scor
ajustat, considerând în acest caz că ambele axe sunt nevinovate.','apply_rule','[]');

-- Law 83
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1327,'83',NULL,1,'Wenn der Turnierleiter meint, dass eine Überprüfung seiner Entscheidung in einer Tatsachen-
oder Regelfrage oder Ausübung seiner Disziplinarbefugnisse angebracht sein könnte, soll er
einen Teilnehmer auf sein Recht zu berufen hinweisen, oder selbst die Sache dem zuständigen
Komitee vorlegen.','Dacă arbitrul crede că ar putea fi cazul să se revizuiască o decizie a sa privind
faptele sau un exercițiu al puterii sale discreționare, el va înștiința concurentul asupra
dreptului său de a face apel sau va înainta cazul unei comisii adecvate.','apply_rule','[]');

-- Law 84
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1328,'84',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1329,'84',1328,'A. keine Korrektur','A. keine Korrektur','A. Nicio Rectificare',1,'keine Korrektur
Wenn die Regeln keine Korrektur vorschreiben, und er keinen Anlass hat, seine
Ermessensbefugnis auszuüben, ordnet er an, dass die Spieler Lizitation oder Spiel fortsetzen.','Nicio Rectificare

Dacă legea nu prevede nicio rectificare şi nu este o situație în care el să-şi exercite
puterile discreţionare, instruiește jucătorii să continue licitaţia şi jocul.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1330,'84',1328,'B. Regeln sehen eine Korrektur vor','B. Regeln sehen eine Korrektur vor','B. Rectificare Prevăzută de Lege',1,'Regeln sehen eine Korrektur vor
Wenn der Vorfall klar von einer Regel abgedeckt ist, stellt er die in dieser Regel für diese
Regelwidrigkeit vorgeschriebene Korrektur fest und stellt sicher, dass sie durchgeführt wird.','Rectificare Prevăzută de Lege

Dacă situația este clar acoperită de o Lege care prescrie rectificarea pentru
neregularitate, determină acea rectificare și se asigură că este implementată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1331,'84',1328,'C. Wahlmöglichkeit eines Spielers','C. Wahlmöglichkeit eines Spielers','C. Opțiunea Jucătorului',1,'Wahlmöglichkeit eines Spielers
Wenn eine Regel einem Spieler eine Wahl zwischen Korrekturen ermöglicht, erklärt der
Turnierleiter die Möglichkeiten und achtet darauf, dass eine Wahl getroffen und die gewählte
Korrektur durchgeführt wird.','Opțiunea Jucătorului

Dacă o Lege îi dă unui jucător posibilitatea de a alege o rectificare, arbitrul explică
opțiunile și are grijă ca alegerea să fie făcută și implementată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1332,'84',1328,'D. Wahlmöglichkeit des Turnierleiters','D. Wahlmöglichkeit des Turnierleiters','D. Opțiunea Arbitrului',1,'Wahlmöglichkeit des Turnierleiters
Der Turnierleiter entscheidet jeden zweifelhaften Aspekt zugunsten der nicht-schuldigen
Seite. Er ist bemüht, den Zustand wieder herzustellen, der billig ist. Wenn es nach seinem
Urteil wahrscheinlich ist, dass eine nicht-schuldige Seite durch eine Regelwidrigkeit, für die
diese Regeln keine Korrektur vorsehen, geschädigt worden ist, weist er ein Berichtigtes
Ergebnis zu (siehe Regel 12).','Opțiunea Arbitrului

Arbitrul judecă orice aspect îndoielnic în favoarea axei nevinovate. El caută să
restabilească echitatea. Dacă în opinia lui este probabil ca axa nevinovată să fi fost
prejudiciată de o neregularitate pentru care aceste legi nu prevăd o rectificare, el
ajustează scorul (vezi Legea 12).','apply_rule','[]');

-- Law 85
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1333,'85',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1334,'85',1333,'A. Beweiswürdigung des Turnierleiters','A. Beweiswürdigung des Turnierleiters','A. Aprecierea Arbitrului',1,'Beweiswürdigung des Turnierleiters
1. Beim Feststellen der Tatsachen soll der Turnierleiter danach entscheiden, was ihm
wahrscheinlicher erscheint, das heißt nach der Gewichtung der Beweise, die er sammeln kann.

2. Wenn der Turnierleiter dann die Tatsachen zu seiner Zufriedenheit festgestellt hat,
entscheidet er nach Regel 84.','Aprecierea Arbitrului

1. În stabilirea faptelor, arbitrul își va baza punctul de vedere pe probabilități, adică

pe ponderile dovezilor pe care reușește să le colecteze.

2. Dacă apoi arbitrul consideră că a determinat faptele, decide ca în Legea 84.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1335,'85',1333,'B. Tatsachen nicht festgestellt','B. Tatsachen nicht festgestellt','B. Faptele Nu Pot Fi Stabilite',1,'Tatsachen nicht festgestellt
Wenn der Turnierleiter nicht in der Lage ist, die Tatsachen festzustellen, trifft er eine
Entscheidung, die es ermöglicht, das Spiel fortzusetzen.','Faptele Nu Pot Fi Stabilite

Dacă arbitrul nu reușește să stabilească faptele într-o măsură satisfăcătoare, el ia o
decizie care va permite ca jocul să continue.','apply_rule','[]');

-- Law 86
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1336,'86',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1337,'86',1336,'A. Ersatzboard','A. Ersatzboard','A. Donă Înlocuitoare',1,'Ersatzboard
Der Turnierleiter darf seine Befugnis nach Regel 6, ein einzelnes Board neu teilen zu lassen,
nicht ausüben, wenn das Endresultat eines Matches ohne dieses Board einem Teilnehmer
bekannt sein könnte. Stattdessen weist er ein Berichtigtes Ergebnis zu.','Donă Înlocuitoare

Arbitrul nu-şi va exercita puterea dată de Legea 6 de a cere redistribuirea unei done
atunci când rezultatul final al meciului fără această donă ar putea fi cunoscut de un
jucător. În schimb, el acordă un scor ajustat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1338,'86',1336,'B. Ergebnis am anderen Tisch erzielt','B. Ergebnis am anderen Tisch erzielt','B. Rezultat Obținut la Cealaltă Masă',1,'Ergebnis am anderen Tisch erzielt
1. einzelnes Ergebnis

Wenn der Turnierleiter im Teamkampf ein Berichtigtes Ergebnis zuweist und das Ergebnis
am anderen Tisch zwischen denselben Teilnehmern für eine Seite klar günstig ist, soll der
Turnierleiter ein ZBE zuweisen [siehe Regel 12C1(c); für mehrfache berichtigte Ergebnisse
siehe aber unten B2].

2. Mehrfache Ergebnisse an einem oder mehreren Tischen86.1

Wenn im Teamkampf zwei oder mehr nicht vergleichbare Ergebnisse zwischen denselben
Teilnehmern erzielt worden sind, oder wenn der Turnierleiter aufgrund dieser Regeln mehr als
ein Berichtigtes Ergebnis zuzuweisen hat, dann gilt:

(a) Wenn keinen Teilnehmer eine Schuld trifft, soll der Turnierleiter die betroffenen Boards
streichen und auf jedem ein KBE zuweisen (siehe Regel 12C2); wenn der Zeitplan es zulässt,
kann er auch ein oder mehrere Ersatzboards spielen lassen (siehe aber oben A).

(b) Wenn nur einen Teilnehmer eine Schuld trifft, soll der Turnierleiter der nicht-schuldigen
Seite auf jedem betroffenen Board entweder ein KBE „über-Schnitt“ [siehe Regel 12C2(b)]

86.1 einschließlich Ergebnisse einer vertauschten Partie
oder ein ZBE zuweisen, je nachdem, was für diesen Teilnehmer günstiger ist. Der schuldigen
Seite wird das komplementäre Ergebnis zugewiesen.

(c) Wenn beide Teilnehmer eine Schuld trifft, soll der Turnierleiter die betroffenen Boards
streichen und auf jedem ein KBE zuweisen (siehe Regel 12C2).

3. Der Zuständige Verband kann andere Bestimmungen erlassen, wenn die Boards nur an
einem Tisch zwischen denselben oder mehreren Teilnehmern gespielt worden sind. Das
Ergebnis für jedes Board kann durch verbandseigene Bestimmungen abweichend von B2
festgelegt werden; ohne eine solche Bestimmung verfährt der Turnierleiter, wie oben
vorgesehen.','Rezultat Obținut la Cealaltă Masă

1. Un Singur Rezultat Obținut

La jocul de echipe, când arbitrul acordă un scor ajustat și rezultatul între aceiași
concurenți la cealaltă masă este în mod clar favorabil uneia dintre părți, arbitrul va
acorda un scor ajustat înlocuitor [vezi Legea 12C1c), dar pentru mai multe scoruri
ajustate vezi B2 mai jos].

2. Mai Multe Rezultate Obținute la Una sau Mai Multe Mese27

La jocul de echipe, când s-au obținut două sau mai multe rezultate necomparabile
între aceiași concurenți sau oricând aceste Legi cer ca arbitrul să acorde mai mult
de un singur scor ajustat:

a) Dacă niciun concurent nu este vinovat, arbitrul va anula dona (donele) și va
acorda unul sau mai multe scoruri ajustate artificial [vezi Legea 12C2] sau,
dacă timpul o permite, va cere jucarea unor done înlocuitoare (dar vezi A mai
sus).

b) Dacă numai un concurent este vinovat, arbitrul va acorda părții nevinovate,
pentru fiecare donă în cauză, ori un scor ajustat artificial de medie plus [vezi
Legea 12C2b)], ori un scor ajustat înlocuitor, în funcție de care este mai
favorabil. Partea vinovată va primi complementul scorului acordat adversarilor.

c) Dacă ambii concurenți sunt vinovați, arbitrul va anula dona (donele) și va

acorda unul sau mai multe scoruri ajustate artificial [vezi Legea 12C2].

3. Autoritatea Regulatoare poate dispune diferit pentru situațiile în care donele au
fost jucate la o singură masă între aceiași sau mai mulți concurenți. Scorul
acordat pentru fiecare asemenea donă poate diferi prin regulament de cel
prescris la B2, dar în absența unei reglementări relevante arbitrul procedează ca
mai sus.','apply_rule','[]');

-- Law 87
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1339,'87',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1340,'87',1339,'A. Definition','A. Definition','A. Definiție',1,'Definition
Ein Board gilt als vertauscht, wenn der Turnierleiter feststellt, dass sich eine oder mehrere
Karten an einem falschen Platz im Board befinden, oder wenn er feststellt, dass Teiler oder
Gefahrenlage zwischen Kopien desselben Boards abweichen, und so Teilnehmer, deren
Ergebnisse hätten verglichen werden sollen, deshalb das Board nicht in identischer Form
gespielt haben.','Definiție

27 Inclusiv rezultate pe o donă incorectă
O donă este considerată incorectă dacă arbitrul determină că o carte (sau mai multe)
a fost deplasată în etui, sau că distribuitorul sau vulnerabilitatea diferă între copiile
aceleiaşi done, și din acest motiv concurenţii care trebuia să-şi compare rezultatele
nu au jucat dona în formă identică.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1341,'87',1339,'B. Paar- und Individualturniere','B. Paar- und Individualturniere','B. Calcularea Scorului în Jocul de Perechi sau Individual',1,'Paar- und Individualturniere
Der Turnierleiter stellt möglichst genau fest, welche Ergebnisse auf dem Board in der
richtigen, und welche in einer geänderten Form erzielt worden sind. Er teilt danach die
Ergebnisse in Gruppen und rechnet jede solche Gruppe für sich aus, wie es die
Durchführungsbestimmungen für dieses Turnier vorsehen. (Gibt es keine, wählt der
Turnierleiter seine Methode und gibt sie bekannt.)','Calcularea Scorului în Jocul de Perechi sau Individual

Când calculează scorul pe o donă incorectă, arbitrul stabilește pe cât posibil care
scoruri au fost obținute cu dona jucată în forma corectă și care cu dona în forma
(formele) alterată. Pe această bază împarte scorurile în grupe și evaluează separat
fiecare grupă conform regulamentului turneului. (În absența unei reglementări
relevante, arbitrul își alege și își face cunoscută metoda.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1342,'87',1339,'C. Teamturniere','C. Teamturniere','C. Calcularea Scorului în Jocul de Echipe',1,'Teamturniere
Siehe Regel 86B2.

Siehe Regel 12C2.','Calcularea Scorului în Jocul de Echipe

Vezi Legea 86B2.','apply_rule','[]');

-- Law 88
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1343,'88',NULL,1,'Siehe Regel 12C2.','Vezi Legea 12C2.','apply_rule','["12C2"]');

-- Law 89
INSERT INTO decision_nodes (id,rule_number,parent_id,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1344,'89',NULL,1,'Siehe Regel 12C3.','Vezi Legea 12C3.','apply_rule','[]');

-- Law 90
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1345,'90',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1346,'90',1345,'A. Befugnis des Turnierleiters','A. Befugnis des Turnierleiters','A. Autoritatea Arbitrului',1,'Befugnis des Turnierleiters
Zusätzlich zur Anwendung der Korrekturen, die diese Regeln vorsehen, kann der Turnierleiter
auch Ordnungsstrafen für jeden Verstoß verhängen, der das Turnier ungebührlich verzögert
oder behindert, anderen Teilnehmern unangenehm ist, die korrekten Abläufe verletzt oder das
Zuweisen eines Berichtigten Ergebnisses erfordert.','Autoritatea Arbitrului

Pe lângă că implementează rectificările din aceste Legi, arbitrul poate de asemenea
să aplice penalizări procedurale pentru orice abatere care întârzie nemotivat sau
obstrucționează jocul, deranjează alți concurenți, încalcă procedura corectă, sau
cauzează acordarea unui scor ajustat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1347,'90',1345,'B. Verstöße, die einer Ordnungsstrafe unterliegen','B. Verstöße, die einer Ordnungsstrafe unterliegen','B. Abateri care Fac Obiectul Penalizărilor Procedurale',1,'Verstöße, die einer Ordnungsstrafe unterliegen
Verstöße, die einer Ordnungsstrafe unterliegen, sind zum Beispiel:
1. Erscheinen eines Teilnehmers nach dem festgesetzten Turnierbeginn.

2. unangebracht langsames Spiel eines Teilnehmers.

3. Diskussionen eines Lizits, Spiels oder Ergebnisses, die an einem anderen Tisch mitgehört
werden können.

4. unerlaubtes Vergleichen von Ergebnissen mit einem anderen Teilnehmer.

5. Berühren von Karten eines anderen Spielers (siehe Regel 7).

6. eine oder mehrere Karten in ein falsches Fach des Boards stecken.

7. Fehler im Ablauf (wie zum Beispiel Nichtzählen der Karten, Spiel eines falschen Boards
usw.), die es erforderlich machen, irgendeinem Teilnehmer ein Berichtigtes Ergebnis
zuzuweisen.

8. wenn ein Spieler Durchführungsbestimmungen des Turniers oder Anweisungen des
Turnierleiters nicht prompt befolgt.','Abateri care Fac Obiectul Penalizărilor Procedurale

Următoarele sunt exemple de abateri care fac obiectul penalizărilor procedurale (dar
abaterile nu se limitează la acestea):

1. Sosirea unui concurent după timpul de start specificat.

2. Joc anormal de lent al unui concurent.

3. Discuții despre licitația, jocul sau rezultatul unei done, care pot fi auzite la o altă

masă.

4. Compararea neautorizată a scorurilor cu un alt concurent.
5. Atingerea sau manevrarea cărţilor unui alt jucător (vezi legea 7).

6. Plasarea uneia sau mai multor cărţi într-un buzunar incorect al etuiului.

7. Erori de procedură (precum nenumăratul cărţilor, jocul unui etui incorect, etc.)

care cauzează acordarea unui scor ajustat pentru orice concurent.

8. Eșecul de a se conforma prompt regulamentului turneului sau instrucţiunilor

arbitrului.','apply_rule','[]');

-- Law 91
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1348,'91',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1349,'91',1348,'A. Befugnisse des Turnierleiters','A. Befugnisse des Turnierleiters','A. Puterile Arbitrului',1,'Befugnisse des Turnierleiters
In Ausübung seiner Pflicht, für Ordnung und Disziplin zu sorgen, ist der Turnierleiter befugt,
Disziplinarstrafen in Punkten zu verhängen, oder einen Spieler oder Teilnehmer für den
laufenden Durchgang oder einen Teil davon zu suspendieren. Eine solche Entscheidung des
Turnierleiters ist endgültig (siehe Regel 93B3).','Puterile Arbitrului

În exercițiul datoriei de a menține ordinea și disciplina, arbitrul este împuternicit să
aplice penalizări disciplinare în puncte sau să suspende un jucător sau concurent
pentru sesiunea curentă sau o parte a acesteia. O astfel de decizie a arbitrului este
finală (vezi Legea 93B3).','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1350,'91',1348,'B. Disqualifikation','B. Disqualifikation','B. Dreptul de a Descalifica',1,'Disqualifikation
Der Turnierleiter ist ermächtigt, mit Zustimmung des Turnierveranstalters einen Spieler oder
Teilnehmer aus einem gerechten Grund zu disqualifizieren.','Dreptul de a Descalifica

Arbitrul are puterea să descalifice un jucător sau concurent dintr-o anumită cauză, cu
aprobarea Organizatorului Turneului.','apply_rule','[]');

-- Law 92
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1351,'92',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1352,'92',1351,'A. Rechte der Teilnehmer','A. Rechte der Teilnehmer','A. Dreptul Concurentului',1,'Rechte der Teilnehmer
Ein Teilnehmer oder sein Kapitän kann zur Überprüfung einer Turnierleiterentscheidung, die
an seinem Tisch getroffen worden ist, Berufung einlegen. Wenn ein solches Verlangen als
ungerechtfertigt erkannt wird, kann es entsprechend den verbandseigenen Bestimmungen
sanktioniert werden.','Dreptul Concurentului

Un concurent sau căpitanul său poate cere revizuirea oricărei decizii luate de arbitru
la masa lui. Orice asemenea cerere, dacă este considerată fără merit, poate fi
supusă unei sancțiuni impuse de regulament.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1353,'92',1351,'B. Zeit für die Berufung','B. Zeit für die Berufung','B. Termenul pentru Apel',1,'Zeit für die Berufung
Das Recht, gegen eine Turnierleiterentscheidung zu berufen, endet 30 Minuten nach dem
Aushang des offiziellen Ergebnisses, wenn der Turnierveranstalter keine andere Frist
festgesetzt hat.','Termenul pentru Apel

Dreptul de a cere sau a face apel la decizia unui arbitru expiră la 30 de minute după
publicarea scorului oficial pentru verificare, dacă Organizatorul Turneului nu a
specificat un alt termen.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1354,'92',1351,'C. Vorgehen','C. Vorgehen','C. Cum se Face un Apel',1,'Vorgehen
Alle Anträge auf Überprüfung einer Turnierleiterentscheidung müssen beim Turnierleiter
eingebracht werden.','Cum se Face un Apel

Toate cererile de revizuire a unei decizii vor fi făcute prin intermediul arbitrului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1355,'92',1351,'D. Zustimmung der Beschwerdeführer','D. Zustimmung der Beschwerdeführer','D. Acord între Apelanți',1,'Zustimmung der Beschwerdeführer
Eine Berufung soll nicht gehört werden, außer wenn

1. in einem Paarturnier beide Spieler der Berufung zustimmen. (In einem Individualturnier ist
das nicht erforderlich.)

2. in einem Teamturnier der Kapitän der Berufung zustimmt.','Acord între Apelanți

Un apel va fi ascultat numai dacă:

1. Într-un concurs de perechi, ambii parteneri sunt de acord cu efectuarea apelului
(dar într-un concurs individual un apelant nu are nevoie de acordul partenerului).

2. Într-un concurs de echipe, căpitanul echipei este de acord cu efectuarea apelului.','apply_rule','[]');

-- Law 93
INSERT INTO decision_nodes (id,rule_number,parent_id,question_de,question_en,question_ro,is_leaf) VALUES (1356,'93',NULL,'Welcher Abschnitt ist anzuwenden?','Which section applies?','Care sectiune este aplicabila?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1357,'93',1356,'A. kein Turnierkomitee','A. kein Turnierkomitee','A. Nu Există un Juriu de Apel',1,'kein Turnierkomitee
Der amtierende Oberturnierleiter hat alle Berufungen zu hören und zu entscheiden, wenn es
kein Turnierkomitee gibt [oder kein alternatives Verfahren nach Regel 80B2(k) in Kraft ist],
oder wenn dieses ohne Störung des Turnierverlaufs nicht zusammentreten kann.','Nu Există un Juriu de Apel

Directorul de concurs va asculta şi judeca toate apelurile dacă nu există un Juriu de
Apel [sau un aranjament alternativ conform Legii 80B2k)], sau când un asemenea
comitet nu poate opera fără a deranja desfăşurarea normală a turneului.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1358,'93',1356,'B. Turnierkomitee vorhanden','B. Turnierkomitee vorhanden','B. Există un Juriu de Apel',1,'Turnierkomitee vorhanden
Wenn ein Turnierkomitee (oder eine zugelassene Alternative) zur Verfügung steht:

1. soll der Oberturnierleiter jenen Teil der Berufung hören und entscheiden, der sich
ausschließlich auf die Regeln oder verbandseigenen Bestimmungen bezieht. Gegen seine
Entscheidung kann beim Komitee berufen werden.

2. Der Oberturnierleiter soll alle anderen Berufungen zur Entscheidung weiterleiten.

3. Bei der Entscheidung über eine Berufung kann das Komitee (oder die zugelassene
Alternative) alle Befugnisse ausüben, die diese Regeln dem Turnierleiter einräumen, außer
dass es den Oberturnierleiter in einer Frage der Regeln oder verbandseigenen Bestimmungen
oder hinsichtlich der Ausübung seiner Befugnisse nach Regel 91 nicht überstimmen kann. (Es
kann dem Oberturnierleiter empfehlen, eine solche Entscheidung zu ändern.)','Există un Juriu de Apel

Dacă este disponibil un Juriu de Apel (sau o alternativă autorizată):

1. Directorul de concurs va asculta și judeca părțile apelului care țin numai de Lege

și regulament. Decizia sa poate fi trimisă la Juriul de Apel.

2. Directorul de concurs va înainta toate celelalte apeluri pentru a fi judecate.

3. În judecarea apelurilor, juriul (sau alternativa autorizată) poate exercita toate
puterile conferite arbitrului prin aceste Legi, dar nu poate schimba decizia
arbitrului asupra unui punct de lege sau regulament, sau care ține de exercițiul
puterilor sale disciplinare conferite de Legea 91. (Îi poate recomanda arbitrului să
își schimbe decizia.)','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1359,'93',1356,'C. weiterführende Berufungen','C. weiterführende Berufungen','C. Posibilități de a Face Apel Mai Departe',1,'weiterführende Berufungen
1. Ein Zuständiger Verband kann Abläufe für weitere Berufungen festlegen, nachdem die
oben angeführten Möglichkeiten ausgeschöpft sind. Der Zuständige Verband kann für
unbegründete solche Berufungen Sanktionen vorsehen.

2. Der Oberturnierleiter oder das Berufungsgremium kann eine Sache an den Zuständigen
Verband zur späteren Behandlung herantragen. Der Zuständige Verband hat die Vollmacht,
jede Sache abschließend zu erledigen.

3. (a) Wenn es, unbeschadet Regel 93C1 und 93C2, für die Abwicklung des Turniers von
entscheidender Bedeutung ist, kann der Zuständige Verband einem festgelegten
Turniergremium die Verantwortung übertragen, abschließend alle Berufungen zu behandeln;
er ist dann, ebenso wie die Berufungsparteien, an das Ergebnis gebunden.
(b) Ein Zuständiger Verband kann genehmigen, dass einzelne Stadien des in diesen Regeln
beschriebenen Berufungsverfahrens entfallen, oder diese nach seinem Gutdünken
modifizieren.93.1 Den Teilnehmern ist das vorher bekannt zu geben.

93.1 Der Zuständige Verband ist dafür verantwortlich, dass alle zu beachtenden staatlichen Gesetze
eingehalten werden.
INDEX

Zusammengestellt von Richard Hills auf der Grundlage des ursprünglichen Werkes von Rick
Assad für die Regeln von 1997.

Def
Zahlen bezeichnen die entsprechende Regel

siehe in den Definitionen

Alert
Bekanntgabe
unerwartetes, Unerlaubte Information
Unterlassen, falsche Auskunft
Unterlassen, Unerlaubte Information

Alleinspieler
nach einem Ausspiel außer der Reihe
vermuteter

Alternative, logische
siehe logische Alternative

Anordnung der Tische

Ansage
Änderung durch Gegner nach Korrektur
Änderung einer beabsichtigten Ansage
Änderung einer unbeabsichtigten Ansage
Änderung wegen Fingerfehlers
Änderung wegen Unkonzentriertheit
Änderung wegen Versprechers
auf Grund eigenen Missverständnisses
auf Grund falscher Auskunft
außer der Reihe
außer der Reihe, angenommen
außer der Reihe, gestrichen (zurückgenommen)
außer der Reihe, künstlich
außer der Reihe, statt linkem Gegner
durch den richtigen Spieler
Erhalt des Rechts anzusagen
Erklärung
Ersatzansage angenommen
Ersatzansage nicht angenommen
gleichzeitige
in der Reihe
nicht klar verstanden
rechter Gegner muss passen
unzulässig nach abschließendem Pass
unzulässig wegen Verpflichtung zu passen
unzulässige

Def
40B2(a)(iii)
16B1, 73C
20F5(a)
16B1, 73C

Def
54A
Def, 21B1(a), 41B, 54C

3

Def
21B2
25B
25A
25A2
25A2
25A2
21A
21B
29
29A
16C, 28B
29C
25, 28B
28B
17D3
20F
25B1
25B2
33
28
20A
28A
39
37
35
unzulässiges Gebot, mehr als 7
unzulässiges Kontra
unzulässiges Rekontra
vergleichbare
Wiederholung und Erklärung
zu spät für Änderung
zurückgezogen, Ausspielbeschränkungen
zurückgezogen, nicht-schuldige Seite
zurückgezogen, schuldige Seite

38
36
36
23
20
21B3
26
16C1
16C2

Anspruch auf Korrektur, Verlust
Turnierleiter berichtigt nur das Ergebnis einer Seite 11A
Ordnungsstrafe

11

11B, 90

Atout
Claim bei ausstehendem Atout
Stich mit Atout
Stich ohne Atout

Def
70C
44E
44F

Ausbessern einer Regelwidrigkeit, vorzeitiges

9C

Def
53, 54, 55, 56
53 Fußnote
53, 54, 55A, 56A
54
47E1
41A, 47E2
53, 54E, 55
53, 54, 56
50, 51

Ausspiel
außer der Reihe
außer der Reihe, 13. Stich
außer der Reihe, angenommen
außer der Reihe, aufgedeckt
außer der Reihe, falsche Auskunft
außer der Reihe, verdeckt
außer der Reihe, vom Alleinspieler
außer der Reihe, vom Gegenspieler
Beschränkungen durch Strafkarte
Beschränkungen nach zurückgenommener Ansage 56
erstes Ausspiel, aufgedeckt
erstes Ausspiel, verdeckt
gleichzeitiges
nicht angenommen
nicht wie verlangt möglich
vorzeitig, von einem Gegenspieler

41C
41A
58
54D, 55B
59
57

Austeilung

Auswertung
andere Methoden
Fehler
IMP
kontrierter Kontrakt
Matchpunkte
rekontrierter Kontrakt
Scoretabelle

Def

78D
79C
Def, 78B
19D, 36C
Def, 78A
19D, 36C
77
Totalpunkte
vertauschte Partie, Paar- und Individualturnier
vertauschte Partie, Teamturnier

Berechnungshilfen

Berichtigtes Ergebnis
Antrag eines Spielers
äußerst schwerwiegender Fehler
Durchschnitt
falsche Korrektur einer Regelwidrigkeit
keine Korrektur in den Regeln
Künstliches Berichtigtes Ergebnis
normales Spiel unmöglich
riskante Aktion
Schaden
Teamkampf
Turnierleiter, Eigeninitiative
über-Schnitt
unter-Schnitt
wahrscheinliches Ergebnis
Zugewiesenes Berichtigtes Ergebnis
Zuweisung

78C
87
86B2

40B2(d)

Def
12A
12C1(e)
12C2(a)
12A3
12A1
12C1(d), 12C2, 86B2
12A2, 12C2
12C1(e)
12B1
12C4, 86
12A
12C2
12C2
12C1(b)
12C1, 86B1, 86B2(b)
12C

93

92, 93

Berufung
amtierender Oberturnierleiter, Befugnisse und Pflichten
auf dem Weg über den Turnierleiter
Entscheidung darüber
Frist
gegen Regelentscheidung
gegen Tatsachenentscheidung
Gremium
grundlose
Hinweis auf das Recht zu berufen
Kapitän
kein Komitee
Komitee verfügbar
Komitee, Rechte
Komitee, zugelassene Alternative
Recht eines Teilnehmers darauf
Verfahren
Vorkehrungen dafür
weitere Berufungsmöglichkeiten
Zuständiger Verband, endgültige Entscheidung
Zuständiger Verband, Rechteübertragung
Zuständiger Verband, staatliche Rechtsvorschriften 93 Fußnote
Zuständiger Verband, Vorlage an

92C
93B2
92B
93B1
93B2
93C2
92A, 93C1
83
92A, 92D
93A
93B
93B3
93D3
92A
93
80B2(k), 93A
93C
93C2
93C3(a)

93C2
Zuständiger Verband, weglassen oder abändern
Zuständiger Verband, weitere Vorgehensweise
Zustimmung der Berufungswerber

Blatt, falsches

Bluff
siehe auch Partnerschaftsvereinbarungen
implizite Vereinbarung
künstliche Ansage
unzulässig
zulässig

Board
siehe auch Austeilung
Auflegen
Duplizierung
Ersatzboard
falsches Board
Herausnehmen der Karten
Kopie
normales Spiel unmöglich
Teiler und Gefahrenlage
vertauschte Partie
Weglegen verboten
Weitergabe
Zurückstecken der Karten

93C3(b)
93C1
92D

15

Def, 40

40A1(a)
40B2(a)(v)
40B2(a)(v)
40A3, 40C

Def

7A
6F
6D3, 86A, 86B2(a)
15
7B
2
12A2
2
86B2, 87
7A
8A
7C

68, 69, 70

Claim
siehe auch Verzicht
70
bestritten
68A
Definition
70C
fehlendes Atout
68C, 70B
Klarstellung
70 Fußnote
normales Spiel
68B2, 68D2(b)
Spiel fortgesetzt
68D, 70D3
Spiel unterbrochen
Spieldurchführung nicht erklärt
70E
Spieldurchführung, Erwägungen des Turnierleiters 70D
Zustimmung
Zustimmung etabliert
Zustimmung zurückgenommen

69
69A
69B

Denomination
Rangfolge

Disziplinarstrafe

Durchgang
Datum und Uhrzeit

Def
1A. 18E

91A

Def
80B2(c)

Ende
erzieltes Ergebnis
Partnerschaften
stationärer Spieler
Suspendierung
verschiedene Bedeutungen
Windrichtung während des Durchgangs

Durchschnitt

Ergebnis
siehe auch Berichtigtes Ergebnis
am anderen Tisch im Teamturnier
bei ungemischtem Board
Einigkeit
gestrichen, mehr als 13 Karten
nicht erzielbar

Erklärungen
Ansagen
Entscheidung des Turnierleiters
falsche richtigstellen
falsche, unerlaubte Information
falsche, vermutet
Spielzüge der Gegenspieler
8C
12C2
4
7D
91A
Def, 4, 12C2, 91
5

12C2(a)

86B
6D2
65D, 79A
13D
12C2

20F
75D
20F4, 20F5, 75B
16B1, 75A
21B1b, 75C
20F2

16

Erlaubte Information
Aus den Regeln oder verbandseigenen Bestimmungen
Eigenheiten der Gegner
Erfordernisse der Turnierdurchführungsbestimmungen
regelkonforme Ansagen und Spiele
vorher vorhanden und nicht verboten
zurückgezogene Aktion, nicht-schuldige Seite
Zwischenstand (Schätzung)

16A1(c)
16A1(d)
16C1
16A2

16A2

16A2

16A1(c)

Ersatzboard
Paar-(Individual-)turnier
Teamturnier

Ersatzspieler

Erstes Ausspiel
aufdecken
außer der Reihe
verdeckt

Faller
Score

6D3
86A, 86B2(a)

4

Def
41C
54
41A

Def
77

falsche Ansage
siehe auch Bluff; siehe auch Täuschung

21B1(b), 75C

oder falsche Auskunft
vom Partner
vom Spieler selbst

falsche Auskunft
Änderung eines Spiels
Ansage aufgrund falscher Auskunft
berichtigtes Ergebnis
oder falsche Ansage
unerlaubte Information

falsches Blatt
75
75B3
20F4, 75B2

Def, 20F1, 21B, 75D
47E
21B
75D3
21B, 75
16, 73C, 75A

15

Farbe
Bezeichnung der Farbe ohne den Rang der Karte
unvollständige Bezeichnung

Def, 1A
46B2
46B3, 46B5

fehlende Karte
siehe Karte, fehlende

Figur

Frage
abgegebene Ansagen
einzelne Ansage
relevante alternative Ansagen
Schlüsse aus Ansagen
um eine falsche Auskunft zu bekommen
unerlaubte Information
von einem Spieler, der passen muss
vor dem ersten Ausspiel
zum Nutzen des Partners

Freude am Spiel
siehe Spielgenuss

Gebot
siehe auch Ansage
außer der Reihe
außer der Reihe, vergleichbare Ansage
falsches
genügendes
korrekte Form
mehr als sieben
nach dem Ende der Lizitation
Rangordnung der Denominationen
überbieten
ungenügend
ungenügend, angenommen
ungenügend, außer der Reihe

Def

20
20F1, 20F2
20F3
20F1, 20F2
20F1, 20F2
20G2
16B, 73C, 75
20B, 20 Fußnote 2
41B
20G1

Def

31
23A
21B1(b), 75
18C
18A
38
39
18E
18B
27
27A1
27A2, 31

ungenügend, nicht angenommen
ungenügend, vergleichbare Ansage
verschiedene Methoden
vor einem Pass außer der Reihe

Gedächtnishilfen

Gefahrenlage
Festlegung
Score

Gegenspieler

Gegner
Rechte

Gestrichen
siehe zurückgenommene Aktion

Höflichkeit

IMP

Individualturnier

Information
siehe auch Informationsaustausch
aus regelkonformem Spiel
aus regelkonformen Ansagen
aus zurückgenommenen Aktionen
Eigenheiten der Gegner
spielfremde, nicht vom Partner
spielfremde, vom Partner
täuschende, ohne Bridgegrund
täuschende, regelkonform
unzulässige
zulässige
27B
23A
18F
30B

40B2(d)

Def
2
77

Def

Def
9B1(d)

74A1, 74B

Def, 78B

12C3

16

16A1(a)
16A1(a)
16C
16A2
16D
16B
73E2
73E1
16
16

73

Informationsaustausch, Tempo, Täuschung
siehe auch Information
abgesprochener unerlaubter Informationsaustausch 73B2
Art und Weise
73D
Informationsaustausch zwischen Partnern, unzulässig
Informationsaustausch zwischen Partnern, zulässig 73A
73E
Täuschung
73D
Tempo
16B1(a), 16B3, 73C
unerlaubte Information vom Partner

73B

Karte
siehe auch: Revoke; Karten ansehen; sichtbare Karte
ansehen
aus dem Board genommen

7B2, 66
7B1
15
7B3
1C
45C4(a)
13
14
45E
45
7C
7C
6
45C
46B

aus einem falschen Board genommen
behalten
Beschaffenheit
bezeichnet oder genannt
falsche Anzahl
fehlende
fünfte Karte eine Stichs
gespielt
ins Board zurückstecken
Mischen nach dem Spiel
Mischen und Teilen
muss gespielt werden
Nennen einer Karte des Strohmanns, irrtümlich
Nennen einer Karte des Strohmanns, unbeabsichtigt 45C4(b), 46B
Nennen einer Karte des Strohmanns, unvollständig 46B
46A
Nennen einer Karte des Strohmanns, vollständig
14A2
nicht zu finden
Rang
1A
Richtigstellung einer unbeabsichtigten Bezeichnung 45C4(b)
sichtbar
sichtbar, Alleinspieler
sichtbar, Gegenspieler
sichtbar, Lizit
sichtbar, Revoke
Strafkarte
Strafkarte, nicht gespielt
Strafkarte, zwei oder mehr
Strohmann spielt nicht-genannte
unkonzentriert
vom Strohmann angedeutet
zählen
zurückgenommen

Def
48
49
24
64B3
49, 50
52
51
45D
45C4(b)
45F
7B2
16C, 47

Karte, fehlende
Information aus der Ersatzkarte
nach Spielbeginn bemerkt
vor Spielbeginn bemerkt

Karten ansehen
aktueller Stich
frühere Stiche
letzte eigene Karte
nach dem Spiel
vor dem Lizit

14
14C
14B
14A

66A
66C
66B
65
7B2

Karten zählen

Kartenpaket
sortiertes

Kiebitz
siehe Zuschauer

Klärungsphase

Kommunikation
siehe Informationsaustausch

Kontra
außer der Reihe
außer der Reihe, vergleichbare Ansage
eines falsch genannten Gebots
erloschen
korrekte Form
scoren
unzulässig
zulässig

Kontrakt

Konventionskarte
eigene ansehen
gegnerische ansehen

korrektes Vorgehen
bedeutsames Ereignis
Benehmen
Desinteresse
Gegner durcheinander bringen
Höflichkeit
Karte herausziehen
langsames Spiel
mangelnde Aufmerksamkeit
Pflichten
rasches Spiel
Spielgenuss
Tempo ändern
Tisch verlassen
Turnierleiter rufen
unnötige Bemerkungen
Verstoß-Beispiele
7B2

Def, 1
Def, 6D2, 6 Fußnote

17D1, 20F4, 20F5(b)(ii), 40B2(b),
40B2(c)(ii), 41

Def
32
23A, 32A2
19A3
19C
19A2
36C, 77
19A, 27B3, 36
19A1

Def, 22

40B2
20G3, 40B2(b
40B2(c)

94C, 90
74C4
74B
74C6
74C7
74A1
74B3
74B4, 74C7, 90B2
74B1
74A3
74C7
74A2
74C7
74C8
74B5
74B2
74C

Korrektur
siehe auch Berichtigtes Ergebnis; einer Revoke: siehe Revoke
berichtigtes Ergebnis nur für eine Seite

11A

Def
falsche
festlegen
festlegen, nur Turnierleiter
festlegen, Wahlmöglichkeit
nach Regelwidrigkeit durch einen Zuschauer
Ordnungsstrafe
Regeln sehen keine vor
unangemessen hart oder vorteilhaft
Verlust des Anspruchs
Verzicht
zweifelhafter Punkt

Korrekturphase

Künstliche Ansage
künstlicher Pass
künstlicher Bluff

Künstliches Berichtigtes Ergebnis
siehe auch Berichtigtes Ergebnis

12A3, 82C
10
10A
10C
76C2
11B, 90
12A1
12B2
11
10B, 81C5
84D

71, 69B,79C

Def, 40B1(c)
Def, 40B1(c)
40B2(a)(v)

12C1(d), 12C2

Def

Lizitation
Siehe auch Lizitationsphase
Karten aus einem falschen Board
Beginn
Ende
Auskünfte während der Lizitation
Vorgehen danach
Wiederholung, nach dem abschließenden Pass
Wiederholung, bevor das erste Ausspiel aufgedeckt wird 41B
Wiederholung, durch einen Gegner
sichtbar gewordene Karte

15
Def
22, 25
20F
22, 41
20C

20D
Def, 24

Lizitationsphase
Siehe auch Lizitation
aufeinanderfolgende Ansagen
Beginn
Beibehalten des Rechts anzusagen
Ende
erste Ansage
Klärungsphase

Lizitwiederholung

Lizittechnikhilfen

Lizitwiederholung
Ansage nicht deutlich verstanden
Ansagen
Endkontrakt

17

17C
17A
17D3
17D
17B
17D1, 20F4, 20F5(b)(ii), 40B2(b),
40B2(c)(ii), 41
20B

40B2(d)

20A
20
41C

Fehler richtigstellen
nach dem abschließenden Pass
nur durch Gegner
wenn man an der Reihe ist anzusagen

logische Alternative
Definition
aufweisbar nahegelegt

Matchpunkt
20E
20C
20D
20B

16B1(b)
16B1(a)

Def, 78A

Mischen
auf Anweisung des Turnierleiters
nochmals Mischen
Sortiertes Kartenpaket
Wahlmöglichkeiten des Turnierleiters

6
6D3, 22A, 86A, 86B2(a)
6D
Def, 6D2, 6 Fußnote
6E

Nicht-schuldige Seite
Aktion vor Rufen des Turnierleiters
11A
Information aus zurückgezogenen Aktionen zulässig 16C1

Ordnungsstrafe
Befugnis des Turnierkomitees
Befugnis des Turnierleiters
Beispiele
Individualturnier
Verhängung

90
93B3
90A
90B
12C3
90A

Partner
Vereinbarungen, siehe Partnerschaftsvereinbarungen
Spielfremde Information

Def

16B

Partnerschaft

4

Partnerschaftsvereinbarungen
Abweichungen
berichtigtes Ergebnis
Besondere
Bluff einer künstlichen Ansage
Bluff
explizit
Gedächtnishilfen
Hilfen zu Lizit- und Spieltechnik
implizit
Informationsaustausch
Konventionskarte
künstliche Bedeutung
nach gegnerischem Regelverstoß ändern
nicht offengelegt
nicht spielerbezogen unterschiedlich

40
40A3, 40C1, 40C2
40B3(a), 40B4, 40B5(b)
40B
40B2(a)(v)
40A3, 40C1, 40C2
40A1(a)
40B2(d)
40B2(d)
40A1(a), 40C1
40A2, 73C
20G3, 40B2(a)(ii), 40B2(b), 40B2(c)
40B1(c)
40B2(a)(iv)
40A3, 40B3, 40C1, 90, 91
40A4
Offenlegung besonderer Informationen
Offenlegung von Schlüssen
Rechenhilfen
teilweise Offenlegung
unzulässig
Verpflichtung zur Offenlegung

Pass
außer der Reihe
außer der Reihe, künstlich
außer der Reihe, vergleichbare Ansage
Schädigung durch erzwungenen Pass
Verstoß gegen Verpflichtung zu passen

Pflichtpausen

Rang
bezeichnen
Denominationen
Farben
Karten
unvollständige Bezeichnung

Recht anzusagen

Rechte
Gegner, nachTurnierleitungsruf
Spieler, nachTurnierleitungsruf
Strohmann

Regeln
Auslegung
sehen keine Korrektur vor

Regelverstoß
siehe auch Regelwidrigkeit
eigene Seite
mögliche Schädigung in Kauf genommen
verbergen
vorsätzlich

Regelwidrigkeit
siehe auch Regelverstoß
aufmerksam machen
keine weitere Aktion setzen
Korrektur anordnen
mögliche Schädigung in Kauf genommen
nachdem darauf aufmerksam gemacht worden ist
Rechte behalten
Rechte der Gegner

40B5(a)
40B5(a)
40B2(d)
40B5(b)
40B4, 90
40A1(b)

Def
30
30C, 31
23A
72C
37

73A2

46B3
18E
1A, 18E
1A
46B1, 46B5

17D3

9B1(d)
9B1(c)
42

81C2, Einleitung
12A

Def, 72

72B2
72C
72B3
72B1

Def

9A
9B2
10
72C
9B
9B1(c), 9B1(d)
9B1(d)

Rechte des Spielers
Turnierleiter rufen
verhindern
von einem Zuschauer verursacht
voreiliges Ausbessern
Vorgehen danach
Wahlmöglichkeit danach

Rekontra
außer der Reihe
außer der Reihe, vergleichbare Ansage
erloschen
Gebot falsch bezeichnet
korrekte Form
Scoren
unzulässig
zulässig
9B1(c)
9B1(a), 9B1(b)
9A3
76C2
9C, 26B
9
10C

Def
32
23A
19C
19B3
19B2
36C, 77
19B, 27B3, 36
16B1

Revoke
am 12. Stich
automatischer Stichtransfer
Berichtigung
Definition
durch Nichtspielen einer aufgedeckten Karte
etabliert
Frage nach Revoke
kein automatischer Stichtransfer
nach Ende der Runde
nicht-schuldige Seite hat am nächsten Board angesagt
Schadensausgleich
Schadensausgleich nach Revoke beider Seiten
Schadensausgleich nach wiederholter Revoke
Stiche ansehen
Vorgehen nach Etablierung

61, 62, 63, 64
62D1, 62D2
64A
62
61A
64B3
63
61B
64B
64B5

64B4

64C
64B7, 64C2(b)
64B2, 64C2(a)
61C, 66C
64

Runde
Ende
Ende der letzten Runde

schadhafter Stich

Schädigung möglich, Inkaufnehmen

Scoren
siehe Auswertung

Seite

Sichtbare Karte
Lizit

Def
8B
8C

67

72C

Def

Def
24

Alleinspieler
Gegenspieler
Revoke

Spiel
siehe auch Karten ansehen
Ablauf
aufeinanderfolgendes
Ausspiel
Beginn
Farbzwang
gleichzeitiges
nach einem regelwidrigen Spiel
nach einer Regelwidrigkeit
Unmöglichkeit zu spielen wie verlangt
Unmöglichkeit, Farbe zu bekennen
vorzeitiges, durch einen Gegenspieler

Spieländerung
nach falscher Auskunft

Spielbereich

Spielgenuss

Spielphase
Auskünfte zum Lizit
Beginn

Spieltechnikhilfen

Stich
Anordnung
ansehen
fehlerhafter
fünfte Karte
gewonnen
Spieler mischt seine Karten
umdrehen
48
49
64B3

Def

44
44B
44A
41
44C
58
60
60A
59
44D
57

47
47E

76 Fußnote

74A2

Def
20F2
41C

40B2(d)

Def
65
66
67
45E
44E, 44F, 65B, 79
65D, 66D
45G

Strafen
Disziplinarstrafen
Individualturnier
Ordnungsstrafen
wiederholter Verstoß gegen Offenlegungspflichten 40B4(b)

Def
91
12C3
90

Strohmann
Beschränkungen
Blatt aufdecken
deutet Spiel an
Gegenspieler darf ihm nicht das Blatt zeigen

Def
43A1, 43A2, 43B
41D
43A1(c), 45F
43A3

Rechte
spielt nicht genannte Karte
zu spielende Karte bezeichnen

Systemkarte
siehe Konventionskarte

Tatsachen
bestritten
Beweislast
unbestritten

Täuschen
siehe auch Bluff
42A, 42B
45D
46

85
85A1
84

73E

Teamturnier
vertauschte Partie
Berichtigte Ergebnisse, deren Summe nicht null ist 12C4
Resultat am anderen Tisch
Ersatzboard

86

86B
86A, 86B2(a)

Teilen
falsch geteilt
neuerlich, auf Weisung des Turnierleiters
neuerlich, nicht im Teamturnier
nicht ohne Mischen
sichtbare Karte
verschiedene Methoden

Teiler

Teilnehmer

Tempo
Schlüsse
Täuschung
unbeabsichtigtes Abweichen
vorsätzliches Abweichen

Trumpf
siehe Atout

Turnierleiter
Befugnisse
Berufung gegen eine Entscheidung
Disqualifizieren
Ermessensspielraum
Fehler
Korrektur von Fehlern im Ablauf
Pflichten delegieren
Pflichten
Rufen

6B
6D1
6D3
86A
6D2
6D1
6E

2, 17B, 87

Def

73D
73C, 73D1
73D2, 73E2
73C, 73D1
73D2, 73E2

81
81C
83, 92C, 93A, 93B1
91B
12
82C
82
81D
81B
9B1, 74B5
Status
Suspendieren
Vorgehen bei Entscheidungen

Turnierveranstalter
Aufgaben
Ausschreibung
Berufungen
Fehlerbehebung nach Ende der Korrekturphase
Korrekturphase
Rechte und Pflichten delegieren

Übereinkunft
Siehe Partnerschaftsvereinbarung

Über-Schnitt

Unbeabsichtigt
unkonzentriert

81A
91A
84, 85, 86

80B
80B2
78D, 80B2(i)
80B2, 93
79C2
79C
80B1

12C2, 86B2

Def
25A2, 45C4(b)

Unerlaubte Information
logische Alternative, aufweisbar nahegelegt
logische Alternative, Definition
spielfremde Information
spielfremde Information nicht vom Partner
spielfremde Information vom Partner
zurückgezogene Aktion für eine schuldige Seite

16
16B1(a)
16B1(b)
16A3
16D
16B, 73C
16C2

Ungenügendes Gebot
angenommen
außer der Reihe
berichtigtes Ergebnis
durch (Re-)Kontra ersetzt
durch ungenügendes Gebot ersetzt
gleiche Denomination(en) auf niedrigster Stufe bezeichnet 27B1(a)
nicht angenommen
Partner des Schuldigen auf Pass gesetzt
vergleichbare Ansage
voreilig ausgebessert

18D, 27
27A1
27A2, 31
27D
27B3
27B4

27B
27B2, 27B3, 27B4
23A, 27B1(b)
27C
25A2, 45C4(b)

12C2

35

23

74

86B2, 87

68, 69, 70, 71

71
70A
68B1
71 Fußnote
68D2(b)
68D, 70D3
69A
69B
69

10C3, 10C4
10C2
10C1

8A
5B, 8A
5B

12C1

Unkonzentriert

Unter-Schnitt

Unzulässige Ansage

Vergleichbare Ansage

Verhalten

Vertauschte Partie

Verzicht
siehe auch Claim
aufgehoben
bestritten
Definition
normales Spiel
Spiel fortgesetzt
Spiel unterbrochen
Zustimmung etabliert
Zustimmung zurückgezogen
Zustimmung

Vorgehen, korrektes
siehe Korrektes Vorgehen

Wahlmöglichkeiten
vorteilhafte
Entscheidung
Erklärung

Wechsel
Boards
Platzwechsel der Spieler
Windrichtung

Zugewiesenes Berichtigtes Ergebnis
siehe auch Berichtigtes Ergebnis

Zulässige Information
siehe Erlaubte Information

16C
26
25B

Zurückgenommene Aktion
Ausspielbeschränkungen
beabsichtigte Ansage
erlaubte Information für eine nicht-schuldige Seite 16C1
Strohmann, unbeabsichtigte Bezeichnung
unbeabsichtigte Ansage
unerlaubte Information für eine schuldige Seite
unkonzentriert
zurückgenommene Karte

45C4(b)
25A
16C2
25A2, 45C4(b)
47

Zuschauer
am Tisch
Kontrolle
Status
Teilnahme an der Partie
verursacht Regelwidrigkeit

Zuständiger Verband
als Turnierveranstalter
Befugnisse delegieren
Befugnisse zuweisen
Nationaler Verband
Rechte und Pflichten
weitere Berufung
World Bridge Federation
Zonenverband

Zuweisung der Plätze
Wechsel von Richtung oder Tisch
76
76B
76A
76D
76C
76C2

80A
80B1
80A3
80A3
80A1(c)
80A2
93C
80A1(a)
80A1(b)

5
5B','Posibilități de a Face Apel Mai Departe

1. Autoritățile Regulatoare pot stabili proceduri pentru a face apel în continuare după
ce procedurile anterioare au fost epuizate. Orice astfel de apel, dacă este
considerat fără merit, poate fi supus unei sancţiuni impuse de regulament.

2. Directorul de concurs sau corpul care se ocupă cu revizuirea poate înainta un caz
Autorităţii Regulatoare pentru o analiză suplimentară. Autoritatea Regulatoare are
puterea de a rezolva definitiv orice caz.

3.

a) În ciuda a 1 și 2 de mai sus, când consideră că este crucial pentru continuarea
turneului, Autoritatea Regulatoare poate atribui unui corp anume
responsabilitatea de a rezolva definitiv orice apel și, ca și părțile implicate în
apel, va trebui să accepte decizia.

b) Cu o înștiințare prealabilă a concurenților, Autoritatea Regulatoare poate
autoriza omiterea sau modificarea după bunul plac a diferitelor etape din
procedura de apel stabilită în aceste Legi28.

28 Autoritatea Regulatoare are responsabilitatea să se conformeze tuturor legilor naționale care îi afectază activitatea.
INDEX LA LEGILE DIN 2017

ACȚIUNE RETRASĂ
 Anulată este
 Carte, desemnare datorată pierderii de concentrare
 Carte, desemnare neintenţionată
 Carte, retrasă
 Declaraţie, intenţionată
 Declaraţie, neintenţionată
 Declarație, pierderea concentrării
 Informaţie autorizată pentru partea nevinovată
 Informaţie neautorizată pentru partea vinovată
 Restricţii de atac

ADVERSAR
 Drepturile adversarilor

AJUTOR DE MEMORIE, CALCUL SAU TEHNICĂ

ALERTĂ
 Informare
 Lipsa alertei, dezinformare
 Lipsa alertei, informaţie neautorizată
 Surprinzătoare, informaţie neautorizată

ALTERNATIVĂ LOGICĂ
 Definiție
 Demonstrabil sugerată

AMESTECARE
 La instrucțiunile arbitrului
 Nouă
 Opțiunile arbitrului
 Pachet sortat

ANULAT

ANUNȚ
 vezi și Declarație

Definiții, 16C
Definiții
45C4b)
45C4b)
25B
25A
25A2
16C1
16C2
Definiții
9B1d)

40B2d)

Definiții
40B2a)iii
20F5a)
16B1, 73C
16B1, 73C

16B1b)
16B1a)
6D3, 22A, 86A, 86B2a)
6D
6E
Definiții, 6D, 6 notă de
subsol

vezi Acțiune retrasă

Definiții
 După încheierea licitaţiei
 Forma corectă
 Greşit
 Insuficient
 Insuficient, acceptat
 Insuficient, declarație comparabilă
 Insuficient, neacceptat
 Insuficient, peste rând
 Înaintea unui pas peste rând
 Metode diferite
 Peste palierul de 7
 Peste rând
 Peste rând, declarație comparabilă
 Rangul denominațiilor
 Succesiv regulamentar
 Suficient

ANUNȚ INSUFICIENT
 Acceptat
 Declarație comparabilă
 Înlocuire prematură
 Înlocuit de alt anunț insuficient
 Înlocuit de contra sau recontra
 Înlocuit la cel mai jos nivel, specifică aceleași denominații
 Neacceptat
 Partenerul jucătorului vinovat ar putea pasa mereu
 Peste rând
 Scor ajustat, axa nevinovată este prejudiciată

APĂRĂTOR

APEL
 Acord între apelanţi
 Aranjament pentru judecare
 Arbitru, puteri și responsabilități
 Autoritatea Regulatoare, apel în continuare
 Autoritatea Regulatoare, atribuie responsabilitatea
 Autoritatea Regulatoare, lege naţională
 Autoritatea Regulatoare, poate omite sau modifica
 Autoritatea Regulatoare, referire către
18A
21B1b), 75
27A1
23A
27B
27A2, 31
30B
18F
31
23A
18E
18B
18C

18D, 27
27A1
23A, 27B1b)
27C
27B4
27B3
27B1a)
27B
27B2, 27B3, 27B4
27A2, 31
27D

Definiții

92, 93
92D
80B2k), 93A
93C1
93C3a)
93, notă de subsol
93C3b)
93C2
 Autoritatea Regulatoare, rezolvă definitiv
 Căpitan
 Corp care se ocupă cu revizuirea
 Dreptul concurenţilor de a face apel
 Există juriu disponibil
 Făcut prin arbitru
 Fără merit
 Judecare
 Juriu, alternativă autorizată
 Notificarea dreptului de a face
 Nu există juriu de apel
 Orice alt apel
 Posibilităţi suplimentare
 Privitor la legi
 Procedură
 Puterile juriului
 Termen limită

ARANJAREA MESELOR

ARBITRU
 Chemarea arbitrului
 Delegarea atribuţiilor
 Descalificare
 Eroare de arbitraj
 Puteri
 Puteri discreţionare
 Referirea unei probleme
 Responsabilităţi
 Statut
 Suspendare

AȘEZAREA ȘI ORIENTAREA ETUIULUI

AȘEZARE LA MESE
 Schimbarea direcţiei sau a mesei de joc

ATAC
 Imposibilitatea de a se conforma
 Iniţial, cu cartea pe faţă

93C2
92A, 92D
93C2
92A
93B
92C
92A, 93C1
93B2
93B3
93A
93B2
93C
93B1
93B3
92B
81
9B1
81D
91B
82C
81C
83
81B
81A
91A

7A
5B

Definiții
41C
 Iniţial, cu cartea pe spate
 Iniţial, peste rând, cu cartea pe faţă
 Iniţial, peste rând, cu cartea pe spate
 Neaceptat
 Peste rând
 Peste rând, acceptat
 Peste rând, de către declarant
 Peste rând, de către un apărător
 Peste rând, dezinformare
 Peste rând, la levata 13
 Prematur, de către un apărător
 Restricţii, pentru declaraţie retrasă
 Restricţii, pentru carte penalizată
 Simultan

ATU
 Levate care conțin atuuri
 Levate care nu conțin atuuri
 Revendicare cu un atu afară

AUTORITATEA REGULATOARE
 Atribuirea puterilor
 Autoritatea Zonală
 Delegarea puterilor
 Federaţia Mondială de Bridge
 Organizaţia naţională de bridge, auspicii
 Poate fi organizator de turneu
 Posibilităţi suplimentare de apel
 Responsabilități și puteri

AUTORITATEA ZONALĂ

AXA NEVINOVATĂ
 Acțiune a
 Acțiune retrasă, informație autorizată

CALCULAREA SCORULUI
 Alte metode
 Contract contrat sau recontrat
 Donă incorectă

41A
41A, 47E2
54D, 55B
53, 54, 55, 56
53, 54, 55A, 56A
53, 54E, 55
53, 54, 56
47E1
53, notă de subsol
26
50, 51
Definiții
44E
44F
70C

80A
80A3
80A1b)
80A3
80A1a)
80A1c)
80B1
93C
80A2

80A1b)

11A
16C1

78D
19D, 36C
89

 Donă incorectă, joc de echipe
 Eroare
 IMP
 Puncte de meci
 Puncte totale
 Tabel de scor

CARTE DE JOC
 A cincea carte la o levată
 Amestecare după terminarea jocului
 Amestecare şi distribuire
 Corectarea unei desemnări neintenţionate de la mort
 Desemnarea unei cărţi de la mort, completă
 Desemnarea unei cărţi de la mort, eronată
 Desemnarea unei cărţi de la mort, incompletă
 Desemnarea unei cărţi de la mort, neintenţionată
 Desemnată sau numită
 Expusă
 Expusă de declarant
 Expusă de un apărător
 Expusă în timpul licitaţiei
 Expusă, renonsă
 Față simetrică
 Indicată de către mort
 Inspecția cărților
 Joc obligatoriu al unei cărți
 Jucată
 Jucată incorect de către mort
 Lipsă
 Nu poate fi găsită
 Număr incorect
 Numărare
 Păstrarea posesiei
 Penalizată
 Penalizată, care nu a fost jucată când trebuia
 Penalizate, două sau mai multe
 Pierderea concentrării
 Rang
 Reintroducerea în etui
 Renonsă

86B2
79C
Definiții, 78B
Definiții, 78A
78C
45E
7C
45C4b)
46A
46B
46B
45C4b), 46B
45C4a)
Definiții
49
64B3
1B
45F
7B2, 66
45C
45D
14A2
7B2
7B3
49, 50
51
45C4b)
1A
7C
vezi Renonsă
 Retrasă
 Scoaterea din etui
 Scoaterea dintr-un etui greşit
 Spate simetric

CARTE LIPSĂ
 Informaţia provenită din înlocuire
 Observată înainte de începerea jocului
 Observată oricând după inceperea jocului

CARTE PENALIZATĂ
 Apărător
 Declarant sau mort, nu are
 Două sau mai multe
 Informație provenită din
 Minoră
 Omisiunea de a juca

CARTE RETRASĂ
 vezi și Acțiune retrasă

CARTE VIZIBILĂ (EXPUSĂ)
 Apărător
 Declarant
 Licitație
 Renonsă

CĂDERE
 Calcularea scorului

CIRCULAȚIE
 A donelor
 A jucătorilor

COMUNICARE, TEMPO ȘI INDUCERE ÎN EROARE
 vezi și Informație
 Inducere în eroare
 Informaţie neautorizată de la partener
 Între parteneri, adecvată
 Între parteneri, neadecvată

16C, 47
7B1
1C
14C
14A
14B

Definiții, 50
48A
50E
50B, 50C
47

Definiții
48
64B3

Definiții
8A
8A
73E
16B1a), 16B3, 73C
73A
73B
 Manieră
 Prestabilită ilegală
 Tempo

CONCESIE
 vezi și Revendicare
 Anulată
 Contestată
 Definiţie
 Joc normal
 Jocul este întrerupt
 Jocul poate continua cu acordul tuturor celor 4 jucători
 Retragerea acordului cu o revendicare sau concesie
 Revendicare sau concesie acceptată
 Revendicare sau concesie acceptată, stabilită

CONCURENT

CONDUITĂ

CONȘTIENTIZARE A UNUI POSIBIL PREJUDICIU

CONTRA
 Calcularea scorului
 Continuarea licitaţiei după contra
 Contrarea anunţurilor incorect formulate
 Forma corectă
 Inadmisibilă
 Legală
 Peste rând
 Peste rând, declarație comparabilă

CONTRACT

CONTRACT CONTRAT
 Calcularea scorului

73D
73B2
73D

68, 69, 70, 71
70A
68B1
71, notă de subsol
68D
68D2b)
69B
69A

Definiții
72C

Definiții
36C, 77
19C
19A3
19A2
19A, 27B3, 36
19A1
23A, 32A2

Definiții, 22

19D
36C, 77

CORECTARE PREMATURĂ A UNEI NEREGULARITĂȚI

9C

CULOARE

Definiții, 1A
 Desemnare
 Desemnare incompletă

CURTOAZIE

DECIZII ALE ARBITRULUI
 Asupra unor fapte convenite
 Asupra unor fapte disputate
 Ponderea dovezilor

DECLARANT
 După un atac inițial peste rând

DECLARAȚIE
 Acţiune inadmisibilă, obligaţia de a pasa
 Adversarul din dreapta e obligat să paseze
 Anunţ inadmisibil, peste palierul de 7
 Bazată pe dezinformare
 Bazată pe lipsa de înțelegere a jucătorului
 Comparabilă
 Contra inadmisibilă
 De către jucătorul care este la rând
 Declaraţie inadmisibilă
 Declaraţie inadmisibilă, după pasul final
 Declaraţie înlocuitoare, acceptată
 Declaraţie înlocuitoare, neacceptată
 Declaraţie retrasă, axa nevinovată
 Declaraţie retrasă, axa vinovată
 Declaraţie retrasă, restricții de atac
 Declaraţii simultane
 Explicaţie a
 În rotaţie
 Neidentificată clar
 Păstrarea dreptului de a declara
 Peste rând
 Peste rând, acceptată
 Peste rând, anulată (retrasă)
 Peste rând, artificială
 Peste rând, la rândul adversarului din stânga
 Prea târziu pentru a schimba o declarație

46B2
46B3, 46B5

74A1
85
85A1

Definiții
54A

Definiții
28A
21B
21A
36
28B
39
25B1
25B2
16C1
16C2
33
20F
20A
17D3
29A
16C, 28B
29C
25, 28B
21B3
 Recapitulare şi explicaţii
 Recontra inadmisibilă
 Schimbarea declaraţiei unui adversar după corecţie
 Schimbarea unei declaraţii intenţionate
 Schimbarea unei declaraţii intenţionate, pierderea concentrării
 Schimbarea unei declaraţii neintenţionate
 Schimbarea unei declaraţii neintenţionate, eroare mecanică
 Schimbarea unei declaraţii neintenţionate, eroare de vorbire
36
21B2
25B
25A2
25A
25A2
25A2

DECLARAȚIE ARTIFICIALĂ
 Declarație artificială psihică
 Pas artificial

DECLARAȚIE COMPARABILĂ

DENOMINAȚIE
 Rang

DEZINFORMARE
 Declaraţie bazată pe dezinformare
 Schimbarea jocului

DEZVĂLUIREA ÎNȚELEGERILOR PARTENERIALE
 Alertă
 Explicarea declaraţiilor
 Înţelegere partenerială

 Procedură incorectă

DISTRIBUIREA CĂRȚILOR
 Cărţi distribuite incorect sau expuse
 La instrucţiunile arbitrului, redistribuire
 Metode de distribuire sau predistribuire
 Opţiunile arbitrului
 Nu se redistribuie, joc de echipe
 Redistribuire
 Rezultat invalid, s-a distribuit fără amestecare

Definiții, 40B1c)
40B2a)v
Definiții, 30C
Definiții
1A, 18E

Definiții, 20F1, 75D
21B
47E

vezi Alertă
20F
vezi Înțelegere
partenerială
20G

Definiții, 6B
6D1
6D3
6E4
6E
86A
6D
6D2

DISTRIBUITOR ȘI VULNERABILITATE
94

DONĂ

DONĂ SAU MÂNĂ GREȘITĂ

DREPTURI
 Ale adversarului, după chemarea arbitrului
 Ale jucătorului, după chemarea arbitrului
 Ale mortului

DREPTUL DE A IMPUNE RECTIFICĂRI

DREPTUL DE A DECLARA, PĂSTRARE A

DUPLICAREA ETUIURILOR

ECHIPĂ
 vezi și Concurent

ETUI (DONĂ)
 Aşezare și orientare
 Circulaţia etuiurilor
 Distribuitor și vulnerabilitate
 Donă greșită
 Donă incorectă
 Duplicare a
 Jocul normal al donei este imposibil
 Reîncadrarea cărţilor în etui
 Scoaterea cărţilor din etui

EXPLICAȚIE
 Apărători, înţelegeri în flanc
 Considerațiile arbitrului
 Corectarea erorilor
 Declaraţii
 Greşită, informaţie neautorizată
 Greşită, presupusă

EXPLICAȚIE GREȘITĂ SAU DECLARAȚIE GREȘITĂ
 Declarație greșită
 Dezinformare

vezi Etui
9B1d)
9B1c)
10A

17D3

6F

Definiții

Definiții
7A
8A
15
86B2, 87
6F
12A2
7C
7B

20F2
75D
20F4, 20F5, 75B
20F
75A
21B1b), 75C

21B, 75
21B1b), 75C
21B, 75B1, 75D2
 Explicație greșită a jucătorului
 Explicație greșită a partenerului jucătorului
 Informație neautorizată
 Scor ajustat, dezinformare
 Scor ajustat, folosirea informației neautorizate

FAPTE
 Consimțite
 Contestate
 Ponderea dovezilor

FEDERAȚIA MONDIALĂ DE BRIDGE

FIȘĂ DE CONVENȚII
 Consultarea fişei adversarilor
 Consultarea fişei proprii

IMP

INDUCERE ÎN EROARE

INFORMAȚIE
 vezi și Comunicare
 Autorizată
 Caracteristicile adversarilor
 Deceptivă, îndreptățită
 Deceptivă, fără o justificare bridgistică demonstrabilă
 Din declaraţii sau jocuri legale
 Din declaraţii sau jocuri retrase
 Ilicită, de la partener
 Ilicită, din alte surse
 Neautorizată

INFORMAȚIE AUTORIZATĂ
 Acțiune retrasă, axa nevinovată
 Caracteristicile adversarilor
 Cerințe ale regulamentului turneului
 Declarații și jocuri legale
 Deținută anterior, neinterzisă de lege
 Estimarea scorului

20F4, 75B2
75B3
16, 73C, 75A
75D3
75A
85
85A1

80A1a)

40B2a)ii
40B2c)
20G3, 40B2b)

Definiții, 78B

73E
16
16A2
73E1
73E2
16A1a)
16C
16B
16D
16
16C1
16A2
16A2
16A1a)
16A1d)
16A2
 Provenită din lege sau regulament

INFORMAȚIE NEAUTORIZATĂ
 Alternativă logică, definiție
 Alternativă logică, demonstrabil sugerată
 Acţiune retrasă, axa vinovată
 Ilicită
 Ilicită, de la partener
 Ilicită, din alte surse

INFRACȚIUNE
 vezi și Neregularitate
 Ascunsă
 Axa proprie
 Conștientizarea unui posibil prejudiciu
 Intenționată

16A1c)
16B1b)
16B1a)
16C2
16A3
16B, 73C
16D

Definiții, 72

72B3
72B2
72C
72B1

INTERPRETAREA LEGILOR

Introducere, 81C2

ÎNLOCUIRE
 Donă
 Donă, joc de echipe
 Jucător

ÎNTREBARE
 Declaraţii, făcute în fapt
 Declaraţii, inferenţe (deducţii)
 Declaraţii, relevante dar care nu au fost făcute
 Despre o singură declaraţie
 Informaţie neautorizată
 Jucător obligat să paseze
 Pentru a obține un răspuns incorect
 Pentru beneficiul partenerului
 Referitoare la licitaţie înainte de atacul iniţial

6D3
86A, 86B2a)
20
20F1, 20F2
20F1, 20F2
20F1, 20F2
20F3
16B, 73C, 75
20B, 20 notă de subsol
20G2
20G1
41B

ÎNȚELEGERE PARTENERIALĂ
 Ajutoare de memorie, calcul sau tehnică
 Consultarea fişei de convenții a adversarilor
 Consultarea propriei fișe de convenții
 Datoria de a le face disponibile înainte de începerea jocului
40B2d)
40B2c)
20G3, 40B2b)
40A1b)
 Deviere de la
 Dezvăluire, inferenţe (deducţii)
 Dezvăluire, parţială
 Dezvăluire, toate informaţiile particulare
 Dezvăluire, violări repetate
 Eșecul de a dezvălui
 Explicită
 Fişă de convenții
 Ilegală
 Implicită
 Informaţie transmisă prin
 Nedezvăluită
 Psihic
 Psihic artificial
 Scor ajustat
 Semnificație artificială
 Specială
 Variații de metodă, între parteneri
 Variații de stil și judecată, între parteneri
 Variații, după o neregularitate adversă

JOC
 Atac
 După o neregularitate
 După un joc ilegal
 Inabilitatea de a da la culoare
 Inabilitatea de a juca conform cererii
 Începerea jocului
 Joc sau atac prematur al unui apărător
 Joc simultan
 Joc subsecvent
 Obligaţia de a da la culoare
 Procedura de joc

JOC DE ECHIPE
 Ajustări necompensate, meciuri de tip knockout
 Donă incorectă
 Donă înlocuitoare
 Rezultat obținut la cealaltă masă

40A3, 40C1, 40C2
40B5a)
40B5b)
40B5a)
40B3b), 90, 91
40B3
40A1a)
40B2a)ii
40B4, 90
40A1a), 40C1
40A2, 73C
40A3, 40B3, 40C1
40A3, 40C1, 40C2
40B2a)v
40B3a), 40B4, 40B5b)
40B1c)
40B
40A4
40A4
40B2a)iv

Definiții
44A
60A
44D
41
58
44B
44C
86
12C4
86B2
86A, 86B2a)
86B
JOC NORMAL IMPOSIBIL

JUCĂTORI
 Circulația jucătorilor

LEGI
 Nu prescriu rectificare
 Utilizare (poate, face, ar trebui, va face, trebuie)

LEVATĂ
 A cincea carte jucată
 Aranjarea levatelor
 Câștigată
 Defectuoasă
 Inspecția levatelor
 Închiderea levatei
 Jucătorul amestecă cărţile
 Recapitularea jocului

LEVATĂ SUPLIMENTARĂ
 Calcularea scorului

LICITAȚIE
 vezi și Perioada de licitație
 Carte expusă
 Cărţi extrase dintr-un etui greşit
 Explicarea declaraţiilor în timpul
 Începerea licitaţiei
 Procedura după terminarea licitației
 Recapitulare, după pas-ul final
 Recapitulare, făcută de un adversar
 Recapitulare, înainte de expunerea atacului iniţial
 Sfârșitul licitației

MANȘĂ

MÂNĂ
 Greșită

MORT

12A2

3, 4, 5
8A

12A
Introducere

Definiții
45E
79
66
45G
65D, 66D
66D

Definiții
Definiții

Definiții, 24
20F
Definiții
22, 41
20C
20D
41B
22, 25

Definiții, 77

Definiții
Definiții
 Desemnarea cărţii care să fie jucată de la mort
 Drepturi, absolute
 Drepturi, condiționate
 Indică o carte
 Joacă o carte nedesemnată de declarant
 Limitări
 Mână expusă
 Un apărător îi arată cărțile

NEINTENȚIONAT
 Pierderea concentrării

NEREGULARITATE
 vezi și Infracțiune
 Atragerea atenţiei
 Cauzată de un spectator
 Chemarea arbitrului
 Conștientizarea unui posibil prejudiciu
 Corectare prematură
 Drepturile adversarilor
 Drepturile jucătorului
 După ce s-a atras atenţia
 Impunerea unei rectificări
 Opțiuni după
 Nicio acțiune până la sosirea arbitrului
 Păstrarea drepturilor
 Prevenirea
 Procedura după

NUMĂR INCORECT DE CĂRȚI

NUMĂRAREA CĂRȚILOR

OBLIGAȚIA DE A PASA, ACȚIUNE CARE VIOLEAZĂ

ONOR

OPȚIUNI
 Alegerea dintre
 Avantajoase
42A
42B
45F
45D
43A1, 43A2, 43B
41D
43A3

Definiții
25A2, 45C4b)

Definiții

9A
76C2
9B1a), 9B1b)
72C
9C, 26B
9B1d)
9B1c)
9B
10C
9B2
9B1c), 9B1d)
9A3
13

7B2
Definiții

10C2
10C3, 10C4
 Explicarea opţiunilor

10C1

ORGANIZATORUL TURNEULUI
 Acceptarea şi listarea înscrierilor
 Apeluri
 Aranjamente în avans
 Calcularea scorului
 Condiţii de concurs
 Condiţii de înscriere
 Data şi ora sesiunilor
 Desemnarea arbitrului
 Desemnarea asistenţilor arbitrului
 Desemnarea personalului
 Licitaţie şi joc, condiţii
 Licitaţie şi joc, condiţii speciale
 Perioada de corecţie
 Perioada de corecţie, eroare corectată după expirare
 Poate fi Autoritatea Regulatoare
 Puteri şi îndatoriri
 Puteri şi îndatoriri, altele
 Puteri şi îndatoriri, delegare
 Reglementări suplimentare
 Sarcini, asumarea responsabilităţii de către arbitru
 Termen limită pentru apel

PACHET DE CĂRȚI

PACHET SORTAT

PARTENER
 Informație ilicită de la
 Înțelegere cu

PARTENERIAT

PARȚIALĂ
 Calcularea scorului

80B
80B2h)
80B2k), 93A
80B2b)
80B2j)
78D, 80B2i)
80B2d)
80B2c)
80B2a)
80B2g)i
80B2g)ii
80B2e)
80B2e)
79C
79C2
80B1
80B2
80B2l)
80B1
80B2f)
80, notă de subsol
92B

Definiții, 1

Definiții, 6D2, 6 notă de
subsol

Definiții
16B
vezi Înțelegere
partenerială
Definiții
101

PAS
 Acţiuni violând obligaţia de a pasa
 Pas obligatoriu care produce prejudiciu
 Peste rând
 Peste rând, artificial
 Peste rând, declarație comparabilă

PAS FINAL, RECAPITULAREA LICITAȚIEI

PAUZE OBLIGATORII

PĂSTRAREA DREPTULUI DE A DECLARA

PENALIZARE
 vezi și Rectificare
 Disciplinară
 Procedurală
 Procedurală, concursuri individuale
 Violări repetate ale obligației de a-și dezvălui înțelegerile

PENALIZARE DISCIPLINARĂ

PENALIZARE PROCEDURALĂ
 Abateri care fac obiectul
 Aşezarea incorectă a cărţilor în etui
 Atingerea cărţilor
 Autoritatea arbitrului
 Compararea scorurilor
 Concursuri individuale
 Discuţie cu voce tare
 Erori de procedură
 Eșecul de a se conforma prompt
 Întârziere
 Joc lent nejustificat
 La aprecierea arbitrului

PERIOADA DE CLARIFICARE

Definiții
72C
30C, 31
23A

20C

73A2

17D3

Definiții
90
12C3
40B3b)

91A
90B
90B6
90B5
90A
90B4
12C3
90B3
90B7
90B8
90B1
90B2
90A

17D1, 20F4, 20F5b)ii,
40B2b), 40B2c)ii, 41

PERIOADA DE CORECȚIE

79C
PERIOADA DE LICITAȚIE
 Vezi și Licitație
 Început
 Păstrarea dreptului de a declara
 Perioada de clarificare

 Prima declarație
 Recapitularea licitației, în timpul
 Sfârșit
 Succesiunea declarațiilor

PERIOADA DE JOC
 Explicarea declaraţiilor, în timpul
 Început
17A
17D3
vezi Perioada de
clarificare
17B
20B
17D
17C

Definiții
20F2
41C

PIERDEREA CONCENTRĂRII

25A2, 45C4b)

PIERDEREA DREPTULUI LA RECTIFICARE
 Arbitrul ajustează numai scorul unei axe
 Penalizare procedurală

PREMATUR
 Atac sau joc al unui apărător
 Corectarea unei neregularităţi

PROCEDURĂ
 Corectă
 După consumarea unei renonse
 Eroare de arbitraj
 Îndatoririle arbitrului
 Joc
 Perioada de licitaţie
 Răspunderea pentru
 Rectificarea erorilor de procedură
11A
11B, 90
9C, 26B

vezi Procedură corectă
82C
81, 82A
vezi Perioada de licitație
7D
PROCEDURĂ CORECTĂ
 Atenţie insuficientă
 Atragerea atenţiei asupra unui eveniment semnificativ
 Comentarii gratuite

74C, 90
74B1
74C4
74B2
 Curtoazie
 Detaşarea unei cărţi
 Etichetă
 Joc lent, anormal
 Joc lent, deconcertant
 Joc lent, inutil
 Joc rapid, deconcertant
 Lipsă de interes
 Manieră nepoliticoasă, chemarea arbitrului
 Obligaţia de a urma procedura corectă
 Părăsirea mesei de joc fără motiv
 Plăcerea de a juca
 Variaţia tempoului de joc, deconcertant
 Violări de procedură, exemple

PSIHIC
 vezi și Înțelegere partenerială
 Declarație artificială psihică

PUNCT DE MECI

PUTERI
 Autoritatea Regulatoare
 Discreționare ale arbitrului
 Îndatoririle şi puterile arbitrului
 Organizatorul Turneului
RANG
 Cărţi şi culori
 Denominaţii
 Desemnare
 Desemnare incompletă

RECAPITULARE
 Contract
 Corectarea unei erori de recapitulare
 Declaraţie neidentificată clar
 Declarații
 După pas-ul final
 După terminarea jocului
 La rândul său de a declara

74A1
74B3
74B
90B2
74C7
74B4
74C7
74C6
74B5
74A3
74C8
74A2
74C7
74C

Definiții, 40

40B2a)v

Definiții, 78A

80A
81C
80B

1A
18E
46B3
46B1, 46B5

41C
20E
20A
20C
65C
20B
 Levata în curs
 Levate închise
 Licitaţie
 Răspuns dat de un adversar
 Ultima carte proprie jucată

RECONTRA
 A unui anunţ formulat incorect
 Calcularea scorului
 Continuarea licitației după recontra
 Contract recontrat
 Forma corectă
 Inadmisibilă
 Legală
 Peste rând
 Peste rând, declarație comparabilă

RECTIFICARE
 vezi și Scor ajustat
 Anularea impunerii sau suprimării unei rectificări
 Chestiune în dubiu
 Dreptul de a impune
 Impunerea unei rectificări
 Incorectă
 Legile nu prescriu
 Neregularitate cauzată de un spectator
 Pierderea dreptului la
 Pierderea dreptului la, arbitrul ajustează doar scorul unei axe
 Pierderea dreptului la, penalizare procedurală
 Prea severă sau prea avantajoasă
 Renonsă

REDISTRIBUIREA CĂRȚILOR
 Nu există redistribuire, joc de echipe

RENONSĂ
 Ajustare automată a numărului de levate
 Carte vizibilă
 Consumare
 Corectare

66A
66C
20C2, 41B
20D
66B

Definiții
19B3
36C, 77
19C
19D
19B2
19B, 27B3, 36
19B1
23A

Definiții

10B, 81C5
84D
10A
12A3
12A1
76C2
11A
11B, 90
12B2
vezi Renonsă

6D
86A

61, 62, 63, 64
64A
Definiții, 64B3
62
 Definiţie
 Dreptul de a inspecta levatele
 După ce axa nevinovată a declarat în dona următoare
 După terminarea rundei
 Interogări despre renonsă
 La levata a 12-a, corectată
 La levata a 12-a, înainte ca partenerul să joace
 Nicio ajustare automată a numărului de levate
 Prin nejucarea unei cărţi vizibile
 Procedura după consumarea renonsei
 Repararea prejudiciului
 Repararea prejudiciului, ambele axe au făcut renonsă
 Repararea prejudiciului, renonse repetate

RENUNȚARE LA RECTIFICARE

REVENDICARE
 vezi și Concesie
 Atu rămas afară
 Clarificare
 Contestată
 Definiție
 Joc normal
 Jocul este întrerupt
 Jocul poate continua cu acordul tuturor celor 4 jucători
 Linie de joc, consideraţiile arbitrului
 Linie de joc, neprecizată
 Retragerea acordului cu o revendicare sau concesie
 Revendicare sau concesie acceptată
 Revendicare sau concesie acceptată, stabilită

REZULTAT
 vezi și Scor
 Acordul asupra rezultatului
 Anulat, mai mult de 13 cărți
 Invalid, distribuire fără amestecarea cărţilor
 Nu se poate obţine un rezultat
 Obţinut la cealaltă masă în jocul de echipe

ROTAȚIE

61A
61C, 66C
64B4
64B5
61B
62D1
62D2
64B
64B3
64C
64B7, 64C2b)
64B2, 64C2a)

10B, 81C5

68, 69, 70

70C
68C, 70B
68A
70, notă de subsol
68D
68D2b)
70D
70E
69B
69A

65D, 79A
13D
6D2
12C2
86B

Definiții
RUNDĂ
 Terminare
 Terminarea ultimei runde

SCHIMBAREA JOCULUI
 Dezinformare

SCOR AJUSTAT
 Acţiune foarte riscantă
 Artificial
 Atribuire
 Eroare extrem de importantă (nelegată de infracțiune)
 La solicitarea unui jucător
 Iniţiativa arbitrului
 Înlocuitor
 Joc de echipe
 Joc normal imposibil
 Legile nu prescriu nicio rectificare
 Medie
 Medie minus
 Medie plus
 Prejudiciu
 Rectificare incorectă a unei neregularităţi
 Rezultat probabil

SESIUNE
 Data şi ora
 La masă pe tot parcursul
 Parteneriate în timpul
 Poziţia la masă în timpul
 Scor obţinut pe parcursul
 Semnificaţii diferite
 Sfârşit
 Suspendarea unui concurent pe timpul sesiunii

SPECTATOR
 Control
 La masă
 Participare

Definiții
8B
8C
47E

Definiții
12C1e)
12C1d), 12C2, 86B2
12C
12C1e)
12A
12A
12C1, 86B1, 86B2b)
12C4, 86
12A2, 12C2
12A1
12C2a)
12C2
12C2, 86B2b)
12B1
12A3
12C1b)

Definiții
80B2c)
7D
5
12C2
Definiții, 4, 12C2, 91
8C
91A
76A
76B
76C
 Provoacă o neregularitate
 Statut

ȘLEM

TEMPO SAU MANIERĂ
 Deducţii (inferenţe)
 Deviere intenționată
 Inducere în eroare
 Variație neintenționată

VULNERABILITATE
 Distribuitor și
 Calcularea scorului

76C2
76D

Definiții

73D
73C, 73D1
73D2, 73E2
73D2, 73E2
73C, 73D1

Definiții
77','apply_rule','[]');


-- Cross-references for the red (critical) laws: 13, 14, 25, 27, 30, 32, 45, 50, 64
-- (31 and 54 already have their own cross-refs above / in seed-rule31.sql)
INSERT INTO rule_refs (from_rule, to_rule, context) VALUES
  ('13A', '12C1(b)', 'Berichtigtes Ergebnis / Adjusted score / Scor ajustat'),
  ('13B', '12C1(b)', 'Berichtigtes Ergebnis / Adjusted score / Scor ajustat'),
  ('13D', '14', 'Zu wenige Karten im Kartenpaket / Fewer than 13 cards in a hand / Prea puține cărți într-o mână'),
  ('13D', '86B', 'Teamturnier / Team event / Turneu pe echipe'),
  ('14B', '67', 'Revoke-Berichtigung / Revoke rectification / Corectarea unei renonse'),
  ('14B', '14B', 'Später bemerkter Kartenmangel / Deficiency noticed later / Lipsă de cărți observată ulterior'),
  ('25A', '26', 'Ausspielbeschränkung / Lead restriction / Restricție de atac'),
  ('25A', '17D', 'Ende der Klärungsphase / End of the clarification period / Sfârșitul perioadei de clarificare'),
  ('25B', '25A', 'Unbeabsichtigte Ansage / Unintended call / Anunț neintenționat'),
  ('25B', '26', 'Ausspielbeschränkung / Lead restriction / Restricție de atac'),
  ('25B', '16C', 'Spielfremde Information / Extraneous information / Informații neautorizate'),
  ('27A', '31', 'Gebot außer der Reihe / Bid out of rotation / Anunț peste rând'),
  ('27B', '26B', 'Ausspielbeschränkung / Lead restriction / Restricție de atac'),
  ('27B', '16C', 'Spielfremde Information / Extraneous information / Informații neautorizate'),
  ('27B', '23A', 'Vergleichbare Ansage / Comparable call / Declarație comparabilă'),
  ('27B', '72C', 'Ergebnisberichtigung / Score adjustment / Ajustarea scorului'),
  ('27B', '27B1(b)', 'Ersatz durch vergleichbare Ansage / Replacement by comparable call / Înlocuire printr-o declarație comparabilă'),
  ('27B', '27A', 'Angenommenes ungenügendes Gebot / Accepted insufficient bid / Anunț insuficient acceptat'),
  ('27B', '27B3', 'Kontra/Rekontra bei ungenügendem Gebot / Double/redouble on insufficient bid / Contra/recontra la anunț insuficient'),
  ('27C', '27A', 'Angenommenes ungenügendes Gebot / Accepted insufficient bid / Anunț insuficient acceptat'),
  ('27D', '27B1', 'Ersatzansage nach ungenügendem Gebot / Replacement call after insufficient bid / Declarație de înlocuire după anunț insuficient'),
  ('27D', '12B1', 'Schaden für nicht-schuldige Seite / Damage to non-offending side / Prejudiciu adus părții nevinovate'),
  ('30A', '72C', 'Ergebnisberichtigung / Score adjustment / Ajustarea scorului'),
  ('30B', '16C2', 'Erlaubte Information für den Partner / Authorized information for partner / Informație autorizată pentru partener'),
  ('30B', '23A', 'Vergleichbare Ansage / Comparable call / Declarație comparabilă'),
  ('30B', '26B', 'Ausspielbeschränkung / Lead restriction / Restricție de atac'),
  ('30B', '23C', 'Folgen einer nicht vergleichbaren Ansage / Consequences of a non-comparable call / Consecințele unei declarații necomparabile'),
  ('30B', '16C', 'Spielfremde Information / Extraneous information / Informații neautorizate'),
  ('30B', '72C', 'Ergebnisberichtigung / Score adjustment / Ajustarea scorului'),
  ('30B', '25', 'Ansageänderung / Change of call / Schimbarea declarației'),
  ('30C', '30', 'Pass außer der Reihe / Pass out of rotation / Pas peste rând'),
  ('30C', '31', 'Gebot außer der Reihe / Bid out of rotation / Anunț peste rând'),
  ('32A', '36', 'Unzulässiges Kontra oder Rekontra / Inadmissible double or redouble / Contra sau recontra inadmisibil'),
  ('32A', '23A', 'Vergleichbare Ansage / Comparable call / Declarație comparabilă'),
  ('32A', '26B', 'Ausspielbeschränkung / Lead restriction / Restricție de atac'),
  ('32A', '23C', 'Folgen einer nicht vergleichbaren Ansage / Consequences of a non-comparable call / Consecințele unei declarații necomparabile'),
  ('32A', '16C', 'Spielfremde Information / Extraneous information / Informații neautorizate'),
  ('32A', '72C', 'Ergebnisberichtigung / Score adjustment / Ajustarea scorului'),
  ('32B', '16C2', 'Erlaubte Information für den Partner / Authorized information for partner / Informație autorizată pentru partener'),
  ('32C', '25', 'Ansageänderung / Change of call / Schimbarea declarației'),
  ('45C', '45E', 'Fünfte Karte eines Stichs / Fifth card to a trick / A cincea carte la o levată'),
  ('45C', '47', 'Zurücknahme einer bezeichneten Karte / Withdrawal of a designated card / Retragerea unei cărți desemnate'),
  ('45C', '47D', 'Karte zulässig zurückgenommen / Card legitimately withdrawn / Carte retrasă legitim'),
  ('45C', '16C1', 'Spielfremde Information, Option des Gegners / Extraneous info, opponent''s option / Informație neautorizată, opțiunea adversarului'),
  ('45C', '50', 'Strafkarte / Penalty card / Carte penalizată'),
  ('45D', '16C', 'Spielfremde Information / Extraneous information / Informații neautorizate'),
  ('45D', '64A', 'Automatischer Stichtransfer / Automatic trick transfer / Transfer automat de levată'),
  ('45D', '64B7', 'Kein automatischer Transfer, Sonderfall / No automatic transfer, special case / Fără transfer automat, caz special'),
  ('45D', '64C', 'Entschädigung / Compensation / Despăgubire'),
  ('45E', '50', 'Strafkarte / Penalty card / Carte penalizată'),
  ('45E', '53', 'Erstes Ausspiel außer der Reihe, verdeckt / Lead out of rotation, unfaced / Atac inițial peste rând, cu cartea pe spate'),
  ('45E', '56', 'Ausspiel oder Zugabe akzeptiert / Lead or play accepted / Atac sau joc acceptat'),
  ('45E', '55', 'Ausspiel des Alleinspielers außer der Reihe / Declarer''s lead out of turn / Atacul declarantului peste rând'),
  ('50D', '49', 'Vorzeitiges Ausspiel / Premature lead / Atac prematur'),
  ('50D', '51', 'Mehr als eine Strafkarte / More than one penalty card / Mai multe cărți penalizate'),
  ('50D', '50D', 'Vorgehen bei großer Strafkarte / Procedure for a major penalty card / Procedura la o carte penalizată majoră'),
  ('50E', '50D2(a)', 'Verzicht auf Verlangen/Verbot der Farbe / Declining to require or forbid the suit / Renunțarea la a cere/interzice culoarea'),
  ('50E', '16C', 'Spielfremde Information / Extraneous information / Informații neautorizate'),
  ('50E', '59', 'Ausspiel nicht wie verlangt möglich / Required lead not possible / Atacul cerut nu este posibil'),
  ('50E', '12B1', 'Schaden für nicht-schuldige Seite / Damage to non-offending side / Prejudiciu adus părții nevinovate'),
  ('64B', '64C', 'Entschädigung / Compensation / Despăgubire'),
  ('64B', '62C3', 'Berichtigung einer Revoke / Correcting a revoke / Corectarea unei renonse');


-- ===== Red-law tree restructure (13,14,25,27,30,32,45,50,64), 2026-08-01 =====
-- ===== Regel 13 =====
UPDATE decision_nodes SET question_de='Wann wird die falsche Kartenanzahl bemerkt?', question_en='Wann wird die falsche Kartenanzahl bemerkt?', question_ro='Cand se observa numarul gresit de carti?' WHERE rule_number='13' AND parent_id IS NULL;
UPDATE decision_nodes SET is_leaf=0, question_de='Kann die Partie korrekt gestellt und normal fertig gespielt werden?', question_en='Kann die Partie korrekt gestellt und normal fertig gespielt werden?', question_ro='Poate fi corectata si terminata normal partida?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1043;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1401,'13',1043,'ja','ja','da',1,'Wenn die Partie nach dem Urteil des Turnierleiters richtig gestellt und gespielt werden
kann, dann kann die Partie ohne Ansageänderung so gespielt werden. Am Ende des Spiels
kann der Turnierleiter ein Berichtigtes Ergebnis zuweisen.','Dacă arbitrul consideră că dona poate fi corectată şi jucată, dona poate fi jucată
fără vreo schimbare de declaraţie. La sfârşitul jocului, arbitrul poate acorda un
scor ajustat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1402,'13',1043,'nein','nein','nu',1,'Andernfalls soll der Turnierleiter ein Berichtigtes Ergebnis zuweisen [siehe Regel
12C1(b)]; er kann einen schuldigen Spieler bestrafen.','Altfel, când s-a făcut o declaraţie cu un număr incorect de cărți, arbitrul acordă un

scor ajustat [vezi Legea 12C1b)] şi poate penaliza un concurent vinovat.','apply_rule','["12C1(b)"]');

-- ===== Regel 14 =====
UPDATE decision_nodes SET question_de='Wann wird der Kartenmangel bemerkt?', question_en='Wann wird der Kartenmangel bemerkt?', question_ro='Cand se observa lipsa de carti?' WHERE rule_number='14' AND parent_id IS NULL;
UPDATE decision_nodes SET parent_id=1046, answer_label_de='vor dem ersten Ausspiel', answer_label_en='vor dem ersten Ausspiel', answer_label_ro='inainte de primul atac' WHERE id=1047;
UPDATE decision_nodes SET is_leaf=0, question_de='Wo wird die fehlende Karte gefunden?', question_en='Wo wird die fehlende Karte gefunden?', question_ro='Unde este gasita cartea lipsa?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1048;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1403,'14',1048,'unter den gespielten Karten','unter den gespielten Karten','printre cartile deja jucate',1,'wenn die Karte unter den gespielten gefunden wird, ist Regel 67 anzuwenden.

4. Es wird angenommen, dass sich eine Karte, die nach Regel 14B einem Blatt hinzugefügt
worden ist, immer in diesem Blatt befunden hat. Sie kann eine Strafkarte werden, und ihr
Nichtspielen kann eine Revoke sein.','Când cartea este găsită printre cărţile jucate, se aplică Legea 67.

4. Se consideră că o carte reîncadrată într-o mână în condiţiile Paragrafului B al
acestei Legi a aparținut de la început mâinii incomplete. Ea poate deveni carte
penalizată şi omisiunea de a o fi jucat poate constitui o renonsă.','apply_rule','["67", "14B"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1404,'14',1048,'anderswo','anderswo','in alta parte',1,'wenn die Karte anderswo gefunden wird, wird sie dem mangelhaften Blatt beigefügt.
Korrekturen und/oder Strafen können zu verhängen sein (siehe unten B4).

4. Es wird angenommen, dass sich eine Karte, die nach Regel 14B einem Blatt hinzugefügt
worden ist, immer in diesem Blatt befunden hat. Sie kann eine Strafkarte werden, und ihr
Nichtspielen kann eine Revoke sein.','Când cartea este găsită în altă parte, este reîncadrată în mâna incompletă. Pot fi

necesare rectificări şi/sau penalizări (vezi B4 mai jos).

4. Se consideră că o carte reîncadrată într-o mână în condiţiile Paragrafului B al
acestei Legi a aparținut de la început mâinii incomplete. Ea poate deveni carte
penalizată şi omisiunea de a o fi jucat poate constitui o renonsă.','apply_rule','["14B"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1405,'14',1048,'nicht gefunden','nicht gefunden','negasita',1,'wenn die Karte nicht gefunden werden kann, wird die Austeilung aus einem anderen
Kartenpaket rekonstruiert. Korrekturen und/oder Strafen können zu verhängen sein (siehe
unten B4.).

4. Es wird angenommen, dass sich eine Karte, die nach Regel 14B einem Blatt hinzugefügt
worden ist, immer in diesem Blatt befunden hat. Sie kann eine Strafkarte werden, und ihr
Nichtspielen kann eine Revoke sein.','Când cartea nu poate fi găsită, arbitrul reconstruieşte dona utilizând alt pachet de

cărţi. Pot fi necesare rectificări şi/sau penalizări (vezi B4 mai jos).

4. Se consideră că o carte reîncadrată într-o mână în condiţiile Paragrafului B al
acestei Legi a aparținut de la început mâinii incomplete. Ea poate deveni carte
penalizată şi omisiunea de a o fi jucat poate constitui o renonsă.','apply_rule','["14B"]');

-- ===== Regel 25 =====
UPDATE decision_nodes SET question_de='Unbeabsichtigt (Verspecher) oder beabsichtigt ersetzt?', question_en='Unbeabsichtigt (Verspecher) oder beabsichtigt ersetzt?', question_ro='Neintentionat (scapare) sau inlocuit deliberat?' WHERE rule_number='25' AND parent_id IS NULL;
UPDATE decision_nodes SET parent_id=1099, answer_label_de='unbeabsichtigt', answer_label_en='unbeabsichtigt', answer_label_ro='neintentionat' WHERE id=1100;
UPDATE decision_nodes SET is_leaf=0, question_de='Hat der Partner schon angesagt?', question_en='Hat der Partner schon angesagt?', question_ro='A declarat partenerul deja?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1100;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1406,'25',1100,'nein','nein','nu',1,'Wenn ein Spieler bemerkt, dass er nicht die Ansage gemacht hat, die er beabsichtigt hatte,
darf er die unbeabsichtigte Ansage durch die beabsichtigte ersetzen, solange sein Partner nicht
angesagt hat. Die zweite (beabsichtigte) Ansage gilt und unterliegt den darauf zutreffenden
Regeln; es gibt keine Ausspielbeschränkung nach Regel 26.

Wenn der Spieler ursprünglich die abgegebene Ansage machen wollte, gilt diese. Eine
Ansageänderung kann wegen eines mechanischen oder Zungenfehlers gestattet werden, nicht
aber wegen mangelnder Konzentration hinsichtlich der die Aktion leitenden Absicht.

Wenn die Umstände von Punkt A1 zutreffen, darf ein Spieler seine Ansage ändern, egal
wie er auf seinen Fehler aufmerksam geworden sein mag.

Wenn die Lizitation endet, bevor sie seinen Partner erreicht hat, kann die Ansage bis zum
Ende der Lizitationsphase (siehe Regel 17D) geändert werden.

Wenn eine Änderung gestattet worden ist, kann der linke Gegner eine Ansage, die er vor
der Änderung gemacht hat, zurückziehen. Die Information aus dieser zurückgezogenen
Ansage ist für seine Seite erlaubte, für seine Gegner unerlaubte Information.','Dacă un jucător descoperă că nu a făcut declarația pe care intenționa să o facă,
el poate, înainte ca partenerul său să declare, să-și înlocuiască declarația
neintenționată cu cea pe care intenționa să o facă. Cea de-a doua declaraţie (cea
intenţionată) rămâne valabilă şi face obiectul Legii corespunzătoare, dar nu se
aplică restricțiile de atac din Legea 26.

Dacă intenția primară a jucătorului a fost să facă declarația selectată sau rostită,
prima declarație rămâne valabilă. Se permite o schimbare de declarație din cauza
unei erori mecanice sau în vorbire, dar nu din cauza unei lipse de concentrare cu
privire la scopul acțiunii.

Un jucător are voie să înlocuiască o declarație neintenționată dacă se îndeplinesc
condițiile de la punctul A1 de mai sus, indiferent de modul în care el a devenit
conștient de eroare.

Dacă licitaţia se termină înainte de a veni rândul partenerului, nu se mai poate

face nicio înlocuire după terminarea perioadei de licitaţie (vezi Legea 17D).

Dacă este permisă o înlocuire, adversarul din stânga îşi poate retrage orice
declaraţie subsecventă declarației înlocuite. Informaţia din declaraţia retrasă este
autorizată pentru axa sa și neautorizată pentru adversari.','apply_rule','["26", "17D"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1407,'25',1100,'ja','ja','da',1,'Wenn sein Partner angesagt hat, ist eine Änderung nicht mehr möglich.','Nu se mai poate face nicio înlocuire când partenerul jucătorului a făcut o

declarație subsecventă.','apply_rule','[]');
UPDATE decision_nodes SET parent_id=1099, answer_label_de='beabsichtigt ersetzt', answer_label_en='beabsichtigt ersetzt', answer_label_ro='inlocuit deliberat' WHERE id=1101;
UPDATE decision_nodes SET is_leaf=0, question_de='Nimmt der linke Gegner die Ersatzansage an?', question_en='Nimmt der linke Gegner die Ersatzansage an?', question_ro='Adversarul din stanga accepta inlocuirea?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1101;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1408,'25',1101,'ja','ja','da',1,'Eine Ersatzansage, die nicht nach Regel 25A zulässig ist, kann vom linken Gegner
angenommen werden. (Sie ist angenommen, wenn er darüber absichtlich lizitiert.) Die erste
Ansage ist dann zurückgenommen, die zweite gilt und das Lizit geht weiter. (Regel 26 kann
anzuwenden sein.)','O declarație înlocuitoare nepermisă de paragraful A poate fi acceptată de
adversarul din stânga al jucătorului vinovat. (Este acceptată dacă adversarul din
stânga declară intenţionat peste aceasta.) În acest caz prima declarație este
retrasă, a doua declarație rămâne valabilă și licitația continuă (se poate aplica
Legea 26).','apply_rule','["25A", "26"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1409,'25',1101,'nein','nein','nu',1,'Abgesehen von Punkt B1, wird eine unzulässige Ersatzansage gestrichen. Die
ursprüngliche Ansage gilt, und das Lizit geht weiter. (Regel 26 kann anzuwenden sein.)','Exceptând cazul de la punctul B1, o înlocuire nepermisă de A este anulată.
Declaraţia iniţială rămâne valabilă şi licitaţia continuă (se poate aplica Legea 26).','apply_rule','["26"]');

-- ===== Regel 27 =====
UPDATE decision_nodes SET question_de='Was passiert mit dem ungenuegenden Gebot?', question_en='Was passiert mit dem ungenuegenden Gebot?', question_ro='Ce se intampla cu anuntul insuficient?' WHERE rule_number='27' AND parent_id IS NULL;
UPDATE decision_nodes SET is_leaf=0, question_de='Ersatzansage vergleichbar?', question_en='Ersatzansage vergleichbar?', question_ro='Ersatzansage vergleichbar?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1107;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1410,'27',1107,'ja','ja','da',1,'1(a) Wenn die Ersatzansage das niedrigste genügende Gebot ist, das sich auf dieselbe(n)
Denomination(en) bezieht wie die zurückgezogene Ansage, geht das Lizit normal weiter. Die
Regeln 26B und 16C sind nicht anzuwenden, siehe aber unten Punkt D.

1(b) wenn anders als gemäß (a) das ungenügende Gebot durch eine vergleichbare Ansage
(siehe Regel 23A) ersetzt wird, wird das Lizit ohne weitere Korrektur fortgesetzt. Regel 16C
ist nicht anzuwenden, siehe aber unten Punkt D.','1a) Dacă anunţul insuficient este corectat prin anunţul suficient la nivelul cel mai
jos care specifică aceeaşi denominaţie cu cea specificată de anunțul retras,
licitaţia continuă fără altă rectificare. Nu se aplică Legile 26B și 16C, dar vezi
D mai jos.

1b) Exceptând cazul a), dacă anunțul insuficient este corectat printr-o declarație
comparabilă (vezi Legea 23A), licitaţia continuă fără altă rectificare. Nu se
aplică Legea 16C, dar vezi D mai jos.','apply_rule','["26B", "16C", "23A"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1411,'27',1107,'nein','nein','nu',1,'2. Wird das ungenügende Gebot anders als oben in Punkt B1 beschrieben durch ein
genügendes Gebot oder Pass ersetzt, muss der Partner des Schuldigen immer passen, wenn er
an der Reihe ist anzusagen. Die Ausspielbeschränkungen gemäß Regel 26B können
anzuwenden sein, und siehe Regel 72C.','2. Exceptând cazurile de la B1, dacă anunțul insuficient este corectat printr-un anunț
suficient sau pas, partenerul jucătorului vinovat trebuie să paseze ori de câte ori îi
vine rândul să declare. Se aplică restricţiile de atac din Legea 26B, şi vezi Legea
72C.','apply_rule','["26B", "72C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1412,'27',1105,'versucht stattdessen zu kontrieren','versucht stattdessen zu kontrieren','incearca contra/recontra in loc',1,'3. Wenn der schuldige Spieler anders, als in Regel 27B1(b) beschrieben, versucht zu
kontrieren oder rekontrieren, wird diese Ansage gestrichen. Der schuldige Spieler muss sie
durch eine oben zugelassene Ansage ersetzen und sein Partner muss danach immer passen,
wenn er an der Reihe ist anzusagen. Die Ausspielbeschränkungen gemäß Regel 26B können
anzuwenden sein, und siehe Regel 72C.','3. Exceptând cazurile de la B1b), dacă jucătorul vinovat încearcă să-și înlocuiască
anunțul insuficient cu contra sau recontra, această declarație este anulată. Ea
trebuie înlocuită conform cerințelor de mai sus și partenerul jucătorului vinovat
trebuie să paseze ori de câte ori îi vine rândul să declare. Se aplică restricţiile de
atac din Legea 26B, şi vezi Legea 72C.','apply_rule','["27B1(b)", "26B", "72C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1413,'27',1105,'ersetzt durch ein weiteres ungenuegendes Gebot','ersetzt durch ein weiteres ungenuegendes Gebot','inlocuieste cu alt anunt insuficient',1,'4. Wenn der schuldige Spieler versucht, sein ungenügendes Gebot durch ein anderes
ungenügendes Gebot zu ersetzen, kann sein linker Gegner dieses ungenügende Gebot
annehmen (siehe oben Regel 27A). Andernfalls entscheidet der Turnierleiter nach Regel
27B3.','4. Dacă jucătorul vinovat încearcă să-și înlocuiască anunţul insuficient cu un alt
anunţ insuficient, arbitrul procedează ca la punctul 3 dacă adversarul din stânga
nu acceptă noul anunţ insuficient conform paragrafului A1.','apply_rule','["27A", "27B3"]');

-- ===== Regel 30 =====
UPDATE decision_nodes SET question_de='War der Pass künstlich?', question_en='War der Pass künstlich?', question_ro='A fost pasul artificial?' WHERE rule_number='30' AND parent_id IS NULL;
UPDATE decision_nodes SET parent_id=1117, answer_label_de='ja', answer_label_en='ja', answer_label_ro='da' WHERE id=1120;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,question_de,question_en,question_ro,is_leaf) VALUES (1414,'30',1117,'nein','nein','nu','Wer war an der Reihe anzusagen?','Wer war an der Reihe anzusagen?','Cine era la rand sa declare?',0);
UPDATE decision_nodes SET parent_id=1414, answer_label_de='rechter Gegner', answer_label_en='rechter Gegner', answer_label_ro='adversarul din dreapta' WHERE id=1118;
UPDATE decision_nodes SET parent_id=1414, answer_label_de='Partner / linker Gegner (noch nicht lizitiert)', answer_label_en='Partner / linker Gegner (noch nicht lizitiert)', answer_label_ro='partener/adv. stanga (nu a licitat inca)' WHERE id=1119;
UPDATE decision_nodes SET is_leaf=0, question_de='Ersatzansage vergleichbar? (Regel 23A)', question_en='Ersatzansage vergleichbar? (Regel 23A)', question_ro='Anuntul de inlocuire e comparabil? (Legea 23A)', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1119;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1415,'30',1119,'ja','ja','da',1,'(a) der Partner des schuldigen Spielers kann jede regelkonforme Ansage machen, wenn er an
der Reihe ist, aber Regel 16C2 ist anzuwenden.

(b)(i) wenn es sich um eine vergleichbare Ansage handelt (siehe Regel 23A), gibt es keine
weitere Korrektur. Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.','a) Când îi vine rândul, partenerul jucătorului vinovat poate face orice declarație

legală, dar se aplică Legea 16C2.

b)i. Când declarația este comparabilă (vezi Legea 23A), nu există nicio altă

rectificare. Nu se aplică Legea 26B, dar vezi Legea 23C.','apply_rule','["16C2", "23A", "26B", "23C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1416,'30',1119,'nein','nein','nu',1,'(a) der Partner des schuldigen Spielers kann jede regelkonforme Ansage machen, wenn er an
der Reihe ist, aber Regel 16C2 ist anzuwenden.

(b)(ii) wenn es sich nicht um eine vergleichbare Ansage handelt (siehe Regel 23A), muss der
Partner des schuldigen Spielers passen, wenn er das nächste Mal an der Reihe ist anzusagen.
Regel 16C, 26B und 72C können anzuwenden sein.','a) Când îi vine rândul, partenerul jucătorului vinovat poate face orice declarație

legală, dar se aplică Legea 16C2.

b)ii. Când declarația nu este comparabilă (vezi Legea 23A), partenerul
jucătorului vinovat trebuie să paseze la următorul său rând de a
declara. Se aplică Legile 16C, 26B și 72C.','apply_rule','["16C2", "23A", "16C", "26B", "72C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1417,'30',1414,'linker Gegner, bereits lizitiert','linker Gegner, bereits lizitiert','adv. stanga, a licitat deja',1,'2. Wenn der linke Gegner des schuldigen Spielers an der Reihe war anzusagen und der
schuldige Spieler bereits lizitiert hat, gilt der Pass außer der Reihe als Änderung einer Ansage
(siehe Regel 25).','2. Dacă jucătorul vinovat a mai declarat în donă, un pas la rândul adversarului său

din stânga este tratat ca o schimbare de declarație. Se aplică Legea 25.','apply_rule','["25"]');

-- ===== Regel 32 =====
UPDATE decision_nodes SET question_de='Wer war an der Reihe, als kontriert/rekontriert wurde?', question_en='Wer war an der Reihe, als kontriert/rekontriert wurde?', question_ro='Cine era la rand cand s-a contrat/recontrat?' WHERE rule_number='32' AND parent_id IS NULL;
UPDATE decision_nodes SET parent_id=1121, answer_label_de='rechter Gegner', answer_label_en='rechter Gegner', answer_label_ro='adversarul din dreapta' WHERE id=1122;
UPDATE decision_nodes SET is_leaf=0, question_de='Passt der rechte Gegner?', question_en='Passt der rechte Gegner?', question_ro='Adversarul din dreapta paseaza?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1122;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1418,'32',1122,'ja','ja','da',1,'1. Wenn dieser Gegner passt, muss der schuldige Spieler sein (Re-)Kontra wiederholen; wenn
das (Re-)Kontra zulässig war, gibt es keine weitere Korrektur, andernfalls ist Regel 36
anzuwenden.','1. Dacă acel adversar pasează, jucătorul vinovat trebuie să își repete contra sau
recontra peste rând, și nu există alte rectificări decât dacă aceasta este
inadmisibilă, caz în care se aplică Legea 36.','apply_rule','["36"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,question_de,question_en,question_ro,is_leaf) VALUES (1419,'32',1122,'bietet/kontriert/rekontriert','bietet/kontriert/rekontriert','anunta/contreaza/recontreaza','Vergleichbare Ansage?','Vergleichbare Ansage?','Anunt comparabil?',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1420,'32',1419,'ja','ja','da',1,'Wenn dieser Gegner bietet, kontriert oder rekontriert, kann der schuldige Spieler jede
regelkonforme Ansage machen, und

(a) wenn es sich um eine vergleichbare Ansage handelt (siehe Regel 23A), gibt es keine
weitere Korrektur. Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.

31.1 Eine regelwidrige Ansage des rechten Gegners unterliegt der üblichen Korrektur.','Dacă acel adversar anunță, contrează sau recontrează, jucătorul vinovat poate

face orice declarație legală:

a) Când declarația este comparabilă (vezi Legea 23A), nu există nicio altă

rectificare. Nu se aplică Legea 26B, dar vezi Legea 23C.

8 O declarație ilegală a adversarului din dreapta este rectificată ca de obicei.','apply_rule','["23A", "26B", "23C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1421,'32',1419,'nein','nein','nu',1,'(b) wenn es sich nicht um eine vergleichbare Ansage handelt (siehe Regel 23A), muss der
Partner des schuldigen Spielers passen, wenn er das nächste Mal an der Reihe ist anzusagen.
Regel 16C, 26B und 72C können anzuwenden sein.','b) Când declarația nu este comparabilă (vezi Legea 23A), partenerul jucătorului
vinovat trebuie să paseze la următorul său rând de a declara. Se aplică Legile
16C, 26B și 72C.','apply_rule','["23A", "16C", "26B", "72C"]');

-- ===== Regel 45 (C, D, E vertieft; A,B,F,G bleiben flach) =====
UPDATE decision_nodes SET is_leaf=0, question_de='Welcher Fall?', question_en='Welcher Fall?', question_ro='Care caz?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1174;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1422,'45',1174,'Gegenspieler-Karte gesehen','Gegenspieler-Karte gesehen','carte vazuta de partener',1,'1. Eine Karte eines Gegenspielers, die so gehalten worden ist, dass es für seinen Partner
möglich war, die Bildseite zu sehen, gilt als zum aktuellen Stich gespielt. (Wenn der Spieler
bereits eine regelkonforme Karte zu diesem Stich gespielt hat, siehe Regel 45E.)','1. O carte a unui apărător ţinută în aşa fel încât este posibil ca partenerul său să o
vadă trebuie jucată la levata în curs (dacă apărătorul a jucat deja o carte legală la
levata curentă, vezi Legea 45E).','apply_rule','["45E"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1423,'45',1174,'Alleinspieler-Blattkarte','Alleinspieler-Blattkarte','carte din mana declarantului',1,'2. Eine Karte aus dem Blatt des Alleinspielers gilt als gespielt, wenn sie

(a) mit der Bildseite nach oben gehalten worden ist, wobei sie den Tisch berührt oder beinahe
berührt hat; oder

(b) einige Zeit in einer derartigen Position gehalten worden ist, dass sie als gespielt zu
erkennen war.','2. Declarantul trebuie să joace o carte din mână dacă aceasta este:

a) ţinută cu faţa în sus, atingând sau aproape atingând masa; sau

b) menținută într-o poziție care sugerează că a fost jucată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1424,'45',1174,'Strohmann-Karte beruehrt','Strohmann-Karte beruehrt','carte de la mort atinsa',1,'3. Eine Karte des Strohmanns ist gespielt, wenn der Alleinspieler sie absichtlich berührt hat,
außer um die Karten zu ordnen, oder eine Karte über oder unter den berührten zu erreichen.','3. O carte a mortului trebuie jucată dacă a fost atinsă deliberat de către declarant,
altfel decât cu intenţia de a aranja cărţile mortului sau de a ajunge la o carte de
deasupra sau dedesubtul cărţii sau cărților atinse.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1425,'45',1174,'Karte bezeichnet','Karte bezeichnet','carte desemnata',1,'4. (a) Eine Karte ist gespielt, wenn sie ein Spieler als die Karte, die er zu spielen beabsichtigt,
nennt oder sonst wie bezeichnet (siehe aber Regel 47).

(b) Der Alleinspieler kann eine unbeabsichtigte Bezeichnung einer Karte des Strohmanns so
lange ändern, bis er das nächste Mal eine Karte aus seinem Blatt oder dem des Strohmanns
spielt. Eine Änderung der Bezeichnung kann gestattet werden, wenn er sich nur versprochen
hat, nicht aber wenn er unkonzentriert war oder einen neuen Plan gemacht hat. Wenn ein
Gegenspieler in der Reihe eine Karte gespielt hat, die vor der Änderung zulässig war, kann er
diese Karte in sein Blatt zurücknehmen und durch eine andere ersetzen (siehe Regel 47D und
16C1).','4. a) O carte trebuie jucată dacă un jucător o numeşte sau o desemnează în vreun

fel ca fiind cea pe care şi-a propus să o joace (dar vezi Legea 47).

b) Declarantul poate corecta o desemnare neintenționată a unei cărți de la mort
cât timp el nu a jucat din nou fie din mână, fie de la mort. O asemenea
schimbare este permisă în cazul unei erori în vorbire, dar nu pentru o pierdere
de concentrare sau o răzgândire. Dacă un adversar a jucat, la rândul său, o
carte legală înaintea schimbării desemnării, acest adversar poate să-şi retragă
cartea astfel jucată, să o reaşeze în mână şi să o înlocuiască cu alta (vezi
Legile 47D şi 16C1).','apply_rule','["47", "47D", "16C1"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1426,'45',1174,'Strafkarte','Strafkarte','carte penalizata',1,'5. Eine (große oder kleine) Strafkarte kann gespielt werden müssen (siehe Regel 50).','5. O carte penalizată, majoră sau minoră, ar putea trebui jucată (vezi Legea 50).','apply_rule','["50"]');
UPDATE decision_nodes SET is_leaf=0, question_de='Rechtzeitig bemerkt? (bevor beide Seiten zum nächsten Stich gespielt haben)', question_en='Rechtzeitig bemerkt? (bevor beide Seiten zum nächsten Stich gespielt haben)', question_ro='Observata la timp? (inainte ca ambele axe sa joace la levata urmatoare)', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1175;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1427,'45',1175,'ja','ja','da',1,'1. Wenn der Strohmann eine Karte, die der Alleinspieler nicht genannt hat, in die Position
einer gespielten Karte legt, muss die Karte zurückgenommen werden, wenn die
Aufmerksamkeit darauf gelenkt worden ist, bevor beide Seiten zum nächsten Stich gespielt
haben. Ein Gegenspieler kann dann eine Karte in sein Blatt zurücknehmen, die er nach dem
Fehler, aber bevor die Aufmerksamkeit darauf gelenkt worden ist, gespielt hat. Wenn der
rechte Gegner des Alleinspielers sein Spiel ändert, kann auch der Alleinspieler eine danach
gespielte Karte zurücknehmen. (siehe Regel 16C)','1. Dacă mortul poziționează ca fiind jucată o carte pe care declarantul nu a numit-o,
cartea trebuie retrasă dacă se atrage atenţia asupra ei înainte ca ambele axe să fi

12 Atacul inițial se face cu cartea mai întâi pe spate, în caz că Autoritatea Regulatoare nu decide altfel.
jucat la levata următoare, şi un apărător poate să retragă şi să reaşeze în mână o
carte jucată după eroare dar înainte să se fi atras atenţia asupra ei; dacă
adversarul din dreapta declarantului își schimbă cartea jucată, declarantul îşi
poate retrage şi el cartea jucată consecutiv la levata respectivă (vezi Legea 16C).','apply_rule','["16C"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1428,'45',1175,'nein','nein','nu',1,'2. Wenn es zu spät ist, die vom Strohmann falsch gespielte Karte zurück zu nehmen (siehe
oben), geht das Spiel normal und ohne Änderung der zu diesem oder einem folgenden Stich
gespielten Karten weiter. Wenn die falsch gelegte Karte die erste des Stiches war, kann eine
Revoke vorliegen, wenn nicht eine Karte der Farbe der falsch gelegten Karte zugegeben
worden ist (siehe Regel 64A, 64B7 und 64C). Wenn die falsch gelegte Karte zu einem Stich
zugegeben worden ist, der bereits im Gange war, und der Strohmann dadurch eine Revoke
begangen hat, siehe Regel 64B3 und 64C.','2. Când este prea târziu pentru a schimba cartea jucată greșit de către mort (vezi
mai sus), jocul continuă normal fără modificarea cărților jucate la această levată
sau la orice levată următoare. Când cartea jucată greșit a fost prima carte a
levatei, jocul unei cărți de altă culoare în levata respectivă poate constitui o
renonsă (vezi Legile 64A, 64B7 și 64C). Când cartea a fost jucată greșit la o
levată deja începută și reprezintă o renonsă de la mort, vezi Legile 64B3 și 64C.','apply_rule','["64A", "64B7", "64C", "64B3"]');
UPDATE decision_nodes SET is_leaf=0, question_de='Wer gibt die fünfte Karte zu?', question_en='Wer gibt die fünfte Karte zu?', question_ro='Cine furnizeaza a cincea carte?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1176;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1429,'45',1176,'ein Gegenspieler','ein Gegenspieler','un aparator',1,'1. Eine fünfte Karte, die ein Gegenspieler zu einem Stich zugibt, wird eine Strafkarte und
unterliegt Regel 50, wenn sie nicht nach dem Urteil des Turnierleiters ausgespielt worden ist
und daher Regel 53 oder 56 anzuwenden ist.','1. O a cincea carte furnizată la o levată de către un apărător devine carte
penalizată, supusă Legii 50, mai puțin dacă arbitrul consideră că a fost atacată,
caz în care se aplică Legea 53 sau 56.','apply_rule','["50", "53", "56"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1430,'45',1176,'der Alleinspieler','der Alleinspieler','declarantul',1,'2. Eine fünfte Karte, die der Alleinspieler aus seinem Blatt oder vom Strohmann zu einem
Stich zugibt, wird ohne weitere Korrektur wieder in das Blatt zurückgegeben, wenn sie nicht
nach dem Urteil des Turnierleiters ausgespielt worden ist und daher Regel 55 anzuwenden ist.','2. Când declarantul furnizează o a cincea carte la o levată, din mână sau de la mort,
aceasta este reîncadrată în mâna respectivă fără altă rectificare, mai puțin dacă
arbitrul consideră că a fost atacată, caz în care se aplică Legea 55.','apply_rule','["55"]');

-- ===== Regel 50 (B, D vertieft; A,C,E bleiben flach) =====
UPDATE decision_nodes SET is_leaf=0, question_de='Wie wurde die Karte sichtbar?', question_en='Wie wurde die Karte sichtbar?', question_ro='Cum a devenit cartea vizibila?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1195;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1431,'50',1195,'unabsichtlich, einzelne kleine Karte','unabsichtlich, einzelne kleine Karte','neintentionat, carte mica',1,'große oder kleine Strafkarte
Eine einzelne kleine Karte, die unabsichtlich sichtbar geworden ist (etwa, wenn zwei Karten
zu einem Stich gespielt werden, oder wenn eine Karte aus dem Blatt fällt), wird zur kleinen
Strafkarte.','Carte Penalizată Majoră sau Minoră

O singură carte de rang inferior unui onor şi expusă neintenţionat (ca, de exemplu,
jucând două cărţi la o levată, sau scăpând o carte accidental din mână) devine carte
penalizată minoră.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1432,'50',1195,'Figur oder absichtlich sichtbar','Figur oder absichtlich sichtbar','onor sau expunere deliberata',1,'Jede Figur und jede absichtlich durch Spielen sichtbar gewordene Karte (etwa
durch ein Ausspiel außer der Reihe oder die Berichtigung einer Revoke) wird eine große
Strafkarte. Wenn ein Gegenspieler mehr als eine Strafkarte hat, werden sie alle große
Strafkarten.','Orice onor sau orice carte expusă printr-un joc deliberat (ca, de
exemplu, un atac peste rând, sau o renonsă corectată) devine carte penalizată
majoră; când un apărător are două sau mai multe cărţi penalizate, toate aceste cărţi
devin cărţi penalizate majore.','apply_rule','[]');
UPDATE decision_nodes SET is_leaf=0, question_de='Wer ist als Nächstes am Zug?', question_en='Wer ist als Nächstes am Zug?', question_ro='Cine e la rand?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1197;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,question_de,question_en,question_ro,is_leaf) VALUES (1433,'50',1197,'der Spieler mit der Strafkarte selbst','der Spieler mit der Strafkarte selbst','cel cu cartea penalizata','Hat er noch eine andere Pflicht? (Farbe/Beschränkung)','Hat er noch eine andere Pflicht? (Farbe/Beschränkung)','Are alta obligatie? (culoare/restrictie)',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1434,'50',1433,'nein','nein','nu',1,'1(a) Abgesehen von dem in (b) geregelten Fall, muss eine große Strafkarte bei der ersten
regelkonformen Gelegenheit gespielt werden, sei es beim Ausspielen, Zugeben, Abwerfen
oder beim Schnappen. Wenn ein Gegenspieler zwei oder mehr Strafkarten hat, die er
regelkonform spielen kann, entscheidet der Alleinspieler, welche gespielt werden soll.','1a) Exceptând cazul b) de mai jos, o carte penalizată majoră trebuie jucată cu
prima ocazie legală, care poate fi un atac, un joc la culoare, o defosă sau un
tai. Dacă un apărător are două sau mai multe cărţi penalizate care pot fi jucate
legal, declarantul desemnează cartea care trebuie jucată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1435,'50',1433,'ja','ja','da',1,'1(b) Die Verpflichtung, Farbe zu bekennen oder einer Ausspiel- oder Spielbeschränkung zu
folgen, hat Vorrang gegenüber der Verpflichtung, eine große Strafkarte zu spielen, doch muss
die Strafkarte mit der Bildseite nach oben auf dem Tisch liegen bleiben und bei der nächsten
regelkonformen Gelegenheit gespielt werden.','1b) Obligaţia de a da la culoare sau de a se conforma unei restricţii de atac sau de
joc primează asupra obligaţiei de a juca o carte penalizată majoră, dar cartea
penalizată rămâne expusă pe masă și trebuie jucată la următoarea ocazie
legală.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,question_de,question_en,question_ro,is_leaf) VALUES (1436,'50',1197,'sein Partner ist am Ausspiel','sein Partner ist am Ausspiel','partenerul lui ataca','Deklarant wählt','Deklarant wählt','declarantul alege',0);
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1437,'50',1436,'Farbe verlangen/verbieten','Farbe verlangen/verbieten','cere/interzice culoarea',1,'2. Wenn ein Gegenspieler am Ausspiel ist, während sein Partner eine große Strafkarte hat,
darf er nicht ausspielen, bevor der Alleinspieler eine der nachstehenden Möglichkeiten
gewählt hat (wenn er vorzeitig ausspielt, unterliegt er einer Korrektur nach Regel 49):

(a) Er kann das Ausspiel der Farbe der Strafkarte verlangen50.1 oder solange verbieten50.1, als
dieser Gegenspieler am Ausspiel bleibt (bei zwei oder mehr Strafkarten siehe Regel 51);
wenn sich der Alleinspieler für eine dieser beiden Möglichkeiten entscheidet, ist die Karte
keine Strafkarte mehr und wird wieder ins Blatt genommen.','2. Când un apărător e la atac în timp ce partenerul său are o carte penalizată
majoră, el nu poate ataca până ce declarantul nu alege una dintre opţiunile de
mai jos (dacă apărătorul atacă prematur, el se supune rectificărilor din Legea 49).
Declarantul poate alege:

a) Să îi ceară apărătorului să atace culoarea cărții penalizate, sau să îi interzică13
să atace această culoare cât timp păstrează atacul (pentru două sau mai
multe cărţi penalizate, vezi Legea 51); dacă declarantul alege una din aceste
opţiuni, cartea respectivă nu mai este penalizată şi este reîncadrată în mână.','apply_rule','["49", "51"]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1438,'50',1436,'verzichten','verzichten','renunta',1,'(b) Er kann darauf verzichten, eine der in (a) genannten Möglichkeiten zu wählen. Dann kann
der Gegenspieler jede beliebige Karte ausspielen, und die Strafkarte bleibt als solche auf dem
Tisch liegen.50.2 In diesem Fall ist Regel 50D weiterhin anzuwenden, solange die Strafkarte
besteht.','b) Să nu ceară sau interzică un atac, caz în care apărătorul poate ataca orice
carte și cartea penalizată rămâne pe masă drept carte penalizată14. Dacă este
selectată această opţiune, Legea 50D continuă să se aplice atât timp cât
cartea rămâne penalizată.','apply_rule','["50D"]');

-- ===== Regel 64 (A, C vertieft; B bleibt flach) =====
UPDATE decision_nodes SET is_leaf=0, question_de='Wer hat den Revokestich gewonnen?', question_en='Wer hat den Revokestich gewonnen?', question_ro='Cine a castigat levata de renonsa?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1248;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1439,'64',1248,'der schuldige Spieler','der schuldige Spieler','jucatorul vinovat',1,'1. und der Revokestich vom schuldigen Spieler64.1 gewonnen worden ist, wird am Ende des
Spiels der Revokestich und zusätzlich ein weiterer Stich, falls die schuldige Seite nach dem
Revokestich noch einen oder mehrere gewonnen hat, an die nicht-schuldige Seite transferiert.','1. Și levata la care s-a petrecut renonsa a fost câștigată de jucătorul vinovat19, la
sfârșitul jocului levata la care s-a petrecut renonsa este transferată axei
nevinovate împreună cu una din levatele câștigate ulterior de axa vinovată.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1440,'64',1248,'nicht der schuldige Spieler','nicht der schuldige Spieler','nu jucatorul vinovat',1,'2. und der Revokestich nicht vom schuldigen Spieler64.1 gewonnen worden ist, und die
schuldige Seite den Revokestich oder einen oder mehrere nachfolgende Stiche gewonnen hat,
wird am Ende des Spiels ein Stich an die nicht-schuldige Seite transferiert.','2. Și levata la care s-a petrecut renonsa nu a fost câștigată de jucătorul vinovat19,
atunci, dacă axa vinovată a câștigat acea levată sau oricare din levatele
următoare, la sfârșitul jocului se transferă o levată axei nevinovate.','apply_rule','[]');
UPDATE decision_nodes SET is_leaf=0, question_de='Welcher Fall?', question_en='Welcher Fall?', question_ro='Care caz?', outcome_de=NULL, outcome_ro=NULL, outcome_type=NULL, referenced_rules=NULL WHERE id=1250;
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1441,'64',1250,'allgemein','allgemein','caz general',1,'1. Entschädigung
1. Wenn nach dem Urteil des Turnierleiters nach einer etablierten Revoke, einschließlich
solcher, für die es keinen automatischen Stichtransfer gibt, die nicht-schuldige Seite durch
diese Regel nicht ausreichend entschädigt worden ist, weist er ein berichtigtes Ergebnis zu.','1. Repararea Prejudiciului

1. Când, după orice renonsă consumată, inclusiv cele care nu fac obiectul ajustării
numărului de levate, arbitrul apreciază că axa nevinovată este insuficient
compensată de această Lege pentru prejudiciul suferit, el va acorda un scor
ajustat.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1442,'64',1250,'wiederholte Revokes gleiche Farbe','wiederholte Revokes gleiche Farbe','renonse repetate aceeasi culoare',1,'2(a) Nach wiederholten Revokes desselben Spielers in derselben Farbe (siehe oben B2)
adjustiert der Turnierleiter das Ergebnis, wenn die nicht-schuldige Seite wahrscheinlich mehr
Stiche erzielt hätte, wenn eine oder mehrere der nachfolgenden Revokes nicht stattgefunden
hätten.','2a) După renonse repetate ale aceluiași jucător în aceeași culoare (vezi B2 mai
sus), arbitrul ajustează scorul când este probabil ca axa nevinovată să fi
câștigat mai multe levate dacă una sau mai multe din renonsele subsecvente
nu s-ar fi petrecut.','apply_rule','[]');
INSERT INTO decision_nodes (id,rule_number,parent_id,answer_label_de,answer_label_en,answer_label_ro,is_leaf,outcome_de,outcome_ro,outcome_type,referenced_rules) VALUES (1443,'64',1250,'beide Seiten Revoke im selben Board','beide Seiten Revoke im selben Board','ambele axe renonsa in aceeasi dona',1,'2(b) Wenn beide Seiten im selben Board eine Revoke begangen haben (siehe oben B7) und
nach dem Urteil des Turnierleiters ein Teilnehmer geschädigt worden ist, soll er ein
berichtigtes Ergebnis so zuweisen, als hätte keine Revoke stattgefunden.','2b) Când ambele axe au făcut renonsă în aceeași donă (vezi B7 mai sus) și
arbitrul apreciază că un concurent a fost prejudiciat, el va acorda un scor
ajustat bazat pe rezultatul probabil în absența tuturor renonselor.','apply_rule','[]');
