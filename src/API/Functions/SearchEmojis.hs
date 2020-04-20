-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchEmojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchEmojis = 
 SearchEmojis { input_language_code :: String, exact_match :: Bool, text :: String }  -- deriving (Show)

instance T.ToJSON SearchEmojis where
 toJSON (SearchEmojis { input_language_code = input_language_code, exact_match = exact_match, text = text }) =
  A.object [ "@type" A..= T.String "searchEmojis", "input_language_code" A..= input_language_code, "exact_match" A..= exact_match, "text" A..= text ]
-- searchEmojis SearchEmojis  { input_language_code :: String, exact_match :: Bool, text :: String } 



instance T.FromJSON SearchEmojis where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchEmojis" -> parseSearchEmojis v
  where
   parseSearchEmojis :: A.Value -> T.Parser SearchEmojis
   parseSearchEmojis = A.withObject "SearchEmojis" $ \o -> do
    input_language_code <- o A..: "input_language_code"
    exact_match <- o A..: "exact_match"
    text <- o A..: "text"
    return $ SearchEmojis { input_language_code = input_language_code, exact_match = exact_match, text = text }