# Swiper-Sogo-Fixed.html - Implementation Plan

## ✅ Starting Point
Copied working `swiper-so.html` to `swiper-sogo-fixed.html`

## 🎯 Changes to Make

### 1. CSS Additions (Lines ~130-160)

Add to chat bubble styles:
```css
/* Loading animation */
.chat-bubble.loading { opacity: .6; animation: pulse 1.5s ease-in-out infinite; }
@keyframes pulse { 0%, 100% { opacity: .6; } 50% { opacity: 1; } }

.chat-bubble .typing-dots { display: inline-flex; gap: 4px; }
.chat-bubble .typing-dots span { 
  width: 6px; height: 6px; 
  background: var(--ink); 
  border-radius: 50%; 
  animation: bounce 1.4s infinite; 
}
.chat-bubble .typing-dots span:nth-child(2) { animation-delay: .2s; }
.chat-bubble .typing-dots span:nth-child(3) { animation-delay: .4s; }
@keyframes bounce { 
  0%, 60%, 100% { transform: translateY(0); } 
  30% { transform: translateY(-8px); } 
}

/* Character counter */
.chat-hints { font-size: 10px; opacity: .6; line-height: 1.4; margin-bottom: 4px; }
.chat-hints strong { opacity: 1; color: var(--accent); }
.char-counter { font-size: 10px; opacity: .5; text-align: right; margin-bottom: 4px; }
.char-counter.warning { opacity: 1; color: var(--warn); font-weight: 800; }

/* Compilation status */
.soul-status { 
  display: inline-flex; 
  align-items: center; 
  gap: 6px; 
  font-size: 10px; 
  padding: 4px 8px; 
  background: var(--muted); 
  color: var(--paper); 
  border-radius: 4px; 
  font-weight: 800;
}
.soul-status.compiling { background: var(--info); animation: pulse 1.5s ease-in-out infinite; }
.soul-status.ready { background: var(--good); }
.soul-status.error { background: var(--bad); }
```

### 2. HTML Chat Input Update (Lines ~218-221)

BEFORE:
```html
<div class="chat-input">
  <input id="chatInput" placeholder="Say something persuasive…" />
  <button id="chatSend">Send</button>
</div>
```

AFTER:
```html
<div class="chat-input">
  <div class="chat-hints" id="chatHints">Think: <strong>What makes this clip essential?</strong> Reference its themes, context, or emotional core.</div>
  <div class="char-counter" id="charCounter">0 / 200</div>
  <div style="display:grid;grid-template-columns:1fr auto;gap:8px;">
    <input id="chatInput" placeholder="Say something persuasive…" maxlength="200" />
    <button id="chatSend">Send</button>
  </div>
</div>
```

### 3. Replace rawConcepts Array (Lines ~306-310)

Replace the small array with the full 80+ items provided by user.

### 4. JavaScript Additions

#### A. Character Counter (after line ~1081)
```javascript
// Character counter and rhetoric hints
chatInput.addEventListener('input', ()=>{
  const len = chatInput.value.length;
  const counter = document.getElementById('charCounter');
  const hints = document.getElementById('chatHints');
  
  counter.textContent = `${len} / 200`;
  counter.classList.toggle('warning', len > 150);
  
  if (len === 0) {
    hints.innerHTML = 'Think: <strong>What makes this clip essential?</strong> Reference its themes, context, or emotional core.';
  } else if (len < 30) {
    hints.innerHTML = 'Keep going: <strong>Be specific.</strong> Generic praise won\'t convince.';
  } else if (len < 80) {
    hints.innerHTML = 'Good start: <strong>Connect to meaning.</strong> Why does this fit your vision?';
  } else if (len < 150) {
    hints.innerHTML = 'Strong: <strong>Show understanding.</strong> Quote the clip, reference its context.';
  } else {
    hints.innerHTML = '<strong>Excellent depth.</strong> You\'re making a real case.';
  }
});
```

#### B. Loading Animation (in handleSend function, after line ~1091)
```javascript
// After pushChat(fragment, 'user', content);
chatInput.value='';
document.getElementById('charCounter').textContent = '0 / 200';
document.getElementById('chatHints').innerHTML = 'Think: <strong>What makes this clip essential?</strong> Reference its themes, context, or emotional core.';

// Show loading indicator
const loadingBubble = document.createElement('div');
loadingBubble.className = 'chat-bubble loading';
loadingBubble.innerHTML = '<div class="typing-dots"><span></span><span></span><span></span></div>';
loadingBubble.id = 'loadingBubble';
chatThread.appendChild(loadingBubble);
chatThread.scrollTop = chatThread.scrollHeight;
```

#### C. Remove Loading (before pushChat assistant reply)
```javascript
// Before pushChat(fragment, 'assistant', text);
const loading = document.getElementById('loadingBubble');
if (loading) loading.remove();
```

#### D. Soul Compilation Status (in compilePersona function)
```javascript
// At start of compilePersona:
const statusEl = document.getElementById('soulStatus');
if (statusEl) {
  statusEl.className = 'soul-status compiling';
  statusEl.textContent = '⚙️ Compiling...';
}

// On success:
if (statusEl) {
  statusEl.className = 'soul-status ready';
  statusEl.textContent = '✓ Ready';
}

// On error:
if (statusEl) {
  statusEl.className = 'soul-status error';
  statusEl.textContent = '✗ Error';
}
```

#### E. Add Status to Chat Profile (in openChatFor function)
```html
chatProfile.innerHTML = `
  <div style="display:flex;align-items:center;gap:8px;margin-bottom:6px">
    <div style="width:32px;height:32px;background:${color};..."></div>
    <strong style="flex:1">${fragment.title || 'Untitled'}</strong>
    <div class="soul-status" id="soulStatus">Pending</div>
  </div>
  ...
`;
```

---

## 🧪 Testing Checklist

After implementation, test:

1. ✅ All 80+ fragments load
2. ✅ Swipe right → item added to collection
3. ✅ Chat opens with correct fragment
4. ✅ "Compiling..." status shows
5. ✅ Character counter updates as you type
6. ✅ Hints change based on length
7. ✅ Loading dots appear when sending
8. ✅ Fragment responds after compilation
9. ✅ Decision updates status (JOINED/UNMATCHED)
10. ✅ Collection shows all attempted fragments

---

## 📦 File Locations

- **Source:** `/Users/gaia/sense-ritual/sense-ritual/swiper-so.html` (working)
- **Target:** `/Users/gaia/sense-ritual/sense-ritual/swiper-sogo-fixed.html` (copy made)
- **Backup:** Keep `swiper-so.html` unchanged as fallback

---

## ⚠️ Critical Notes

- **Don't change** core swipeRight/chat logic (it works in swiper-so.html)
- **Only add** visual improvements (animations, hints, status)
- **Verify** each change doesn't break existing functionality
- **Test** on actual browser after each major change

---

## 🚀 Ready to Implement?

Confirm and I'll proceed with careful, tested edits to create the fixed version.
