# 🍕 Food-Themed Progressive Development

## Base Recipe
**swipe-food.html** - Working swiper with collection ✅

---

## Progressive Additions

### 🥖 swipe-food-bread.html (Foundation)
**Adds:** collectedItem wrapper system
- Wraps fragments in collectedItem objects
- Adds instanceId, status, addedAt fields
- Updates renderCollection to show status badges
- Keeps everything else working

**Test:** Swipe 3 cards, verify collection shows status "PENDING"

---

### 🧈 swipe-food-butter.html (Smooth Panels)
**Adds:** Chat panel HTML + toggle
- Adds left-side chat panel structure
- Adds "Chat" button in alley menu
- Opens/closes chat panel
- No functionality yet, just UI

**Test:** Click chat button, panel slides in/out

---

### 🥚 swipe-food-egg.html (Core Chat)
**Adds:** Chat opens for fragment
- "Chat to Convince" button opens chat
- Shows fragment info in chat header
- Collection items clickable to open chat
- Displays which fragment is active

**Test:** Click "Chat to Convince", verify correct fragment shown in chat

---

### 🧀 swipe-food-cheese.html (Persistence)
**Adds:** localStorage for chats
- Adds store.chats getter/setter
- Saves chat history to localStorage
- Loads history on page refresh
- Persists across sessions

**Test:** Add fragment, refresh page, verify still there

---

### 🥓 swipe-food-bacon.html (Messaging)
**Adds:** Send/receive messages
- Chat input works
- User can type messages
- Messages display in chat thread
- Simulated AI responses

**Test:** Type message, see it appear, get AI response

---

### 🍳 swipe-food-eggs.html (Conviction System)
**Adds:** Argument quality analysis
- Analyzes message quality (length, specificity, quotes)
- Updates conviction score
- Shows conviction bar with percentage
- Status text updates (SKEPTICAL → CONVINCED)

**Test:** Send weak message (low conviction), send strong message (high conviction)

---

### 🥞 swipe-food-pancakes.html (Decisions)
**Adds:** Fragment decision logic
- After 5 turns, fragment decides
- Decision based on conviction level
- Status updates to JOINED or UNMATCHED
- UNMATCHED items removed from collection

**Test:** Complete 5-turn negotiation, verify outcome matches conviction

---

### 🥗 swipe-food-salad.html (Compiler Lab)
**Adds:** Prompt Lab panel
- Adds compiler selection dropdown
- Adds hydration hints textarea
- "Compile Current" button
- Saves compiler choice per fragment

**Test:** Open lab, select compiler, verify saved

---

### 🍔 swipe-food-burger.html (Soul Compilation)
**Adds:** OpenAI integration
- API key input in settings
- Actual persona compilation
- Stores personas in localStorage
- Uses compiled persona in chat

**Test:** Enter API key, compile fragment, verify persona created

---

### 🍟 swipe-food-fries.html (Export Features)
**Adds:** Export functions
- Export JSON with full data
- Export CSV with collection
- Export EDL for video editing
- Download handlers

**Test:** Export each format, verify file contents

---

### 🍕 swipe-food-pizza.html (Polish & Complete)
**Adds:** Final polish
- All 74+ fragments loaded
- Refined UI animations
- Mobile responsive improvements
- Complete feature set

**Test:** Full end-to-end workflow

---

## Development Order

```
swipe-food.html (base)
    ↓
swipe-food-bread.html (collectedItem)
    ↓
swipe-food-butter.html (chat panel UI)
    ↓
swipe-food-egg.html (open chat)
    ↓
swipe-food-cheese.html (localStorage)
    ↓
swipe-food-bacon.html (messaging)
    ↓
swipe-food-eggs.html (conviction)
    ↓
swipe-food-pancakes.html (decisions)
    ↓
swipe-food-salad.html (compiler lab)
    ↓
swipe-food-burger.html (OpenAI)
    ↓
swipe-food-fries.html (exports)
    ↓
swipe-food-pizza.html (complete)
```

---

## Testing Checklist

After each food version:
1. ✅ Swipe still works
2. ✅ Collection still shows correct items
3. ✅ New feature works as expected
4. ✅ Console logs are informative
5. ✅ No JavaScript errors

**If any test fails:** Fix before proceeding to next food!

---

## Quick Commands

```bash
# Create next version
cp swipe-food.html swipe-food-bread.html

# Test in browser
open swipe-food-bread.html

# Check console
# Swipe 3 cards
# Verify new feature works
```

Each step builds on the previous, keeping everything working!
