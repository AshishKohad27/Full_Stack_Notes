# Roadmap: Frontend Dev → Full Stack + AI Engineer (2025-26)

> You already have STRONG frontend skills (React, Next.js, WordPress, Shopify, Laravel frontend, 20+ projects).
> This roadmap focuses on what you DON'T know yet — backend, AI, system design, DSA.
> No need to re-learn frontend. Time to level up.

> Estimated time: 8-10 months (4-6 hours/day)

---

# QUICK SUMMARY (The Entire Roadmap in 1 Minute)

```
YOU NOW:  Frontend + backend (Node/APIs) + SQL (medium) + MongoDB (basic), 20+ projects
YOU GOAL: Full Stack + AI Engineer, 25-60+ LPA, product company or remote international

MONTH 1-2:  DEEP DIVE       → TypeScript, advanced Node.js, SQL/MongoDB deep, Redis (new)
MONTH 3-4:  PROJECTS        → Convert your best frontends to full stack apps
MONTH 5-6:  AI SKILLS       → LLM APIs, RAG, Vector DB, AI Agents, build AI project
MONTH 7:    DEVOPS          → Docker, AWS, CI/CD, Testing
MONTH 8-10: DSA + SYSDESIGN → LeetCode 150+ problems, system design practice
MONTH 11:   INTERVIEWS      → Resume, mock interviews, apply aggressively

HARD SKILLS: Backend, Database, AI/LLM, DevOps, DSA, System Design
SOFT SKILLS: Communication, Problem Solving, Ownership, Networking, Resilience

FREE AI COURSES (Do alongside roadmap):
  → Anthropic Academy (anthropic.skilljar.com) — 13 FREE courses with certificates!
    Claude 101, Prompt Engineering, Claude API, Claude Code, AI Agents, MCP & more
  → Anthropic on Coursera — Prompt Engineering, RAG, API specialization
  → Anthropic GitHub (github.com/anthropics/courses) — Hands-on Jupyter notebooks

SECRET WEAPONS:
  1. Your 20+ company projects = real production experience (most candidates have 0)
  2. Your client-facing experience (rare in developers)
  3. Build 3-4 PERSONAL projects you can show on GitHub/portfolio (company projects are NDA)
  4. AI-powered project on resume (top 5% differentiator)
  5. Anthropic Academy certificates on LinkedIn (free proof of AI skills!)

SALARY JUMP:
  Now (frontend only):           5-15 LPA
  After roadmap (full stack+AI): 25-60+ LPA (Indian) / $40-80K (remote)
```

---

# WHERE YOU ARE NOW

```
STRONG (Skip these):
  ✅ HTML, CSS, Tailwind, Responsive Design
  ✅ JavaScript (ES6+, DOM, async)
  ✅ React.js, Next.js
  ✅ WordPress, Shopify (CMS/E-commerce)
  ✅ Laravel (frontend/blade templates)
  ✅ Node.js, Express, REST APIs (backend basics)
  ✅ SQL (medium-level queries)
  ✅ MongoDB (basics)
  ✅ Git, GitHub
  ✅ 20+ real company/client projects (professional experience)
  ✅ Client handling, project delivery

GAPS (Focus here):
  ❌ Backend DEEP (advanced Node.js internals, auth patterns, architecture)
  ❌ SQL DEEP (optimization, indexing, complex queries, transactions)
  ❌ MongoDB DEEP (aggregation, schema design patterns, indexing)
  ❌ Redis (caching, pub/sub — you don't know this yet)
  ❌ System Design
  ❌ DSA (Data Structures & Algorithms)
  ❌ AI / LLM integration
  ❌ DevOps (Docker, AWS, CI/CD)
  ❌ TypeScript (deep level)
  ❌ Testing
```

---

# PART A: HARD SKILLS

---

## PHASE 1: Backend Mastery (Month 1-2)

### 1. TypeScript Deep Dive (1 week)
```
You know JS well. Now level up to TypeScript:
  - Advanced types, generics, utility types (Partial, Pick, Omit)
  - TypeScript with Node.js & Express
  - Strict mode, type guards, discriminated unions
  - You already use it in Next.js — now master it

WHY: 90% of high-paying jobs require TypeScript.
     Your code becomes self-documenting. Fewer bugs.
```

### 2. Node.js & Express - Advanced Level (3 weeks)
```
You already know basics (routes, CRUD, APIs). Now go DEEP:

Week 1: Node.js internals (INTERVIEW HEAVY)
  - Event loop deep dive (phases, microtasks vs macrotasks)
  - Streams & buffers (handle large files without memory crash)
  - Worker threads & child processes (CPU-heavy tasks)
  - Clustering (use all CPU cores)
  - Memory leaks: how to find and fix them

Week 2: Express advanced patterns
  - Advanced middleware (chaining, error handling middleware)
  - Request validation (Zod — type-safe, works with TypeScript)
  - Rate limiting, CORS, helmet (security)
  - File uploads (Multer + S3 pre-signed URLs)
  - API versioning, cursor-based pagination
  - Logging (Winston/Pino) + monitoring

Week 3: Auth & Architecture
  - JWT + refresh token rotation (production-grade auth)
  - OAuth 2.0 (Login with Google/GitHub)
  - Role-based access control (RBAC)
  - Clean architecture: controllers → services → repositories
  - Error handling strategy (custom error classes)
  - WebSocket integration (Socket.io with Express)

Build: Production-grade REST API for one of your existing frontend projects
```

### 3. Database - Level Up (3 weeks)
```
You can write medium SQL queries + basic MongoDB. Now go interview-ready:

Week 1: SQL — Interview & Scale Level
  - Skip basics. Focus on:
  - CTEs (Common Table Expressions), Window functions (ROW_NUMBER, RANK, PARTITION BY)
  - Query optimization (EXPLAIN ANALYZE — find why your query is slow)
  - Indexes deep dive (B-tree, composite, when to index, when NOT to)
  - Transactions, ACID, row-level locking, deadlocks
  - Normalization vs Denormalization (trade-offs at scale)
  - Prisma ORM advanced (relations, raw queries, migrations)
  - Practice: solve SQL problems on HackerRank/LeetCode (15-20 problems)

Week 2: MongoDB — Production Level
  - You know basics. Now learn:
  - Schema design patterns (embedding vs referencing — WHEN to use which)
  - Aggregation pipeline ($group, $match, $project, $lookup)
  - Indexing (compound, text, TTL, partial indexes)
  - Mongoose advanced (virtuals, pre/post hooks, populate vs lookup)
  - Transactions in MongoDB
  - When to use SQL vs NoSQL (interview favorite — you need a clear answer)

Week 3: Redis (NEW for you) + Database Design
  - Redis: key-value store, TTL, caching API responses
  - Caching patterns: cache-aside, write-through, invalidation
  - Redis pub/sub (real-time notifications)
  - Redis sorted sets (leaderboards, rate limiting)
  - Session storage with Redis
  - Database design practice: given requirements → design schema
  - Practice: design DB for Instagram, Uber, e-commerce
```

---

## PHASE 2: Full Stack Projects (Month 3-4)

### 4. Build YOUR OWN Portfolio Projects (Full Stack)
```
IMPORTANT: Your 20+ projects are company-owned. You CAN'T show them on GitHub or portfolio.
           You NEED personal projects that YOU own, with source code on YOUR GitHub.
           These are what interviewers will see, clone, and judge you on.

Use your company experience as KNOWLEDGE, build new projects as PROOF.

Project 1: E-Commerce Platform (Next.js + Node + PostgreSQL + Redis + Stripe)
  - You've built e-commerce frontends for clients → now build the FULL thing yourself
  - Product API, cart, checkout, payment (Razorpay/Stripe)
  - Admin dashboard with analytics
  - Caching with Redis
  - Deploy it live, put code on GitHub

Project 2: Real-Time App (React + Node + Socket.io + MongoDB)
  - Real-time chat OR live collaboration OR live dashboard
  - WebSocket implementation
  - Online/offline status
  - This shows you can handle REAL-TIME — most candidates can't

Project 3: AI-Powered App (Next.js + Node + AI APIs + Vector DB) ⭐
  - Build AFTER Phase 3 (AI skills)
  - This is your BIGGEST differentiator
  - Ideas in Phase 3 below

WHY build new projects when you have company experience?
  - Company projects: proves you WORKED (mention in resume/interviews)
  - Personal projects: proves you CAN BUILD (show code, live demo, GitHub)
  - Interviewers want to SEE code. Company code is behind NDA. Personal code is PUBLIC.
```

---

## PHASE 3: AI & LLM Skills (Month 5-6) -- YOUR UNFAIR ADVANTAGE

### FREE AI COURSES — Do These FIRST (Before Building)
```
Anthropic just launched Anthropic Academy (March 2026) — 13 FREE courses with certificates.
No paid subscription needed. Just sign up with email and start learning.

WEBSITE: anthropic.skilljar.com

TRACK 1: AI FLUENCY (Start here if new to AI)
  ┌─────────────────────────────────────────────────────────┐
  │ 1. Claude 101                                           │
  │    - What Claude can do, how to use it effectively      │
  │    - Write good prompts, understand capabilities        │
  │    - Real-world use cases                               │
  │                                                         │
  │ 2. AI Fluency & Frameworks                              │
  │    - How to collaborate with AI systems                 │
  │    - Best practices for AI-assisted work                │
  │    - Safety and responsible AI usage                    │
  └─────────────────────────────────────────────────────────┘

TRACK 2: DEVELOPER DEEP-DIVES (Most important for YOU!)
  ┌─────────────────────────────────────────────────────────┐
  │ 3. Claude Code                                          │
  │    - Use Claude as coding assistant                     │
  │    - Generate, debug, refactor code with AI             │
  │    - Integrate into your dev workflow                   │
  │                                                         │
  │ 4. Building with Claude API                             │
  │    - Authentication, API calls, streaming               │
  │    - Tool use / function calling                        │
  │    - Building production applications                   │
  │                                                         │
  │ 5. Prompt Engineering (Interactive Tutorial)            │
  │    - 9 chapters + exercises                             │
  │    - From basics to advanced prompting                  │
  │    - Also on GitHub: github.com/anthropics/courses      │
  │                                                         │
  │ 6. Introduction to Agent Skills                         │
  │    - Build AI agents that take actions                  │
  │    - Multi-step reasoning, tool use                     │
  │                                                         │
  │ 7. MCP (Model Context Protocol) — Intro + Advanced      │
  │    - Connect AI to databases, APIs, external tools      │
  │    - Build MCP servers and clients                      │
  │    - Production patterns                                │
  └─────────────────────────────────────────────────────────┘

TRACK 3: PRODUCT TRAINING
  ┌─────────────────────────────────────────────────────────┐
  │ 8. Claude on Amazon Bedrock                             │
  │ 9. Claude on Google Vertex AI                           │
  │    - Deploy Claude in cloud environments                │
  │    - Enterprise-grade AI integration                    │
  └─────────────────────────────────────────────────────────┘

ALSO ON COURSERA (Free to audit):
  → Anthropic Specialization: Prompting, APIs, RAG, MCP
  → Link: coursera.org/partners/anthropic

ALSO ON GITHUB (Free, hands-on Jupyter notebooks):
  → github.com/anthropics/courses
  → 5 tutorials: Prompt Engineering, API Fundamentals,
    Tool Use, Prompt Evaluations, Real-world Prompting

RECOMMENDED ORDER FOR YOU:
  1. Claude 101 (1-2 hours)
  2. Prompt Engineering Tutorial (4-6 hours)
  3. Claude Code (2-3 hours)
  4. Building with Claude API (4-6 hours)
  5. Agent Skills (3-4 hours)
  6. MCP courses (4-6 hours)

  Total: ~20-30 hours → spread across 2 weeks alongside your learning
  Result: 6+ certificates on your LinkedIn → instant AI credibility!
```

### 5. AI Tools for Your Workflow (1 week)
```
You're already building projects. Now be 3-5x FASTER:

MUST USE daily:
  - GitHub Copilot (AI autocomplete in VS Code)
  - Claude / ChatGPT for:
    → Debugging: paste error → get fix
    → Code review: "review this function for bugs"
    → Refactoring: "make this cleaner"
    → Testing: "write unit tests for this API"
    → Learning: "explain this concept with examples"

Prompt Engineering:
  - Be specific: "Write an Express middleware that checks JWT token,
    extracts user_id, and adds it to req.user. Use TypeScript."
  - Give context: paste your existing code + ask for modification
  - Ask for alternatives: "give me 3 ways to solve this, with trade-offs"

RULE: AI writes, YOU verify. Never push AI code without understanding it.
```

### 6. Building AI-Powered Applications (4 weeks)
```
Week 1: LLM APIs
  - OpenAI API (GPT-4o), Anthropic API (Claude)
  - API calls: chat completions, streaming responses
  - System prompts, temperature, token limits
  - Cost management (don't burn Rs.5000/day on API calls)
  - Vercel AI SDK (easiest way to add AI to Next.js)
  - Structured output (AI returns JSON, not just text)

Week 2: RAG (Retrieval-Augmented Generation)
  - Embeddings: converting text to vectors (numbers)
  - Vector databases: Pinecone, Weaviate, Chroma
  - RAG flow:
    1. Upload documents (PDFs, docs, website content)
    2. Split into chunks → convert to embeddings → store in vector DB
    3. User asks question
    4. Search vector DB for relevant chunks
    5. Feed chunks + question to LLM
    6. LLM answers using YOUR data (not hallucinations!)

  Build: AI chatbot that answers questions about any website/document

Week 3: AI Agents & Function Calling
  - Function calling: AI calls YOUR APIs (not just chatting)
    Example: User says "Book a meeting tomorrow at 3pm"
    → AI calls your calendar API → meeting booked!
  - Multi-step agents: AI breaks complex tasks into steps
  - Tool use: give AI access to your functions/APIs
  - Error handling and retry logic for AI calls

Week 4: Build your AI PROJECT ⭐
  Choose ONE (this goes on your resume as the TOP project):

  a) AI SaaS Product
     - AI-powered content generator for e-commerce
     - Feed it product details → generates descriptions, SEO tags, ad copy
     - Dashboard with usage analytics, user management
     - Stripe subscription (free/pro plans)
     - Tech: Next.js + Node + PostgreSQL + OpenAI + Stripe

  b) AI Customer Support Bot
     - Upload company docs → bot answers customer questions
     - Escalation to human when AI can't answer
     - Analytics: most asked questions, resolution rate
     - Embeddable widget (like you'd add to Shopify/WordPress sites!)
     - Tech: Next.js + Node + Pinecone + Claude API + WebSocket

  c) AI Code Review Tool
     - Paste code or connect GitHub repo
     - AI reviews: bugs, security issues, performance, best practices
     - Score card with detailed feedback
     - Tech: Next.js + Node + GitHub API + Claude API

  d) AI Resume/Portfolio Analyzer
     - Upload resume → AI scores it, suggests improvements
     - Compare against job descriptions
     - Generate tailored cover letters
     - Tech: Next.js + Node + OpenAI + PDF parsing

  ANY of these will put you in top 5% of candidates.
```

### 7. Python Basics (1 week)
```
You don't need to master Python. Just enough for AI:
  - Variables, loops, functions, classes, pip
  - Requests library (API calls)
  - FastAPI basics (build quick Python APIs)
  - Pandas basics (data manipulation)
  - Know when to use Python vs Node.js for AI tasks

WHY: Many AI/ML libraries are Python-first.
     JS + Python = you can build ANYTHING in the AI space.
```

---

## PHASE 4: DevOps & Production Skills (Month 7)

### 8. Docker (1 week)
```
- Containers, images, Dockerfile, docker-compose
- Containerize your full stack app (frontend + backend + DB in one command)
- Multi-stage builds (smaller images)
- Asked in 80% of mid/senior interviews
```

### 9. AWS / Cloud (2 weeks)
```
Week 1: Core services
  - EC2 (servers), S3 (file storage), RDS (managed database)
  - Lambda (serverless functions — run code without managing servers)
  - CloudFront (CDN), SQS (message queue)
  - IAM (permissions and security)

Week 2: AI + Advanced
  - AWS Bedrock (run AI models like Claude on AWS)
  - Deploy your full stack app on AWS
  - Set up CI/CD with GitHub Actions (auto-deploy on git push)
  - Basic monitoring (CloudWatch)
  - Cost management (don't get a surprise Rs.50,000 bill!)

You've deployed on Vercel/Netlify for frontend.
Now learn to deploy BACKEND on real infrastructure.
```

### 10. Testing (1 week)
```
- Unit testing: Jest (test individual functions)
- API testing: Supertest (test your Express APIs)
- Integration testing: test database operations
- React testing: React Testing Library (you may know this already)
- E2E testing: Playwright basics

Companies with high pay have strict testing culture.
"We don't push code without tests" — every top company.
```

---

## PHASE 5: DSA & System Design (Month 8-10)

### 11. Data Structures & Algorithms (8 weeks)
```
This is the GATEKEEPER to high-paying product companies.
No DSA = no Google, Amazon, Microsoft, Flipkart, Swiggy, Razorpay.

Week 1-2: Arrays, Strings, HashMap, HashSet, Two Pointers, Sliding Window
Week 3-4: Stack, Queue, Linked List, Trees (BST, BFS, DFS)
Week 5-6: Recursion, Backtracking, Binary Search, Sorting algorithms
Week 7-8: Graphs (BFS, DFS, Dijkstra), Dynamic Programming (top-down, bottom-up)

Practice Plan:
  - 150-200 LeetCode problems
  - Easy: 50, Medium: 100, Hard: 50
  - Focus: NeetCode 150, Blind 75, Striver's SDE Sheet
  - 2-3 problems DAILY (morning routine, non-negotiable)

Your advantage: You already think logically from building 20+ projects.
DSA is just formalizing that thinking.

AI Rule: Use AI to EXPLAIN solutions, NEVER to solve for you.
         In the interview, it's just you and the whiteboard.
```

### 12. System Design (4 weeks)
```
Week 1: Fundamentals (scaling, LB, cache, CDN, DB sharding)
Week 2: Advanced (message queue, microservices, CAP theorem, consistent hashing)
Week 3: Design real systems (URL shortener, Instagram, Uber, Netflix)
Week 4: Mock interviews + practice

(You already have 40 detailed notes in System Design folder!)

Your advantage: You've built real products. You know how frontends
consume APIs, how WordPress/Shopify handle scale. Use that experience.
```

---

## PHASE 6: Interview Prep (Month 11)

### 13. Resume & Portfolio
```
Resume (1 page):
  - Headline: "Full Stack Developer | AI Integration"

  EXPERIENCE section (company projects):
    - List your company/client work with IMPACT, not just tasks
    - "Built 6+ frontend projects for clients using React, Next.js, WordPress"
    - Quantify: "Reduced page load by 40%", "Delivered 20+ projects on time"
    - Don't share client names if NDA — say "E-commerce client", "SaaS startup"

  PROJECTS section (personal projects — with GitHub links!):
    - Your 3-4 personal full stack projects (that YOU own)
    - MUST include AI project
    - Each project: 1-line description + tech stack + live link + GitHub link

  SKILLS:
    - React, Next.js, Node.js, TypeScript, PostgreSQL, MongoDB,
      Redis, Docker, AWS, AI/LLM, REST APIs
    - Don't list WordPress/Shopify as main skills (unless applying for CMS roles)

Portfolio website:
  - Showcase your PERSONAL projects with live demos (not company ones)
  - Include AI project prominently
  - Mention company experience in "About" or "Experience" section

GitHub:
  - Personal projects with clean code and README files
  - Contribution graph should be GREEN
  - Pin your best 6 repos
  - Company code stays private — GitHub shows YOUR code

LinkedIn:
  - Professional headline with keywords
  - In Experience: mention company work with results
  - Post about your personal projects, learnings, AI experiments
  - Connect with 500+ people in tech
```

### 14. Interview Preparation
```
Technical Rounds:
  - DSA: LeetCode medium (core of interview)
  - JavaScript: event loop, closures, promises, prototypes, this keyword
  - React/Next.js: hooks, SSR vs CSR, performance, state management
  - Node.js: event loop, streams, middleware, error handling
  - System Design: design URL shortener, chat app, Instagram feed
  - Database: SQL queries, schema design, indexing
  - AI/LLM: "How would you add AI features to this product?"

Machine Coding (60-90 min build):
  You're STRONG here with 20+ project experience.
  Practice: autocomplete search, kanban board, file explorer, infinite scroll

Behavioral:
  - "Tell me about yourself" (have 30s, 1min, 2min versions)
  - "Tell me about your most challenging project"
  - "How do you handle tight deadlines?" (use your real project experience!)
  - "How do you use AI in your development workflow?"
  - STAR method: Situation → Task → Action → Result

YOUR ADVANTAGE:
  Most candidates have 0 real experience (just tutorial copies).
  You have 20+ REAL company projects with REAL clients. THAT'S GOLD.

  In interviews, talk about your company experience:
    "In my last project, we had 10K users and the page was slow.
     I optimized images, added lazy loading, reduced load time by 60%."
  You can talk about problems/solutions WITHOUT revealing client details.

  PLUS show your personal projects on GitHub for code quality proof.
```

---

# PART B: SOFT SKILLS

> You already work with clients/teams on 20+ projects.
> You have a head start. Now sharpen these deliberately.

---

### 15. Communication
```
You already talk to clients. Now level up:
  - Explain technical decisions to non-tech stakeholders
  - Write clear technical documentation
  - Present your work confidently in demos
  - Give and receive code reviews gracefully
  - Post on LinkedIn 2-3x/week (builds visibility + writing skill)

Your edge: Most developers can't talk to clients. YOU CAN.
           This alone is worth 20-30% more salary.
```

### 16. Problem Solving & Critical Thinking
```
- When AI gives you code → evaluate it: "Is this secure? Performant? Maintainable?"
- Break big problems into small tasks (you already do this in projects)
- Think about trade-offs: "fast to build" vs "scalable" vs "maintainable"
- Ask WHY before jumping to HOW
  Client: "Add a chat feature"
  Bad dev: starts coding immediately
  Good dev: "Who uses it? How many users? Real-time needed? Budget?"
```

### 17. Ownership & Initiative
```
Don't wait to be told. Find problems, fix them, tell people.

In interviews, say things like:
  "I noticed the client's WordPress site loaded in 8 seconds.
   Nobody asked me to fix it. I optimized images, added caching,
   and lazy loading. Load time dropped to 2 seconds.
   Client's bounce rate decreased 35%."

THIS gets you hired at 2x salary vs someone who just "did what was asked."
```

