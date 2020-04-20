-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatSetTtlMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SendChatSetTtlMessage = 
 SendChatSetTtlMessage { ttl :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendChatSetTtlMessage where
 toJSON (SendChatSetTtlMessage { ttl = ttl, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatSetTtlMessage", "ttl" A..= ttl, "chat_id" A..= chat_id ]
-- sendChatSetTtlMessage SendChatSetTtlMessage  { ttl :: Int, chat_id :: Int } 



instance T.FromJSON SendChatSetTtlMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatSetTtlMessage" -> parseSendChatSetTtlMessage v
  where
   parseSendChatSetTtlMessage :: A.Value -> T.Parser SendChatSetTtlMessage
   parseSendChatSetTtlMessage = A.withObject "SendChatSetTtlMessage" $ \o -> do
    ttl <- o A..: "ttl"
    chat_id <- o A..: "chat_id"
    return $ SendChatSetTtlMessage { ttl = ttl, chat_id = chat_id }