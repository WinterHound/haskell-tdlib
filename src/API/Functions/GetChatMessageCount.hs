-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMessageCount where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SearchMessagesFilter as SearchMessagesFilter

data GetChatMessageCount = 
 GetChatMessageCount { return_local :: Maybe Bool, _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatMessageCount where
 toJSON (GetChatMessageCount { return_local = return_local, _filter = _filter, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMessageCount", "return_local" A..= return_local, "filter" A..= _filter, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatMessageCount where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMessageCount" -> parseGetChatMessageCount v
   _ -> mempty
  where
   parseGetChatMessageCount :: A.Value -> T.Parser GetChatMessageCount
   parseGetChatMessageCount = A.withObject "GetChatMessageCount" $ \o -> do
    return_local <- o A..:? "return_local"
    _filter <- o A..:? "filter"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatMessageCount { return_local = return_local, _filter = _filter, chat_id = chat_id }