### 18. Adaptability & Learning Speed
```
You've already learned WordPress, Shopify, Laravel, React, Next.js.
That PROVES you can learn fast. Now:
  - Learn backend in 2 months (not 6)
  - Pick up AI tools in weeks (not months)
  - Every month, spend 1 day trying something new

Companies pay for people who CAN learn, not people who KNOW everything.
Your track record of learning 5+ tech stacks is PROOF.
```

### 19. Networking & Personal Brand
```
LinkedIn (your #1 job-finding tool):
  - Post 2-3x/week: project demos, learnings, AI experiments
  - Comment on CTOs, VPs, recruiters' posts
  - Share before/after of your projects
  - "Built an AI chatbot this weekend. Here's what I learned..." → engagement

GitHub:
  - Green every day
  - Pin best repos, clean READMEs with screenshots

Twitter/X:
  - Follow tech leaders, share coding tips
  - Engage with developer community

70% of high-paying jobs come through REFERRALS.
Build relationships BEFORE you need a job.
```

### 20. Emotional Intelligence & Resilience
```
- Handle client feedback without getting defensive (you already do this!)
- Handle interview rejections: 100 applications → 10 interviews → 2-3 offers = NORMAL
- Imposter syndrome: you have 20+ projects. You're NOT an imposter.
- AI anxiety: AI is a tool. Carpenters weren't replaced by power drills.
  They became FASTER carpenters.
- Work-life balance: code hard, but also sleep, exercise, go outside.
  Marathon, not sprint.
```

---

# PART C: AI-ERA SURVIVAL GUIDE

---

### 21. Your Moat (What Makes You Irreplaceable)

```
AI CAN:                              YOU CAN (AI can't):
─────────────────                    ─────────────────
Write boilerplate code                Understand client's actual need
Generate CRUD APIs                    Make product decisions
Write basic tests                     Handle ambiguous requirements
Convert Figma to HTML                 Build relationships with clients
Debug simple errors                   Lead teams and mentor juniors
                                      Evaluate if AI output is correct
                                      Combine business + tech knowledge
                                      Negotiate, persuade, sell

YOUR SPECIFIC MOAT:
  1. 20+ company projects = battle-tested production experience
  2. Client-facing skills (rare in developers — most can't talk to clients)
  3. Multi-platform knowledge (WordPress, Shopify, React, Next.js, Laravel, Node)
  4. You understand BUSINESS + TECH (most devs only know tech)
  5. You've delivered under deadlines with real clients (not just hobby projects)
  6. Add AI skills → you become "full stack + AI + business sense" → top 3% of market
```

### 22. AI-Era Workflow
```
How your daily work changes:

BEFORE (old you):                    AFTER (AI-powered you):
────────────────                     ────────────────
4 hours to build a component         45 min (AI generates, you refine)
2 hours debugging                    20 min (paste error, get fix)
3 hours writing API                  1 hour (AI scaffolds, you customize)
1 hour writing tests                 15 min (AI generates test cases)

You're not working less. You're SHIPPING MORE.
Same 8 hours → 3-4x more output → more value → more pay.
```

### 23. Technologies to Watch (2025-2030)
```
LEARN NOW:
  - AI/LLM APIs (OpenAI, Claude, Gemini)
  - RAG + Vector Databases
  - AI Agents (function calling, tool use)
  - Next.js App Router + Server Components

LEARN SOON (next 1-2 years):
  - Kubernetes (container orchestration)
  - Edge computing (Cloudflare Workers, Deno Deploy)
  - Multi-modal AI (text + image + video)
  - AI-native development (Cursor, Windsurf, Devin)

KEEP EYE ON:
  - WebAssembly (run any language in browser)
  - Rust (growing in web infrastructure)
  - Local/on-device AI (running AI without cloud)
```

---

# PART D: SALARY & CAREER

---

### 24. Salary Expectations

