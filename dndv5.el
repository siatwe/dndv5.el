;;; dndv5.el --- Dungeon and Dragons V3 Elisp character sheet and functions
;;; Commentary: The character sheet and some functions for the
;;; Dungeon and Dragons pen & paper game rules for Elisp

;;; Code:

;;;
;;; VARIABLES
;;;

;;; General (writeable)
(defvar dndv5/w-general-name "Melbor" "The name of your character")
(defvar dndv5/w-general-race "Elf" "The race of your character")
(defvar dndv5/w-general-background "Einsiedler" "The background of your character")

;;; Base attributes (writeable)
(defvar dndv5/w-attributes-base-strength      8 "The strength of your character")
(defvar dndv5/w-attributes-base-dexterity    14 "The dexterity of your character")
(defvar dndv5/w-attributes-base-constitution 13 "The constitution of your character")
(defvar dndv5/w-attributes-base-intelligence 16 "The intelligence of your character")
(defvar dndv5/w-attributes-base-wisdom       12 "The wisom of your character")
(defvar dndv5/w-attributes-base-charisma     10 "The charisma of your character")

;;; Boni/Mali on attributes by race (writeable)
(defvar dndv5/w-attributes-bonimali-strength     0 "The boni/mali strength of your character by your race")
(defvar dndv5/w-attributes-bonimali-dexterity    2 "The dexterity of your character by your race")
(defvar dndv5/w-attributes-bonimali-constitution 0 "The constitution of your character by your race")
(defvar dndv5/w-attributes-bonimali-intelligence 2 "The intelligence of your character by your race")
(defvar dndv5/w-attributes-bonimali-wisdom       0 "The wisom of your character by your race")
(defvar dndv5/w-attributes-bonimali-charisma     0 "The charisma of your character by your race")

;;; Total attributes (readonly)
(defvar dndv5/r-attributes-total-strength
  (+ dndv5/attributes-base-strength dndv5/attributes-bonimali-strength)
  "The total strength of your character")
(defvar dndv5/r-attributes-total-dexterity
  (+ dndv5/attributes-base-dexterity dndv5/attributes-bonimali-dexterity)
  "The total dexterity of your character")
(defvar dndv5/r-attributes-total-constitution
  (+ dndv5/attributes-base-constitution dndv5/attributes-bonimali-constitution)
  "The total constitution of your character")
(defvar dndv5/r-attributes-total-intelligence
  (+ dndv5/attributes-base-intelligence dndv5/attributes-bonimali-intelligence)
  "The total intelligence of your character")
(defvar dndv5/r-attributes-total-wisdom
  (+ dndv5/attributes-base-wisdom dndv5/attributes-bonimali-wisdom)
  "The total wisdom of your character")
(defvar dndv5/r-attributes-total-charisma
  (+ dndv5/attributes-base-charisma dndv5/attributes-bonimali-charisma)
  "The total charisma of your character")

;;;

;;;
;;; FUNCTIONS
;;;
(defun dndv3/roll-dice (factor dice boni)
  "Roll the dice"
  (setq thrown-dice (+ (random dice) 1))
  (setq result (+ (* thrown-dice factor) boni))
  (setq status "")
  (if (eq dice thrown-dice)
      (setq status "*CRITICAL*")
    (if (eq 1 thrown-dice)
        (setq status "*BLUNDER*")))
  (princ (format "%dW%d\t+%d\n%d\t+%d\n= %d %s" factor dice boni thrown-dice boni result status)))

(defun dndv3/generate-life-checkboxes (max-life)
  "Generate checkboxes for each life point in Org-Mode"
  (setq i max-life)
  (while (>= i -10)
    (princ (format "- [ ] %d/%d\n" i max-life))
    (setq i (1- i))))



(provide 'pathfinder)
;;; pathfinder.el ends here
