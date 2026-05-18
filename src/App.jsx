import { useState, useEffect } from 'react'
import { initDB, query } from './db/database'
import { LANGS, UI } from './db/i18n'
import DecisionTree from './components/DecisionTree'

export default function App() {
  const [ready, setReady] = useState(false)
  const [error, setError] = useState(null)
  const [lang, setLang] = useState('de')
  const [selectedRule, setSelectedRule] = useState(null)
  const [rules, setRules] = useState([])

  useEffect(() => {
    initDB()
      .then(() => {
        setRules(query('SELECT * FROM rules ORDER BY CAST(number AS REAL)'))
        setReady(true)
      })
      .catch(e => setError(e.message))
  }, [])

  const t = UI[lang]

  if (error) return <div style={styles.error}>Fehler / Error: {error}</div>
  if (!ready) return <div style={styles.loading}>...</div>

  return (
    <div style={styles.app}>
      <header style={styles.header}>
        <div style={styles.headerTop}>
          <div>
            <h1 style={styles.headerTitle}>Bridge</h1>
            <p style={styles.headerSub}>{t.appSub}</p>
          </div>
          <LangPicker lang={lang} onChange={setLang} />
        </div>
      </header>

      <main style={styles.main}>
        {selectedRule ? (
          <>
            <div style={styles.ruleHeader}>
              <button style={styles.backHome} onClick={() => setSelectedRule(null)}>
                {t.backRules}
              </button>
              <h2 style={styles.ruleTitle}>
                {lang === 'de' ? 'Regel' : 'Legea'} {selectedRule.number} — {selectedRule[`title_${lang}`] || selectedRule.title_de}
              </h2>
            </div>
            <DecisionTree rule={selectedRule} lang={lang} onLangChange={setLang} t={t} />
          </>
        ) : (
          <>
            <p style={styles.intro}>{t.chooseRule}</p>
            <div style={styles.ruleList}>
              {rules.map(r => (
                <button
                  key={r.number}
                  style={{ ...styles.ruleBtn, borderColor: RED_LAWS.has(r.number) ? '#c0392b' : '#27ae60' }}
                  onClick={() => setSelectedRule(r)}
                >
                  <span style={styles.ruleNum}>
                    {lang === 'de' ? 'Regel' : lang === 'en' ? 'Law' : 'Legea'} {r.number}
                  </span>
                  <span style={styles.ruleNameText}>
                    {r[`title_${lang}`] || r.title_de}
                  </span>
                  <span style={styles.arrow}>›</span>
                </button>
              ))}
            </div>
          </>
        )}
      </main>
    </div>
  )
}

function LangPicker({ lang, onChange }) {
  return (
    <div style={styles.langPicker}>
      {LANGS.map(l => (
        <button
          key={l.code}
          style={{ ...styles.langBtn, ...(lang === l.code ? styles.langBtnActive : {}) }}
          onClick={() => onChange(l.code)}
        >
          {l.code.toUpperCase()}
        </button>
      ))}
    </div>
  )
}

const RED_LAWS = new Set(['2','13','14','25','27','30','31','32','45','50','54','64'])

const styles = {
  app: {
    fontFamily: "'Segoe UI', system-ui, sans-serif",
    minHeight: '100vh',
    background: '#f0f4f8',
  },
  header: {
    background: '#1a3a5c',
    color: '#fff',
    padding: '16px 20px',
  },
  headerTop: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  headerTitle: {
    margin: 0,
    fontSize: 22,
    fontWeight: 700,
  },
  headerSub: {
    margin: '3px 0 0',
    fontSize: 12,
    opacity: 0.65,
  },
  langPicker: {
    display: 'flex',
    gap: 6,
  },
  langBtn: {
    background: 'rgba(255,255,255,0.15)',
    color: '#fff',
    border: '1px solid rgba(255,255,255,0.3)',
    borderRadius: 6,
    padding: '5px 10px',
    fontSize: 12,
    fontWeight: 600,
    cursor: 'pointer',
    letterSpacing: 0.5,
  },
  langBtnActive: {
    background: '#fff',
    color: '#1a3a5c',
    border: '1px solid #fff',
  },
  main: {
    maxWidth: 600,
    margin: '0 auto',
    padding: 16,
  },
  intro: {
    color: '#555',
    fontSize: 14,
    marginBottom: 12,
  },
  ruleList: {
    display: 'flex',
    flexDirection: 'column',
    gap: 10,
  },
  ruleBtn: {
    display: 'flex',
    alignItems: 'center',
    gap: 12,
    padding: '16px',
    background: '#fff',
    border: '2px solid #c0392b',
    borderRadius: 12,
    cursor: 'pointer',
    boxShadow: '0 1px 6px rgba(0,0,0,0.08)',
    textAlign: 'left',
  },
  ruleNum: {
    fontWeight: 700,
    color: '#1a3a5c',
    minWidth: 64,
    fontSize: 13,
  },
  ruleNameText: {
    flex: 1,
    color: '#333',
    fontSize: 15,
  },
  arrow: {
    color: '#aaa',
    fontSize: 20,
  },
  ruleHeader: {
    marginBottom: 16,
  },
  backHome: {
    background: 'none',
    border: 'none',
    color: '#1a3a5c',
    fontSize: 14,
    cursor: 'pointer',
    padding: '0 0 8px',
    display: 'block',
  },
  ruleTitle: {
    margin: 0,
    fontSize: 16,
    color: '#1a1a2e',
    fontWeight: 600,
  },
  loading: {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    height: '100vh',
    fontSize: 16,
    color: '#888',
  },
  error: {
    padding: 20,
    color: '#c0392b',
  },
}
