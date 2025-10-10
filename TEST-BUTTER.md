# 🧈 BUTTER Testing Guide

## What Changed

**File:** `swipe-food-butter.html`

### Additions:
1. ✅ Chat panel HTML structure (fixed left side)
2. ✅ Chat toggle button (top-left corner)
3. ✅ Chat panel slides in/out animation
4. ✅ Close button in chat header
5. ✅ Click outside to close
6. ✅ Layout expanded to 3-column grid

### Visual Changes:
- **Chat toggle button** (💬) appears top-left
- **Chat panel** slides in from left when clicked
- **Main grid** now 3 columns to accommodate wider layout
- Chat input/send **disabled** (no functionality yet)

---

## Testing Steps

### Test 1: Toggle Button Works
1. Open `swipe-food-butter.html` in browser
2. See **💬 button** in top-left corner (black background)
3. Click the button
4. **Expected:** 
   - Chat panel slides in from left
   - Button turns **green**
   - Console shows: `[CHAT PANEL] Opened`

### Test 2: Close Button Works
1. With chat panel open
2. Click **×** button in chat header
3. **Expected:**
   - Panel slides out to left
   - Toggle button turns black again
   - Console shows: `[CHAT PANEL] Closed`

### Test 3: Click Outside Closes
1. Open chat panel
2. Click anywhere on the cards or collection area
3. **Expected:** Panel closes automatically

### Test 4: Chat Shows Empty State
1. Open chat panel
2. **Expected:** See:
   ```
   💬 Negotiate
   
   No fragment selected
   Select a fragment from collection to start chatting
   
   👈 Click a fragment in your collection to start negotiating
   ```

### Test 5: Input is Disabled
1. Open chat panel
2. Try clicking in text input
3. Try clicking Send button
4. **Expected:** 
   - Input is greyed out
   - Cannot type
   - Send button doesn't work

### Test 6: Swiper Still Works
1. Swipe right on 3 cards
2. **Expected:**
   - Collection shows 3 items with PENDING badges
   - Swipe functionality unchanged from BREAD
   - Chat panel doesn't interfere

---

## What Should Work

✅ Chat toggle button visible  
✅ Chat panel slides in/out  
✅ Close button works  
✅ Click outside closes panel  
✅ Empty state message shows  
✅ Input/Send disabled  
✅ All BREAD features still work (swipe, collection, status badges)  

---

## What's NOT Added Yet

❌ Chat actually opens for a fragment (coming in egg)  
❌ Collection items clickable (coming in egg)  
❌ Messages can be sent (coming in bacon)  
❌ localStorage (coming in cheese)  

---

## Success Criteria

**BUTTER is successful if:**
1. Toggle button appears and is clickable
2. Chat panel slides in/out smoothly
3. Close button works
4. Click outside closes panel
5. All BREAD features still work
6. No JavaScript errors

**If any criteria fails:** Debug before moving to egg!

---

## Visual Layout

```
┌─💬──────┬─────────────┬──────────┬──────────┐
│         │   Swiper    │ Collection│          │
│  Chat   │             │           │          │
│  Panel  │   [Card]    │  Item 1   │          │
│  (400px)│             │  Item 2   │          │
│         │             │  Item 3   │          │
│  Slides │             │           │          │
│  in/out │             │           │          │
└─────────┴─────────────┴──────────┴──────────┘
```

---

## Console Output Expected

```
🧈 BUTTER: Chat panel UI initialized
[RENDER] Card: "Family of Man" (ID: fom-exhibition-1950s)

[User clicks toggle]
[CHAT PANEL] Opened

[User clicks close]
[CHAT PANEL] Closed
```

---

## Next Step

Once BUTTER tests pass → Create **swipe-food-egg.html** (chat opens for fragment)

```bash
cp swipe-food-butter.html swipe-food-egg.html
# Then add:
# - "Chat to Convince" button functionality
# - Collection item click handlers
# - Display fragment info in chat
```
