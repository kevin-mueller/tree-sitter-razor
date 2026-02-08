;; ============================================================================
;; Razor Bracket Matching
;; ============================================================================

;; Curly Braces
("{" @open "}" @close)

;; Parentheses
("(" @open ")" @close)

;; Square Brackets
("[" @open "]" @close)

;; HTML Tags
((element
  "<" @open
  (_tag_name) @tag.open
  ">" @open.end) @container
 (#set! type "tag"))

((element
  "</" @close.start
  (_tag_name) @tag.close
  ">" @close) @container
 (#set! type "tag"))

;; Self-closing HTML tags
((element
  "<" @open
  (_tag_name) @tag
  "/>" @close) @container
 (#set! type "self_closing_tag"))
