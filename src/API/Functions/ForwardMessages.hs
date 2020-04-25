-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ForwardMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

data ForwardMessages = 
 ForwardMessages { remove_caption :: Maybe Bool, send_copy :: Maybe Bool, as_album :: Maybe Bool, options :: Maybe SendMessageOptions.SendMessageOptions, message_ids :: Maybe [Int], from_chat_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ForwardMessages where
 toJSON (ForwardMessages { remove_caption = remove_caption, send_copy = send_copy, as_album = as_album, options = options, message_ids = message_ids, from_chat_id = from_chat_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "forwardMessages", "remove_caption" A..= remove_caption, "send_copy" A..= send_copy, "as_album" A..= as_album, "options" A..= options, "message_ids" A..= message_ids, "from_chat_id" A..= from_chat_id, "chat_id" A..= chat_id ]

instance T.FromJSON ForwardMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "forwardMessages" -> parseForwardMessages v
   _ -> mempty
  where
   parseForwardMessages :: A.Value -> T.Parser ForwardMessages
   parseForwardMessages = A.withObject "ForwardMessages" $ \o -> do
    remove_caption <- o A..:? "remove_caption"
    send_copy <- o A..:? "send_copy"
    as_album <- o A..:? "as_album"
    options <- o A..:? "options"
    message_ids <- o A..:? "message_ids"
    from_chat_id <- mconcat [ o A..:? "from_chat_id", readMaybe <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ForwardMessages { remove_caption = remove_caption, send_copy = send_copy, as_album = as_album, options = options, message_ids = message_ids, from_chat_id = from_chat_id, chat_id = chat_id }