// Formats law text and renders inline law references as clickable links.

export function formatText(text) {
  if (!text) return ''
  return text
    .replace(/\n(?!\n)(?![A-H]\. )(?!\d+\. )(?!\([a-z]\) )/g, ' ')
    .replace(/ {2,}/g, ' ')
    .trim()
}

// Matches "Regel(n) 12C1, 26B und 72C" or "Legea/Legile 29A, ..." in DE and RO.
// Sub-point suffixes appear in two conventions across the source translations:
// parenthesized ("27B1(b)(i)", German) and bare-trailing-paren ("27B1b), 30B1b)i",
// Romanian) — REF_NUM accepts up to two suffix levels in either style so a citation
// doesn't get truncated mid-list (a bare ")" with no matching "(" used to break the
// separator match for every citation after it).
const REF_NUM = String.raw`\d+[A-Z]?\d*(?:\(?[a-z]{1,3}\)?){0,2}`
const REF_RE = new RegExp(
  String.raw`\b(Regeln?|Leg(?:ea|ile|ii|ilor))\s+(${REF_NUM})((?:\s*(?:,\s*|\s+(?:und|oder|sau|și|şi|si)\s+)${REF_NUM})*)`,
  'g'
)

const EXTRA_RE = new RegExp(
  String.raw`(\s*(?:,\s*|\s+(?:und|oder|sau|și|şi|si)\s+))(${REF_NUM})`,
  'g'
)

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
      <button key={key++} style={linkStyle} onClick={() => onRuleClick(firstRef)}>
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
          <button key={key++} style={linkStyle} onClick={() => onRuleClick(ref)}>
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
