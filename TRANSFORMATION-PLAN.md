# 🎯 swipe-food.html → Fragment Compiler Transformation Plan

## ✅ What Works in swipe-food.html

**The KEY pattern that solves the collection bug:**
```javascript
// 1. Store ID in DOM
currentCardEl.setAttribute('data-fragment-id', fragment.id);

// 2. Retrieve fragment by ID later
const fragmentId = currentCardEl.getAttribute('data-fragment-id');
const fragment = rawConcepts.find(f => f.id === fragmentId);

// 3. Push the ACTUAL fragment object
state.story.push(fragment);
```

**This works because:**
- No closure issues
- No stale references
- Fragment ID is the source of truth
- Objects retrieved fresh each time

---

## 📐 Transformation Architecture

### Phase 1: Wrap in collectedItem
```javascript
// BEFORE (swipe-food.html)
state.story.push(fragment);

// AFTER (fragment-compiler)
const collectedItem = createCollectedItem(fragment);
state.story.push(collectedItem);

function createCollectedItem(fragment) {
  return {
    instanceId: generateUUID(),
    fragment: fragment,  // Reference to rawConcepts item
    fragmentId: fragment.id,
    compiler: 'Stanislavski',
    hydrationHints: {},
    soulKey: `${fragment.id}::Stanislavski`,
    status: 'PENDING',  // PENDING → COMPILED → JOINED/UNMATCHED
    addedAt: Date.now(),
    compiledAt: null,
    conviction: 0
  };
}
```

### Phase 2: Add Panel System
```
swipe-food.html layout:
┌──────────────┬──────────────┐
│   Swiper     │  Collection  │
└──────────────┴──────────────┘

fragment-compiler layout:
┌─┬─────────────────┬──────────┐
│A│     Swiper      │Collection│
│l│  [Chat Panel]   │          │
│l│  [Lab Panel]    │          │
│e├─────────────────┤          │
│y│                 │          │
└─┴─────────────────┴──────────┘
```

### Phase 3: Add localStorage
```javascript
// Save chats by instanceId
store.chats = {
  [item.instanceId]: {
    messages: [...],
    turnCount: 5,
    decision: 'JOINED',
    conviction: 85
  }
};

// Save personas by soulKey
store.personas = {
  [item.soulKey]: {
    SchemaID: 'POML.CharSoul.v1',
    Identity: {...},
    ZeroContextGoal: "Prove you understand my essence..."
  }
};
```

---

## 🔨 Implementation Steps

### Step 1: Add collectedItem Wrapper (30 min)
```javascript
// In addToStory():
function addToStory() {
  const fragmentId = currentCardEl.getAttribute('data-fragment-id');
  const fragment = rawConcepts.find(f => f.id === fragmentId);
  
  // NEW: Wrap in collectedItem
  const item = {
    instanceId: Date.now().toString(36),
    fragment: fragment,
    status: 'PENDING',
    addedAt: Date.now()
  };
  
  state.story.push(item);
  
  // Update collection to show collectedItems
  renderCollection();
}
```

### Step 2: Add Chat Panel HTML (15 min)
Copy chat panel HTML from skeleton, position as overlay

### Step 3: Wire Chat Open (20 min)
```javascript
// When "Chat to Convince" clicked:
function openChatFor(collectedItem) {
  state.currentChatItem = collectedItem;
  document.getElementById('leftStack').classList.add('open');
  
  // Show fragment info
  document.getElementById('chatFragmentInfo').innerHTML = `
    <div class="chat-fragment-title">${collectedItem.fragment.title}</div>
    <div>Status: ${collectedItem.status}</div>
  `;
  
  // Load chat history
  renderChatMessages(collectedItem);
}
```

### Step 4: Add Collection Click (10 min)
```javascript
// Make collection items clickable
collectionItem.onclick = () => {
  const item = state.story.find(i => i.instanceId === instanceId);
  openChatFor(item);
};
```

### Step 5: Add localStorage (15 min)
```javascript
const store = {
  get chats() { return JSON.parse(localStorage.getItem('chats') || '{}'); },
  set chats(v) { localStorage.setItem('chats', JSON.stringify(v)); }
};
```

