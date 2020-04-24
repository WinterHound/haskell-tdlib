-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatRecentLocationMessages where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SearchChatRecentLocationMessages = 
 SearchChatRecentLocationMessages { limit :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SearchChatRecentLocationMessages where
 toJSON (SearchChatRecentLocationMessages { limit = limit, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "searchChatRecentLocationMessages", "limit" A..= limit, "chat_id" A..= chat_id ]

instance T.FromJSON SearchChatRecentLocationMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatRecentLocationMessages" -> parseSearchChatRecentLocationMessages v
   _ -> mempty
  where
   parseSearchChatRecentLocationMessages :: A.Value -> T.Parser SearchChatRecentLocationMessages
   parseSearchChatRecentLocationMessages = A.withObject "SearchChatRecentLocationMessages" $ \o -> do
    limit <- optional $ o A..: "limit"
    chat_id <- optional $ o A..: "chat_id"
    return $ SearchChatRecentLocationMessages { limit = limit, chat_id = chat_id }