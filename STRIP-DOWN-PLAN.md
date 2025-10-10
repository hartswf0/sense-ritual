# 🔬 Systematic Strip-Down to Find the Bug

## Strategy: Progressive Simplification

Start with `swiper-mo.html` (647 lines, working swipe gestures)
Remove features one by one until we isolate the bug.

---

## Strip-Down Sequence

### Phase 1: Remove Non-Essential Features
**Create:** `swiper-minimal-1.html`
**Remove:**
- ❌ Chat panel (all chat code)
- ❌ Settings panel
- ❌ Compiler lab
- ❌ Export functions
- ❌ Prediction/transclusion features
- ❌ Sound effects
- ❌ Flash animations

**Keep:**
- ✅ Card rendering
- ✅ Swipe gestures (touch + mouse)
- ✅ Collection sidebar
- ✅ story[] array
- ✅ Console logging

**Test:** Swipe 3 cards, check if collection shows 3 different titles

---

### Phase 2: Simplify Swipe Logic
**Create:** `swiper-minimal-2.html`
**Remove:**
- ❌ swipeLeft, swipeUp, swipeDown (keep only swipeRight)
- ❌ Card animation (instant removal)
- ❌ Gesture sensitivity code (simple threshold)

**Keep:**
- ✅ Basic swipe detection
- ✅ swipeRight() function
- ✅ Collection

**Test:** Still works or breaks?

---

### Phase 3: Simplify Rendering
**Create:** `swiper-minimal-3.html`
**Remove:**
- ❌ Video embeds
- ❌ Card styling (minimal CSS)
- ❌ Fancy layouts

**Keep:**
- ✅ Basic card HTML
- ✅ Fragment data
- ✅ DOM rendering

**Test:** Still shows correct fragments?

---

### Phase 4: Bare Minimum
**Create:** `swiper-minimal-4.html`
**Remove:**
- ❌ All panels except card + collection
- ❌ All CSS except basic layout
- ❌ All features except:
  - Show card
  - Click to collect
  - Display collection

**Test:** Does collection work with just button clicks?

---

## What We'll Learn

If bug appears in Phase 1 → Problem is in core swipe/collection logic
If bug appears in Phase 2 → Problem is in swipe gesture handling
If bug appears in Phase 3 → Problem is in card rendering/closures
If bug appears in Phase 4 → Problem is fundamental architecture

---

## Let's Start: Phase 1

Copy swiper-mo.html → swiper-minimal-1.html
Remove all chat/settings/compiler code
Add aggressive console logging
Test collection
