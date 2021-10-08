-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateChatInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Creates a new invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat
-- 
-- __chat_id__ Chat identifier
-- 
-- __expire_date__ Point in time (Unix timestamp) when the link will expire; pass 0 if never
-- 
-- __member_limit__ The maximum number of chat members that can join the chat by the link simultaneously; 0-99999; pass 0 if not limited
data CreateChatInviteLink = 

 CreateChatInviteLink { member_limit :: Maybe Int, expire_date :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show CreateChatInviteLink where
 show CreateChatInviteLink { member_limit=member_limit, expire_date=expire_date, chat_id=chat_id } =
  "CreateChatInviteLink" ++ cc [p "member_limit" member_limit, p "expire_date" expire_date, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CreateChatInviteLink where
 toJSON CreateChatInviteLink { member_limit = member_limit, expire_date = expire_date, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "createChatInviteLink", "member_limit" A..= member_limit, "expire_date" A..= expire_date, "chat_id" A..= chat_id ]

instance T.FromJSON CreateChatInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createChatInviteLink" -> parseCreateChatInviteLink v
   _ -> mempty
  where
   parseCreateChatInviteLink :: A.Value -> T.Parser CreateChatInviteLink
   parseCreateChatInviteLink = A.withObject "CreateChatInviteLink" $ \o -> do
    member_limit <- mconcat [ o A..:? "member_limit", readMaybe <$> (o A..: "member_limit" :: T.Parser String)] :: T.Parser (Maybe Int)
    expire_date <- mconcat [ o A..:? "expire_date", readMaybe <$> (o A..: "expire_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateChatInviteLink { member_limit = member_limit, expire_date = expire_date, chat_id = chat_id }
 parseJSON _ = mempty
