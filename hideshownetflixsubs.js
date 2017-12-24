// ==UserScript==
// @name         Show/Hide Netflix Subtitle with keyboard shortcut
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Show/Hide netflix subtitle with keyboard shortcut. Press 'v' to hide/show subtitles
// @author       Ayush Goyal <perfectayush@gmail.com>
// @match        https://www.netflix.com/*
// @grant        none
// ==/UserScript==
'use strict';
(() => {
  const hidecss = ".player-timedtext-text-container { display: none !important}";
  let isSubtitleVisible = true;

  document.addEventListener('keydown', e => {
      if (e.keyCode !== 86) return;
  
      if (isSubtitleVisible) {
              document.styleSheets[0].insertRule(hidecss);
              isSubtitleVisible = false;
          } else {
              document.styleSheets[0].removeRule(hidecss);
              isSubtitleVisible = true;
          }
    }, false);
})();
