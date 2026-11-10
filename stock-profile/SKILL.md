---
name: stock-profile
description: >
  Build an initial empirical research profile on a stock. Use this skill whenever the user wants to start researching a new stock, ticker, or company from scratch — before they've formed a thesis. Triggers include: "profile [ticker]", "build a profile on [company]", "research [stock] for me", "I want to start looking at [ticker]", "pull up info on [company]", "what do we know about [ticker]", or any request to gather background facts on a company the user is beginning to evaluate. This is the fact-gathering stage only — no conclusions, no buy/sell opinions, no thesis. The output is a populated research dossier. Always use web search to fill in current data. Pair with the stock-notes skill once the user is ready to form a thesis.
---

# Stock Profile Skill

## Core Philosophy

**Empirical only. No conclusions.**

This skill is for the research phase that comes *before* thesis formation. The goal is to populate a factual dossier — products, financials, competition, risks, open questions — so the user has a solid information base to work from. Do not editorialize. Do not assess whether the stock is attractive. Do not suggest what the user should think about anything in the profile.

The output should read like a well-organized Wikipedia entry crossed with a Bloomberg company summary: dense with facts, free of opinion.

---

## What to Fill In

From the user's template, populate only these sections. The others (Working Thesis, Skeleton Thesis, Purchase History) are left blank — those belong to the user.

### 1. QUICK FACTS
Pull and present:
- Full company name, ticker, exchange
- Market cap (current)
- Sector / Industry (GICS or equivalent)
- HQ location
- Founded / IPO date
- Employees (approx)
- CEO and tenure
- Fiscal year end
- Analyst coverage count (if findable)
- Short interest % (if findable)

### 2. Summary
2–4 sentence factual description of what the company does, its scale, and its primary market position. No opinion. Think: the first paragraph of a 10-K business description, compressed.

### 3. Products
List the company's primary products and/or services. Group by segment if the company reports segmented revenue. Include approximate revenue contribution per segment if disclosed. Do not assess which products are "better" or "more promising."

### 4. Consumption Models
How does the company make money? Map the revenue model:
- Subscription / recurring revenue?
- Transactional / usage-based?
- Hardware + services?
- Licensing?
- Advertising?
- Services / professional services?
- Government contracts?

Note what % of revenue is recurring vs. one-time, if disclosed.

### 5. Competition
List primary competitors. For each, note:
- Company name and ticker
- Approximate market position relative to the subject company
- Key differentiator (what makes them a competitive threat)

Do not assess who "wins." Just map the landscape.

### 6. Risk
List disclosed and observable risks. Source from:
- 10-K risk factors (top 5–7 most salient)
- Recent news/events
- Sector-level risks (regulatory, macro, cyclicality)

Format as a flat list. No weighting or prioritization — that comes later in thesis work.

### 7. Pipeline
If applicable (biotech, enterprise software, hardware, government contracts):
- List known upcoming products, trials, programs, or catalysts
- Include expected timing if public
- No probability assessments

If pipeline is not material to this business type, note "N/A — pipeline not a primary driver."

### 8. Financials
Pull the most recent available data. Present in a simple table or structured list:

**Income Statement (TTM or most recent FY):**
- Revenue
- Gross Profit / Gross Margin %
- Operating Income / Operating Margin %
- Net Income / Net Margin %
- EPS (diluted)

**Balance Sheet (most recent quarter):**
- Cash & equivalents
- Total debt
- Net cash / net debt

**Cash Flow:**
- Operating cash flow (TTM)
- Free cash flow (TTM)
- Capex

**Growth:**
- Revenue growth YoY (most recent reported)
- Revenue growth guidance (if given)

**Key Ratios (current):**
- P/E (forward)
- EV/EBITDA
- EV/Revenue (if pre-profitable)
- P/FCF

Note the data source and date for all financial figures.

### 9. Sector Comparisons
List 3–5 peers and show a simple comp table:

| Company | Mkt Cap | Rev Growth | Gross Margin | EV/EBITDA | P/E Fwd |
|---------|---------|-----------|--------------|-----------|---------|
| [Subject] | | | | | |
| [Peer 1] | | | | | |
| [Peer 2] | | | | | |

Fill in what's findable. Leave cells blank rather than guessing. Note data date.

### 10. Open Questions
After filling in the above, list factual questions that came up during research that couldn't be answered from public data. Format:

```
[ ] What is X?
[ ] How does Y work in their model?
[ ] When is Z expected?
```

These are research gaps, not thesis questions. Factual unknowns only.

### 11. Research Log
At the bottom, note:
- Date of research
- Primary sources consulted (10-K, earnings call, press release, etc.)
- Any data that seemed inconsistent or unclear and should be re-verified

### 12. Discovery
One sentence: how/why did this stock come up? (User should fill this in — leave a placeholder.)

---

## What NOT to Do

- Do not write "this stock looks interesting because..."
- Do not suggest what the user should think about any finding
- Do not flag risks as "major" or "minor" — just list them
- Do not say "strong growth" or "concerning margins" — give the number, not the label
- Do not fill in Working Thesis, Skeleton Thesis, or Purchase History — those are user-owned sections
- Do not make a buy/sell/hold statement of any kind

---

## Research Process

1. **Identify the ticker** from the user's request. If ambiguous, confirm before proceeding.
2. **Use web search** to gather current data. Search for:
   - `[ticker] company overview site:sec.gov OR investor relations`
   - `[ticker] financials revenue earnings`
   - `[ticker] competitors market share`
   - `[ticker] 10-K risk factors [current year]`
   - `[ticker] pipeline products roadmap` (if applicable)
3. **Pull financials** from a reliable source (company IR page, SEC EDGAR, financial data provider). Note: don't fabricate numbers — if a metric isn't findable, leave it blank with a `[not found]` note.
4. **Build comp table** by identifying sector peers, then pulling their key metrics.
5. **Populate the template** section by section, in order.
6. **List open questions** at the end — things that came up during research that couldn't be answered.

---

## Output Format

Output the completed profile as a markdown document using this structure:

```markdown
# [COMPANY NAME] ([TICKER]) — Research Profile
*Profile date: [DATE]*
*Data sources: [brief list]*

---

## Discovery
[Leave blank or placeholder: "Source: ___"]

## Summary
[2–4 sentences, factual only]

## QUICK FACTS
| Field | Value |
|-------|-------|
| Exchange | |
| Market Cap | |
| Sector | |
| ...etc | |

## Products
...

## Consumption Models
...

## Competition
...

## Risk
...

## Pipeline
...

## Financials
...

## Sector Comparisons
...

## Open Questions
[ ] ...

## Research Log
- Date: 
- Sources: 
- Notes: 
```

---

## Handoff Note

When the profile is complete, include a brief one-liner at the end:

> *Profile complete. When you're ready to form a thesis or stress-test assumptions, use the stock-notes skill.*

Do not preview the thesis or suggest what it should be.
