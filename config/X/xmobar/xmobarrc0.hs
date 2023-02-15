Config { font = "xft:Ubuntu Mono:pixelsize=14:style=bold:antialias=true:hinting:=true"
      -- Only 1 font, so height automatic
      , position = BottomW C 16
      , bgColor = "#2e3440"
      , fgColor = "#2aa198"
      , lowerOnStart = True
      , pickBroadest = False
      , persistent = False
      , hideOnStart = False
      , overrideRedirect = True
      , wmName = "xmobar2"

      , commands = [
              Run StdinReader
      ]
      , sepChar = "%"
      , alignSep = "}{"

      , template = "}<fc=#eceff4> %StdinReader% </fc>{"}

