let db = null
let initPromise = null

function loadScript(src) {
  return new Promise((resolve, reject) => {
    if (window.initSqlJs) { resolve(); return; }
    const s = document.createElement('script')
    s.src = src
    s.onload = resolve
    s.onerror = reject
    document.head.appendChild(s)
  })
}

async function _initDB() {
  const base = import.meta.env.BASE_URL
  await loadScript(`${base}sql-wasm.js`)

  const SQL = await window.initSqlJs({
    locateFile: () => `${base}sql-wasm.wasm`,
  })

  db = new SQL.Database()

  const [schema, seedRule31, seedAllLaws, seedTexts, seedTrees] = await Promise.all([
    fetch(`${base}schema.sql`).then(r => r.text()),
    fetch(`${base}seed-rule31.sql`).then(r => r.text()),
    fetch(`${base}seed-all-laws.sql`).then(r => r.text()),
    fetch(`${base}seed-law-texts.sql`).then(r => r.text()),
    fetch(`${base}seed-trees-all.sql`).then(r => r.text()),
  ])

  db.run(schema)
  db.run(seedRule31)
  db.run(seedAllLaws)
  db.run(seedTexts)
  db.run(seedTrees)

  return db
}

export function initDB() {
  if (!initPromise) initPromise = _initDB()
  return initPromise
}

export function query(sql, params = []) {
  if (!db) throw new Error('DB not initialized')
  const result = db.exec(sql, params)
  if (!result.length) return []
  const { columns, values } = result[0]
  return values.map(row =>
    Object.fromEntries(columns.map((col, i) => [col, row[i]]))
  )
}
