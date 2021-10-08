-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.JsonObjectMember where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.JsonValue as JsonValue

-- |
-- 
-- Represents one member of a JSON object 
-- 
-- __key__ Member's key
-- 
-- __value__ Member's value
data JsonObjectMember = 

 JsonObjectMember { value :: Maybe JsonValue.JsonValue, key :: Maybe String }  deriving (Eq)

instance Show JsonObjectMember where
 show JsonObjectMember { value=value, key=key } =
  "JsonObjectMember" ++ cc [p "value" value, p "key" key ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON JsonObjectMember where
 toJSON JsonObjectMember { value = value, key = key } =
  A.object [ "@type" A..= T.String "jsonObjectMember", "value" A..= value, "key" A..= key ]

instance T.FromJSON JsonObjectMember where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "jsonObjectMember" -> parseJsonObjectMember v
   _ -> mempty
  where
   parseJsonObjectMember :: A.Value -> T.Parser JsonObjectMember
   parseJsonObjectMember = A.withObject "JsonObjectMember" $ \o -> do
    value <- o A..:? "value"
    key <- o A..:? "key"
    return $ JsonObjectMember { value = value, key = key }
 parseJSON _ = mempty
