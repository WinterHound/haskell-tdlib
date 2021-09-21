-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessageStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns detailed statistics about a message. Can be used only if message.can_get_statistics == true 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_id__ Message identifier
-- 
-- __is_dark__ Pass true if a dark theme is used by the application
data GetMessageStatistics = 

 GetMessageStatistics { is_dark :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetMessageStatistics where
 toJSON (GetMessageStatistics { is_dark = is_dark, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessageStatistics", "is_dark" A..= is_dark, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetMessageStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessageStatistics" -> parseGetMessageStatistics v
   _ -> mempty
  where
   parseGetMessageStatistics :: A.Value -> T.Parser GetMessageStatistics
   parseGetMessageStatistics = A.withObject "GetMessageStatistics" $ \o -> do
    is_dark <- o A..:? "is_dark"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMessageStatistics { is_dark = is_dark, message_id = message_id, chat_id = chat_id }