
typeset -g  APOLLO_TL_LINK="╭─"
typeset -g  APOLLO_ML_LINK="├─"
typeset -g  APOLLO_SL_LINK="│ "
typeset -g  APOLLO_BL_LINK="╰─"
typeset -g  APOLLO_TR_LINK="─╮"
typeset -g  APOLLO_MR_LINK="─┤"
typeset -g  APOLLO_SR_LINK=" │"
typeset -g  APOLLO_BR_LINK="─╯"
typeset -g  APOLLO_NL_LINK="  "
typeset -g  APOLLO_LINK_COLOR="white"

typeset -ga _APOLLO_LEFT_LINK
typeset -ga _APOLLO_RIGHT_LINK

# Logic for adding link lines. Don't look it's ugly
_apollo_add_links() {

  local line line_index start
  local tl ml sl bl tr mr sr br nl

  if (( APOLLO_PROFILER > 0 )); then
    start="$EPOCHREALTIME"
  fi

  tl="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_TL_LINK}%f"
  ml="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_ML_LINK}%f"
  sl="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_SL_LINK}%f"
  bl="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_BL_LINK}%f"
  tr="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_TR_LINK}%f"
  mr="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_MR_LINK}%f"
  sr="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_SR_LINK}%f"
  br="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_BR_LINK}%f"
  nl="%F{${__APOLLO_COLORS[${APOLLO_LINK_COLOR}]}}${APOLLO_NL_LINK}%f"

  line_index="$1";

  for ((line=1;line<=line_index;line++)); do

    case "${_APOLLO_LINES_META[line]}" in
      3)
        case "$line" in
          "$line_index")
            _APOLLO_LEFT_LINK[line]="${bl}"; _APOLLO_RIGHT_LINK[line]="${br}"; ;;
          1)
            _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${tr}"; ;;
          *)
            case "${_APOLLO_LINES_META[line-1]}" in
              3)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${br}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${br}";;
                esac
                ;;
              2)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              1)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${tr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${tr}";;
                  1) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              0)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${tr}";;
                  2) _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${tr}";;
                  1) _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${tr}";;
                  0) _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${tr}";;
                esac
                ;;
            esac
            ;;
        esac
        ;;
      2)
        case "$line" in
          "$line_index")
            _APOLLO_PROMPT_LINES[line]="${_APOLLO_PROMPT_LINES[line]}${br}" ;;
          1)
            _APOLLO_LEFT_LINK[line]="${nl}"; _APOLLO_RIGHT_LINK[line]="${tr}"; ;;
          *)
            case "${_APOLLO_LINES_META[line-1]}" in
              3)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              2)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${nl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              1)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              0)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
            esac
            ;;
        esac
        ;;
      1)
        case "$line" in
          "$line_index")
            _APOLLO_LEFT_LINK[line]="${bl}" ;;
          1)
            _APOLLO_LEFT_LINK[line]="${tl}" ;;
          *)
            case "${_APOLLO_LINES_META[line-1]}" in
              3)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              2)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${tl}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              1)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
              0)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  2) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  1) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                  0) _APOLLO_LEFT_LINK[line]="${ml}"; _APOLLO_RIGHT_LINK[line]="${mr}";;
                esac
                ;;
            esac
            ;;
        esac
        ;;
      0)
        case "$line" in
          "$line_index")
            _APOLLO_LEFT_LINK[line]="${bl}" ;;
          1)
            _APOLLO_LEFT_LINK[line]="${tl}" ;;
          *)
            case "${_APOLLO_LINES_META[line-1]}" in
              3)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  2) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  1) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  0) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                esac
                ;;
              2)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  2) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  1) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  0) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                esac
                ;;
              1)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  2) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  1) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  0) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                esac
                ;;
              0)
                case "${_APOLLO_LINES_META[line+1]}" in
                  3) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  2) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  1) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                  0) _APOLLO_LEFT_LINK[line]="${sl}"; _APOLLO_RIGHT_LINK[line]="${sr}";;
                esac
                ;;
            esac
            ;;
        esac
    esac

  done

  if (( APOLLO_PROFILER > 0 )); then
    printf "%25s: %f\n" "line links" "$((EPOCHREALTIME-start))"
  fi

}

