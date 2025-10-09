// Color mapping by category
function getCategoryColor(category) {
  const colorMap = {
    'Systemic Control': '#E74C3C',
    'Systemic Critique': '#E74C3C',
    'Systemic Event': '#E74C3C',
    'Systemic Impact': '#E74C3C',
    'Systemic Apparatus': '#E74C3C',
    'Systemic Vulnerability': '#E74C3C',
    'Economic Event': '#F39C12',
    'Economic Apparatus': '#F39C12',
    'Political Ideology': '#F39C12',
    'Political Project': '#F39C12',
    'Scientific Theory': '#3498DB',
    'Psychological Theory': '#3498DB',
    'Concept': '#3498DB',
    'Theory/Action': '#3498DB',
    'Future Scenario': '#2ECC71',
    'Core Concept': '#2ECC71',
    'Culture/Identity': '#9B59B6',
    'Culture/Propaganda': '#9B59B6',
    'Conspiracy Theory': '#9B59B6',
    'Social Phenomenon': '#9B59B6',
    'Personal Apparatus': '#95A5A6',
    'Technological Apparatus': '#95A5A6',
    'Critique': '#95A5A6'
  };
  return colorMap[category] || '#7F8C8D';
}

// Analyze frequency
function analyzeFrequency() {
  const freq = {};
  stories.forEach((story, idx) => {
    story.selected.forEach(concept => {
      if (!freq[concept.id]) {
        freq[concept.id] = {
          ...concept,
          count: 0,
          stories: []
        };
      }
      freq[concept.id].count++;
      freq[concept.id].stories.push(idx + 1);
    });
  });
  return freq;
}

// Render lanes
function renderLanes(filter = 'all') {
  const freq = analyzeFrequency();
  const lanesContainer = document.getElementById('lanes');
  
  const html = stories.map((story, storyIdx) => {
    const blocks = story.selected.map((concept, conceptIdx) => {
      const conceptFreq = freq[concept.id];
      const isShared = conceptFreq.count > 1;
      const color = getCategoryColor(concept.category);
      
      // Apply filter
      if (filter === 'shared' && !isShared) return '<div class="block empty"></div>';
      if (filter === 'unique' && isShared) return '<div class="block empty"></div>';
      
      return `
        <div class="block ${isShared ? 'shared' : ''}" 
             style="background: ${color};"
             data-id="${concept.id}"
             data-title="${concept.title}"
             data-category="${concept.category}"
             data-count="${conceptFreq.count}"
             data-stories="${conceptFreq.stories.join(', ')}">
          <div class="block-title">${concept.title}</div>
          <div class="block-category">${concept.category}</div>
          ${isShared ? `<div class="block-count">${conceptFreq.count}</div>` : ''}
        </div>
      `;
    }).join('');

    return `
      <div class="lane">
        <div class="lane-header">Story ${storyIdx + 1}<br/>(${story.selected.length})</div>
        <div class="lane-content">${blocks}</div>
      </div>
    `;
  }).join('');

  lanesContainer.innerHTML = html;
  attachBlockListeners();
}

// Tooltip
function attachBlockListeners() {
  const tooltip = document.getElementById('tooltip');
  
  document.querySelectorAll('.block:not(.empty)').forEach(block => {
    block.addEventListener('mouseenter', function(e) {
      const title = this.dataset.title;
      const category = this.dataset.category;
      const count = this.dataset.count;
      const storiesStr = this.dataset.stories;
      
      document.getElementById('tooltipTitle').textContent = title;
      document.getElementById('tooltipCategory').textContent = category;
      document.getElementById('tooltipStories').textContent = `Appears in ${count} ${count > 1 ? 'stories' : 'story'}: ${storiesStr}`;
      
      tooltip.classList.add('active');
      updateTooltipPosition(e);
    });

    block.addEventListener('mousemove', updateTooltipPosition);
    
    block.addEventListener('mouseleave', function() {
      tooltip.classList.remove('active');
    });

    block.addEventListener('click', function() {
      const conceptId = this.dataset.id;
      highlightConcept(conceptId);
    });
  });
}

function updateTooltipPosition(e) {
  const tooltip = document.getElementById('tooltip');
  tooltip.style.left = (e.clientX + 15) + 'px';
  tooltip.style.top = (e.clientY + 15) + 'px';
}

function highlightConcept(conceptId) {
  document.querySelectorAll('.block').forEach(block => {
    if (block.dataset.id === conceptId) {
      block.style.opacity = '1';
      block.style.transform = 'scale(1.1)';
    } else {
      block.style.opacity = '0.3';
      block.style.transform = 'scale(1)';
    }
  });

  setTimeout(() => {
    document.querySelectorAll('.block').forEach(block => {
      block.style.opacity = '1';
      block.style.transform = 'scale(1)';
    });
  }, 2000);
}

// Filter controls
document.querySelectorAll('.control-btn').forEach(btn => {
  btn.addEventListener('click', function() {
    document.querySelectorAll('.control-btn').forEach(b => b.classList.remove('active'));
    this.classList.add('active');
    
    const filter = this.dataset.filter;
    renderLanes(filter);
  });
});

// Initialize
renderLanes();
