-- base
import XMonad
import qualified XMonad.StackSet as W
import System.Posix.Env (getEnv)
import System.IO

-- data
import Data.Maybe (maybe)

-- actions
import XMonad.Actions.CopyWindow (kill1)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.WindowGo (runOrRaise)

-- utilities
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.Dmenu
import XMonad.Util.EZConfig (additionalKeysP)

-- hooks
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat, doCenterFloat)

-- colors
import Colors.Dracula

-- layouts
import XMonad.Layout.Accordion
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Fullscreen

-- layout modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.Magnifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ShowWName
import XMonad.Layout.Simplest
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.WindowNavigation
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

-- variables
myFont :: String
myFont = "xft:BlexMono Nerd Font:style=Text,Regular"

myModMask :: KeyMask
myModMask = mod4Mask        -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "alacritty"    -- Sets default terminal

myBrowser :: String
myBrowser = "firefox"  -- Sets qutebrowser as browser

myEditor :: String
myEditor = myTerminal ++ " -e vim "    -- Sets vim as editor

myBorderWidth :: Dimension
myBorderWidth = 2           -- Sets border width for windows

myWindowSpace :: Integer
myWindowSpace = 5

myNormColor :: String       -- Border color of normal windows
myNormColor   = colorBack   -- This variable is imported from Colors.THEME

myFocusColor :: String      -- Border color of focused windows
myFocusColor  = color05     -- This variable is imported from Colors.THEME


myStartupHook :: X ()
myStartupHook = do
    spawnOnce "picom &"
    spawnOnce "nm-applet &"
    spawnOnce "nitrogen --restore &"   -- if you prefer nitrogen to feh

