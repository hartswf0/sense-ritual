const stories = [
  {
    "title": "Story 1",
    "selected": [
      {"id": "mass-incarceration-clinton", "title": "Mass Incarceration (Clinton)", "category": "Systemic Control"},
      {"id": "cultural-fairy-tale-tupac", "title": "Culture as Fairy Tale (Tupac)", "category": "Systemic Critique"}
    ]
  },
  {
    "title": "Story 2",
    "selected": [
      {"id": "putin-eurasia-defense", "title": "Putin (Eurasia as Defense)", "category": "Political Ideology"},
      {"id": "china-algorithmic-governance", "title": "China (Algorithmic Governance)", "category": "Systemic Control"},
      {"id": "tupac-grand-stories", "title": "Grand Stories (Tupac)", "category": "Core Concept"}
    ]
  },
  {
    "title": "Story 3",
    "selected": [
      {"id": "pokemon-go-persuasive", "title": "Pokémon Go (Persuasive Gaming)", "category": "Technological Apparatus"},
      {"id": "china-algorithmic-governance", "title": "China (Algorithmic Governance)", "category": "Systemic Control"},
      {"id": "china-land-grab-corruption", "title": "China (Massive Land Grab)", "category": "Systemic Event"},
      {"id": "2008-global-economic-crash", "title": "2008 Global Economic Crash", "category": "Systemic Event"},
      {"id": "liberal-avoidance-despair", "title": "Liberal Avoidance (Despair)", "category": "Critique"},
      {"id": "future-imagine-new", "title": "Future (Imagine New)", "category": "Future Scenario"},
      {"id": "zubaydah-diary-fragments", "title": "Zubaydah's Diary (Fragments)", "category": "Personal Apparatus"}
    ]
  },
  {
    "title": "Story 4",
    "selected": [
      {"id": "cia-godzilla-fear", "title": "CIA & Godzilla (Fear Wave)", "category": "Systemic Impact"},
      {"id": "jihad-disintegration-factions", "title": "Jihad Disintegration", "category": "Systemic Event"},
      {"id": "mass-incarceration-clinton", "title": "Mass Incarceration (Clinton)", "category": "Systemic Control"},
      {"id": "crack-epidemic-afeni-fall", "title": "Crack Epidemic (Afeni's Fall)", "category": "Systemic Event"},
      {"id": "afeni-fairyland-conceal", "title": "Unreal Fairyland (Afeni)", "category": "Systemic Critique"},
      {"id": "tupac-thug-life-authenticity", "title": "Thug Life (Authenticity)", "category": "Culture/Identity"},
      {"id": "civil-rights-promises-broken", "title": "Civil Rights Promises (Broken)", "category": "Systemic Event"}
    ]
  },
  {
    "title": "Story 5",
    "selected": [
      {"id": "skinner-walden2", "title": "Walden 2 Utopia", "category": "Concept"},
      {"id": "skinner-operant-conditioning", "title": "Skinner (Operant Conditioning)", "category": "Psychological Theory"},
      {"id": "nightwolves-conspiracy-propaganda", "title": "Nightwolves (Conspiracy Drama)", "category": "Culture/Propaganda"}
    ]
  },
  {
    "title": "Story 6",
    "selected": [
      {"id": "bayer-individual-self", "title": "Individual Self (Central)", "category": "Core Concept"},
      {"id": "civil-rights-promises-broken", "title": "Civil Rights Promises (Broken)", "category": "Systemic Event"},
      {"id": "saudi-dream-corrupt", "title": "Saudi Dream Society (Corrupt)", "category": "Systemic Critique"},
      {"id": "dot-com-burst-money-power", "title": "Dot-Com Bust (Money Power)", "category": "Economic Event"},
      {"id": "data-gold-rush-surveillance", "title": "Data Gold Rush (Surveillance)", "category": "Economic Apparatus"},
      {"id": "pokemon-go-persuasive", "title": "Pokémon Go (Persuasive Gaming)", "category": "Technological Apparatus"},
      {"id": "nightwolves-conspiracy-propaganda", "title": "Nightwolves (Conspiracy Drama)", "category": "Culture/Propaganda"},
      {"id": "brexit-take-back-control", "title": "Brexit (Take Back Control)", "category": "Political Project"},
      {"id": "future-indiv-disappear", "title": "Future (Individualism Disappears)", "category": "Future Scenario"},
      {"id": "graeber-world-we-make", "title": "Graeber (World We Make)", "category": "Core Concept"},
      {"id": "russia-dream-consumption", "title": "Russia (Dream World of Consumption)", "category": "Systemic Critique"},
      {"id": "thornley-op-mindfuck", "title": "Operation Mindfuck (Thornley)", "category": "Theory/Action"}
    ]
  },
  {
    "title": "Story 7",
    "selected": [
      {"id": "chaos-theory-unpredictable", "title": "Chaos Theory", "category": "Scientific Theory"},
      {"id": "pokemon-go-persuasive", "title": "Pokémon Go (Persuasive Gaming)", "category": "Technological Apparatus"},
      {"id": "illuminati-mind-control", "title": "Illuminati (Mind Control Theory)", "category": "Conspiracy Theory"},
      {"id": "complexity-theory-patterns", "title": "Complexity Theory", "category": "Scientific Theory"},
      {"id": "dot-com-burst-money-power", "title": "Dot-Com Bust (Money Power)", "category": "Economic Event"},
      {"id": "skinner-walden2", "title": "Walden 2 Utopia", "category": "Concept"},
      {"id": "conspiracy-theories-human-ai", "title": "Conspiracy Theories (Human AI)", "category": "Social Phenomenon"},
      {"id": "afeni-fairyland-conceal", "title": "Unreal Fairyland (Afeni)", "category": "Systemic Critique"}
    ]
  },
  {
    "title": "Story 8",
    "selected": [
      {"id": "graeber-world-we-make", "title": "Graeber (World We Make)", "category": "Core Concept"},
      {"id": "fragile-structure-discon-frag", "title": "Fragile Structure (Disconnected Fragments)", "category": "Systemic Vulnerability"},
      {"id": "skinner-operant-conditioning", "title": "Skinner (Operant Conditioning)", "category": "Psychological Theory"},
      {"id": "skinner-walden2", "title": "Walden 2 Utopia", "category": "Concept"},
      {"id": "future-indiv-disappear", "title": "Future (Individualism Disappears)", "category": "Future Scenario"},
      {"id": "future-old-stability", "title": "Future (Return to Old Stability)", "category": "Future Scenario"},
      {"id": "future-imagine-new", "title": "Future (Imagine New)", "category": "Future Scenario"}
    ]
  },
  {
    "title": "Story 9",
    "selected": [
      {"id": "bayer-individual-self", "title": "Individual Self (Central)", "category": "Core Concept"},
      {"id": "society-boom-q", "title": "Societal \"Boom\" (Repression)", "category": "Systemic Control"},
      {"id": "cultural-fairy-tale-tupac", "title": "Culture as Fairy Tale (Tupac)", "category": "Systemic Critique"},
      {"id": "skinner-walden2", "title": "Walden 2 Utopia", "category": "Concept"},
      {"id": "london-second-empire-discretion", "title": "London (Second Empire of Secrecy)", "category": "Systemic Apparatus"},
      {"id": "2008-global-economic-crash", "title": "2008 Global Economic Crash", "category": "Systemic Event"},
      {"id": "future-indiv-disappear", "title": "Future (Individualism Disappears)", "category": "Future Scenario"},
      {"id": "future-old-stability", "title": "Future (Return to Old Stability)", "category": "Future Scenario"}
    ]
  },
  {
    "title": "Story 10",
    "selected": [
      {"id": "chaos-theory-unpredictable", "title": "Chaos Theory", "category": "Scientific Theory"},
      {"id": "cia-godzilla-fear", "title": "CIA & Godzilla (Fear Wave)", "category": "Systemic Impact"},
      {"id": "complexity-theory-patterns", "title": "Complexity Theory", "category": "Scientific Theory"},
      {"id": "cia-enhanced-interrogation", "title": "CIA Enhanced Interrogation", "category": "Systemic Control"}
    ]
  }
];
