// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
import { createApp, h } from 'vue';
import { createInertiaApp } from '@inertiajs/vue3';
import { InertiaProgress } from '@inertiajs/progress';
import Layout from '@/Layout/Layout.vue'
import '@/styles/style.css'
InertiaProgress.init();

const pages = import.meta.glob('../Pages/**/*.vue', { eager: true });
if(document.getElementById('app')){
  createInertiaApp({
    resolve: (name) => {

      let page = pages[`../Pages/${name}.vue`];
      if (!page)
        throw new Error(
          `Unknown page ${name}. Is it located under Pages with a .vue extension?`,
        );
      page.default.layout = page.default.layout || Layout
      return page;
    },

    title: (title) => (title ? `${title} - CyberFin` : 'CyberFin'),

    setup({ el, App, props, plugin }) {
      console.log(el)
      const vueApp = createApp({
        render: () => h(App, props),
      });
      //vueApp.config.globalProperties.$routes = Routes;
      vueApp.config.globalProperties.$formatCurrency=(number)=>{
        return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(
          number,
        )
      }
      vueApp.use(plugin).mount(el);
    },
  });
}