--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.
-- https://gitlab.com/dwt1/dotfiles/-/blob/master/.xmonad/xmonad.hs
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Defining a bunch of layouts, many that I don't use.
-- limitWindows n sets maximum number of windows displayed for layout.
-- mySpacing n sets the gap size around the windows.
tall     = renamed [Replace "tall"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 12
           $ mySpacing myWindowSpace
           $ ResizableTall 1 (3/100) (1/2) []
magnify  = renamed [Replace "magnify"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ magnifier
           $ limitWindows 12
           $ mySpacing myWindowSpace
           $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 20 Full
floats   = renamed [Replace "floats"]
           $ smartBorders
           $ limitWindows 20 simplestFloat
grid     = renamed [Replace "grid"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 12
           $ mySpacing myWindowSpace
           $ mkToggle (single MIRROR)
           $ Grid (16/10)
spirals  = renamed [Replace "spirals"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ mySpacing' myWindowSpace
           $ spiral (6/7)
threeCol = renamed [Replace "threeCol"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 7
           $ ThreeCol 1 (3/100) (1/2)
threeRow = renamed [Replace "threeRow"]
           $ smartBorders
           $ windowNavigation
           $ addTabs shrinkText myTabTheme
           $ subLayout [] (smartBorders Simplest)
           $ limitWindows 7
           -- Mirror takes a layout and rotates it by 90 degrees.
           -- So we are applying Mirror to the ThreeCol layout.
           $ Mirror
           $ ThreeCol 1 (3/100) (1/2)
tabs     = renamed [Replace "tabs"]
           -- I cannot add spacing to this layout because it will
           -- add spacing between window and tabs which looks bad.
           $ tabbed shrinkText myTabTheme
tallAccordion  = renamed [Replace "tallAccordion"]
           $ Accordion
wideAccordion  = renamed [Replace "wideAccordion"]
           $ Mirror Accordion

-- setting colors for tabs layout and tabs sublayout.
myTabTheme = def { fontName            = myFont
                 , activeColor         = color15
                 , inactiveColor       = color08
                 , activeBorderColor   = color15
                 , inactiveBorderColor = colorBack
                 , activeTextColor     = colorBack
                 , inactiveTextColor   = color16
                 }

myLayoutHook = avoidStruts $ windowArrange $ T.toggleLayouts floats 
                $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
                where
                  myDefaultLayout = withBorder myBorderWidth tall
                                  ||| magnify
                                  ||| noBorders monocle
                                  ||| noBorders monocle
                                  ||| floats
                                  ||| noBorders tabs
                                  ||| grid
                                  ||| spirals
                                  ||| threeCol
                                  ||| threeRow
                                  ||| tallAccordion
                                  ||| wideAccordion

-- keyboard shortcuts
myKeys :: [(String, X ())]
myKeys = 
        [
        ("M-C-r", spawn "xmonad --recompile")       -- Recompiles xmonad
        , ("M-S-r", spawn "xmonad --restart")         -- Restarts xmonad


        -- KB_GROUP shortcuts to useful programs
        , ("M-<Return>", spawn (myTerminal))
        , ("M-b", spawn (myBrowser))

        -- KB_GROUP Kill windows
        , ("M-S-c", kill1)     -- Kill the currently focused client
        , ("M-S-a", killAll)   -- Kill all windows on current workspace

        -- KB_GROUP Floating windows
        , ("M-f", sendMessage (T.Toggle "floats")) -- Toggles my 'floats' layout
        , ("M-t", withFocused $ windows . W.sink)  -- Push floating window back to tile
        , ("M-S-t", sinkAll)                       -- Push ALL floating windows to tile

        -- KB_GROUP Increase/decrease spacing (gaps)
        , ("C-M1-j", decWindowSpacing 4)         -- Decrease window spacing
        , ("C-M1-k", incWindowSpacing 4)         -- Increase window spacing
        , ("C-M1-h", decScreenSpacing 4)         -- Decrease screen spacing
        , ("C-M1-l", incScreenSpacing 4)         -- Increase screen spacing

        -- KB_GROUP Windows navigation
        , ("M-m", windows W.focusMaster)  -- Move focus to the master window
        , ("M-j", windows W.focusDown)    -- Move focus to the next window
        , ("M-k", windows W.focusUp)      -- Move focus to the prev window
        , ("M-S-m", windows W.swapMaster) -- Swap the focused window and the master window
        , ("M-S-j", windows W.swapDown)   -- Swap focused window with next window
        , ("M-S-k", windows W.swapUp)     -- Swap focused window with prev window
        , ("M-<Backspace>", promote)      -- Moves focused window to master, others maintain order
        , ("M-S-<Tab>", rotSlavesDown)    -- Rotate all windows except master and keep focus in place
        , ("M-C-<Tab>", rotAllDown)       -- Rotate all the windows in the current stack

        -- KB_GROUP Layouts
        , ("M-<Tab>", sendMessage NextLayout)           -- Switch to next layout
        , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full

        -- KB_GROUP Increase/decrease windows in the master pane or the stack
        , ("M-S-<Up>", sendMessage (IncMasterN 1))      -- Increase # of clients master pane
        , ("M-S-<Down>", sendMessage (IncMasterN (-1))) -- Decrease # of clients master pane
        , ("M-C-<Up>", increaseLimit)                   -- Increase # of windows
        , ("M-C-<Down>", decreaseLimit)                 -- Decrease # of windows

        -- KB_GROUP Window resizing
        , ("M-h", sendMessage Shrink)                   -- Shrink horiz window width
        , ("M-l", sendMessage Expand)                   -- Expand horiz window width
        , ("M-M1-j", sendMessage MirrorShrink)          -- Shrink vert window width
        , ("M-M1-k", sendMessage MirrorExpand)          -- Expand vert window width

        -- KB_GROUP Multimedia Keys
        , ("<XF86AudioPlay>", spawn "mocp --play")
        , ("<XF86AudioPrev>", spawn "mocp --previous")
        , ("<XF86AudioNext>", spawn "mocp --next")
        , ("<XF86AudioMute>", spawn "amixer set Master toggle")
        , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
        , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")

        ]


main = do
    -- xmproc <- spawnPipe ("xmobar -x 0 $HOME/.config/xmobar/" ++ colorScheme ++ "-xmobarrc")
    xmproc <- spawnPipe ("xmobar")
    xmonad $ def
        { modMask            = myModMask
        , handleEventHook    = docksEventHook
        , terminal           = myTerminal
        , startupHook        = myStartupHook
        , borderWidth        = myBorderWidth
        , layoutHook         = myLayoutHook
        , logHook            = dynamicLogWithPP xmobarPP
                               { ppOutput = hPutStrLn xmproc
                                 , ppTitle = xmobarColor color03 "" . shorten 50
                                 , ppCurrent = xmobarColor color06 "" . wrap
                                   ("<box type=Bottom width=2 mb=2 color=" ++ color06 ++ ">") "</box>"
                               }
        , normalBorderColor  = myNormColor
        , focusedBorderColor = myFocusColor
        } `additionalKeysP` myKeys



