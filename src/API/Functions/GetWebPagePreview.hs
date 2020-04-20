-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetWebPagePreview where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

--main = putStrLn "ok"

data GetWebPagePreview = 
 GetWebPagePreview { text :: FormattedText.FormattedText }  -- deriving (Show)

instance T.ToJSON GetWebPagePreview where
 toJSON (GetWebPagePreview { text = text }) =
  A.object [ "@type" A..= T.String "getWebPagePreview", "text" A..= text ]
-- getWebPagePreview GetWebPagePreview  { text :: FormattedText.FormattedText } 

