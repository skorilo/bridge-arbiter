import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { VitePWA } from 'vite-plugin-pwa'

export default defineConfig({
  base: '/bridge-arbiter/',
  plugins: [
    react(),
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['sql-wasm.wasm', 'sql-wasm.js'],
      manifest: {
        name: 'Bridge Schiedsrichter',
        short_name: 'Bridge',
        description: 'Entscheidungshilfe für Bridge-Turnierleiter',
        theme_color: '#1a3a5c',
        background_color: '#ffffff',
        display: 'standalone',
        icons: [
          { src: 'icon-192.png', sizes: '192x192', type: 'image/png' },
          { src: 'icon-512.png', sizes: '512x512', type: 'image/png' },
        ],
      },
      workbox: {
        globPatterns: ['**/*.{js,css,html,wasm}'],
      },
    }),
  ],
  optimizeDeps: {
    exclude: ['sql.js'],
  },
})
