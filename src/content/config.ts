import { defineCollection, z } from 'astro:content';

const siteCopy = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
  }),
});

const projects = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    type: z.string(),
    year: z.string(),
    institution: z.string(),
    tools: z.array(z.string()),
    team_size: z.number(),
    my_role: z.string(),
  }),
});

const samples = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
  }),
});

export const collections = {
  'site-copy': siteCopy,
  projects,
  samples,
};
