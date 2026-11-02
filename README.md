# Authority SEO Pod

> Autonomous, edge-first SEO execution engine for the **Authority Network** Line of Business (96+ commercial sites, PBN syndication nodes, and niche authority portals).

- **Role**: `seo`
- **Line of Business**: `authority-network`
- **Live Worker Edge**: [https://authority-seo-pod.walterhudson462.workers.dev](https://authority-seo-pod.walterhudson462.workers.dev)
- **Central Mesh Hub**: [https://factory-hub.walterhudson462.workers.dev](https://factory-hub.walterhudson462.workers.dev)
- **D1 Database**: `authority-seo-pod-db` (`5b4a48ca-a3bc-419b-bb4d-a3fc44a2de94`)

---

## ⚡ Capabilities

1. **2026 AI Search Engine & Web Crawler Governance**:
   - Permits citation engines (`PerplexityBot`, `OAI-SearchBot`, `Claude-Web`, `Applebot-Extended`, `Meta-ExternalAgent`) for LLM referral visibility.
   - Gated training scrapers (`GPTBot`, `CCBot`, `Bytespider`, `anthropic-ai`, `Diffbot`).
2. **Schema.org JSON-LD Structured Data**:
   - Generates valid `Organization`, `WebSite`, `Article`, and `LocalBusiness` structured markup.
3. **On-Page SEO Optimization & Quality Scoring**:
   - Title tag optimization ($\le 60$ characters).
   - Meta description optimization ($\le 155$ characters).
   - Target keyword alignment and OpenGraph tagging.
4. **Tincan Mesh Protocol Integration**:
   - Direct zero-latency Cloudflare Worker Service Binding to `factory-hub`.
   - Sends background heartbeats every 5 minutes (`*/5 * * * *`).
   - Listens for `task.assigned` events, executes domain tasks, and emits `task.completed`.

---

## 🚀 Live Edge Endpoints

- `GET /`: Dark Mode Pod Cockpit UI (Task simulator, real-time ledger, live status)
- `GET /health`: Health and identity verification probe
- `POST /api/task`: Edge execution endpoint for SEO tasks

---

## 🛠️ Testing & Recipes

```bash
# Run test suite
just test

# Type check
just check

# Apply D1 schema
just cf-schema authority-seo-pod-db

# Deploy to Cloudflare Workers
just cf-deploy
```
