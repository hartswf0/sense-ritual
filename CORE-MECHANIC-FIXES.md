# 🚨 CRITICAL: Core Mechanic Fixes

## 🐛 Bugs Reported

1. **Swipe right adds first fragment name repeatedly** - Not adding the actual swiped fragment
2. **Can't click collection items to chat** - Click handlers not working
3. **UNMATCHED fragments disappear** - Should stay in collection

## 🔍 Diagnosis

### Bug #1: Fragment Identity
**Root Cause:** The fragment parameter is being passed correctly, but console logging will reveal if it's the right one.

**Test:** Add more verbose logging:
```javascript
console.log('[SWIPE RIGHT] Fragment object:', {
  id: fragment.id,
  title: fragment.title,
  currentCard: currentCard?.title
});
```

### Bug #2: Collection Chat Buttons
**Root Cause:** Event listeners might not be attaching correctly, or filtered array index mismatch.

**Current Code (Lines 961-966):**
```javascript
list.querySelectorAll('[data-action="chat"]').forEach(btn=> 
  btn.addEventListener('click', ()=> {
    const idx = parseInt(btn.dataset.idx);
    const fragment = filtered[idx];
    console.log('[COLLECTION CHAT] Opening chat for item at idx', idx, ':', fragment.title);
    openChatFor(fragment);
  })
);
```

**Issue:** This looks correct. Need to verify:
1. Are buttons rendering?
2. Are event listeners attaching?
3. Is filtered array correct?

### Bug #3: UNMATCHED Disappearing
**Root Cause:** No code removes UNMATCHED fragments automatically. Issue might be:
1. Filter is hiding them
2. They're not being added in the first place
3. UI bug showing wrong data

## ✅ Fixes to Apply

### Fix #1: Enhanced Logging in swipeRight

```javascript
async function swipeRight(fragment){
  // CRITICAL DEBUG
  console.log('[SWIPE RIGHT] Called with fragment:', {
    id: fragment?.id,
    title: fragment?.title,
    category: fragment?.category
  });
  console.log('[SWIPE RIGHT] currentCard:', currentCard?.title);
  console.log('[SWIPE RIGHT] story BEFORE:', story.map(f => f.title));
  
  createFlash('accept'); playSwipeSound('accept');
  
  // CRITICAL: Add THIS specific fragment to collection
  console.log('[SWIPE RIGHT] Adding fragment to collection:', fragment.title);
  story.push(fragment); 
  swipedCards.add(fragment.id);
  
  console.log('[SWIPE RIGHT] story AFTER:', story.map(f => f.title));
  
  animateCardOut('right'); 
  setTimeout(showNextCard, 250); 
  updateCollection();
  
  // ... rest of function
}
```

### Fix #2: Verify Collection Buttons Render

Add to renderList:
```javascript
function renderList(){
  const list=document.getElementById('listView');
  const filtered = getFilteredStory();
  
  console.log('[RENDER LIST] Rendering', filtered.length, 'fragments:', filtered.map(f => f.title));
  console.log('[RENDER LIST] story array:', story.map(f => f.title));
  
  list.innerHTML = filtered.map((frag, idx)=>{
    // ... render code
  }).join('');

  // VERIFY BUTTONS EXIST
  const chatButtons = list.querySelectorAll('[data-action="chat"]');
  console.log('[RENDER LIST] Chat buttons created:', chatButtons.length);
  
  chatButtons.forEach((btn, i)=> {
    console.log('[RENDER LIST] Attaching handler to button', i, 'for fragment:', filtered[i].title);
    btn.addEventListener('click', ()=> {
      const idx = parseInt(btn.dataset.idx);
      const fragment = filtered[idx];
      console.log('[COLLECTION CHAT CLICK] idx:', idx, 'fragment:', fragment?.title);
      if (fragment) {
        openChatFor(fragment);
      } else {
        console.error('[COLLECTION CHAT CLICK] No fragment found at index', idx);
      }
    });
  });
}
```

### Fix #3: Verify UNMATCHED Stay

Check getFilteredStory:
```javascript
function getFilteredStory() {
  let filtered = [...story];
  
  console.log('[GET FILTERED STORY] Starting with', story.length, 'items');
  console.log('[GET FILTERED STORY] Current filter:', currentFilter);
  
  // Apply filter
  if (currentFilter !== 'all') {
    filtered = filtered.filter(frag => {
      const chatData = getChatData(frag);
      const compiler = document.getElementById('compilerSelect').value;
      const cacheKey = `${frag.id}::${compiler}`;
      const hasSoul = !!store.personas[cacheKey];
      
      if (currentFilter === 'joined') {
        const result = chatData.decision === 'JOINED';
        console.log('[FILTER] Fragment', frag.title, 'JOINED check:', result);
        return result;
      }
      if (currentFilter === 'compiled') return hasSoul;
      if (currentFilter === 'pending') return !chatData.decision;
      return true;
    });
  }
  
  console.log('[GET FILTERED STORY] After filter:', filtered.length, 'items:', filtered.map(f => f.title));
  
  // Apply sort
  // ... sorting code
  
  return filtered;
}
```

## 🧪 Testing Protocol

### Test 1: Verify Swipe Adds Correct Fragment

```
1. Open console (F12)
2. Note current story: []
3. Swipe right on "Family of Man"
4. Check logs:
   [SWIPE RIGHT] Called with fragment: {id: "fom-exhibition-1950s", title: "Family of Man"}
   [SWIPE RIGHT] story BEFORE: []
   [SWIPE RIGHT] Adding fragment to collection: Family of Man
   [SWIPE RIGHT] story AFTER: ["Family of Man"]
   
5. Swipe right on "Chaos Theory"
6. Check logs:
   [SWIPE RIGHT] Called with fragment: {id: "chaos-theory-unpredictable", title: "Chaos Theory"}
   [SWIPE RIGHT] story BEFORE: ["Family of Man"]
   [SWIPE RIGHT] Adding fragment to collection: Chaos Theory
   [SWIPE RIGHT] story AFTER: ["Family of Man", "Chaos Theory"]
```

