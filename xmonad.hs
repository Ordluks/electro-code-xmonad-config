import XMonad
import XMonad.Util.Cursor (setDefaultCursor)
import XMonad.Util.EZConfig

terminalApp :: String
terminalApp = "kitty"

launcherApp :: String
launcherApp = "rofi -show drun -show-icons"

onStart :: X ()
onStart = do
  spawn "feh --no-fehbg --bg-scale $HOME/.config/xmonad/background.jpg"
  setDefaultCursor xC_arrow

main :: IO ()
main =
  xmonad $
    def
      { terminal = terminalApp,
        modMask = mod4Mask,
        borderWidth = 2,
        focusedBorderColor = "#6d399e",
        normalBorderColor = "#0e0e0e",
        startupHook = onStart
      }
      `additionalKeys` [((mod4Mask, xK_d), spawn launcherApp)]