```
YOUR PROFILE: Frontend dev with 20+ projects + full stack + AI

Without Backend/AI (current):
  Freelance/Agency:      5-12 LPA
  Product company:       8-15 LPA

After this roadmap (Full Stack + AI):
  Indian Product Company:  15-30 LPA
  Indian Startup (funded): 18-35 LPA
  Remote International:    $40-80K/year (33-67 LPA)
  Freelance AI projects:   $50-150/hour

AI PREMIUM: Companies pay 30-50% MORE for developers who can
            integrate AI features into products.

WHERE TO APPLY:
  India: LinkedIn, Instahyre, Wellfound, AngelList, Cutshort
  Remote: Turing, Toptal, Arc.dev, Remote.co, We Work Remotely
  Freelance: Upwork (position yourself as "AI + Full Stack")
```

### 25. Career Paths

```
Path A: Senior Full Stack Engineer (IC Track)
  Mid → Senior → Staff → Principal
  Focus: hard tech, system design, architecture
  Pay: 40-100+ LPA at Staff level

Path B: AI Product Engineer
  Full Stack + AI → AI Product Lead → Head of AI
  Focus: building AI-powered products
  Pay: FASTEST growing salaries right now

Path C: Tech Lead → Engineering Manager
  Senior Dev → Tech Lead → EM → VP Engineering
  Focus: leading teams, architecture decisions
  Pay: 50-80+ LPA, but less coding

Path D: Founder / AI SaaS Builder
  Build your own AI product, charge subscription
  Your edge: you know frontend + backend + AI + client handling
  Examples: AI writing tool, AI customer support, AI code reviewer
  Pay: Rs.0 to unlimited

Path E: Freelance AI Consultant
  Help companies add AI features to their products
  Your edge: 20+ project experience + AI skills = clients trust you
  Charge: $100-200/hour for AI integration consulting
  Pay: 50-100+ LPA (working 20-30 hours/week)
```

---

## DAILY ROUTINE

```
Morning (2 hrs):    DSA practice (2 LeetCode problems)
Afternoon (3 hrs):  Learn new concept + build (backend/AI)
Evening (1.5 hrs):  Work on your main project
Night (30 min):     LinkedIn post / revise notes / read tech blog

Weekend:
  Saturday: Deep project work + push to GitHub
  Sunday:   1 mock interview + rest + planning next week
```

---

## YOUR PERSONALIZED TIMELINE

```
Month 1-2:   Backend (TypeScript, Node, Express, PostgreSQL, MongoDB, Redis)
Month 3-4:   Full Stack Projects (convert your best frontends to full stack)
Month 5-6:   AI/LLM Skills + Build AI project (your differentiator)
Month 7:     DevOps (Docker, AWS, CI/CD, Testing)
Month 8-10:  DSA + System Design (interview prep)
Month 11:    Interview prep + Apply aggressively

PARALLEL (throughout):
  - LinkedIn posting (2-3x/week)
  - GitHub commits (daily)
  - Mock interviews (weekly from month 8)
  - AI tools in daily workflow (from day 1)
```

---

## KEY RULES

```
1.  You already have frontend. DON'T re-learn it. Move forward.
2.  Backend is your biggest gap. CLOSE IT FIRST (month 1-2).
3.  AI project is your BIGGEST differentiator. Don't skip it.
4.  DSA is the GATEKEEPER to high pay. No shortcuts.
5.  USE AI TOOLS daily — but understand every line.
6.  Build PERSONAL projects for your portfolio (company code is NDA).
7.  PUSH TO GITHUB daily (personal projects — your public proof).
8.  POST ON LINKEDIN 2-3x/week (share learnings, not client details).
9.  APPLY to jobs from month 8 (don't wait to be "perfect").
10. Your client experience is RARE — use it in every interview.
11. Health first: sleep 7+ hrs, exercise, take breaks. Marathon, not sprint.
12. You're NOT starting from zero. You're upgrading. Remember that.
```