**Expected:** Different fragments each time
**If fails:** Fragment parameter is wrong - need to check renderCard/setupCardInteraction

### Test 2: Verify Collection Buttons Work

```
1. Collect 3 fragments
2. Open collection panel
3. Check console:
   [RENDER LIST] Rendering 3 fragments: ["A", "B", "C"]
   [RENDER LIST] Chat buttons created: 3
   [RENDER LIST] Attaching handler to button 0 for fragment: A
   [RENDER LIST] Attaching handler to button 1 for fragment: B
   [RENDER LIST] Attaching handler to button 2 for fragment: C

4. Click "Chat" button on second item (B)
5. Check console:
   [COLLECTION CHAT CLICK] idx: 1, fragment: B
   [OPEN CHAT FOR] Opening chat for fragment: B

6. Verify chat opens for B (not A or C)
```

**Expected:** Chat opens for clicked fragment
**If fails:** Check if buttons exist, if event listeners attach, if filtered array is correct

### Test 3: Verify UNMATCHED Stay

```
1. Collect fragment
2. Give weak arguments
3. Fragment decides UNMATCHED
4. Check console:
   [GET FILTERED STORY] Starting with 1 items
   [GET FILTERED STORY] Current filter: all
   [GET FILTERED STORY] After filter: 1 items: ["Vector World"]

5. Open collection
6. Verify fragment still shows with [UNMATCHED] badge

7. Change filter to "joined"
8. Check console:
   [GET FILTERED STORY] Current filter: joined
   [FILTER] Fragment Vector World JOINED check: false
   [GET FILTERED STORY] After filter: 0 items: []

9. Change filter back to "all"
10. Verify fragment reappears
```

**Expected:** UNMATCHED fragments stay in collection, can be filtered out but not deleted
**If fails:** Check if fragment is actually in story array, or if it's being removed somewhere

## 🔧 Implementation Order

1. **Add enhanced logging to swipeRight** (diagnose fragment identity)
2. **Add logging to renderList** (diagnose button attachment)
3. **Add logging to getFilteredStory** (diagnose filtering)
4. **Run Test 1** - verify fragments are unique
5. **Run Test 2** - verify buttons work
6. **Run Test 3** - verify UNMATCHED stay

## 🎯 Expected Console Output (Good)

```
[Card shows: Family of Man]
[User swipes right]

[SWIPE RIGHT] Called with fragment: {id: "fom-exhibition-1950s", title: "Family of Man"}
[SWIPE RIGHT] currentCard: Family of Man
[SWIPE RIGHT] story BEFORE: []
[SWIPE RIGHT] Adding fragment to collection: Family of Man
[SWIPE RIGHT] story AFTER: ["Family of Man"]
[UPDATE COLLECTION] story array has 1 items: ["Family of Man"]
[RENDER LIST] Rendering 1 fragments: ["Family of Man"]
[RENDER LIST] story array: ["Family of Man"]
[RENDER LIST] Chat buttons created: 1
[RENDER LIST] Attaching handler to button 0 for fragment: Family of Man

[Card shows: Chaos Theory]
[User swipes right]

[SWIPE RIGHT] Called with fragment: {id: "chaos-theory", title: "Chaos Theory"}
[SWIPE RIGHT] currentCard: Chaos Theory
[SWIPE RIGHT] story BEFORE: ["Family of Man"]
[SWIPE RIGHT] Adding fragment to collection: Chaos Theory
[SWIPE RIGHT] story AFTER: ["Family of Man", "Chaos Theory"]
[UPDATE COLLECTION] story array has 2 items: ["Family of Man", "Chaos Theory"]
[RENDER LIST] Rendering 2 fragments: ["Family of Man", "Chaos Theory"]
```

## 🚩 Red Flags (Bad Output)

### Problem: Same Fragment Repeated
```
[SWIPE RIGHT] Called with fragment: {id: "fom-exhibition-1950s", title: "Family of Man"}
[SWIPE RIGHT] story AFTER: ["Family of Man"]

[SWIPE RIGHT] Called with fragment: {id: "fom-exhibition-1950s", title: "Family of Man"}  // WRONG
[SWIPE RIGHT] story AFTER: ["Family of Man", "Family of Man"]  // WRONG
```

**Cause:** Fragment parameter not changing between cards
**Fix:** Check currentCard assignment in showNextCard

### Problem: Buttons Don't Attach
```
[RENDER LIST] Rendering 3 fragments: ["A", "B", "C"]
[RENDER LIST] Chat buttons created: 0  // WRONG - should be 3
```

**Cause:** querySelector not finding buttons
**Fix:** Check HTML rendering, verify data-action="chat" exists

### Problem: Click Does Nothing
```
[User clicks Chat button]
[No logs appear]  // WRONG
```

**Cause:** Event listener not attaching or not firing
**Fix:** Verify addEventListener is called, check if button exists when listener added

### Problem: UNMATCHED Disappears
```
[Fragment decides UNMATCHED]
[UPDATE COLLECTION] story array has 0 items: []  // WRONG - should still be 1
```

**Cause:** Something is removing from story array
**Fix:** Search for story.splice or story.filter that removes UNMATCHED

## 📝 Notes

- The code LOOKS correct based on review
- Need runtime logs to see actual behavior
- Likely issue: timing (async) or reference (closures)
- Collection buttons might need different approach if current doesn't work
