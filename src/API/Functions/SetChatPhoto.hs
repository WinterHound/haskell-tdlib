-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatPhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputChatPhoto as InputChatPhoto

-- |
-- 
-- Changes the photo of a chat. Supported only for basic groups, supergroups and channels. Requires can_change_info administrator right
-- 
-- __chat_id__ Chat identifier
-- 
-- __photo__ New chat photo; pass null to delete the chat photo
data SetChatPhoto = 

 SetChatPhoto { photo :: Maybe InputChatPhoto.InputChatPhoto, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatPhoto where
 show SetChatPhoto { photo=photo, chat_id=chat_id } =
  "SetChatPhoto" ++ cc [p "photo" photo, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetChatPhoto where
 toJSON SetChatPhoto { photo = photo, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatPhoto", "photo" A..= photo, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatPhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatPhoto" -> parseSetChatPhoto v
   _ -> mempty
  where
   parseSetChatPhoto :: A.Value -> T.Parser SetChatPhoto
   parseSetChatPhoto = A.withObject "SetChatPhoto" $ \o -> do
    photo <- o A..:? "photo"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatPhoto { photo = photo, chat_id = chat_id }
 parseJSON _ = mempty
