-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackStrings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.LanguagePackString as LanguagePackString

--main = putStrLn "ok"

data LanguagePackStrings = 
 LanguagePackStrings { strings :: [LanguagePackString.LanguagePackString] }  -- deriving (Show)

instance T.ToJSON LanguagePackStrings where
 toJSON (LanguagePackStrings { strings = strings }) =
  A.object [ "@type" A..= T.String "languagePackStrings", "strings" A..= strings ]
-- languagePackStrings LanguagePackStrings  { strings :: [LanguagePackString.LanguagePackString] } 

