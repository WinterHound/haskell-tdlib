-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.BackgroundType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundFill as BackgroundFill

--main = putStrLn "ok"

data BackgroundType = 
 BackgroundTypeWallpaper { is_moving :: Bool, is_blurred :: Bool }  
 | BackgroundTypePattern { is_moving :: Bool, intensity :: Int, fill :: BackgroundFill.BackgroundFill }  
 | BackgroundTypeFill { fill :: BackgroundFill.BackgroundFill }  -- deriving (Show)

instance T.ToJSON BackgroundType where
 toJSON (BackgroundTypeWallpaper { is_moving = is_moving, is_blurred = is_blurred }) =
  A.object [ "@type" A..= T.String "backgroundTypeWallpaper", "is_moving" A..= is_moving, "is_blurred" A..= is_blurred ]

 toJSON (BackgroundTypePattern { is_moving = is_moving, intensity = intensity, fill = fill }) =
  A.object [ "@type" A..= T.String "backgroundTypePattern", "is_moving" A..= is_moving, "intensity" A..= intensity, "fill" A..= fill ]

 toJSON (BackgroundTypeFill { fill = fill }) =
  A.object [ "@type" A..= T.String "backgroundTypeFill", "fill" A..= fill ]
-- backgroundTypeWallpaper BackgroundType  { is_moving :: Bool, is_blurred :: Bool } 

-- backgroundTypePattern BackgroundType  { is_moving :: Bool, intensity :: Int, fill :: BackgroundFill.BackgroundFill } 

-- backgroundTypeFill BackgroundType  { fill :: BackgroundFill.BackgroundFill } 

