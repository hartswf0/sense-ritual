# 🧪 Fragment Closure Bug Test

## The Hypothesis

**All swiper files have the same bug:** Collection fills with the first fragment's data repeatedly.

**Possible causes:**
1. **Closure problem** - The `fragment` parameter isn't captured correctly
2. **Global variable problem** - Using `currentCard` which gets overwritten
3. **Timing problem** - Fragment changes between render and click

---

## The Test

Open: `/Users/gaia/sense-ritual/sense-ritual/swiper-test-closure.html`

This test file shows TWO buttons for each card:
1. **"Collect (using currentCard)"** - Uses global `currentCard` variable
2. **"Collect (using closure)"** - Uses closure over `fragment` parameter

---

## How to Test

### Test A: Using Global Variable

1. Open the file in browser
2. Card shows: "Fragment A"
3. Click: **"Collect (using currentCard)"**
4. Card shows: "Fragment B"
5. Click: **"Collect (using currentCard)"**
6. Card shows: "Fragment C"
7. Click: **"Collect (using currentCard)"**

**Check collection:**
- ✅ **Expected:** Fragment A, Fragment B, Fragment C (all different)
- ❌ **Bug:** Fragment A, Fragment A, Fragment A (all same)

---

### Test B: Using Closure

1. Refresh page
2. Card shows: "Fragment A"
3. Click: **"Collect (using closure)"**
4. Card shows: "Fragment B"
5. Click: **"Collect (using closure)"**
6. Card shows: "Fragment C"
7. Click: **"Collect (using closure)"**

**Check collection:**
- ✅ **Expected:** Fragment A, Fragment B, Fragment C (all different)
- ❌ **Bug:** Fragment A, Fragment A, Fragment A (all same)

---

## What the Logs Tell Us

### If Global Works:
```
[TIME] showNextCard() called for: Fragment A (id: a)
[TIME]   → currentCard set to: Fragment A
[TIME] collectViaGlobal() called
[TIME]   → Using currentCard: Fragment A (id: a)
[TIME]   → story AFTER: [Fragment A]

[TIME] showNextCard() called for: Fragment B (id: b)
[TIME]   → currentCard set to: Fragment B
[TIME] collectViaGlobal() called
[TIME]   → Using currentCard: Fragment B (id: b)
[TIME]   → story AFTER: [Fragment A, Fragment B]  ← DIFFERENT!
```
**Conclusion:** Global variable approach works

---

### If Closure Works:
```
[TIME] renderCard() called with: Fragment A (id: a)
[TIME]   → Created closure function for: Fragment A
[TIME] collectCard() received: Fragment A (id: a)
[TIME]   → story AFTER: [Fragment A]

[TIME] renderCard() called with: Fragment B (id: b)
[TIME]   → Created closure function for: Fragment B
[TIME] collectCard() received: Fragment B (id: b)
[TIME]   → story AFTER: [Fragment A, Fragment B]  ← DIFFERENT!
```
**Conclusion:** Closure approach works

---

### If Both Fail:
```
[TIME] collectCard() received: Fragment A (id: a)
[TIME] collectCard() received: Fragment A (id: a)  ← SAME!
[TIME] collectCard() received: Fragment A (id: a)  ← SAME!
```
**Conclusion:** Something else is wrong (fragment identity lost earlier)

---

## Expected Outcome

**I predict:** The closure button will work, but something in the real swiper files breaks it.

**Why?** In real files, the closure might be:
1. Created in wrong scope
2. Overwritten by subsequent renders
3. Broken by event delegation
4. Lost in anonymous functions

---

## Next Steps

### If Test Shows Closure Works:
→ The bug is in how real swiper files set up closures
→ Compare test file closure setup vs real file
→ Find the difference

### If Test Shows Both Fail:
→ The bug is in fragment identity before rendering
→ Check `deck.pop()` and `showNextCard()`
→ Fragment objects might be references, not copies

### If Test Shows Global Works:
→ Solution: Use `currentCard` everywhere, remove parameter
→ Simplest fix, proven to work

---

## The Real Swiper Code

In `swiper-mo.html` line 329:
```javascript
el.querySelector('[data-act="accept"]').addEventListener('click', 
  (e)=>{ 
    e.stopPropagation(); 
    swipeRight(fragment)  // ← This uses closure
  }
);
```

In `swiper-mo.html` line 338:
```javascript
const onEnd = ()=>{ 
  // ...
  if (currentX>threshold) swipeRight(fragment);  // ← This also uses closure
};
```

**Both use closure over `fragment` parameter.**

If test shows closure works but real code doesn't → Something is breaking the closure in the real implementation.

---

## Run the Test Now

1. Open: `swiper-test-closure.html`
2. Try both buttons on multiple cards
3. Check console logs
4. Report which button works (if any)

This will definitively show us where the bug is!
