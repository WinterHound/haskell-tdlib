-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.PushMessageContent as PushMessageContent
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Contains detailed information about a notification
data NotificationType = 
 -- |
 -- 
 -- New message was received 
 -- 
 -- __message__ The message
 NotificationTypeNewMessage { message :: Maybe Message.Message }  |
 -- |
 -- 
 -- New secret chat was created
 NotificationTypeNewSecretChat |
 -- |
 -- 
 -- New call was received 
 -- 
 -- __call_id__ Call identifier
 NotificationTypeNewCall { call_id :: Maybe Int }  |
 -- |
 -- 
 -- New message was received through a push notification
 -- 
 -- __message_id__ The message identifier. The message will not be available in the chat history, but the ID can be used in viewMessages, or as reply_to_message_id
 -- 
 -- __sender__ The sender of the message. Corresponding user or chat may be inaccessible
 -- 
 -- __sender_name__ Name of the sender
 -- 
 -- __is_outgoing__ True, if the message is outgoing
 -- 
 -- __content__ Push message content
 NotificationTypeNewPushMessage { content :: Maybe PushMessageContent.PushMessageContent, is_outgoing :: Maybe Bool, sender_name :: Maybe String, sender :: Maybe MessageSender.MessageSender, message_id :: Maybe Int }  deriving (Eq)

instance Show NotificationType where
 show NotificationTypeNewMessage { message=message } =
  "NotificationTypeNewMessage" ++ cc [p "message" message ]

 show NotificationTypeNewSecretChat {  } =
  "NotificationTypeNewSecretChat" ++ cc [ ]

 show NotificationTypeNewCall { call_id=call_id } =
  "NotificationTypeNewCall" ++ cc [p "call_id" call_id ]

 show NotificationTypeNewPushMessage { content=content, is_outgoing=is_outgoing, sender_name=sender_name, sender=sender, message_id=message_id } =
  "NotificationTypeNewPushMessage" ++ cc [p "content" content, p "is_outgoing" is_outgoing, p "sender_name" sender_name, p "sender" sender, p "message_id" message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON NotificationType where
 toJSON NotificationTypeNewMessage { message = message } =
  A.object [ "@type" A..= T.String "notificationTypeNewMessage", "message" A..= message ]

 toJSON NotificationTypeNewSecretChat {  } =
  A.object [ "@type" A..= T.String "notificationTypeNewSecretChat" ]

 toJSON NotificationTypeNewCall { call_id = call_id } =
  A.object [ "@type" A..= T.String "notificationTypeNewCall", "call_id" A..= call_id ]

 toJSON NotificationTypeNewPushMessage { content = content, is_outgoing = is_outgoing, sender_name = sender_name, sender = sender, message_id = message_id } =
  A.object [ "@type" A..= T.String "notificationTypeNewPushMessage", "content" A..= content, "is_outgoing" A..= is_outgoing, "sender_name" A..= sender_name, "sender" A..= sender, "message_id" A..= message_id ]

instance T.FromJSON NotificationType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notificationTypeNewMessage" -> parseNotificationTypeNewMessage v
   "notificationTypeNewSecretChat" -> parseNotificationTypeNewSecretChat v
   "notificationTypeNewCall" -> parseNotificationTypeNewCall v
   "notificationTypeNewPushMessage" -> parseNotificationTypeNewPushMessage v
   _ -> mempty
  where
   parseNotificationTypeNewMessage :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewMessage = A.withObject "NotificationTypeNewMessage" $ \o -> do
    message <- o A..:? "message"
    return $ NotificationTypeNewMessage { message = message }

   parseNotificationTypeNewSecretChat :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewSecretChat = A.withObject "NotificationTypeNewSecretChat" $ \o -> do
    return $ NotificationTypeNewSecretChat {  }

   parseNotificationTypeNewCall :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewCall = A.withObject "NotificationTypeNewCall" $ \o -> do
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ NotificationTypeNewCall { call_id = call_id }

   parseNotificationTypeNewPushMessage :: A.Value -> T.Parser NotificationType
   parseNotificationTypeNewPushMessage = A.withObject "NotificationTypeNewPushMessage" $ \o -> do
    content <- o A..:? "content"
    is_outgoing <- o A..:? "is_outgoing"
    sender_name <- o A..:? "sender_name"
    sender <- o A..:? "sender"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ NotificationTypeNewPushMessage { content = content, is_outgoing = is_outgoing, sender_name = sender_name, sender = sender, message_id = message_id }
 parseJSON _ = mempty
