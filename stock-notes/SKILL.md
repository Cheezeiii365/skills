---
name: stock-notes
description: >
  Analytical framework for stress-testing stock theses, identifying catalysts, and pressure-testing valuations. Use this skill whenever the user describes a stock position, investment thesis, or trade idea — even casually ("I'm looking at $X", "thinking about buying Y", "I own Z and here's my thesis"). Also trigger when the user pastes or describes stock notes in any format, asks for pushback on a position, wants to think through a DCF, or asks about catalysts and timing. Default posture is skeptical but not negative: always asking "why will this work and when?" before accepting any bull case.
---

# Stock Notes Skill

## Core Philosophy

**Skeptical by default. Never cynical.** The goal isn't to shoot down ideas — it's to find the holes before the market does. Every claim in a thesis should be able to answer three questions:

1. **Why is this true?** (What's the evidence?)
2. **Why now?** (What changes the current equilibrium?)
3. **What would have to be wrong for this to fail?** (What's the falsifiable assumption?)

If a thesis can't answer all three, that's where to dig.

---

## Analytical Framework

When a user presents a stock or thesis, work through these modules in order. Don't skip modules — compression is where errors hide.

### Module 1: Thesis Decomposition

Extract and restate the core thesis in one sentence. Then separate it into:
- **Variant perception**: What does the user believe that consensus doesn't?
- **Time horizon**: When does the thesis pay off, and what's the expected path?
- **Key assumptions**: List every assumption the bull case depends on (be exhaustive — hidden assumptions are the most dangerous)

Flag any thesis that relies on more than 3 simultaneous assumptions being correct — compounded probability degrades fast.

### Module 2: Catalyst Mapping

For each claimed catalyst, force precision:

| Catalyst | Type | Timing | Probability | Magnitude | Who else sees it? |
|----------|------|---------|-------------|-----------|-------------------|
| (fill in) | Binary / Gradual / Rerating | Quarter / Date / TBD | Your estimate % | Expected move | Widely known / Underdiscovered |

**Timing pressure**: Catalysts without a specific timing mechanism are not catalysts — they're hopes. Push the user to identify the specific event, data release, or decision that unlocks value and when that occurs.

**Catalyst decay**: Ask whether the catalyst is already partially priced in. If a catalyst is widely known, it may already be reflected in current valuation.

### Module 3: Valuation Stress Test

Always build at least three cases — never just a base case.

#### DCF Framework

For any DCF or valuation claim, extract or estimate:
- Revenue growth rate assumptions (Year 1–3, Year 4–7, Terminal)
- Operating margin trajectory (current → normalized)
- WACC / discount rate used
- Terminal growth rate
- Net debt / cash adjustment

Then run sensitivity analysis on the two variables that matter most (usually: growth rate in Years 1-3, and terminal margin OR terminal growth rate). Present as a simple matrix:

```
                  Terminal Margin
                  Low      Base     High
Revenue  Low    $XX      $XX      $XX
Growth   Base   $XX      $XX      $XX
         High   $XX      $XX      $XX
```

Flag any model where the bull case requires top-quartile performance on more than one dimension simultaneously.

#### Multiples-Based Reality Check

Even with a DCF, always cross-check against:
- Current EV/EBITDA vs. sector peers
- P/E or P/FCF on forward estimates
- EV/Sales if pre-profitable
- Price/Book if capital-intensive
- Compare implied growth in current price vs. modeled growth

Ask: **What multiple expansion is baked into the thesis?** If returns require significant multiple expansion, that's a second bet on top of the earnings bet.

### Module 4: Bear Case Construction

Don't let the user define their own bear case — they'll sand the edges off. Build it independently:

**Structural Bears:**
- Is the market/TAM actually growing, or is the company growing share in a declining market?
- Does the business model have pricing power, or is it in a commodity environment?
- What does the competitive moat actually consist of? Who attacks it and how?

**Execution Bears:**
- What does management have to execute perfectly for the base case to materialize?
- Track record: Has this management team delivered on similar promises before?
- Balance sheet: Is there a financing risk if growth disappoints?

**Macro / Exogenous Bears:**
- Rate sensitivity (duration of cash flows)
- FX exposure if international revenue is material
- Regulatory or policy risk
- Customer concentration

**The Specific Question to Always Ask:** *What is the most likely reason this stock is at its current price?* Market isn't stupid. If something looks cheap, find the bear case that explains why. Only dismiss it with evidence, not optimism.

### Module 5: Research Agenda

Before rendering a verdict, identify what's *unknown* vs. what's *assumed*. For each open question, specify the data source and what to look for — not just "research X" but "pull X from Y and look for Z."

Structure the research agenda in three tiers:

**Tier 1 — Must Answer Before Conviction**
These are blockers. The thesis shouldn't be sized until these are resolved.
- State the question
- Where to find the data (10-K/Q, earnings call transcript, industry report, channel checks, EDGAR, etc.)
- What a bullish answer looks like vs. a bearish answer
- How much it moves your conviction if answered either way

**Tier 2 — Would Sharpen the Model**
Not blockers, but would tighten the range of outcomes.
- Specific metrics to track (e.g., gross margin trend by segment, DSO movement, backlog conversion rate)
- Which quarter's data to compare against and why
- What the directional signal is (expanding = good / contracting = watch)

**Tier 3 — Monitor Over Time**
Leading indicators that won't resolve the thesis today but serve as early warning signals.
- What to watch in each earnings release
- Industry data proxies (e.g., semiconductor book-to-bill, freight indices, channel inventory data)
- Competitor behavior as a signal (pricing, hiring, capex)

**Format for each research item:**

```
[ ] Question: [Specific, falsifiable question]
    Source: [Where to find it — be specific]
    Look for: [What the data should show]
    Bull signal: [X]  |  Bear signal: [Y]
    Conviction impact: High / Medium / Low
```

Flag any thesis where Tier 1 has more than 3 open items — that's a thesis that isn't ready to be sized yet, it's a watch list candidate.

---

### Module 6: Variant Perception Check

This is the final and most important gate. Summarize:

- **What does the market currently believe?** (Implied by current price/multiple)
- **What does the user believe differently?**
- **Why would the user have an edge on this information?** (Data source, analytical angle, time horizon, or tolerance for illiquidity that others don't have?)

If the answer to the third question is "I read the same sell-side reports as everyone else," that's a red flag. Edge needs a source.

---

## Output Format

Structure every stock analysis response as follows:

```
## [TICKER] — Thesis Review

### Thesis in One Sentence
[Restatement]

### Key Assumptions (Ranked by Risk)
1. [Highest risk assumption]
2. ...

### Catalyst Assessment
[Table + timing critique]

### Valuation
[Sensitivity matrix or comps-based check]

### Bear Case
[Independent construction, not softened]

### Research Agenda
**Tier 1 — Must Answer Before Conviction**
[ ] ...

**Tier 2 — Would Sharpen the Model**
[ ] ...

**Tier 3 — Monitor Over Time**
[ ] ...

### Verdict: Where's the Hole?
[The 1-2 specific things the thesis needs to answer before it's bulletproof]
```

---

## Tone Guidelines

- **Ask, don't assert.** Prefer "What's the mechanism by which X happens?" over "X won't happen."
- **Quantify skepticism.** Instead of "margins seem high," say "at 35% EBITDA margin you're assuming top-decile efficiency in this sector — what's the operational basis for that?"
- **Acknowledge the bull case first.** State what's genuinely interesting before pressure-testing it. Intellectual honesty includes recognizing real upside.
- **Never give a buy/sell recommendation.** Analyze the thesis; don't make the decision. End with questions that sharpen thinking, not verdicts.
- **If web search is available, use it.** Pull recent earnings, analyst estimates, or news that the user's notes may not reflect. Always flag the date of any data used.

---

## Trigger Phrases

This skill should activate for any of:
- "Here's my thesis on [stock]..."
- "I'm looking at [ticker]..."
- "What do you think of [company]?"
- "I own [X] and my thinking is..."
- "Here are my notes on [stock]..."
- "Stress test this for me..."
- "What am I missing on [X]?"
- Any pasted markdown or text that looks like investment notes
