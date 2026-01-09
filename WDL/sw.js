/**
 * ================================================================
 *   Web Designing Lab (WDL) Portfolio - Service Worker
 * ================================================================
 *   Author: Amey Thakur
 *   GitHub: https://github.com/Amey-Thakur
 *   Course: Web Designing Lab (WDL)
 *   Roll No: 50
 *   Batch: B3
 *   Repository: https://github.com/Amey-Thakur/WEB-DESIGNING-LAB
 *   Year: 2020
 *   
 *   Description: Service Worker for PWA with offline support.
 * ================================================================
 */

const CACHE_NAME = 'wdl-portfolio-v1';
const OFFLINE_URL = 'offline.html';

const CORE_ASSETS = [
    './',
    'index.html',
    'script.js',
    'manifest.json',
    OFFLINE_URL,
    'assets/icon-192.png',
    'assets/icon-512.png',
    'assets/og-image.png'
];

self.addEventListener('install', (event) => {
    event.waitUntil(
        caches.open(CACHE_NAME)
            .then((cache) => cache.addAll(CORE_ASSETS))
            .then(() => self.skipWaiting())
    );
});

self.addEventListener('activate', (event) => {
    event.waitUntil(
        caches.keys().then((cacheNames) => {
            return Promise.all(
                cacheNames
                    .filter((name) => name !== CACHE_NAME)
                    .map((name) => caches.delete(name))
            );
        }).then(() => self.clients.claim())
    );
});

self.addEventListener('fetch', (event) => {
    if (event.request.method !== 'GET') return;

    event.respondWith(
        fetch(event.request)
            .catch(() => {
                return caches.match(event.request).then((cachedResponse) => {
                    if (cachedResponse) return cachedResponse;
                    if (event.request.mode === 'navigate') {
                        return caches.match(OFFLINE_URL);
                    }
                });
            })
    );
});
