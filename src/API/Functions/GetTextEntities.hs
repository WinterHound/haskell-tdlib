-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTextEntities where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, URLs, and email addresses) contained in the text. Can be called synchronously 
-- 
-- __text__ The text in which to look for entites
data GetTextEntities = 

 GetTextEntities { text :: Maybe String }  deriving (Eq)

instance Show GetTextEntities where
 show GetTextEntities { text=text } =
  "GetTextEntities" ++ cc [p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetTextEntities where
 toJSON GetTextEntities { text = text } =
  A.object [ "@type" A..= T.String "getTextEntities", "text" A..= text ]

instance T.FromJSON GetTextEntities where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTextEntities" -> parseGetTextEntities v
   _ -> mempty
  where
   parseGetTextEntities :: A.Value -> T.Parser GetTextEntities
   parseGetTextEntities = A.withObject "GetTextEntities" $ \o -> do
    text <- o A..:? "text"
    return $ GetTextEntities { text = text }
 parseJSON _ = mempty
