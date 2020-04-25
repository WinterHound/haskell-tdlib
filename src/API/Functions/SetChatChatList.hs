-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatChatList where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

data SetChatChatList = 
 SetChatChatList { chat_list :: Maybe ChatList.ChatList, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetChatChatList where
 toJSON (SetChatChatList { chat_list = chat_list, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatChatList", "chat_list" A..= chat_list, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatChatList where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatChatList" -> parseSetChatChatList v
   _ -> mempty
  where
   parseSetChatChatList :: A.Value -> T.Parser SetChatChatList
   parseSetChatChatList = A.withObject "SetChatChatList" $ \o -> do
    chat_list <- o A..:? "chat_list"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatChatList { chat_list = chat_list, chat_id = chat_id }