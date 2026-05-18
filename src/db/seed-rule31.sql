INSERT INTO rules (number, title_de, title_en, title_ro, text_de, text_en, text_ro) VALUES (
  '31',
  'Gebot außer der Reihe',
  'Bid Out of Rotation',
  'Anunț Peste Rând',

  -- German (source: Turnierbridge-Regeln 2017, ÖBV, S. 39-40)
  'Wenn ein Spieler außer der Reihe geboten, künstlich gepasst oder auf eine künstliche Ansage seines Partners gepasst hat (siehe Regel 30C) und die Ansage gestrichen wird, weil sie nicht gemäß Regel 29A angenommen worden ist, dann gilt:

A. rechter Gegner an der Reihe
Wenn der schuldige Spieler angesagt hat, während sein rechter Gegner an der Reihe war anzusagen, dann gilt:
1. Wenn dieser Gegner passt, muss der schuldige Spieler seine Ansage wiederholen; wenn sie regelkonform ist, gibt es keine weitere Korrektur.
2. Wenn dieser Gegner ein regelkonformes Gebot abgibt, oder kontriert oder rekontriert, kann der schuldige Spieler jede regelkonforme Ansage machen, und
(a) wenn es sich um eine vergleichbare Ansage handelt (siehe Regel 23A), gibt es keine weitere Korrektur. Regel 26B ist nicht anzuwenden, siehe aber Regel 23C.
(b) wenn es sich nicht um eine vergleichbare Ansage handelt (siehe Regel 23A), muss der Partner des schuldigen Spielers passen, wenn er das nächste Mal an der Reihe ist anzusagen. Regel 16C, 26B und 72C können anzuwenden sein.

B. Partner oder linker Gegner an der Reihe
Wenn der schuldige Spieler geboten hat, während entweder sein Partner an der Reihe war anzusagen, oder sein linker Gegner und der schuldige Spieler noch nicht lizitiert hat, dann gilt:
1. der Partner des schuldigen Spielers kann jede regelkonforme Ansage machen, wenn er an der Reihe ist, aber Regel 16C2 ist anzuwenden.
2. der schuldige Spieler kann, wenn er an der Reihe ist, jede regelkonforme Ansage machen, und der Turnierleiter entscheidet nach Absatz A2(a) oder A2(b).

C. spätere Gebote, wenn der linke Gegner an der Reihe ist
Spätere Gebote, wenn der linke Gegner an der Reihe ist anzusagen, gelten als Änderung einer Ansage, auf die Regel 25 anzuwenden ist.',

  -- English (WBF 2017 Laws of Duplicate Bridge, Law 31)
  'When a player has bid out of rotation, or made an artificial pass or an artificial call that could be construed as a pass (see Law 30C), and the call is cancelled (not accepted as provided in Law 29A), then:

A. Right-Hand Opponent''s Turn
When the offender bid while his right-hand opponent was obligated to call:
1. If RHO passes, the offender must repeat the call; if it was legal there is no further rectification.
2. If RHO makes a legal bid, double or redouble, the offender may make any legal call, and:
(a) if it is the same call as that made out of rotation (see Law 23A), there is no rectification. Law 26B does not apply, but see Law 23C.
(b) if it is not the same call (see Law 23A), the offender''s partner must pass whenever it is his turn to call. Laws 16C, 26B, and 72C may apply.

B. Partner''s or Left-Hand Opponent''s Turn
When the offender bid while his partner was obligated to call, or while his LHO was obligated to call and the offender had not previously bid:
1. The offender''s partner may make any legal call, but Law 16C2 applies.
2. The offender may make any legal call when it is his turn to call, and the Director applies subsection A2(a) or A2(b).

C. Left-Hand Opponent''s Subsequent Calls
Subsequent calls by LHO, when LHO is obligated to call, are treated as a change of call subject to Law 25.',

  -- Romanian (source: Legile bridge-ului contract 2017, Federația Română de Bridge, p. 40-41)
  'Când un jucător a făcut un anunț peste rând, un pas artificial peste rând sau a pasat peste rând o declarație artificială a partenerului (vezi Legea 30C) și declarația este anulată, opțiunea din Legea 29A nefiind exercitată, se aplică următoarele prevederi:

A. La Rândul Adversarului din Dreapta
Dacă jucătorul vinovat a declarat când era rândul adversarului său din dreapta, atunci:
1. Dacă acel adversar pasează, jucătorul vinovat trebuie să își repete declarația peste rând, și când aceasta este legală nu există alte rectificări.
2. Dacă acel adversar anunță, contrează sau recontrează legal, jucătorul vinovat poate face orice declarație legală:
a) Când declarația este comparabilă (vezi Legea 23A), nu există nicio altă rectificare. Nu se aplică Legea 26B, dar vezi Legea 23C.
b) Când declarația nu este comparabilă (vezi Legea 23A), partenerul jucătorului vinovat trebuie să paseze la următorul său rând de a declara. Se aplică Legile 16C, 26B și 72C.

