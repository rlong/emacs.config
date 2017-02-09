

Web Resources
=============

+ http://lpn.rnbhq.org/tools/xemacs/emacs_ref.html
+ http://www.cs.williams.edu/~kim/cs136/s04/emacs.html

Basic Control
-------------

### process ###

+ `C-x C-q`: quit

### basic ###

+ `C-g` : cancel pending/partial command 
+ `C-x z` : repeat last command

### files ###

+ `C-x C-s` : save current buffer to it's associated file
+ `C-x C-f` : load a file into a buffer


### navigating ###

+ `C-b`: back one character
+ `C-f`: forward one character
+ `C-p`: previous line 
+ `C-n`: next line 
+ `C-v`: page down
+ `M-v`: page up
+ `M-<`: beginning of the document
+ `M->`: end of the document


### editing ###

+ `C-_`: undo

+ `del`: delete previous character
+ `M-del`: delete prevous word

+ `C-d`: delete next character
+ `M-d`: delete next word

+ `C-k`: kill (cut) to the end of the line 
+ `C-S-del`: kill whole line

+ `M-/`: auto complete

+ `M-l`: lower case


### search / replace ###

C-s : search forward
C-r : search backward
M-% : replace

### kill (cut) / paste (yank) ###

C-<SPACE> : mark beginning of area for kill (mark beginning of a cut) 
M-w : copy from current position to position marked by C-SPACE
C-w : kill (cut) from current position to position marked by C-SPACE
C-y : yank (paste)
M-y : yank previous copies/kills (after C-y)
 
### frames ###

M-x make-frame <Return> : create a new frame appear on your 
M-x delete-frame <Return> : removes the selected frame.

### minor modes ###

M-x auto-fill-mode <Return> : enable auto fill (word wrap) mode
M-q : auto fill a paragraph while in auto fill mode


### Help ###

* `C-h k`: get the help on a particular emacs key command (which is entered after `C-h k`)

### references ###

* <https://www.hackerschool.com/blog/11-exploring-emacs>
* <http://stackoverflow.com/questions/259354/goto-file-in-emacs>


Buffers
-------


+ `C-x b`: switch to named buffer
+ `C-x C-b`: list buffers
+ `M-x` revert-buffer RET yes RET : revert the current buffer

+ `g`: refresh
+ `d`: mark for (buffer) deletion 
+ `x`: commit (buffer) saves/deletes


### \*Buffer List\* ###


+ `C-x C-b`: open \*Buffer List\* in another window 
+ `M-x buffer-menu`: open \*Buffer List\* in this window
+ `T`: toggle hiding of non-file based buffers

references:
* <http://www.gnu.org/software/emacs/manual/html_node/emacs/Several-Buffers.html>


dired
-----


+ `M-x dired-jump`: open a file in `dired`
+ `C-x C-j`: open a file in `dired`

+ `^`: go to a directories parent

+ `+`: create a directory
+ `R`: rename a file

Finding Files and URLs at Point (FFAP)
--------------------------------------

+ `M-x ffap-bindings`: enable FFAP

+ `C-x C-f filname <RET>`: Find filename, guessing a default from text around point

references:

* https://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html

Markdown Mode
-------------


### Headers ###

+ `C-c C-t h`: header at the current level
+ `C-c C-t H`: header at the current level (setext/underlined style)
+ `C-u C-c C-t h`: header at the next higher level
+ `C-u C-u C-c C-t h`: header at the next lower level

### Lists ###

+ `M-RET`: new list item

### Other ###

+ `C-c -`: Horizontal Rule

### References ###

+ http://jblevins.org/projects/markdown-mode/


Window Control
--------------


C-x 0 : kill this window
C-x 1 : kill all other windows except this one 
C-x 2 : split window into 2 (horizontally)
C-x 3 : split window into 2 (vertically)
C-x o : switch to other window

M-x } : enlarge-window-horizontally
M-x { : shrink-window-horizontally


Bookmarks
---------

C-x r b : jump to bookmark
C-x r m : create a bookmark for the current location
C-x r m bookmark <RET> : create a bookmark for the current location
with the specified name
C-x r l : List all bookmarks

working with bookmarks:

* `r`: rename 

Base64
------

<http://www.gnu.org/software/emacs/manual/html_node/elisp/Base-64.html>

base64-encode-region
base64-decode-region

Evaluate
--------

+ `C-x C-e`: evaluate S-expression
+ `M-:`: enter S-expression in the minibuffer and evaulate it
+ `M-x eval-buffer`: evaluate the buffer

Calculator
----------


### Starting/Stopping ###

+ `C-x * c`: start/stop the calculator
+ `C-x * *`: start/stop the calculator
+ `q`: quit the calculator


### Bases ###

+ hexadecimal numbers are prepended with `16#`, e.g. `16#f`
+ `d r 16`: displays as base 16
+ `d 6`: displays as base 16 
+ `d 2`: displays as base 2
+ `d 0`: displays as base 10

### Other ###

+ `C-x * 0`: reset the calculator


+ <http://stackoverflow.com/questions/1859798/how-can-i-convert-hexadecimal-to-decimal-numbers-in-calc-of-emacs>

Meta-Key setup on OSX `Terminal.app`
------------------------------------

+ open `Terminal.app`
+ open `Preferences`
+ open `Settings` tab
+ open `Keyboard`
+ turn on *Use option as meta key*

References:
+ <http://stackoverflow.com/questions/3562845/how-do-you-send-meta-key-over-ssh-on-mac>

Customising Emacs
-----------------

### Replace \*Buffer List\* with \*Buffer Menu\*

+ from <http://www.gnu.org/software/emacs/emacs-\
lisp-intro/html_node/Keybindings.html>

`
;;; Rebind `C-x C-b' from `buffer-list` to `buffer-menu'
(global-set-key "\C-x\C-b" 'buffer-menu)
`


`C-u C-x C-b` will now list all open files (all buffers that are backed by files).


Calendar
--------

* `M-x calendar`: open the calendar


Finding Files and URLs at Point
-------------------------------

+ `M-x ffap`: find file at point
+ `C-x C-f filename <RET>`: open file at point
+ `C-x C-d directory <RET>`: start Dired on directory

