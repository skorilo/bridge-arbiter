import { useState, useEffect } from 'react'
import { query } from '../db/database'
import { formatText, renderWithLinks } from '../utils/lawText'

export default function RuleCard({ ruleNumber, lang, t, onClose, onRuleClick }) {
  const [rule, setRule] = useState(null)
  const [refs, setRefs] = useState([])

  useEffect(() => {
    const rows = query('SELECT * FROM rules WHERE number = ?', [ruleNumber])
    if (rows.length) setRule(rows[0])
    setRefs(query(
      'SELECT to_rule, context FROM rule_refs WHERE from_rule LIKE ?',
      [ruleNumber + '%']
    ))
  }, [ruleNumber])

  const title = rule ? (rule[`title_${lang}`] || rule.title_de) : ''
  const text = rule ? (rule[`text_${lang}`] || rule.text_de) : null

  return (
    <div style={styles.overlay} onClick={onClose}>
      <div style={styles.sheet} onClick={e => e.stopPropagation()}>
        <button style={styles.close} onClick={onClose}>✕</button>
        <h2 style={styles.title}>
          {lang === 'de' ? 'Regel' : lang === 'en' ? 'Law' : 'Legea'} {ruleNumber}
        </h2>
        {title && <h3 style={styles.subtitle}>{title}</h3>}

        {rule ? (
          <>
            <pre style={styles.text}>{renderWithLinks(formatText(text), onRuleClick) || t.noText}</pre>
            {refs.length > 0 && (
              <div style={styles.refSection}>
                <span style={styles.refLabel}>{t.crossRefs}</span>
                {refs.map(r => (
                  <div key={r.to_rule} style={styles.refRow}>
                    <strong>
                      {lang === 'de' ? 'Regel' : lang === 'en' ? 'Law' : 'Legea'} {r.to_rule}
                    </strong>
                    {r.context ? ` — ${r.context.split(' / ')[lang === 'de' ? 0 : lang === 'en' ? 1 : 2] || r.context}` : ''}
                  </div>
                ))}
              </div>
            )}
          </>
        ) : (
          <p style={styles.placeholder}>{t.noText}</p>
        )}
      </div>
    </div>
  )
}

const styles = {
  overlay: {
    position: 'fixed',
    inset: 0,
    background: 'rgba(0,0,0,0.5)',
    display: 'flex',
    alignItems: 'flex-end',
    zIndex: 100,
  },
  sheet: {
    background: '#fff',
    width: '100%',
    maxHeight: '80vh',
    borderRadius: '16px 16px 0 0',
    padding: 20,
    overflowY: 'auto',
    position: 'relative',
  },
  close: {
    position: 'absolute',
    top: 12,
    right: 16,
    background: 'none',
    border: 'none',
    fontSize: 20,
    cursor: 'pointer',
    color: '#888',
  },
  title: {
    margin: '0 0 4px',
    fontSize: 20,
    color: '#1a3a5c',
  },
  subtitle: {
    margin: '0 0 12px',
    fontSize: 15,
    color: '#555',
    fontWeight: 400,
  },
  text: {
    fontSize: 13,
    lineHeight: 1.7,
    color: '#222',
    whiteSpace: 'pre-wrap',
    fontFamily: 'inherit',
    margin: '0 0 16px',
    textAlign: 'justify',
  },
  placeholder: {
    color: '#888',
    fontStyle: 'italic',
  },
  refSection: {
    borderTop: '1px solid #eee',
    paddingTop: 12,
  },
  refLabel: {
    fontSize: 12,
    color: '#888',
    display: 'block',
    marginBottom: 6,
  },
  refRow: {
    fontSize: 14,
    color: '#333',
    padding: '4px 0',
  },
}
