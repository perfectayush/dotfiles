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

document.addEventListener('keydown', e => {
  if(e.keyCode !== 86) return;

  const subtitle = document.querySelector('.player-timedtext-text-container');
  subtitle.style.display = (subtitle.style.display === 'none') ? 'block' : 'none';
}, false);
