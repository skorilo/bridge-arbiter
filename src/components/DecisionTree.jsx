import { useState } from 'react'
import { query } from '../db/database'
import { LANGS } from '../db/i18n'
import OutcomeCard from './OutcomeCard'
import RuleCard from './RuleCard'

export default function DecisionTree({ rule, lang, onLangChange, t }) {
  const [history, setHistory] = useState([])
  const [currentNode, setCurrentNode] = useState(() =>
    query(
      'SELECT * FROM decision_nodes WHERE rule_number = ? AND parent_id IS NULL',
      [rule.number]
    )[0] || null
  )
  const [openRule, setOpenRule] = useState(null)

  function selectAnswer(label) {
    const next = query(
      'SELECT * FROM decision_nodes WHERE parent_id = ? AND answer_label_de = ?',
      [currentNode.id, label]
    )[0]
    if (!next) return
    setHistory(h => [...h, currentNode])
    setCurrentNode(next)
  }

  function goBack() {
    if (!history.length) return
    setCurrentNode(history[history.length - 1])
    setHistory(h => h.slice(0, -1))
  }

  function restart() {
    setHistory([])
    setCurrentNode(
      query(
        'SELECT * FROM decision_nodes WHERE rule_number = ? AND parent_id IS NULL',
        [rule.number]
      )[0] || null
    )
  }

  if (!currentNode) return <p style={{ color: '#c0392b' }}>Tree not found.</p>

  const children = currentNode.is_leaf
    ? []
    : query('SELECT * FROM decision_nodes WHERE parent_id = ?', [currentNode.id])

  const question = currentNode[`question_${lang}`] || currentNode.question_de

  return (
    <div>
      {/* Language switcher */}
      <div style={styles.langBar}>
        <span style={styles.langBarLabel}>{t.viewIn}</span>
        {LANGS.map(l => (
          <button
            key={l.code}
            style={{ ...styles.langChip, ...(lang === l.code ? styles.langChipActive : {}) }}
            onClick={() => onLangChange(l.code)}
          >
            {l.label}
          </button>
        ))}
      </div>

      {history.length > 0 && (
        <button style={styles.backBtn} onClick={goBack}>{t.back}</button>
      )}

      {currentNode.is_leaf ? (
        <OutcomeCard node={currentNode} lang={lang} t={t} onRuleClick={setOpenRule} onRestart={restart} />
      ) : (
        <div style={styles.card}>
          <div style={styles.stepLabel}>{t.step} {history.length + 1}</div>
          <p style={styles.question}>{question}</p>
          <div style={styles.answers}>
            {children.map(child => (
              <button
                key={child.id}
                style={styles.answerBtn}
                onClick={() => selectAnswer(child.answer_label_de)}
              >
                {child[`answer_label_${lang}`] || child.answer_label_de}
              </button>
            ))}
          </div>
        </div>
      )}

      {openRule && (
        <RuleCard ruleRef={openRule} lang={lang} t={t}
          onClose={() => setOpenRule(null)}
          onRuleClick={ref => setOpenRule(ref)} />
      )}
    </div>
  )
}

const styles = {
  langBar: {
    display: 'flex',
    alignItems: 'center',
    gap: 8,
    marginBottom: 14,
    flexWrap: 'wrap',
  },
  langBarLabel: {
    fontSize: 12,
    color: '#888',
  },
  langChip: {
    background: '#e8edf2',
    color: '#1a3a5c',
    border: '1px solid transparent',
    borderRadius: 16,
    padding: '4px 12px',
    fontSize: 12,
    fontWeight: 500,
    cursor: 'pointer',
  },
  langChipActive: {
    background: '#1a3a5c',
    color: '#fff',
  },
  backBtn: {
    background: 'none',
    border: 'none',
    color: '#1a3a5c',
    fontSize: 15,
    cursor: 'pointer',
    padding: '0 0 12px',
    display: 'block',
  },
  card: {
    background: '#fff',
    borderRadius: 12,
    padding: 20,
    boxShadow: '0 2px 12px rgba(0,0,0,0.12)',
  },
  stepLabel: {
    fontSize: 11,
    fontWeight: 700,
    letterSpacing: 1,
    color: '#1a3a5c',
    textTransform: 'uppercase',
    marginBottom: 10,
  },
  question: {
    fontSize: 17,
    lineHeight: 1.5,
    color: '#1a1a2e',
    margin: '0 0 20px',
    fontWeight: 500,
  },
  answers: {
    display: 'flex',
    flexDirection: 'column',
    gap: 10,
  },
  answerBtn: {
    textAlign: 'left',
    padding: '14px 16px',
    background: '#f4f7fb',
    border: '2px solid transparent',
    borderRadius: 10,
    fontSize: 14,
    color: '#1a3a5c',
    cursor: 'pointer',
    lineHeight: 1.4,
    fontWeight: 500,
  },
}
