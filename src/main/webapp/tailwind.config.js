/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./dist/*.html",
    "./dist/*.jsp",
    "**/dist/*.html",
    "**/dist/*.jsp",
    "./dist/javascript/*.js"
  ],
  theme: {
    extend: {
      keyframes: {
        'show-down' : {
          '0%': {
            transform: 'scaleY(0%) ',
            'transform-origin': 'top'
          },
          '100%': {
            transform: 'scaleY(100%)',
            'transform-origin': 'top'
          }
        },
      },
      animation: {
        'show-down': 'show-down 0.25s ease-out',
      }
    },
    colors: {
      'primary': "var(--primary)",
      'secondary': "var(--secondary)",
      'gray-shade': "var(--gray-shade)",
      'white-shade': "var(--white-shade)",
      'error': "var(--error)",
    },
  },
  plugins: [],
}

