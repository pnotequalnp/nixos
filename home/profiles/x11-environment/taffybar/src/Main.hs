module Main where

import System.Taffybar (startTaffybar)
import System.Taffybar.Context (defaultTaffybarConfig)

main :: IO ()
main = startTaffybar defaultTaffybarConfig
