" Vim syntax file
" Language: HTML (version 5)
" URL:	    https://github.com/othree/html5.vim

" new version 5 tags
syn keyword htmlTagName contained article aside audio canvas command datalist
syn keyword htmlTagName contained details dialog embed figcaption figure footer
syn keyword htmlTagName contained header hgroup keygen mark meter menu nav
syn keyword htmlTagName contained output progress time ruby rt rp section source
syn keyword htmlTagName contained summary time track video wbr bdi

" arguments
" - core attributes
syn keyword htmlArg contained accesskey class contenteditable contextmenu dir
syn keyword htmlArg contained draggable hidden id lang spellcheck style tabindex
syn keyword htmlArg contained title translate
" - event-handler attributes
syn keyword htmlArg contained onabort onblur oncanplay oncanplaythrough onchange
syn keyword htmlArg contained onclick oncontextmenu ondblclick ondrag ondragend
syn keyword htmlArg contained ondragenter ondragleave ondragover ondragstart
syn keyword htmlArg contained ondrop ondurationchange onemptied onended onerror
syn keyword htmlArg contained onfocus onformchange onforminput oninput oninvalid
syn keyword htmlArg contained onkeydown onkeypress onkeyup onload onloadeddata
syn keyword htmlArg contained onloadedmetadata onloadstart onmousedown
syn keyword htmlArg contained onmousemove onmouseout onmouseover onmouseup
syn keyword htmlArg contained onmousewheel onpause onplay onplaying onprogress
syn keyword htmlArg contained onratechange onreadystatechange onscroll onseeked
syn keyword htmlArg contained onseeking onselect onshow onstalled onsubmit
syn keyword htmlArg contained onsuspend ontimeupdate onvolumechange onwaiting
" - xml attributes
syn keyword htmlArg contained xml:lang xml:space xml:base xmlns
" - body
syn keyword htmlArg contained onafterprint onbeforeprint onbeforeunload onblur
syn keyword htmlArg contained onerror onfocus onhashchange onload onmessage
syn keyword htmlArg contained onoffline ononline onpopstate onredo onresize
syn keyword htmlArg contained onstorage onundo onunload
" - video, audio, source, track
syn keyword htmlArg contained autoplay preload controls loop poster media kind
syn keyword htmlArg contained charset srclang track
" - form, input, button
syn keyword htmlArg contained form autocomplete autofocus list min max step
syn keyword htmlArg contained formaction autofocus formenctype formmethod
syn keyword htmlArg contained formtarget formnovalidate required placeholder
" - command, details, time
syn keyword htmlArg contained label icon open datetime pubdate
" - script
syn keyword htmlArg contained async
" - data attributes
syn match   htmlArg "\<\(data\(\-[a-z]\+\)\+\)\=\>" contained
