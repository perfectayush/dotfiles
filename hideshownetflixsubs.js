// ==UserScript==
// @name         Show/Hide Netflix Subtitle with keyboard shortcut
// @namespace    http://tampermonkey.net/
// @version      0.2
// @description  Show/Hide netflix subtitle with keyboard shortcut. Press 'v' to hide/show subtitles
// @author       Ayush Goyal <perfectayush@gmail.com>
// @match        https://www.netflix.com/*
// @grant        none
// ==/UserScript==
'use strict';
(() => {
    const hidestyle = document.getElementById("hidestyle") || (function() {
        const style = document.createElement('style');
        style.type = 'text/css';
        style.id = "hidenetflixsub";
        document.head.appendChild(style);
        return style;
    })();
    const sheet = hidestyle.sheet;
    const hidecss = ".player-timedtext-text-container { display: none !important}";

    document.addEventListener('keydown', e => {
        if (e.keyCode !== 86) return;
        if (sheet.rules.length == 0) {
            sheet.insertRule(hidecss);
        } else {
            sheet.deleteRule(hidecss);
        }
    }, false);
})();
