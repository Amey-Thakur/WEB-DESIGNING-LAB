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
    const loader = document.getElementById('loading-screen');

    // =========================================
    //   LOADING SCREEN HIDE
    // =========================================
    window.addEventListener('load', () => {
        setTimeout(() => {
            if (loader) loader.classList.add('hidden');
        }, 800);
    });

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
        link.addEventListener('click', (e) => {
            playCelebrateSound();
            if (link.id === 'practical-exam-link') {
                triggerConfetti();
            }
        });
    });

    function triggerConfetti() {
        if (typeof confetti === 'function') {
            confetti({
                particleCount: 150,
                spread: 70,
                origin: { y: 0.6 },
                colors: ['#2563eb', '#38bdf8', '#ffffff']
            });
        }
    }

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
    //   STATS COUNTER ANIMATION
    // =========================================
    const animateCounters = () => {
        const counters = document.querySelectorAll('.stat-number');
        const duration = 2000;

        counters.forEach(counter => {
            const target = +counter.getAttribute('data-target');
            const suffix = counter.getAttribute('data-suffix') || '';
            const startTime = performance.now();

            const updateCount = (currentTime) => {
                const elapsed = currentTime - startTime;
                const progress = Math.min(elapsed / duration, 1);
                const easeOut = 1 - Math.pow(1 - progress, 3);
                const current = Math.floor(easeOut * target);

                counter.innerText = current + suffix;

                if (progress < 1) {
                    requestAnimationFrame(updateCount);
                } else {
                    counter.innerText = target + suffix;
                }
            };
            requestAnimationFrame(updateCount);
        });
    };

    const statsSection = document.querySelector('.stats-container');
    if (statsSection) {
        const statsObserver = new IntersectionObserver((entries) => {
            if (entries[0].isIntersecting) {
                animateCounters();
                statsObserver.unobserve(statsSection);
            }
        }, { threshold: 0.5 });
        statsObserver.observe(statsSection);
    }

    // =========================================
    //   SHARE SYSTEM
    // =========================================
    let currentShareImageBlob = null;
    const shareModal = document.getElementById('share-modal');
    const sharePreview = document.getElementById('share-preview');
    const nativeShareBtn = document.getElementById('native-share-btn');

    window.shareResult = async (type, id) => {
        playCelebrateSound();
        shareModal.classList.add('active');
        sharePreview.innerHTML = '<div class="text-center p-5"><i class="fas fa-spinner fa-spin fa-2x"></i><p class="mt-2">Generating Preview...</p></div>';

        try {
            const target = id === 'portfolio' ? document.querySelector('.hero') : document.getElementById(id) || document.querySelector(`[onclick*="${id}"]`).closest('.card-custom');

            const canvas = await html2canvas(target, {
                backgroundColor: getComputedStyle(document.documentElement).getPropertyValue('--card-bg'),
                scale: 2,
                logging: false,
                useCORS: true
            });

            sharePreview.innerHTML = '';
            const img = document.createElement('img');
            img.src = canvas.toDataURL('image/png');
            sharePreview.appendChild(img);

            canvas.toBlob(blob => {
                currentShareImageBlob = blob;
            });

            if (navigator.share) {
                nativeShareBtn.style.display = 'block';
            }
        } catch (err) {
            console.error("Capture failed", err);
            sharePreview.innerHTML = '<p class="text-danger">Failed to generate preview.</p>';
        }
    };

    window.closeShareModal = () => {
        shareModal.classList.remove('active');
    };

    window.downloadShareImage = () => {
        if (!currentShareImageBlob) return;
        const url = URL.createObjectURL(currentShareImageBlob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `WDL_Lab_Result_Amey_Thakur_${Date.now()}.png`;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
    };

    window.copyShareLink = () => {
        const url = window.location.href;
        navigator.clipboard.writeText(url).then(() => {
            const btn = document.querySelector('button[onclick="copyShareLink()"]');
            const originalContent = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-check me-2"></i>Copied!';
            btn.classList.add('btn-success');

            setTimeout(() => {
                btn.innerHTML = originalContent;
                btn.classList.remove('btn-success');
            }, 2000);
        });
    };

    window.shareNative = async () => {
        if (navigator.share && currentShareImageBlob) {
            try {
                const file = new File([currentShareImageBlob], 'WDL_Portfolio_Result.png', { type: 'image/png' });
                await navigator.share({
                    title: 'WDL Lab Portfolio - Amey Thakur',
                    text: 'Check out this Web Designing Lab Portfolio showcasing responsive layouts, client-side logic, and full-stack web solutions!',
                    url: window.location.href,
                    files: [file]
                });
            } catch (err) {
                console.log('Error sharing:', err);
                // Fallback for browsers that support share but not files
                try {
                    await navigator.share({
                        title: 'WDL Lab Portfolio - Amey Thakur',
                        text: 'Check out this Web Designing Lab Portfolio showcasing responsive layouts, client-side logic, and full-stack web solutions!',
                        url: window.location.href
                    });
                } catch (e) { console.log('Share failed', e); }
            }
        } else {
            alert("Web Share API not supported on this device/browser.");
        }
    };


    // =========================================
    //   COMMAND PALETTE SYSTEM
    // =========================================
    const cmdOverlay = document.getElementById('cmd-overlay');
    const cmdInput = document.getElementById('cmd-input');
    const cmdResults = document.getElementById('cmd-results');
    const kbdHint = document.getElementById('kbd-hint');

    // Index content for search
    const searchIndex = [];
    document.querySelectorAll('.card-custom').forEach((card, idx) => {
        const title = card.querySelector('h5').innerText;
        const tag = card.querySelector('.exp-tag').innerText;
        const link = card.querySelector('.launch-link').href;
        searchIndex.push({ title: `${tag}: ${title}`, type: 'Experiment', link });
    });

    searchIndex.push({ title: 'Toggle Theme', type: 'Command', action: toggleTheme });
    searchIndex.push({ title: 'Share Portfolio', type: 'Command', action: () => window.shareResult('portfolio', 'portfolio') });
    searchIndex.push({ title: 'Go to GitHub', type: 'External', link: 'https://github.com/Amey-Thakur/WEB-DESIGNING-LAB' });

    // PWA Install Prompt Capture
    let deferredPrompt;
    window.addEventListener('beforeinstallprompt', (e) => {
        e.preventDefault();
        deferredPrompt = e;
        searchIndex.push({
            title: 'Install App', type: 'Command', action: () => {
                deferredPrompt.prompt();
                deferredPrompt.userChoice.then(() => { deferredPrompt = null; });
            }
        });
    });

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
        if (e.ctrlKey && e.key === 'k') {
            e.preventDefault();
            openPalette();
        }

        if (!cmdOverlay.classList.contains('active') && e.key.toLowerCase() === 't') {
            const tag = e.target.tagName.toLowerCase();
            if (tag !== 'input' && tag !== 'textarea') toggleTheme();
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

    // Auto-hide kbd hint
    setTimeout(() => { if (kbdHint) kbdHint.classList.add('hidden'); }, 10000);
    document.addEventListener('scroll', () => { if (kbdHint) kbdHint.classList.add('hidden'); }, { once: true });

    // Register Service Worker
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('sw.js')
                .then(reg => console.log('[SW] Registered', reg))
                .catch(err => console.error('[SW] Registration failed', err));
        });
    }
    // =========================================
    //   SIMPLE SHARE BUTTON HANDLER
    // =========================================
    const simpleShareBtn = document.getElementById('share-btn');
    if (simpleShareBtn && !simpleShareBtn.hasAttribute('onclick')) {
        simpleShareBtn.addEventListener('click', async () => {
            const shareData = {
                title: 'Web Designing Lab Portfolio — Amey Thakur',
                text: 'Web Designing Lab Portfolio — Amey Thakur. Explore responsive layouts, client-side logic, and full-stack web solutions!',
                url: window.location.href
            };

            try {
                await navigator.share(shareData);
            } catch (err) {
                // Fallback: Copy to clipboard
                const dummy = document.createElement('input');
                document.body.appendChild(dummy);
                dummy.value = window.location.href;
                dummy.select();
                document.execCommand('copy');
                document.body.removeChild(dummy);
                alert('Portfolio link copied to clipboard!');
            }
        });
    }
});
