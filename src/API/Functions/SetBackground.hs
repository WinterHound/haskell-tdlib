-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType
import {-# SOURCE #-} qualified API.InputBackground as InputBackground

--main = putStrLn "ok"

data SetBackground = 
 SetBackground { for_dark_theme :: Bool, _type :: BackgroundType.BackgroundType, background :: InputBackground.InputBackground }  -- deriving (Show)

instance T.ToJSON SetBackground where
 toJSON (SetBackground { for_dark_theme = for_dark_theme, _type = _type, background = background }) =
  A.object [ "@type" A..= T.String "setBackground", "for_dark_theme" A..= for_dark_theme, "type" A..= _type, "background" A..= background ]
-- setBackground SetBackground  { for_dark_theme :: Bool, _type :: BackgroundType.BackgroundType, background :: InputBackground.InputBackground } 