B. La Rândul Partenerului sau al Adversarului din Stânga
Dacă jucătorul vinovat face un anunț când era rândul partenerului, sau al adversarului său din stânga fără ca jucătorul vinovat să mai fi declarat în donă, atunci:
1. Când îi vine rândul, partenerul jucătorului vinovat poate face orice declarație legală, dar se aplică Legea 16C2.
2. Când îi vine rândul, jucătorul vinovat poate face orice declarație legală și arbitrul procedează ca la punctele A2a) sau A2b) de mai sus.

C. Anunțuri Ulterioare la Rândul Adversarului din Stânga
Anunțurile ulterioare făcute la rândul adversarului din stânga sunt tratate ca schimbări de declarație și se aplică Legea 25.

Notă: O declarație ilegală a adversarului din dreapta este rectificată ca de obicei.'
);

-- Cross-references
INSERT INTO rule_refs (from_rule, to_rule, context) VALUES
  ('31',    '29A',  'Annahme / Acceptance / Opțiunea de acceptare a declarației peste rând'),
  ('31',    '30C',  'Künstlicher Pass / Artificial pass / Pas artificial'),
  ('31A2a', '23A',  'Vergleichbare Ansage / Same call / Declarație comparabilă'),
  ('31A2a', '23C',  'Folgen / Consequences / Consecințe'),
  ('31A2a', '26B',  'Ausspielbeschränkungen / Lead restrictions / Restricții de atac'),
  ('31A2b', '16C',  'Spielfremde Information / Extraneous information / Informații neautorizate'),
  ('31A2b', '26B',  'Ausspielbeschränkungen / Lead restrictions / Restricții de atac'),
  ('31A2b', '72C',  'Ergebnisberichtigung / Score adjustment / Scor ajustat'),
  ('31B1',  '16C2', 'Partner-Information / Partner information / Informații partener'),
  ('31C',   '25',   'Ansageänderung / Change of call / Schimbare de declarație');

-- Decision tree nodes — fully trilingual with official RO terminology

-- Node 1: ROOT
INSERT INTO decision_nodes (id, rule_number, parent_id,
  question_de, question_en, question_ro, is_leaf)
VALUES (1, '31', NULL,
  'Wer war an der Reihe anzusagen, als das Gebot außer der Reihe gemacht wurde?',
  'Who was obligated to call when the bid out of rotation was made?',
  'Cine era la rând să declare când s-a făcut anunțul peste rând?',
  0);

-- Node 2: Branch A
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  question_de, question_en, question_ro, is_leaf)
VALUES (2, '31', 1,
  'A — Rechter Gegner',
  'A — Right-Hand Opponent (RHO)',
  'A — La Rândul Adversarului din Dreapta',
  'Was hat der rechte Gegner nach dem Gebot außer der Reihe getan?',
  'What did RHO do after the bid out of rotation?',
  'Ce a făcut adversarul din dreapta după declarația peste rând?',
  0);

-- Node 3: Branch B
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  question_de, question_en, question_ro, is_leaf)
VALUES (3, '31', 1,
  'B — Partner / linker Gegner (Schuldiger hat noch nicht lizitiert)',
  'B — Partner / LHO (offender has not yet bid)',
  'B — La Rândul Partenerului sau al Adversarului din Stânga (vinovat nu a mai declarat în donă)',
  'Wer ist jetzt an der Reihe?',
  'Who is now obligated to call?',
  'Cine este acum la rând să declare?',
  0);

-- Node 4: Branch C (leaf)
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  is_leaf, outcome_de, outcome_en, outcome_ro,
  outcome_type, referenced_rules)
VALUES (4, '31', 1,
  'C — Linker Gegner (Schuldiger hat bereits lizitiert)',
  'C — LHO (offender has already bid)',
  'C — Anunțuri Ulterioare la Rândul Adversarului din Stânga (vinovat a mai declarat)',
  1,
  'Spätere Ansagen des linken Gegners gelten als Ansageänderung. Regel 25 ist anzuwenden.',
  'Subsequent calls by LHO are treated as a change of call. Law 25 applies.',
  'Anunțurile ulterioare făcute la rândul adversarului din stânga sunt tratate ca schimbări de declarație și se aplică Legea 25.',
  'apply_rule', '["25"]');

-- Node 5: A1 — RHO passes (leaf)
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  is_leaf, outcome_de, outcome_en, outcome_ro,
  outcome_type, referenced_rules)
VALUES (5, '31', 2,
  'A1 — Gegner passt',
  'A1 — RHO passes',
  'A1 — Adversarul din dreapta pasează',
  1,
  'Der schuldige Spieler muss seine Ansage wiederholen. Wenn sie regelkonform ist, gibt es keine weitere Korrektur.',
  'The offender must repeat the call. If it is legal, there is no further rectification.',
  'Jucătorul vinovat trebuie să își repete declarația peste rând. Când aceasta este legală nu există alte rectificări.',
  'repeat_bid', '[]');

