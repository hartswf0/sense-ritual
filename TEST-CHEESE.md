# 🧀 CHEESE Testing Guide

## What Changed

**File:** `swipe-food-cheese.html`

### Additions:
1. ✅ `store` object - localStorage wrapper with getters/setters
2. ✅ Auto-save on collection - Every swipe saves to localStorage
3. ✅ Auto-load on page load - Restores collection from localStorage
4. ✅ Smart card skipping - Doesn't show already-collected cards
5. ✅ `initializeApp()` - Handles restoration logic

### How It Works:
```javascript
// Save story
store.story = state.story;  // Automatically saves to localStorage

// Load story
state.story = store.story;  // Automatically loads from localStorage
```

---

## Testing Steps

### Test 1: Basic Persistence
1. Open `swipe-food-cheese.html` in browser (fresh start)
2. Open console (F12)
3. Swipe right on 3 cards
4. **Check console:**
   ```
   [🧀 SAVED] Story saved to localStorage
   [STORY STATE] "Family of Man" (PENDING)
   [🧀 SAVED] Story saved to localStorage
   [STORY STATE] "Family of Man" (PENDING), "Harsh Reality" (PENDING)
   [🧀 SAVED] Story saved to localStorage
   [STORY STATE] "Family of Man" (PENDING), "Harsh Reality" (PENDING), "Grand Stories" (PENDING)
   ```

5. **Refresh the page** (Cmd+R or F5)
6. **Check console:**
   ```
   [🧀 LOADED] Restored 3 items from localStorage
   [RENDER COLLECTION] Rendered 3 items
   ```

7. **Verify:** Collection still shows 3 items with correct titles

### Test 2: Card Skipping
1. After refresh with 3 collected items
2. Look at the current card shown
3. **Expected:** Shows 4th card (not any of the 3 already collected)
4. In console, type: `state.currentIndex`
5. **Expected:** Should be `3` (skipped 0, 1, 2)

### Test 3: Continue Collecting
1. With 3 items restored
2. Swipe right on 2 more cards
3. **Expected:** Collection now shows 5 items
4. Refresh page
5. **Expected:** All 5 items restored
6. Current card skips to card #6

### Test 4: localStorage Inspection
1. After collecting 3 items
2. In console, type: `localStorage.getItem('story')`
3. **Expected:** See JSON array with 3 collectedItem objects
4. Each should have:
   - `instanceId`
   - `fragment` object with full data
   - `status: "PENDING"`
   - `addedAt` timestamp

### Test 5: Clear and Restart
1. In console, type: `localStorage.clear()`
2. Refresh page
3. **Expected:**
   - Collection is empty
   - Shows first card
   - Can start collecting from scratch

### Test 6: Cross-Tab Persistence
1. Collect 3 items in one tab
2. Open `swipe-food-cheese.html` in **NEW tab**
3. **Expected:** New tab shows same 3 items in collection
4. Collect 2 more in new tab
5. Go back to first tab
6. Refresh first tab
7. **Expected:** Now shows all 5 items

---

## What Should Work

✅ All APPLE-BUTTER features (clickable collection, chat opens)  
✅ Every swipe saves to localStorage  
✅ Page refresh restores collection  
✅ Card index skips already-collected  
✅ Can continue where you left off  
✅ Works across browser tabs  
✅ Can clear and restart  

---

## What's NOT Added Yet

❌ Send messages (coming in bacon)  
❌ Save chat history (chats in localStorage prepared but not used yet)  
❌ Conviction system (coming in eggs)  
❌ Decisions (coming in pancakes)  

---

## Success Criteria

**CHEESE is successful if:**
1. Swipe 3 cards → Saves to localStorage
2. Refresh page → Collection restored with 3 items
3. Current card shows 4th card (skips first 3)
4. Swipe 2 more → Now have 5 items
5. Refresh → All 5 items still there
6. Open in new tab → Same 5 items appear
7. `localStorage.clear()` → Everything resets

**If any criteria fails:** Debug before moving forward!

---

## Console Output Expected

```
🧀 CHEESE: Persistence initialized
[RENDER] Card: "Family of Man" (ID: fom-exhibition-1950s)

[User swipes card 1]
[ADD TO STORY] Fragment: "Family of Man"
[🧀 SAVED] Story saved to localStorage
[STORY STATE] "Family of Man" (PENDING)

[User swipes card 2]
[ADD TO STORY] Fragment: "Harsh Reality"
[🧀 SAVED] Story saved to localStorage
[STORY STATE] "Family of Man" (PENDING), "Harsh Reality" (PENDING)

[User refreshes page]
[🧀 LOADED] Restored 2 items from localStorage
[RENDER COLLECTION] Rendered 2 items
🧀 CHEESE: Persistence initialized
[RENDER] Card: "Grand Stories" (ID: tupac-grand-stories)  ← Skipped first 2
```

---

## Visual Improvements (from APPLE-BUTTER fix)

**Active item now shows:**
- ✅ **Green background** (#2ECC71) - Much more visible!
- ✅ Black text - Clear contrast
- ✅ Thick black left border (6px)
- ✅ Green shadow
- ✅ Black badge with white text

No more "black on black" issue! 🎉

---

## Next Step

Once CHEESE tests pass → Create **swipe-food-bacon.html** (send/receive messages)

```bash
cp swipe-food-cheese.html swipe-food-bacon.html
# Then add:
# - Enable chat input/send button
# - User can type messages
# - Simulated AI responses
# - Messages saved to store.chats
```
