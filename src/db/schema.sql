CREATE TABLE IF NOT EXISTS rules (
  id       INTEGER PRIMARY KEY,
  number   TEXT NOT NULL UNIQUE,
  title_de TEXT,
  title_en TEXT,
  title_ro TEXT,
  text_de  TEXT NOT NULL,
  text_en  TEXT,
  text_ro  TEXT
);

CREATE TABLE IF NOT EXISTS rule_refs (
  id        INTEGER PRIMARY KEY,
  from_rule TEXT NOT NULL,
  to_rule   TEXT NOT NULL,
  context   TEXT
);

CREATE TABLE IF NOT EXISTS decision_nodes (
  id               INTEGER PRIMARY KEY,
  rule_number      TEXT NOT NULL,
  parent_id        INTEGER,
  answer_label_de  TEXT,
  answer_label_en  TEXT,
  answer_label_ro  TEXT,
  question_de      TEXT,
  question_en      TEXT,
  question_ro      TEXT,
  is_leaf          INTEGER DEFAULT 0,
  outcome_de       TEXT,
  outcome_en       TEXT,
  outcome_ro       TEXT,
  outcome_type     TEXT,
  referenced_rules TEXT
);