-- Node 6: A2 — RHO bids/doubles/redoubles
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  question_de, question_en, question_ro, is_leaf)
VALUES (6, '31', 2,
  'A2 — Gegner bietet / kontriert / rekontriert',
  'A2 — RHO bids / doubles / redoubles',
  'A2 — Adversarul anunță / contrează / recontrează legal',
  'Ist die neue Ansage des schuldigen Spielers eine vergleichbare Ansage? (Regel 23A)',
  'Is the offender''s new call the same call as made out of rotation? (Law 23A)',
  'Declarația jucătorului vinovat este comparabilă cu cea de peste rând? (Legea 23A)',
  0);

-- Node 7: A2a — same call (leaf)
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  is_leaf, outcome_de, outcome_en, outcome_ro,
  outcome_type, referenced_rules)
VALUES (7, '31', 6,
  'Ja — vergleichbare Ansage',
  'Yes — same call',
  'Da — declarație comparabilă',
  1,
  'Keine weitere Korrektur. Regel 26B ist nicht anzuwenden. Regel 23C ist zu beachten.',
  'No further rectification. Law 26B does not apply. See Law 23C.',
  'Nu există nicio altă rectificare. Nu se aplică Legea 26B, dar vezi Legea 23C.',
  'no_correction', '["23A","23C","26B"]');

-- Node 8: A2b — different call (leaf)
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  is_leaf, outcome_de, outcome_en, outcome_ro,
  outcome_type, referenced_rules)
VALUES (8, '31', 6,
  'Nein — nicht vergleichbare Ansage',
  'No — different call',
  'Nu — declarație necomparabilă',
  1,
  'Der Partner des schuldigen Spielers muss passen, wenn er das nächste Mal an der Reihe ist. Regel 16C, 26B und 72C können anzuwenden sein.',
  'The offender''s partner must pass whenever it is his turn to call. Laws 16C, 26B, and 72C may apply.',
  'Partenerul jucătorului vinovat trebuie să paseze la următorul său rând de a declara. Se aplică Legile 16C, 26B și 72C.',
  'partner_must_pass', '["16C","26B","72C"]');

-- Node 9: B1 — partner's turn (leaf)
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  is_leaf, outcome_de, outcome_en, outcome_ro,
  outcome_type, referenced_rules)
VALUES (9, '31', 3,
  'B1 — Partner ist an der Reihe',
  'B1 — Partner''s turn',
  'B1 — Rândul partenerului',
  1,
  'Der Partner kann jede regelkonforme Ansage machen. Regel 16C2 ist anzuwenden.',
  'The partner may make any legal call. Law 16C2 applies.',
  'Când îi vine rândul, partenerul jucătorului vinovat poate face orice declarație legală, dar se aplică Legea 16C2.',
  'no_correction', '["16C2"]');

-- Node 10: B2 — offender's turn
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  question_de, question_en, question_ro, is_leaf)
VALUES (10, '31', 3,
  'B2 — Schuldiger Spieler ist an der Reihe',
  'B2 — Offender''s turn',
  'B2 — Rândul jucătorului vinovat',
  'Ist die Ansage des schuldigen Spielers eine vergleichbare Ansage? (Regel 23A)',
  'Is the offender''s call the same call as made out of rotation? (Law 23A)',
  'Declarația jucătorului vinovat este comparabilă cu cea de peste rând? (Legea 23A)',
  0);

-- Node 11: B2a — same call (leaf)
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  is_leaf, outcome_de, outcome_en, outcome_ro,
  outcome_type, referenced_rules)
VALUES (11, '31', 10,
  'Ja — vergleichbare Ansage',
  'Yes — same call',
  'Da — declarație comparabilă',
  1,
  'Keine weitere Korrektur. Regel 26B ist nicht anzuwenden. Regel 23C ist zu beachten.',
  'No further rectification. Law 26B does not apply. See Law 23C.',
  'Nu există nicio altă rectificare. Nu se aplică Legea 26B, dar vezi Legea 23C.',
  'no_correction', '["23A","23C","26B"]');

-- Node 12: B2b — different call (leaf)
INSERT INTO decision_nodes (id, rule_number, parent_id,
  answer_label_de, answer_label_en, answer_label_ro,
  is_leaf, outcome_de, outcome_en, outcome_ro,
  outcome_type, referenced_rules)
VALUES (12, '31', 10,
  'Nein — nicht vergleichbare Ansage',
  'No — different call',
  'Nu — declarație necomparabilă',
  1,
  'Der Partner des schuldigen Spielers muss passen, wenn er das nächste Mal an der Reihe ist. Regel 16C, 26B und 72C können anzuwenden sein.',
  'The offender''s partner must pass whenever it is his turn to call. Laws 16C, 26B, and 72C may apply.',
  'Partenerul jucătorului vinovat trebuie să paseze la următorul său rând de a declara. Se aplică Legile 16C, 26B și 72C.',
  'partner_must_pass', '["16C","26B","72C"]');
