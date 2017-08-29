// an example to create a new mapping `ctrl-y` //mapkey('<Ctrl-y>', 'Show me the money', function() {
//    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
//});

// an example to replace `u` with `?`, click `Default mappings` to see how `u` works.
//map('?', 'u');

// an example to remove mapkey `Ctrl-i`
//unmap('<Ctrl-i>');

// click `Save` button to make above settings to take effect.
// set theme

map('u', 'e');
mapkey('p', "Open the clipboard's URL in the current tab", function() {
    Front.getContentFromClipboard(function(response) {
        window.location.href = response.data;
    });
});


//mapkey('gx$', 'close tabs right', 'RUNTIME(closeTabsToRight)');
//mapkey('gx0', 'close tabs left', 'RUNTIME(closeTabsToLeft)');

showModeStatus	= false;
map('P', 'cc');
map('gi', 'i');
map('F', 'af');
map('gf', 'w');
// save default key `t` to temp key `>_t`
//map('o', 't');
map('H', 'S');
map('L', 'D');
map('gt', 'R');
map('gT', 'E');
map('K', 'R');
map('J', 'E');

mapkey("'","#10Jump to vim-like-mark quickly", function(mark) {
    Normal.jumpVIMark(mark.toUpperCase());
});

mapkey("<Ctrl-'>", '#10Jump to vim-like mark in new tab.', function(mark) {
    Normal.jumpVIMark(mark.toUpperCase(), true);
});
mapkey("`","#10Jump to vim-like-mark", Normal.jumpVIMark);

aceVimMap('jk', '<Esc>', 'insert');

command('jira', '#14Go to jira ticket', function(args){
    tabOpenLink("https://helpshift.atlassian.net/browse/" + args);
});

var base00= "#1d1f21";
var base01= "#282a2e";
var base02= "#373b41";
var base03= "#969896";
var base04= "#b4b7b4";
var base05= "#c5c8c6";
var base06= "#e0e0e0";
var base07= "#ffffff";
var base08= "#cc6666";
var base09= "#de935f";
var base0A= "#f0c674";
var base0B= "#b5bd68";
var base0C= "#8abeb7";
var base0D= "#81a2be";
var base0E= "#b294bb";
var base0F= "#a3685a";

Visual.style('marks', 'background-color: ${base0C};');
Visual.style('cursor', 'background-color: ${base09};');
Hints.style(`color:${base00}; background: ${base0A}; font-size: 9pt`);

settings.theme = `
.sk_theme {
    background: ${base02};
    color: ${base06};
}

.sk_theme .prompt {
    color: ${base06};
}
.sk_theme input {
    color: ${base0A};
}

.sk_theme ul > li > .title {
    color: ${base06};
}

.sk_theme ul > li > .url {
    color: ${base06};
}

.sk_theme .focused {
    background: ${base05} !important;
}

.sk_theme ul > li.focused > .title,
.sk_theme ul > li.focused > .url {
    color: ${base02};
}

#sk_omnibar > #sk_omnibarSearchResult > ul > li:nth-child(odd) {
    background: ${base02};
}


.sk_theme .url {
    color: ${base06};
}
.sk_theme .annotation {
    color: ${base06};
}

.sk_theme .omnibar_highlight {
    color: ${base08};
}

.sk_theme .omnibar_folder {
    color: ${base0D};
}
.sk_theme .omnibar_timestamp {
    color: ${base09};
}

.sk_theme .omnibar_visitcount {
    color: ${base0C};
}
#sk_richKeystroke {
    z-index: 2147483001;
    position: absolute;
    background: ${base02};
    max-width: 18%;
    bottom: -4px;
    right: -4px;
    padding: 4px 20px 8px 4px;
    border: 3px solid ${base06};
    // border-radius: 16px;
}

#sk_richKeystroke kbd{
    background: ${base06};
}

#sk_richKeystroke kbd>.candidates{
    color: ${base0F};
}`
;
