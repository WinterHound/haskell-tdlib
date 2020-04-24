-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatMessageByDate where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetChatMessageByDate = 
 GetChatMessageByDate { date :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatMessageByDate where
 toJSON (GetChatMessageByDate { date = date, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatMessageByDate", "date" A..= date, "chat_id" A..= chat_id ]

instance T.FromJSON GetChatMessageByDate where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatMessageByDate" -> parseGetChatMessageByDate v
   _ -> mempty
  where
   parseGetChatMessageByDate :: A.Value -> T.Parser GetChatMessageByDate
   parseGetChatMessageByDate = A.withObject "GetChatMessageByDate" $ \o -> do
    date <- optional $ o A..: "date"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetChatMessageByDate { date = date, chat_id = chat_id }