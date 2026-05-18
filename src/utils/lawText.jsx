// Formats law text and renders inline law references as clickable links.

export function formatText(text) {
  if (!text) return ''
  return text
    .replace(/\n(?!\n)(?![A-H]\. )(?!\d+\. )(?!\([a-z]\) )/g, ' ')
    .replace(/ {2,}/g, ' ')
    .trim()
}

// Matches "Regel(n) 12C1, 26B und 72C" or "Legea/Legile 29A, ..." in DE and RO
const REF_RE = /\b(Regeln?|Leg(?:ea|ile|ii|ilor))\s+(\d+[A-Z]?\d*[a-z]?(?:\([a-z]\))?)((?:\s*(?:,\s*|\s+(?:und|und|și|şi|si)\s+)\d+[A-Z]?\d*[a-z]?(?:\([a-z]\))?)*)/g

const EXTRA_RE = /(\s*(?:,\s*|\s+(?:und|und|și|şi|si)\s+))(\d+[A-Z]?\d*[a-z]?(?:\([a-z]\))?)/g

function baseNum(ref) {
  return ref.match(/^\d+/)[0]
}

const linkStyle = {
  display: 'inline',
  background: 'none',
  border: 'none',
  padding: '0 1px',
  color: '#1565c0',
  textDecoration: 'underline',
  cursor: 'pointer',
  font: 'inherit',
  fontSize: 'inherit',
  fontWeight: 600,
}

export function renderWithLinks(text, onRuleClick) {
  if (!text) return null
  if (!onRuleClick) return text

  const re = new RegExp(REF_RE.source, 'g')
  const parts = []
  let last = 0
  let key = 0
  let m

  while ((m = re.exec(text)) !== null) {
    const [full, keyword, firstRef, rest] = m
    const start = m.index

    if (start > last) parts.push(text.slice(last, start))

    parts.push(keyword + ' ')
    parts.push(
      <button key={key++} style={linkStyle} onClick={() => onRuleClick(baseNum(firstRef))}>
        {firstRef}
      </button>
    )

    if (rest) {
      const xre = new RegExp(EXTRA_RE.source, 'g')
      let sm
      while ((sm = xre.exec(rest)) !== null) {
        const [, sep, ref] = sm
        parts.push(sep)
        parts.push(
          <button key={key++} style={linkStyle} onClick={() => onRuleClick(baseNum(ref))}>
            {ref}
          </button>
        )
      }
    }

    last = start + full.length
  }

  if (last < text.length) parts.push(text.slice(last))
  return parts
}
