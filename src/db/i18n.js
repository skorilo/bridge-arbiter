export const LANGS = [
  { code: 'de', label: 'Deutsch' },
  { code: 'ro', label: 'Română' },
]

export const UI = {
  de: {
    appSub: 'Turnierbridge-Regeln 2017',
    chooseRule: 'Wähle eine Regel:',
    step: 'Schritt',
    back: '← Zurück',
    backRules: '← Regeln',
    decisionTree: 'Entscheidungsbaum',
    restart: '↩ Neu beginnen',
    refs: 'Referenzierte Regeln:',
    ruleText: 'Regeltext',
    crossRefs: 'Querverweise:',
    noText: 'Regeltext wird mit der nächsten Version hinzugefügt.',
    viewIn: 'Anzeigen in:',
  },
  en: {
    appSub: 'Laws of Duplicate Bridge 2017',
    chooseRule: 'Select a law:',
    step: 'Step',
    back: '← Back',
    backRules: '← Laws',
    decisionTree: 'Decision Tree',
    restart: '↩ Restart',
    refs: 'Referenced laws:',
    ruleText: 'Law text',
    crossRefs: 'Cross-references:',
    noText: 'Law text will be added in a future version.',
    viewIn: 'View in:',
  },
  ro: {
    appSub: 'Legile bridge-ului contract 2017',
    chooseRule: 'Selectează o lege:',
    step: 'Pasul',
    back: '← Înapoi',
    backRules: '← Legi',
    decisionTree: 'Arbore de decizie',
    restart: '↩ Reîncepe',
    refs: 'Legi referențiate:',
    ruleText: 'Textul legii',
    crossRefs: 'Referințe încrucișate:',
    noText: 'Textul legii va fi adăugat într-o versiune viitoare.',
    viewIn: 'Afișează în:',
  },
}

export const TYPE_LABELS = {
  de: {
    repeat_bid: { label: 'Ansage wiederholen', color: '#e67e22' },
    no_correction: { label: 'Keine weitere Korrektur', color: '#27ae60' },
    partner_must_pass: { label: 'Partner muss passen', color: '#c0392b' },
    apply_rule: { label: 'Regel anwenden', color: '#2980b9' },
  },
  en: {
    repeat_bid: { label: 'Repeat the call', color: '#e67e22' },
    no_correction: { label: 'No further rectification', color: '#27ae60' },
    partner_must_pass: { label: 'Partner must pass', color: '#c0392b' },
    apply_rule: { label: 'Apply law', color: '#2980b9' },
  },
  ro: {
    repeat_bid: { label: 'Repetă declarația', color: '#e67e22' },
    no_correction: { label: 'Nicio altă rectificare', color: '#27ae60' },
    partner_must_pass: { label: 'Partenerul trebuie să paseze', color: '#c0392b' },
    apply_rule: { label: 'Aplică legea', color: '#2980b9' },
  },
}
