// ==UserScript==
// @name         Show/Hide Netflix Subtitle with keyboard shortcut
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Show/Hide netflix subtitle with keyboard shortcut. Press 'v' to hide/show subtitles
// @author       Ayush Goyal <perfectayush@gmail.com>
// @match        https://www.netflix.com/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    function hideSubtitle(){
        var hidecss = ".player-timedtext-text-container { display: none !important}";
        if ((typeof document.subtitleVisible == "undefined") || document.subtitleVisible === true) {
            document.styleSheets[0].insertRule(hidecss);
            document.subtitleVisible = false;
        } else
        {
            document.styleSheets[0].removeRule(hidecss);
            document.subtitleVisible = true;
        }
    }
    document.addEventListener('keydown', function(e) {
        if (e.keyCode == 86 && !e.shiftKey && !e.ctrlKey && !e.altKey && !e.metaKey) {
            hideSubtitle();
        }
    }, false);
})();