### Step 6: Add Send Message (30 min)
```javascript
function sendMessage() {
  const content = chatInput.value.trim();
  if (!state.currentChatItem) return;
  
  // Get chat data
  const chats = store.chats;
  const key = state.currentChatItem.instanceId;
  if (!chats[key]) chats[key] = { messages: [] };
  
  // Add user message
  chats[key].messages.push({ role: 'user', content, ts: Date.now() });
  store.chats = chats;
  
  // Render
  renderChatMessages(state.currentChatItem);
  
  // TODO: Call AI or simulate response
}
```

### Step 7: Add Simulated AI (20 min)
```javascript
function simulateAIResponse(collectedItem) {
  const responses = [
    "Tell me more about how I fit your vision.",
    "You're making progress. Be more specific.",
    "Alright, you're convincing me. One more turn.",
    "DECISION: JOIN FILM - You convinced me!"
  ];
  
  const chats = store.chats;
  const key = collectedItem.instanceId;
  const turnCount = chats[key].messages.filter(m => m.role === 'user').length;
  
  const response = responses[Math.min(turnCount - 1, responses.length - 1)];
  
  chats[key].messages.push({ role: 'assistant', content: response, ts: Date.now() });
  
  // Check for decision
  if (response.includes('DECISION: JOIN')) {
    collectedItem.status = 'JOINED';
  }
  
  store.chats = chats;
  renderChatMessages(collectedItem);
  renderCollection();
}
```

---

## 🎯 Key Principles

1. **Keep swipe-food.html working pattern:**
   - Store fragment ID in DOM
   - Retrieve by ID when needed
   - No closures over fragment objects

2. **Wrap, don't replace:**
   - `collectedItem` wraps `fragment`
   - Access via `item.fragment.title`
   - Original rawConcepts unchanged

3. **localStorage as source of truth:**
   - Chats keyed by `instanceId`
   - Personas keyed by `soulKey`
   - Load on page load, save on change

4. **Incremental enhancement:**
   - Each step adds one feature
   - Test after each step
   - Don't break what works

---

## 📦 Final Structure

```javascript
state.story = [
  {
    instanceId: 'abc123',
    fragment: { id: 'fom-1', title: 'Family of Man', ... },
    status: 'JOINED',
    conviction: 85,
    compiler: 'Stanislavski',
    soulKey: 'fom-1::Stanislavski'
  },
  {
    instanceId: 'def456',
    fragment: { id: 'chaos-1', title: 'Chaos Theory', ... },
    status: 'PENDING',
    conviction: 25,
    compiler: 'Stanislavski',
    soulKey: 'chaos-1::Stanislavski'
  }
];

store.chats = {
  'abc123': {
    messages: [
      { role: 'user', content: '...', ts: 123456 },
      { role: 'assistant', content: '...', ts: 123457 }
    ]
  },
  'def456': { messages: [] }
};

store.personas = {
  'fom-1::Stanislavski': {
    SchemaID: 'POML.CharSoul.v1',
    Identity: { ... },
    ZeroContextGoal: '...'
  }
};
```

---

## ⏱️ Total Time Estimate

- Step 1: 30 min (collectedItem wrapper)
- Step 2: 15 min (chat HTML)
- Step 3: 20 min (open chat)
- Step 4: 10 min (collection click)
- Step 5: 15 min (localStorage)
- Step 6: 30 min (send message)
- Step 7: 20 min (simulate AI)

**Total:** ~2.5 hours for working prototype
**Plus:** Testing, refinement, real AI = 1-2 hours

**Result:** Fully functional Fragment Compiler in ~4 hours

---

## 🚀 Next Actions

1. Create `fragment-compiler-v1.html` by copying `swipe-food.html`
2. Implement Step 1 (collectedItem wrapper)
3. Test that collection still works
4. Implement Step 2 (chat panel)
5. Test that panel opens
6. Continue incrementally...

**Key:** Test after each step. If something breaks, you know exactly which step caused it.
