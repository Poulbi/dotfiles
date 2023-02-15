Config { font = "xft:Ubuntu Mono:pixelsize=14:style=bold:antialias=true:hinting:=true"
      , additionalFonts = [
        "xft:Mononoki Nerd Font Mono:style=bold:pixelsize=24:antialias=true:hinting=true",
        "xft:Mononoki Nerd Font Mono:style=bold:pixelsize=24:antialias=false:hinting=true"
      ]
      , position = TopH 24
      , borderColor = "#2e3440"
      , borderWidth = 2
      , border = BottomB
      , bgColor = "#2e3440"
      , fgColor = "#2aa198"
      , lowerOnStart = True
      , pickBroadest = False
      , persistent = False
      , hideOnStart = False
      , iconRoot = "/home/aluc/.config/xmobar/icons"
      , overrideRedirect = True
      , commands = [ Run Cpu [ "-t",         "<total>%"
                              ,"-l",         "#2e3440,#58e1ac"
                              ,"-L",         "20"
                              ,"-n",         "#4c566a,#58e1ac"
                              ,"-h",         "#cb4b16,#58e1ac"
                              ,"-H",         "50"
                              ,"-w",         "3"
                              ] 10

                    , Run Memory ["-t",          "<usedratio>%"
                                 ,"-l",          "#2e3440,#58e1ac"
                                 ,"-L",          "20"
                                 ,"-n",          "#4c566a,#58e1ac"
                                 ,"-h",          "#cb4b16,#58e1ac"
                                 ,"-H",          "50"
                                 ,"-w",          "2"
                                 ] 10

                    -- Focused window info
                    , Run Com "/home/aluc/.config/xmobar/scripts/winfo" ["-n"] "FWname" 3
                    , Run Com "/home/aluc/.config/xmobar/scripts/winfo" ["-t"] "FWtitle" 3
                    , Run Com "/home/aluc/.config/xmobar/scripts/winfo" ["-i"] "FWicon" 3
                    , Run Com "/home/aluc/.config/xmobar/scripts/checkupds" ["-i"] "updates" 3600
                    -- , Run ComX "$HOME/bin/cmusP" [] "" "cmus" 1
                    , Run Com "uname" ["-r"] "" 36000
                    , Run Date "<fn=1>\xf073</fn> %b %_d %Y - %H:%M:%S" "date" 10
                    , Run PipeReader "/home/aluc/.config/xmobar/scripts/volume-pipe" "vol"
                    ]
      , sepChar = "%"
      , alignSep = "}{"


        -- COLORS 
        -- #2aa198  : Blue/green    -- fg
        --
        -- #d08770  : pinkish brown -- memory
        -- #ff00ff  : pink/purple   -- swap
        -- #828be6  : perrywinkle   -- FWname
        -- #825be6  : purpley       -- FWtitle
        -- bgColor = "#2e3440"
        -- fgColor = "#2aa198"
        -- #58e1ac

      , template = " \
      -- Left

      \<fc=#b48ead,#2e3440><fn=2></fn></fc>\
      \<fc=#2e3440,#b48ead>\
      \<box type=VBoth width=4 color=#b48ead>\
      \ <fn=1></fn> %uname% \
      \</box>\
      \</fc>\
      \<fc=#2e3440,#b48ead><fn=2></fn></fc>\

      \<fc=#58e1ac,#2e3440><fn=2></fn></fc>\
      \<fc=#2e3440,#58e1ac>\
      \<box type=VBoth width=4 color=#58e1ac>\
      \ %vol% \
      \</box>\
      \</fc>\
      \<fc=#2e3440,#58e1ac><fn=2></fn></fc>\
      
      \<fc=#88c0d0,#2e3440><fn=2></fn></fc>\
      \<fc=#2e3440,#88c0d0>\
      \<box type=VBoth width=4 color=#88c0d0>\
      \<action=`dmenu_run` button=1>\
      \ dmenu \
      \</action>\
      \</box>\
      \</fc>\
      \<fc=#88c0d0><fn=2></fn></fc>\


      -- Centered
      \}\
      \<fc=#ebcb8b,#2e3440><fn=2></fn></fc>\
      \<fc=#4c566a,#ebcb8b>\
      \<box type=VBoth width=4 color=#ebcb8b>\
      \ %FWicon% \
      \</box>\
      \</fc>\
      \<fc=#4c566a,#ebcb8b>\
      \<box type=VBoth width=4 color=#ebcb8b>\
      \%FWname% \
      \</box>\
      \</fc>\
      \<fc=#b48ead,#ebcb8b>\
      \<box type=VBoth width=4 color=#ebcb8b>\
      \<box type=Bottom width=2 mb=3 color=#b48ead>\
      \%FWtitle%\
      \</box>\
      \</box>\
      \</fc>\
      \<fc=#2e3440,#ebcb8b><fn=2> </fn></fc>\
      \<fc=#ebcb8b,#2e3440><fn=2></fn></fc>\

      
      -- Right
      \{ \

      \<fc=#88c0d0,#2e3440><fn=2></fn></fc>\
      \<fc=#2e3440,#88c0d0>\
      \<box type=VBoth width=4 color=#88c0d0>\
      \ %updates% <fn=1></fn>\
      \</box>\
      \</fc>\
      \<fc=#88c0d0><fn=2></fn></fc>\

      \<fc=#2e3440,#58e1ac><fn=2></fn></fc>\
      \<fc=#2e3440,#58e1ac>\
      \<box type=VBoth width=4 color=#58e1ac>\
      \ <fn=1></fn>%cpu% \
      \</box>\
      \<fc=#2e3440,#58e1ac>\
      \<box type=VBoth width=4 color=#58e1ac>\
      \%memory% \
      \</box>\
      \</fc>\
      \</fc>\
      \<fc=#58e1ac><fn=2></fn></fc>\

      \<fc=#2e3440,#b48ead><fn=2></fn></fc>\
      \<fc=#2e3440,#b48ead>\
      \<box type=VBoth width=4 color=#b48ead>\
      \ %date% \
      \</box>\
      \</fc>\
      \<fc=#b48ead><fn=2></fn></fc> "

       }


