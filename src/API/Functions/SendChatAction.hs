-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatAction where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatAction as ChatAction

-- |
-- 
-- Sends a notification about user activity in a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_thread_id__ If not 0, a message thread identifier in which the action was performed
-- 
-- __action__ The action description; pass null to cancel the currently active action
data SendChatAction = 

 SendChatAction { action :: Maybe ChatAction.ChatAction, message_thread_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SendChatAction where
 show SendChatAction { action=action, message_thread_id=message_thread_id, chat_id=chat_id } =
  "SendChatAction" ++ cc [p "action" action, p "message_thread_id" message_thread_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendChatAction where
 toJSON SendChatAction { action = action, message_thread_id = message_thread_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "sendChatAction", "action" A..= action, "message_thread_id" A..= message_thread_id, "chat_id" A..= chat_id ]

instance T.FromJSON SendChatAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatAction" -> parseSendChatAction v
   _ -> mempty
  where
   parseSendChatAction :: A.Value -> T.Parser SendChatAction
   parseSendChatAction = A.withObject "SendChatAction" $ \o -> do
    action <- o A..:? "action"
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendChatAction { action = action, message_thread_id = message_thread_id, chat_id = chat_id }
 parseJSON _ = mempty
