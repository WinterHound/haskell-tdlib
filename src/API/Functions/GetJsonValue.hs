-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetJsonValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Converts a JSON-serialized string to corresponding JsonValue object. Can be called synchronously 
-- 
-- __json__ The JSON-serialized string
data GetJsonValue = 

 GetJsonValue { json :: Maybe String }  deriving (Eq)

instance Show GetJsonValue where
 show GetJsonValue { json=json } =
  "GetJsonValue" ++ cc [p "json" json ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetJsonValue where
 toJSON GetJsonValue { json = json } =
  A.object [ "@type" A..= T.String "getJsonValue", "json" A..= json ]

instance T.FromJSON GetJsonValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getJsonValue" -> parseGetJsonValue v
   _ -> mempty
  where
   parseGetJsonValue :: A.Value -> T.Parser GetJsonValue
   parseGetJsonValue = A.withObject "GetJsonValue" $ \o -> do
    json <- o A..:? "json"
    return $ GetJsonValue { json = json }
 parseJSON _ = mempty
