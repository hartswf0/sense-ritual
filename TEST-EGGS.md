# EGGS Testing Guide

## What Changed

**File:** `swipe-food-eggs.html`

### New Features:
1. CONVICTION SYSTEM - Analyzes argument quality
2. VISUAL CONVICTION BAR - Shows 0-100% with color gradient
3. DYNAMIC HINTS - Changes based on conviction level
4. CHARACTER COUNTER - Shows 0/200 characters
5. ARGUMENT ANALYSIS - Scores based on length, keywords, specificity
6. SMART DECISIONS - JOINED if conviction >= 60%, UNMATCHED if < 30%
7. AUTO-OPEN FIX - Chat panel now always opens when clicking collection item

### Conviction Scoring:
- **Length:** 50+ chars = +15 points
- **Quotes:** Using " or ' = +12 points
- **Keywords:** theme, power, narrative, context, etc. = +5 each
- **Analysis:** "because", "demonstrates", "reveals" = +8 each
- **Score converts to conviction:** -20% to +40% per message

---

## Testing Steps

### Test 1: Auto-Open Fix
1. Open `swipe-food-eggs.html`
2. Swipe right on a card (collect it)
3. **Click the collection item**
4. **Expected:**
   - Chat panel slides open IMMEDIATELY
   - No need to click CHAT button
   - Item turns green (active)
   - Console shows: `[CHAT PANEL] Forced open`

### Test 2: Weak Argument (Low Conviction)
1. With chat open for a fragment
2. Type: "cool"
3. Press Enter
4. **Expected:**
   - Message appears
   - Conviction bar stays at 0% or moves slightly
   - Bar color: RED (left side)
   - Status: "HIGHLY SKEPTICAL"
   - Hint changes to: "TOO VAGUE: Be more specific..."
   - Hint border turns RED
   - Console shows:
     ```
     [ANALYSIS] Score: 5, Quality: weak, Conviction change: -25
     [CONVICTION] 0% -> 0%
     ```

### Test 3: Strong Argument (High Conviction)
1. Type: "This fragment demonstrates the power of collective narrative and reveals how systems of control operate through representation. It connects to the broader theme of individual agency versus systemic structures."
2. Press Enter
3. **Expected:**
   - Conviction jumps significantly (30-40%)
   - Bar color: YELLOW (middle)
   - Status: "CONSIDERING"
   - Hint: "SOLID: You're making the case..."
   - Hint border: YELLOW
   - Console shows:
     ```
     [ANALYSIS] Score: 75, Quality: strong, Conviction change: +40
     [CONVICTION] 0% -> 40%
     ```

### Test 4: Progressive Hints
As you type more messages, watch the hints change:

**0-20% (RED):**
```
TOO VAGUE: Be more specific about themes, context, or narrative function.
```

**20-40% (ORANGE):**
```
IMPROVING: Good start. Now connect to broader themes or explain structural role.
```

**40-60% (YELLOW):**
```
SOLID: You're making the case. Add more depth about relationships to other clips.
```

**60-80% (GREEN):**
```
STRONG: Excellent reasoning. One more turn should convince.
```

**80-100% (DARK GREEN):**
```
COMPELLING: Your arguments are persuasive. Nearly convinced.
```

### Test 5: Character Counter
1. Start typing in input
2. Watch top-right counter
3. **Expected:**
   - Shows "0 / 200" (grey, faded)
   - At 150 chars: turns ORANGE, opaque
   - At 200 chars: turns RED
   - Cannot type beyond 200

### Test 6: JOINED Outcome
1. Collect a fragment
2. Send 5 strong arguments (60%+ conviction)
3. After 5th turn
4. **Expected:**
   - System message: "[JOINED] This fragment has agreed to join your film."
   - Badge changes to [JOINED] (green)
   - Fragment stays in collection
   - Status persists on refresh

### Test 7: UNMATCHED Outcome
1. Collect a fragment
2. Send 5 weak arguments (< 30% conviction)
3. After 5th turn
4. **Expected:**
   - System message: "[UNMATCHED] This fragment remains unconvinced..."
   - Fragment REMOVED from collection
   - Chat panel closes automatically
   - Fragment gone on refresh

### Test 8: Mixed Quality Arguments
1. Send weak: "interesting" → Low conviction
2. Send strong: "This represents systemic control through narrative structures and demonstrates how power operates" → High conviction
3. Send weak: "cool clip" → Slight decrease
4. Send strong: "It articulates the theme of individual resistance..." → High increase
5. Send medium: "I think it works here" → Small increase
6. **Expected:** Conviction fluctuates based on quality

---

## Conviction Bar Visual

```
0-20%:   [RED==========>                    ] HIGHLY SKEPTICAL
20-40%:  [ORANGE==============>             ] UNCONVINCED
40-60%:  [YELLOW==================>         ] CONSIDERING
60-80%:  [LIGHT GREEN================>      ] LEANING YES
80-100%: [GREEN==========================>  ] NEARLY CONVINCED
```

---

## What Should Work

- ALL BACON features (messaging)
- ALL SWISS-CHEESE features (skip, compile)
- ALL CHEESE features (localStorage)
- Argument quality analysis
- Conviction bar updates in real-time
- Dynamic hints based on conviction
- Character counter
- Smart outcomes (JOINED vs UNMATCHED)
- AUTO-OPEN chat when clicking collection (FIXED!)
- System messages for outcomes

---

## Success Criteria

**EGGS is successful if:**
1. Clicking collection item ALWAYS opens chat
2. Weak arguments give low conviction (0-20%)
3. Strong arguments give high conviction (30-40%)
4. Conviction bar animates smoothly
5. Hints change based on conviction level
6. Character counter shows at 0/200
7. After 5 turns with 60%+ conviction → JOINED
8. After 5 turns with < 30% conviction → UNMATCHED (removed)
9. System messages appear for outcomes
10. All conviction data persists on refresh

---

## Console Output Expected

```
EGGS: Conviction system initialized

[User clicks collection]
[OPEN CHAT] For instanceId: abc123
[OPEN CHAT] Found item: "Family of Man"
[CHAT PANEL] Forced open
[OPEN CHAT] Chat opened for "Family of Man"

[User types weak argument]
[MESSAGE] User to "Family of Man": cool
[ANALYSIS] Score: 5, Quality: weak, Conviction change: -25
[CONVICTION] 0% -> 0%

[User types strong argument]
[MESSAGE] User to "Family of Man": This demonstrates power...
[ANALYSIS] Score: 78, Quality: strong, Conviction change: +40
[CONVICTION] 0% -> 40%
```

---

## Argument Quality Tips

**To get HIGH conviction:**
- Use 50+ characters
- Include quotes (")
- Use keywords: power, control, system, narrative, truth, theme, context
- Use analytical phrases: demonstrates, reveals, connects to, represents
- Be specific about themes and structure

**Example STRONG argument:**
```
"This fragment reveals the system of control through representation 
and connects to the broader theme of individual agency. It demonstrates 
how narrative structures operate to shape collective consciousness."
```
Score: 80+, Conviction: +40%

**Example WEAK argument:**
```
"cool"
```
Score: 5, Conviction: -25%

---

## Next Step

Once EGGS tests pass, the app is nearly complete! All core features working:
- Swipe to collect/skip
- Compile with different compilers
- Chat with fragments
- Conviction system
- Smart outcomes

Ready to test the complete system!
