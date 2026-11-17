Build my freelance portfolio website in THIS folder (the current directory). Read this whole prompt first, then plan, then build.

## Step 0: set up the files yourself (I do nothing by hand)
- All my content is in `portfolio-kit.zip` in this folder. Unzip it here with `unzip -o portfolio-kit.zip`. It creates `content/` with every file already named and placed correctly (case study, site copy, 4 figures, sample workbook, sample diagram, my square photo). Do not rename or move them. Do not ask me to copy anything.
- Before changing anything, back up the existing `index.html` as `index.old.html`. Leave the `.claude` and `.playwright-mcp` folders alone.
- Build the site in this folder. Then list the final file tree for me.

## About me
- Name: Rohit Kumar Sah
- Location: Banepa, Kavrepalanchok, Nepal (UTC+5:45), near Kathmandu valley
- Background: BE Electrical Engineering, Tribhuvan University, IOE Pashchimanchal Campus (2025). Electrical Engineering Instructor at Banepa Polytechnic Institute.
- Services: load flow (power flow) studies, load calculation, cable/breaker sizing, voltage drop, earthing calculation, solar PV sizing, electrical drawings (AutoCAD), MATLAB/Simulink simulation, online technical tutoring
- Tools: MATLAB, Simulink, AutoCAD, Excel
- Contact: rs28102058@gmail.com | WhatsApp +977 9716100765 (link: https://wa.me/9779716100765) | https://www.linkedin.com/in/rohit-sah-202026229/
- I work remotely only. NO site visits and NO in-person tutoring. I teach on-site only as an instructor at Banepa Polytechnic Institute.
- I want freelance work in load flow studies and core electrical engineering (calculations, power systems, MATLAB/Simulink, AutoCAD drawings). Put load flow first in the services list. Do not claim any completed load flow client work. The load flow example uses assumed data and is labelled a worked example. Do not change its numbers.
- Registration: Nepal Engineering Council registration is in progress. Show NO registration or "licensed" claim anywhere until I add the number.

## Stack (visually rich, but light to build and load)
- Static site with Astro and plain CSS (small vanilla JS only). No heavy UI frameworks, no database, no backend.
- Content comes from Markdown files so I can edit text without touching code.
- Mobile-first, fast, accessible (alt text on every image, good contrast, semantic HTML).

## Files already in the project folder
- /content/site-copy.md : hero, about, services, selected work, how I work, availability, contact text
- /content/projects/avr-pss.md : AVR-PSS case study (project head: I did most of the simulation and calculation tables)
- /content/figures/ : fig1-settling-time.png, fig2-damping-ratio.png, fig3-overshoot-undershoot.png, fig4-avr-pss-block-diagram.png
- /content/samples/ : sample-electrical-calculations-banepa.xlsx, sample-single-line-diagram.png, and the load flow example: sample-5bus-load-flow.md (write-up), sample-5bus-load-flow.xlsx, solve_loadflow.m (MATLAB script), sample-5bus-load-flow-diagram.png, sample-5bus-convergence.png
- /content/images/profile.jpg : my photo, already square-cropped to 1000x1000 (use it in the hero and About; keep my face centred when cropping to circles or rounded frames)

## Pages
1. Home: hero, short services list, selected work, how I work, contact buttons (WhatsApp, Email)
2. About: includes a "Teaching" paragraph (Banepa Polytechnic Institute)
3. Services
4. Work: two groups
   - Academic project: AVR-PSS comparison, rendered from avr-pss.md as its own page. Show team size, my role, all five teammates and the supervisor.
   - Sample deliverables: FIRST the 5-bus load flow worked example (render sample-5bus-load-flow.md as its own page with the diagram and convergence chart in the lightbox, results table as written, download links for the xlsx and the .m script), then the house workbook (download link) and the single-line diagram. Label every item "Worked example, not a client project" and state that the assumptions are mine.
5. Contact: WhatsApp, email and LinkedIn buttons

## Design brief (make it look premium and memorable)
- Theme: "engineering blueprint meets modern studio". Deep navy background (#0B1220 range), warm amber/electric-yellow accent, soft cyan secondary. Also a clean light theme, with a toggle that remembers the choice and follows the system setting by default.
- Type: Space Grotesk for headings, Inter for body, JetBrains Mono for numbers and labels. Self-host the fonts so the site stays fast.
- Hero: large headline, my photo in a rounded frame with a subtle amber glow ring, and an animated SVG of a damped oscillation (a generator transient settling, a nod to my project) drawing itself on load. A faint circuit-trace or blueprint grid in the background.
- Section feel: glass-style cards with thin borders, soft shadows, gradient hairlines, generous spacing, large section numbers (01, 02, 03) in mono type.
- Motion: scroll-reveal fade/slide with IntersectionObserver, hover lift on cards, smooth anchor scrolling, sticky blurred navbar. Respect prefers-reduced-motion.
- Case study page: figures in a lightbox (click to enlarge), the results table styled with the best value per column highlighted, and a small "Team" card.
- Trust strip using only real facts: "BE Electrical, TU (2025)", "Instructor, Banepa Polytechnic", "Based in Banepa, Nepal", "Online and remote". No made-up numbers.
- Floating WhatsApp button (bottom right) on every page.
- Keep total page weight small: optimise images (WebP, width/height set, lazy-load), no video, no large libraries. Aim for Lighthouse 90+ on performance and accessibility.

## Hard rules
- I have no completed client projects. Do NOT invent clients, testimonials, reviews, ratings, statistics, certificates or site photos.
- Do NOT add any registration, licence or "certified" wording.
- Do NOT offer assignment or thesis completion. Tutoring and learning support only.
- Do NOT host the full AVR-PSS report PDF (copyright page restricts it). Link only the case study page.
- Keep every TODO in the copy visible on the page in a clear style (for example a yellow "TODO" tag) until I replace it. Do not delete or guess them.
- Do not change numbers in the AVR-PSS table or charts. The ANFIS fault settling time is confirmed as 2.236 s. Use that everywhere.
- Footer note: "Sample files are worked examples with assumed values. Check them against current standards and NEA rules before real use."
- Basic SEO: page titles, meta descriptions, Open Graph tags, sitemap, favicon.
- My email and phone number are public on purpose. Never commit passwords, tokens or keys.

## Publishing on GitHub Pages
- Ask me for the GitHub username and repo name before configuring anything.
- If the repo is named <username>.github.io, no base path is needed. Otherwise set `site` and `base` in astro.config.mjs and make every link and asset path respect `base`.
- Add .github/workflows/deploy.yml using the official withastro/action and actions/deploy-pages, triggered on push to main.
- Tell me to turn on Settings > Pages > Source: GitHub Actions, if it is not on.
- Add a .gitignore (node_modules, dist, .astro). Commit in small steps and push only after I approve the build.
- After the first deploy, show the live URL and check that all pages, images and the workbook download work there.

## Process
1. Show a short plan and file tree. Wait for my OK before building.
2. Build, run the build, fix errors, and run it locally.
3. Check each page at phone width and desktop width, in both themes.
4. Finish with a list of every TODO still on the site and what I must give you for each.

## Open TODOs (I will send these later)
- NEC registration number, after I collect the licence
