# POML Character Compilers

This directory contains JSON schema definitions for character compilation systems used in the Fragment swiper interface.

## Available Compilers

### 1. **Stanislavski** (`Stanislavski.json`)
**Type:** Classic Method Acting System  
**Focus:** Stanislavski acting techniques for character building

**Core Components:**
- **Given Circumstances:** Background, personal details, relationships, pre-play events
- **Character Kernel:** Core traits, motivations, flaws, defining actions
- **Stanislavski Techniques:** Emotional memory, objectives, super-objective, Magic If, tasks, subtext
- **Performance Indicators:** Authenticity, emotional richness, realism, psychological depth

**Best For:** Characters grounded in realistic psychological motivations and emotional truth

---

### 2. **CharacterGrowth** (`CharacterGrowth.json`)
**Type:** Personal Evolution & Relationship System  
**Focus:** Character development arcs and interpersonal dynamics

**Core Components:**
- **Personal Development:**
  - Self-discovery (identity crisis, skill acquisition, belief evolution)
  - Resilience building (adversity, coping strategies, growth outcomes)
  - Aspirations and goals (initial, pursuit, attainment)
- **Relationship Evolution:**
  - Foundational relationships (family, early friendships, significant other)
  - Professional interactions (workplace, mentorship, rivalry)
  - Social circle expansion (community, global connections)

**Best For:** Characters with strong transformation arcs and complex relationship networks

---

### 3. **PlotDynamics** (`PlotDynamics.json`)
**Type:** Narrative Structure System  
**Focus:** Story arc integration and plot-driven character development

**Core Components:**
- **Story Structure:** Introduction → Rising Action → Climax → Falling Action → Conclusion
- **Character Growth:**
  - Personal development (internal conflict, growth arc, transformation)
  - Relationship evolution (dynamics, bond strengthening, conflict resolution)
  - Moral evolution (value changes, ethical dilemmas, final stance)

**Best For:** Characters defined by their role in narrative structure and plot progression

---

### 4. **MagicCompiler07** (`MagicCompiler07.json`)
**Type:** Stanislavski Variant (Magic If Focus)  
**Focus:** Imaginative exploration and hypothetical scenarios

**Core Components:**
- **Stanislavski System:**
  - Given circumstances (background, life situation, environment)
  - Objectives (short-term goals, long-term ambitions)
  - Emotional memory (past experiences, triggers)
  - Subtext & physical action (unspoken thoughts, expressive actions)
  - **The Magic If** (hypothetical scenarios, imagined reactions)
  - Communion (character interactions, dependencies)
- **Performance Indicators:** Character evolution, realistic portrayal

**Best For:** Characters explored through "what if" scenarios and imaginative psychological depth

---

### 5. **compiler03** (`compiler03.json`)
**Type:** Strategic Motivations System  
**Focus:** Goal-driven tactical character construction

**Core Components:**
- **Basic Characteristics:** Literal traits, psychological profile
- **Core Motivations:** Want (desires), essential action, "as if" analogies
- **Strategic Planning:**
  - Goal (objective, significance, challenges)
  - Obstacle (nature, impact, emotional response)
  - Tactics (approach, effectiveness, adaptability)
  - Expectation (outcome, hope vs reality)
- **Interpersonal Dynamics:** Relationships, social interactions
- **Performance Indicators:** Nuanced portrayal, emotional connection, interactive dynamics

**Best For:** Characters with clear strategic objectives and tactical decision-making processes

---

## Compiler Selection Guide

| If your fragment is about... | Use this compiler |
|------------------------------|-------------------|
| Psychological realism & emotional truth | **Stanislavski** |
| Personal transformation & relationships | **CharacterGrowth** |
| Story structure & narrative role | **PlotDynamics** |
| Hypothetical exploration & imagination | **MagicCompiler07** |
| Strategic goals & tactical thinking | **compiler03** |

---

## How Compilers Work

1. **Fragment Input:** A story fragment (quote, description, tags, timecode)
2. **Compiler Selection:** Choose schema based on desired character depth
3. **Hydration Hints:** Optional key-value pairs (e.g., `essence=defiant teacher; wound=betrayal`)
4. **Schema Compilation:** AI fills in compiler schema fields using fragment data
5. **Soul Output:** A complete character "soul" JSON ready for dialogue/interaction

---

## Integration with swiper-sogo.html

The compilers are referenced in the Prompt Lab panel:

```html
<select id="compilerSelect">
  <option value="Stanislavski">Stanislavski (Classic Method Acting)</option>
  <option value="CharacterGrowth">CharacterGrowth (Personal Evolution)</option>
  <option value="PlotDynamics">PlotDynamics (Narrative Structure)</option>
  <option value="MagicCompiler07">MagicCompiler07 (Magic If System)</option>
  <option value="compiler03">Compiler03 (Strategic Motivations)</option>
</select>
```

The JavaScript validates compiler names:
```javascript
const COMPILERS = {
  "Stanislavski": true,
  "CharacterGrowth": true,
  "PlotDynamics": true,
  "MagicCompiler07": true,
  "compiler03": true
};
```

---

## Schema Extension

To add a new compiler:

1. Create `NewCompiler.json` in this directory
2. Define schema with nested structure
3. Add to dropdown in `swiper-sogo.html` (line ~230)
4. Add to `COMPILERS` object (line ~372)
5. Update this README with description

---

## Technical Notes

- **Caching:** Compiled souls are cached in localStorage by `soulKey` (fragmentId + compiler + hintsHash)
- **Versioning:** Compiler changes invalidate cache automatically via hash
- **Persona Storage:** `localStorage.fragment_personas` stores all compiled souls
- **OpenAI Integration:** POML prompt templates use compiler schemas to structure API requests

---

## File Status

✅ **Stanislavski.json** - 74 lines, complete schema  
✅ **CharacterGrowth.json** - 110 lines, complete schema  
✅ **PlotDynamics.json** - 144 lines, complete schema  
✅ **MagicCompiler07.json** - 95 lines, complete schema  
✅ **compiler03.json** - 85 lines, complete schema  

All compilers validated and integrated with swiper-sogo.html as of 2025-10-10.
