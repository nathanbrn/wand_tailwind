module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/frontend/**/*.vue',
  ],
  theme: {
    extend: {
      colors: {
        'bs-purple': '#6f42c1',
        'bs-white': '#fff',
        'bs-gray-600': '#6c757d',
      },
      padding: {
        3.5: '0.875rem',
        3.75: '0.9375rem',
        7.5: '1.875rem',
      },
      margin: {
        2.5: '0.625rem',
      },
      height: {
        35: '8.75rem',
      },
      borderRadius: {
        'lg-2': '0.625rem',
      },
      flex: {
        't-2': '0 0 100%',
        't-3': '0 0 24.2%',
      },
      gap: {
        3.5: '0.9375rem',
      },
      maxWidth: {
        '1/4': '25%',
      },
      boxShadow: {
        'bs-1': '0 1px 3px 0 rgba(0, 0, 0, 0.09)',
        'bs-2': '0 3px 3px 0 rgba(0, 0, 0, 0.09)',
      },
      zIndex: {
        1: '1',
      }
    },
  },
  plugins: [],
};


