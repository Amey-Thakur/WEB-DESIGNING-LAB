/**
 * ================================================================
 *   Web Designing Lab (WDL) Portfolio - Security & UX Logic
 * ================================================================
 *   Author: Amey Thakur
 *   GitHub: https://github.com/Amey-Thakur
 *   Course: Web Designing Lab (WDL)
 *   Roll No: 50
 *   Batch: B3
 *   Year: 2020
 *   Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
 *   License: MIT
 * ================================================================
 */

// =========================================
//   CONSOLE PROTECTION & EASTER EGG 🥚
// =========================================
console.log(
    "%c🧬 WDL Lab Portfolio",
    "font-size: 28px; font-weight: bold; color: #2563eb; text-shadow: 2px 2px 0 #0f172a;"
);
console.log(
    "%c👋 Hey developer! Curious about the code?",
    "font-size: 14px; color: #64748b;"
);
console.log(
    "%c🔗 https://github.com/Amey-Thakur/WEB-DESIGNING-LAB",
    "font-size: 12px; color: #2563eb;"
);
console.log(
    "%c⚠️ This portfolio is protected. Please respect the author's work!",
    "font-size: 12px; color: #f59e0b; font-weight: bold;"
);

// Anti-Inspection / Selection / Right-Click Protection
document.addEventListener('contextmenu', (e) => e.preventDefault());
document.addEventListener('selectstart', (e) => e.preventDefault());
document.addEventListener('dragstart', (e) => e.preventDefault());
document.addEventListener('copy', (e) => {
    e.preventDefault();
    return false;
});

document.onkeydown = function (e) {
    if (e.keyCode === 123) return false; // F12
    if (e.ctrlKey && e.shiftKey && (e.keyCode === 73 || e.keyCode === 74)) return false; // Ctrl+Shift+I/J
    if (e.ctrlKey && e.keyCode === 85) return false; // Ctrl+U (View Source)
    if (e.ctrlKey && (e.keyCode === 67 || e.keyCode === 86 || e.keyCode === 83 || e.keyCode === 65)) return false; // Ctrl+C, V, S, A
};

/**
 * =========================================
 *   CORE INTERACTIVE LOGIC
 * =========================================
 */

