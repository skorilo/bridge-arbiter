import { TYPE_LABELS } from '../db/i18n'
import { formatText, renderWithLinks } from '../utils/lawText'

export default function OutcomeCard({ node, lang, t, onRuleClick, onRestart }) {
  const refs = node.referenced_rules ? JSON.parse(node.referenced_rules) : []
  const typeInfo = TYPE_LABELS[lang]?.[node.outcome_type] || TYPE_LABELS.de[node.outcome_type] || { label: node.outcome_type, color: '#666' }
  const outcome = node[`outcome_${lang}`] || node.outcome_de

  return (
    <div style={styles.card}>
      <div style={{ ...styles.typeBadge, background: typeInfo.color }}>
        {typeInfo.label}
      </div>
      <pre style={styles.outcome}>{renderWithLinks(formatText(outcome), onRuleClick)}</pre>

      {refs.length > 0 && (
        <div style={styles.refSection}>
          <span style={styles.refLabel}>{t.refs}</span>
          <div style={styles.refChips}>
            {refs.map(r => (
              <button key={r} style={styles.chip} onClick={() => onRuleClick(r)}>
                {lang === 'de' ? 'Regel' : lang === 'en' ? 'Law' : 'Legea'} {r}
              </button>
            ))}
          </div>
        </div>
      )}

      <button style={styles.restartBtn} onClick={onRestart}>
        {t.restart}
      </button>
    </div>
  )
}

const styles = {
  card: {
    background: '#fff',
    borderRadius: 12,
    padding: 20,
    boxShadow: '0 2px 12px rgba(0,0,0,0.12)',
  },
  typeBadge: {
    display: 'inline-block',
    color: '#fff',
    borderRadius: 6,
    padding: '4px 12px',
    fontSize: 13,
    fontWeight: 600,
    marginBottom: 14,
  },
  outcome: {
    fontSize: 14,
    lineHeight: 1.6,
    color: '#1a1a2e',
    margin: '0 0 20px',
    whiteSpace: 'pre-wrap',
    fontFamily: 'inherit',
    textAlign: 'justify',
  },
  refSection: {
    borderTop: '1px solid #eee',
    paddingTop: 14,
    marginBottom: 16,
  },
  refLabel: {
    fontSize: 12,
    color: '#888',
    display: 'block',
    marginBottom: 8,
  },
  refChips: {
    display: 'flex',
    flexWrap: 'wrap',
    gap: 8,
  },
  chip: {
    background: '#eaf1fb',
    color: '#1a3a5c',
    border: 'none',
    borderRadius: 20,
    padding: '6px 14px',
    fontSize: 13,
    cursor: 'pointer',
    fontWeight: 500,
  },
  restartBtn: {
    width: '100%',
    padding: '12px',
    background: '#1a3a5c',
    color: '#fff',
    border: 'none',
    borderRadius: 8,
    fontSize: 15,
    cursor: 'pointer',
  },
}
