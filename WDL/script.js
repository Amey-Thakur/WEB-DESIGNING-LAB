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

    if (toggleBtn) {
        toggleBtn.addEventListener('click', () => {
            const currentTheme = htmlElement.getAttribute('data-theme');
            const newTheme = currentTheme === 'light' ? 'dark' : 'light';
            htmlElement.setAttribute('data-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            if (themeIcon) updateIcon(newTheme, themeIcon);
        });
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

    // Register Service Worker
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('sw.js')
                .then(reg => console.log('[SW] Registered', reg))
                .catch(err => console.error('[SW] Registration failed', err));
        });
    }
});
