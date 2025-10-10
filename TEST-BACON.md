# BACON Testing Guide

## What Changed

**File:** `swipe-food-bacon.html`

### New Features:
1. MESSAGING SYSTEM - Chat input is now ENABLED
2. USER CAN TYPE - Input field accepts text
3. USER CAN SEND - Click SEND or press Enter
4. AI RESPONSES - Fragment responds to your arguments
5. CHAT HISTORY - Messages persist in localStorage
6. STATUS PROGRESSION - After 5 turns, fragment joins (JOINED status)
7. BAUHAUS AESTHETIC - All emojis removed, pure typography

### Visual Changes:
- Chat toggle button: "CHAT" (no emoji)
- Chat header: "NEGOTIATE" (no emoji)
- Compile button: "COMPILE SOUL" / "COMPILED" (no emoji)
- All UI elements now text-based
- Square corners (border-radius: 0)
- Heavy typography, high contrast

---

## Testing Steps

### Test 1: Send First Message
1. Open `swipe-food-bacon.html`
2. Swipe right on a card (collect it)
3. Click the collection item
4. Chat panel opens
5. See: "[START THE NEGOTIATION - TYPE YOUR FIRST ARGUMENT]"
6. Type: "This fragment articulates the core tension"
7. Press Enter OR click SEND
8. **Expected:**
   - Message appears with "YOU" label
   - Input clears
   - After 1 second, fragment responds
   - Response appears with fragment title as label
   - Console shows:
     ```
     [MESSAGE] User to "Family of Man": This fragment articulates...
     [MESSAGE] "Family of Man" response: Interesting. But can you...
     ```

### Test 2: Multi-Turn Conversation
1. Continue conversation
2. Send message 2: "You connect to Bayer's humanism"
3. Wait for response
4. Send message 3: "Your themes resonate with my opening sequence"
5. Wait for response
6. Send message 4: "You represent the idealistic foundation"
7. Wait for response
8. Send message 5: "You establish the world view I'm critiquing"
9. Wait for response
10. **Expected:**
    - Each response is different and progressive
    - Turn 1: "can you be more specific..."
    - Turn 2: "making progress..."
    - Turn 3: "broader context..."
    - Turn 4: "you're convincing me..."
    - Turn 5: "I'm joining your story"
    - After turn 5: Badge changes to [JOINED]

### Test 3: Chat History Persists
1. After sending 3 messages to a fragment
2. Click a different fragment in collection
3. See empty chat for new fragment
4. Click back to first fragment
5. **Expected:**
   - All 3 messages still there
   - Can continue conversation from where you left off
   - Each fragment has independent chat history

### Test 4: Refresh Persistence
1. Have conversation with 2 different fragments
2. Refresh the page
3. Click first fragment
4. **Expected:** All messages still there
5. Click second fragment
6. **Expected:** All messages still there
7. In console, type: `store.chats`
8. **Expected:** See both chat histories with all messages

### Test 5: Status Changes
1. Collect fragment (starts as [PENDING])
2. Have 5-turn conversation
3. After 5th response
4. **Expected:**
   - Badge changes from [PENDING] to [JOINED]
   - Status badge is green
   - Change persists on refresh

### Test 6: Bauhaus Aesthetic Check
1. Look at entire UI
2. **Verify:**
   - NO emojis anywhere
   - "CHAT" button (text only)
   - "NEGOTIATE" header (text only)
   - "COMPILE SOUL" button (text only)
   - "SWIPE LEFT: SKIP | SWIPE RIGHT: COLLECT" (text only)
   - All caps for labels
   - Square corners
   - High contrast
   - Clean typography

---

## What Should Work

- ALL SWISS-CHEESE features (skip, compile)
- ALL CHEESE features (localStorage)
- ALL APPLE-BUTTER features (clickable collection)
- Chat input ENABLED
- User can type messages
- User can send messages (Enter or SEND button)
- AI responds with progressive messages
- Chat history saved per fragment
- Chat history persists on refresh
- After 5 turns, fragment joins
- Status badge updates to JOINED
- Bauhaus aesthetic throughout

---

## What's NOT Added Yet

- Conviction scoring (coming in eggs)
- Argument quality analysis (coming in eggs)
- Procedural rhetoric hints (coming in eggs)
- Decision randomness (coming in pancakes)

---

## Success Criteria

**BACON is successful if:**
1. Can type in chat input
2. Sending message displays in chat thread
3. Fragment responds after 1 second
4. Each response is different/progressive
5. After 5 turns, status changes to JOINED
6. Chat history persists on refresh
7. Different fragments have independent chats
8. NO EMOJIS ANYWHERE in UI
9. All text is uppercase/Bauhaus style
10. No JavaScript errors

---

## Console Output Expected

```
BACON: Messaging system initialized
[RENDER] Card: "Family of Man"

[User sends message]
[MESSAGE] User to "Family of Man": This articulates the core tension
[MESSAGE] "Family of Man" response: Interesting. But can you be more specific...

[User sends message]
[MESSAGE] User to "Family of Man": You connect to Bayer's vision
[MESSAGE] "Family of Man" response: You're making progress. Tell me about...

[After 5 turns]
[MESSAGE] "Family of Man" response: Alright. You've made your case. I'm joining your story.
```

---

## Chat Data Structure

In `localStorage.chats`:

```javascript
{
  "abc123-instanceId": {
    "messages": [
      {
        "role": "user",
        "content": "This articulates the core tension",
        "timestamp": 1234567890
      },
      {
        "role": "assistant",
        "content": "Interesting. But can you be more specific...",
        "timestamp": 1234567891
      }
    ],
    "turnCount": 1
  }
}
```

---

## Visual Style

```
BAUHAUS PRINCIPLES:
- Form follows function
- Geometric shapes (squares, rectangles)
- No decorative elements
- High contrast (black on white)
- Heavy typography
- All caps for emphasis
- No curves (border-radius: 0)
- Grid-based layout
- Functional beauty
```

---

## Next Step

Once BACON tests pass, we can add:
- EGGS (conviction system, argument quality)
- PANCAKES (decision logic, outcomes)
- FINAL POLISH

Ready to test the messaging system!
