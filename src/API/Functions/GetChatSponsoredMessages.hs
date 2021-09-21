-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChatSponsoredMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns sponsored messages to be shown in a chat; for channel chats only 
-- 
-- __chat_id__ Identifier of the chat
data GetChatSponsoredMessages = 

 GetChatSponsoredMessages { chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GetChatSponsoredMessages where
 toJSON (GetChatSponsoredMessages { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChatSponsoredMessages", "chat_id" A..= chat_id ]

instance T.FromJSON GetChatSponsoredMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getChatSponsoredMessages" -> parseGetChatSponsoredMessages v
   _ -> mempty
  where
   parseGetChatSponsoredMessages :: A.Value -> T.Parser GetChatSponsoredMessages
   parseGetChatSponsoredMessages = A.withObject "GetChatSponsoredMessages" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetChatSponsoredMessages { chat_id = chat_id }