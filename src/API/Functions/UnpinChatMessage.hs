-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnpinChatMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data UnpinChatMessage = 
 UnpinChatMessage { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON UnpinChatMessage where
 toJSON (UnpinChatMessage { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "unpinChatMessage", "chat_id" A..= chat_id ]
-- unpinChatMessage UnpinChatMessage  { chat_id :: Int } 



instance T.FromJSON UnpinChatMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unpinChatMessage" -> parseUnpinChatMessage v
  where
   parseUnpinChatMessage :: A.Value -> T.Parser UnpinChatMessage
   parseUnpinChatMessage = A.withObject "UnpinChatMessage" $ \o -> do
    chat_id <- o A..: "chat_id"
    return $ UnpinChatMessage { chat_id = chat_id }