document.addEventListener('DOMContentLoaded', () => {
    const toggleBtn = document.getElementById('theme-toggle');
    const themeIcon = toggleBtn ? toggleBtn.querySelector('i') : null;
    const htmlElement = document.documentElement;
    const backToTopBtn = document.getElementById("btn-back-to-top");

    // Theme Logic
    const savedTheme = localStorage.getItem('theme') || 'light';
    htmlElement.setAttribute('data-theme', savedTheme);
    if (themeIcon) updateIcon(savedTheme, themeIcon);

    const toggleTheme = () => {
        const currentTheme = htmlElement.getAttribute('data-theme');
        const newTheme = currentTheme === 'light' ? 'dark' : 'light';
        htmlElement.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        if (themeIcon) updateIcon(newTheme, themeIcon);
        playCelebrateSound();
    };

    if (toggleBtn) {
        toggleBtn.addEventListener('click', toggleTheme);
    }

    function updateIcon(theme, icon) {
        if (theme === 'dark') {
            icon.classList.remove('fa-moon');
            icon.classList.add('fa-sun');
        } else {
            icon.classList.remove('fa-sun');
            icon.classList.add('fa-moon');
        }
    }

    // Scroll Logic
    window.onscroll = function () {
        if (backToTopBtn) {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                backToTopBtn.style.display = "flex";
            } else {
                backToTopBtn.style.display = "none";
            }
        }
    };

    if (backToTopBtn) {
        backToTopBtn.addEventListener("click", () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }

    // =========================================
    //   SOUND EFFECTS (AudioContext)
    // =========================================
    const audioCtx = new (window.AudioContext || window.webkitAudioContext)();

    function playLaunchSound() {
        if (audioCtx.state === 'suspended') audioCtx.resume();
        const osc = audioCtx.createOscillator();
        const gain = audioCtx.createGain();
        osc.type = 'sine';
        osc.frequency.setValueAtTime(440, audioCtx.currentTime);
        osc.frequency.exponentialRampToValueAtTime(880, audioCtx.currentTime + 0.1);
        gain.gain.setValueAtTime(0.1, audioCtx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.01, audioCtx.currentTime + 0.1);
        osc.connect(gain);
        gain.connect(audioCtx.destination);
        osc.start();
        osc.stop(audioCtx.currentTime + 0.1);
    }

    function playCelebrateSound() {
        if (audioCtx.state === 'suspended') audioCtx.resume();
        const osc = audioCtx.createOscillator();
        const gain = audioCtx.createGain();
        osc.type = 'triangle';
        osc.frequency.setValueAtTime(523.25, audioCtx.currentTime); // C5
        osc.frequency.exponentialRampToValueAtTime(1046.5, audioCtx.currentTime + 0.2); // C6
        gain.gain.setValueAtTime(0.1, audioCtx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.01, audioCtx.currentTime + 0.2);
        osc.connect(gain);
        gain.connect(audioCtx.destination);
        osc.start();
        osc.stop(audioCtx.currentTime + 0.2);
    }

    // Attach launch sound to experiment links
    document.querySelectorAll('.launch-link').forEach(link => {
        link.addEventListener('mouseenter', playLaunchSound);
        link.addEventListener('click', () => {
            playCelebrateSound();
        });
    });

    // =========================================
    //   SCROLL REVEAL ANIMATIONS
    // =========================================
    const revealCallback = (entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
                observer.unobserve(entry.target);
            }
        });
    };

    const revealObserver = new IntersectionObserver(revealCallback, {
        threshold: 0.1
    });

    document.querySelectorAll('.reveal').forEach(el => {
        revealObserver.observe(el);
    });

    // =========================================
    //   COMMAND PALETTE SYSTEM
    // =========================================
    const cmdOverlay = document.getElementById('cmd-overlay');
    const cmdInput = document.getElementById('cmd-input');
    const cmdResults = document.getElementById('cmd-results');
    const kbdHint = document.getElementById('kbd-hint');

    // Index content for search
    const searchIndex = [];
    document.querySelectorAll('.card-custom').forEach(card => {
        const title = card.querySelector('h5').innerText;
        const tag = card.querySelector('.exp-tag').innerText;
        const link = card.querySelector('.launch-link').href;
        searchIndex.push({ title: `${tag}: ${title}`, type: 'Experiment', link });
    });
    searchIndex.push({ title: 'Toggle Theme', type: 'Command', action: toggleTheme });
    searchIndex.push({ title: 'Go to GitHub', type: 'External', link: 'https://github.com/Amey-Thakur/WEB-DESIGNING-LAB' });

    let selectedIndex = 0;

    function openPalette() {
        cmdOverlay.classList.add('active');
        cmdInput.focus();
        renderResults("");
    }

    function closePalette() {
        cmdOverlay.classList.remove('active');
        cmdInput.value = "";
    }

    function renderResults(query) {
        cmdResults.innerHTML = "";
        const filtered = searchIndex.filter(item =>
            item.title.toLowerCase().includes(query.toLowerCase())
        );

        if (filtered.length === 0) {
            cmdResults.innerHTML = '<div class="cmd-item">No results found</div>';
            return;
        }

        filtered.forEach((item, index) => {
            const div = document.createElement('div');
            div.className = `cmd-item ${index === selectedIndex ? 'selected' : ''}`;
            div.innerHTML = `
                <span class="cmd-item-icon"><i class="${item.type === 'Experiment' ? 'fas fa-flask' : item.type === 'Command' ? 'fas fa-terminal' : 'fab fa-github'}"></i></span>
                <span class="cmd-item-text">${item.title}</span>
                <span class="cmd-item-type">${item.type}</span>
            `;
            div.onclick = () => executeItem(item);
            cmdResults.appendChild(div);
        });
    }

    function executeItem(item) {
        if (item.link) {
            window.location.href = item.link;
        } else if (item.action) {
            item.action();
            closePalette();
        }
    }

    // Keyboard controls
    document.addEventListener('keydown', (e) => {
        // Ctrl + K to open
        if (e.ctrlKey && e.key === 'k') {
            e.preventDefault();
            openPalette();
        }

        // T to toggle theme (only if palette is closed)
        if (!cmdOverlay.classList.contains('active') && e.key.toLowerCase() === 't') {
            const tag = e.target.tagName.toLowerCase();
            if (tag !== 'input' && tag !== 'textarea') {
                toggleTheme();
            }
        }

        if (cmdOverlay.classList.contains('active')) {
            const results = cmdResults.querySelectorAll('.cmd-item');
            if (e.key === 'Escape') closePalette();
            if (e.key === 'ArrowDown') {
                e.preventDefault();
                selectedIndex = (selectedIndex + 1) % results.length;
                renderResults(cmdInput.value);
            }
            if (e.key === 'ArrowUp') {
                e.preventDefault();
                selectedIndex = (selectedIndex - 1 + results.length) % results.length;
                renderResults(cmdInput.value);
            }
            if (e.key === 'Enter') {
                e.preventDefault();
                const filtered = searchIndex.filter(item =>
                    item.title.toLowerCase().includes(cmdInput.value.toLowerCase())
                );
                if (filtered[selectedIndex]) executeItem(filtered[selectedIndex]);
            }
        }
    });

    cmdInput.addEventListener('input', (e) => {
        selectedIndex = 0;
        renderResults(e.target.value);
    });

    cmdOverlay.addEventListener('click', (e) => {
        if (e.target === cmdOverlay) closePalette();
    });

    // Auto-hide kbd hint after 10 seconds or on interaction
    setTimeout(() => {
        if (kbdHint) kbdHint.classList.add('hidden');
    }, 10000);

    document.addEventListener('scroll', () => {
        if (kbdHint) kbdHint.classList.add('hidden');
    }, { once: true });

    // Register Service Worker
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('sw.js')
                .then(reg => console.log('[SW] Registered', reg))
                .catch(err => console.error('[SW] Registration failed', err));
        });
    }
});
