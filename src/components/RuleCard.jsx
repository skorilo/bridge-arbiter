import { useState, useEffect, useRef } from 'react'
import { query } from '../db/database'
import { formatText, renderWithLinks } from '../utils/lawText'

function parseRef(ref) {
  const s = String(ref)
  const num = s.match(/^\d+/)?.[0] || s
  const section = s.slice(num.length).match(/^[A-Z]/)?.[0] || null
  return { num, section }
}

export default function RuleCard({ ruleRef, lang, t, onClose, onRuleClick }) {
  const { num: ruleNumber, section: anchor } = parseRef(ruleRef)
  const [rule, setRule] = useState(null)
  const [refs, setRefs] = useState([])
  const anchorRef = useRef(null)

  useEffect(() => {
    const rows = query('SELECT * FROM rules WHERE number = ?', [ruleNumber])
    if (rows.length) setRule(rows[0])
    setRefs(query(
      'SELECT to_rule, context FROM rule_refs WHERE from_rule LIKE ?',
      [ruleNumber + '%']
    ))
  }, [ruleNumber])

  useEffect(() => {
    if (anchorRef.current) {
      anchorRef.current.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }
  }, [anchor, rule])

  const title = rule ? (rule[`title_${lang}`] || rule.title_de) : ''
  const rawText = rule ? (rule[`text_${lang}`] || rule.text_de) : null

  function renderText(text) {
    if (!text) return t.noText
    const formatted = formatText(text)
    const lines = formatted.split('\n')
    const out = []
    for (let i = 0; i < lines.length; i++) {
      const line = lines[i]
      const sectionLetter = line.match(/^([A-H])\. /)?.[1]
      const isTarget = anchor && sectionLetter === anchor
      const content = renderWithLinks(line, onRuleClick)
      if (isTarget) {
        out.push(<span key={i} ref={anchorRef} style={styles.highlight}>{content}</span>)
      } else {
        out.push(<span key={i}>{content}</span>)
      }
      if (i < lines.length - 1) out.push('\n')
    }
    return out
  }

  return (
    <div style={styles.overlay} onClick={onClose}>
      <div style={styles.sheet} onClick={e => e.stopPropagation()}>
        <button style={styles.close} onClick={onClose}>✕</button>
        <h2 style={styles.title}>
          {lang === 'de' ? 'Regel' : 'Legea'} {ruleNumber}
          {anchor && <span style={styles.anchorBadge}> ·{anchor}</span>}
        </h2>
        {title && <h3 style={styles.subtitle}>{title}</h3>}

        {rule ? (
          <>
            <pre style={styles.text}>{renderText(rawText)}</pre>
            {refs.length > 0 && (
              <div style={styles.refSection}>
                <span style={styles.refLabel}>{t.crossRefs}</span>
                {refs.map(r => (
                  <div key={r.to_rule} style={styles.refRow}>
                    <strong>
                      {lang === 'de' ? 'Regel' : 'Legea'} {r.to_rule}
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
    alignItems: 'center',
    justifyContent: 'center',
    padding: 16,
    zIndex: 100,
  },
  sheet: {
    background: '#fff',
    width: '100%',
    maxWidth: 600,
    maxHeight: '80vh',
    borderRadius: 12,
    boxShadow: '0 2px 12px rgba(0,0,0,0.12)',
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
  anchorBadge: {
    fontSize: 14,
    color: '#888',
    fontWeight: 400,
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
  highlight: {
    display: 'block',
    background: '#fff8e1',
    borderLeft: '3px solid #f59e0b',
    paddingLeft: 8,
    marginLeft: -8,
    borderRadius: 2,
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
