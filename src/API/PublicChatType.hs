-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PublicChatType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes a type of public chats
data PublicChatType = 
 -- |
 -- 
 -- The chat is public, because it has username
 PublicChatTypeHasUsername |
 -- |
 -- 
 -- The chat is public, because it is a location-based supergroup
 PublicChatTypeIsLocationBased deriving (Eq)

instance Show PublicChatType where
 show PublicChatTypeHasUsername {  } =
  "PublicChatTypeHasUsername" ++ cc [ ]

 show PublicChatTypeIsLocationBased {  } =
  "PublicChatTypeIsLocationBased" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PublicChatType where
 toJSON PublicChatTypeHasUsername {  } =
  A.object [ "@type" A..= T.String "publicChatTypeHasUsername" ]

 toJSON PublicChatTypeIsLocationBased {  } =
  A.object [ "@type" A..= T.String "publicChatTypeIsLocationBased" ]

instance T.FromJSON PublicChatType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "publicChatTypeHasUsername" -> parsePublicChatTypeHasUsername v
   "publicChatTypeIsLocationBased" -> parsePublicChatTypeIsLocationBased v
   _ -> mempty
  where
   parsePublicChatTypeHasUsername :: A.Value -> T.Parser PublicChatType
   parsePublicChatTypeHasUsername = A.withObject "PublicChatTypeHasUsername" $ \o -> do
    return $ PublicChatTypeHasUsername {  }

   parsePublicChatTypeIsLocationBased :: A.Value -> T.Parser PublicChatType
   parsePublicChatTypeIsLocationBased = A.withObject "PublicChatTypeIsLocationBased" $ \o -> do
    return $ PublicChatTypeIsLocationBased {  }
 parseJSON _ = mempty
