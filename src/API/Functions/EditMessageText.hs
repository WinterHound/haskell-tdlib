-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageText where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditMessageText = 
 EditMessageText { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON EditMessageText where
 toJSON (EditMessageText { input_message_content = input_message_content, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageText", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON EditMessageText where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageText" -> parseEditMessageText v
   _ -> mempty
  where
   parseEditMessageText :: A.Value -> T.Parser EditMessageText
   parseEditMessageText = A.withObject "EditMessageText" $ \o -> do
    input_message_content <- optional $ o A..: "input_message_content"
    reply_markup <- optional $ o A..: "reply_markup"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ EditMessageText { input_message_content = input_message_content, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }