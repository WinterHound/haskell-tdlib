-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RevokeGroupCallInviteLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Revokes invite link for a group call. Requires groupCall.can_be_managed group call flag 
-- 
-- __group_call_id__ Group call identifier
data RevokeGroupCallInviteLink = 

 RevokeGroupCallInviteLink { group_call_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON RevokeGroupCallInviteLink where
 toJSON (RevokeGroupCallInviteLink { group_call_id = group_call_id }) =
  A.object [ "@type" A..= T.String "revokeGroupCallInviteLink", "group_call_id" A..= group_call_id ]

instance T.FromJSON RevokeGroupCallInviteLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "revokeGroupCallInviteLink" -> parseRevokeGroupCallInviteLink v
   _ -> mempty
  where
   parseRevokeGroupCallInviteLink :: A.Value -> T.Parser RevokeGroupCallInviteLink
   parseRevokeGroupCallInviteLink = A.withObject "RevokeGroupCallInviteLink" $ \o -> do
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RevokeGroupCallInviteLink { group_call_id = group_call_id }