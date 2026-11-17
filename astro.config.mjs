import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://rohit2058.github.io',
  base: '/portfolio/',
  integrations: [],
  markdown: {
    shikiConfig: {
      theme: 'dark-plus',
      wrap: true,
    },
  },
});
