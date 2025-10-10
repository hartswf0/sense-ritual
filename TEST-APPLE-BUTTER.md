# 🍎🧈 APPLE-BUTTER Testing Guide

## What Changed

**File:** `swipe-food-apple-butter.html`

### Additions:
1. ✅ Collection items are **clickable**
2. ✅ Clicking opens chat panel automatically
3. ✅ Fragment info displays in chat header
4. ✅ Active item highlighted in collection (black background)
5. ✅ Hover effect on collection items
6. ✅ `state.currentChatItem` tracks which fragment is being chatted with
7. ✅ `openChatForItem()` function to open chat for specific item

### Visual Changes:
- **Collection items** now have cursor pointer + hover effects
- **Active item** turns black with white text
- **Chat header** shows selected fragment's title, category, status, conviction

---

## Testing Steps

### Test 1: Swipe and Collect
1. Open `swipe-food-apple-butter.html` in browser
2. Swipe right on 3 different cards
3. **Expected:**
   - Collection shows 3 items with PENDING badges
   - Each item has different title
   - Items have hover effect (cursor: pointer)

### Test 2: Click Collection Item
1. After collecting 3 items
2. Click on **item 2** in collection
3. **Expected:**
   - Chat panel slides in from left
   - Chat header shows: "Harsh Reality (Afeni)" (or whatever item 2 is)
   - Shows: "Systemic Critique · Status: PENDING · Conviction: 0%"
   - Item 2 turns **black** with white text (active state)
   - Console shows:
     ```
     [OPEN CHAT] For instanceId: abc123
     [OPEN CHAT] Found item: "Harsh Reality (Afeni)"
     [OPEN CHAT] Chat opened for "Harsh Reality (Afeni)"
     ```

### Test 3: Switch Between Items
1. With chat open for item 2
2. Click on **item 1** in collection
3. **Expected:**
   - Chat header updates to item 1's info
   - Item 1 becomes active (black)
   - Item 2 returns to normal (grey)
   - No need to close/reopen panel

4. Click on **item 3**
5. **Expected:**
   - Chat header updates again
   - Item 3 becomes active
   - Previous items return to normal

### Test 4: Hover Effects
1. Hover over collection items
2. **Expected:**
   - Background turns white
   - Left border turns black
   - Item slides left slightly
   - Shadow appears

### Test 5: Active State Persists
1. Click item 2 (chat opens)
2. Close chat panel (click × or outside)
3. **Expected:** Item 2 still shows as active (black)
4. Open chat again (click 💬)
5. **Expected:** Still shows item 2's info

### Test 6: Console Verification
1. Collect 3 items
2. Click item 1
3. In console, type: `state.currentChatItem`
4. **Expected:** Shows collectedItem object for item 1
5. Click item 2
6. Check `state.currentChatItem` again
7. **Expected:** Now shows collectedItem object for item 2

---

## What Should Work

✅ All BREAD features (swipe, collection, status badges)  
✅ All BUTTER features (chat panel toggle)  
✅ Collection items clickable  
✅ Chat opens for clicked item  
✅ Fragment info shows in chat  
✅ Active state highlighting  
✅ Switch between items  
✅ Hover effects  

---

## What's NOT Added Yet

❌ Send messages (coming in bacon)  
❌ localStorage (coming in cheese)  
❌ Conviction system (coming in eggs)  
❌ Decisions (coming in pancakes)  

---

## Success Criteria

**APPLE-BUTTER is successful if:**
1. Collect 3 items → all show in collection
2. Click item 2 → chat opens showing item 2's info
3. Item 2 turns black (active)
4. Click item 1 → chat updates to item 1's info
5. Item 1 turns black, item 2 returns to grey
6. Console shows correct instanceId for `state.currentChatItem`
7. No JavaScript errors

**If any criteria fails:** Debug before moving forward!

---

## Console Output Expected

```
🍎🧈 APPLE-BUTTER: Clickable collection initialized
[RENDER] Card: "Family of Man" (ID: fom-exhibition-1950s)

[User swipes 3 cards]
[ADD TO STORY] Fragment: "Family of Man" (ID: fom-exhibition-1950s)
[COLLECTED ITEM] Created with instanceId: lq1abc, status: PENDING
...

[User clicks item 2]
[OPEN CHAT] For instanceId: lq2def
[OPEN CHAT] Found item: "Harsh Reality (Afeni)"
[RENDER COLLECTION] Rendered 3 items
[OPEN CHAT] Chat opened for "Harsh Reality (Afeni)"
```

---

## Visual State After Test

```
💬 (green)  ← Toggle button shows panel is open

┌─────────────────────────────────┐
│ 💬 Negotiate              ×     │
├─────────────────────────────────┤
│ Harsh Reality (Afeni)           │
│ Systemic Critique · PENDING · 0%│
├─────────────────────────────────┤
│ [Empty chat area]               │
│ "Click to start..."             │
├─────────────────────────────────┤
│ [Input disabled] [Send disabled]│
└─────────────────────────────────┘

Collection:
┌─────────────────────────────────┐
│ 1. Family of Man [PENDING]      │  ← Grey (not active)
│ 2. Harsh Reality [PENDING]      │  ← BLACK (active)
│ 3. Grand Stories [PENDING]      │  ← Grey (not active)
└─────────────────────────────────┘
```

---

## Next Step

Once APPLE-BUTTER tests pass → Create **swipe-food-cheese.html** (localStorage persistence)

```bash
cp swipe-food-apple-butter.html swipe-food-cheese.html
# Then add:
# - localStorage for chats
# - Save/load story array
# - Persistence across page refresh
```

This is now ready to test! The core issue (can't select from collection) is FIXED. 🎉
