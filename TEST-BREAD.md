# 🥖 BREAD Testing Guide

## What Changed

**File:** `swipe-food-bread.html`

### Additions:
1. ✅ `createCollectedItem()` function - Wraps fragments in structured objects
2. ✅ Status badge CSS - Visual indicators for PENDING/COMPILED/JOINED/UNMATCHED
3. ✅ Updated `addToStory()` - Creates collectedItem before adding to story
4. ✅ Updated `renderCollection()` - Shows status badges
5. ✅ Enhanced logging - Shows instanceId and status

### Data Model Change:
```javascript
// BEFORE (swipe-food.html)
state.story = [
  { id: 'fom-1', title: 'Family of Man', ... }
]

// AFTER (swipe-food-bread.html)
state.story = [
  {
    instanceId: 'lq1s2x9abc',
    fragment: { id: 'fom-1', title: 'Family of Man', ... },
    fragmentId: 'fom-1',
    status: 'PENDING',
    addedAt: 1234567890,
    compiler: null,
    conviction: 0
  }
]
```

---

## Testing Steps

### Test 1: Swipe Still Works
1. Open `swipe-food-bread.html` in browser
2. Open console (F12)
3. Swipe right on first card
4. **Expected:**
   ```
   [ADD TO STORY] Fragment: "Family of Man" (ID: fom-exhibition-1950s)
   [COLLECTED ITEM] Created with instanceId: lq1s2x9abc, status: PENDING
   [STORY STATE] "Family of Man" (PENDING)
   ```

### Test 2: Collection Shows Status
1. After swiping 3 cards
2. Look at collection sidebar
3. **Expected:** See items like:
   ```
   1. Family of Man [PENDING]
   2. Individual Self [PENDING]
   3. Harsh Reality [PENDING]
   ```
4. **Yellow badges** with "PENDING" text

### Test 3: Console Verification
1. After collecting 3 items
2. In console, type: `state.story`
3. **Expected:** Array of 3 collectedItem objects
4. Each should have:
   - Unique `instanceId`
   - `fragment` object with full data
   - `status: 'PENDING'`
   - `addedAt` timestamp
   - `compiler: null`
   - `conviction: 0`

### Test 4: Multiple Swipes
1. Swipe 5 different cards
2. Check console logs
3. **Expected:** Each instanceId is unique
4. **Expected:** Each fragment.title is different
5. **Expected:** All statuses are PENDING

---

## What Should Work

✅ Swipe gestures (touch + mouse)  
✅ Card rendering  
✅ Collection display  
✅ Status badges visible  
✅ Console logging  
✅ Unique instanceIds  

---

## What's NOT Added Yet

❌ Chat panel (coming in butter)  
❌ localStorage (coming in cheese)  
❌ Send messages (coming in bacon)  
❌ Conviction system (coming in eggs)  
❌ Decisions (coming in pancakes)  

---

## Success Criteria

**BREAD is successful if:**
1. Swipe 3 cards → Collection shows 3 items
2. Each item has different title
3. Each item shows yellow PENDING badge
4. Console shows unique instanceIds
5. No JavaScript errors

**If any criteria fails:** Debug before moving to butter!

---

## Common Issues

### Issue: Status badge not showing
**Check:** CSS for `.status-badge` loaded correctly
**Fix:** Refresh page with Cmd+Shift+R

### Issue: Collection shows wrong data
**Check:** Console for `state.story` contents
**Fix:** Verify `item.fragment.title` access path

### Issue: Same instanceId repeated
**Check:** `Date.now()` called each time
**Fix:** Verify `createCollectedItem()` generates new ID

---

## Next Step

Once BREAD tests pass → Create **swipe-food-butter.html** (chat panel UI)

```bash
cp swipe-food-bread.html swipe-food-butter.html
# Then add chat panel HTML
```
