{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatInviteLinkCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatInviteLinkCount = -- | Describes a chat administrator with a number of active and revoked chat invite links
  ChatInviteLinkCount
  { -- | Number of revoked invite links
    revoked_invite_link_count :: Maybe Int,
    -- | Number of active invite links
    invite_link_count :: Maybe Int,
    -- | Administrator's user identifier
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatInviteLinkCount where
  show
    ChatInviteLinkCount
      { revoked_invite_link_count = revoked_invite_link_count_,
        invite_link_count = invite_link_count_,
        user_id = user_id_
      } =
      "ChatInviteLinkCount"
        ++ U.cc
          [ U.p "revoked_invite_link_count" revoked_invite_link_count_,
            U.p "invite_link_count" invite_link_count_,
            U.p "user_id" user_id_
          ]

instance T.FromJSON ChatInviteLinkCount where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatInviteLinkCount" -> parseChatInviteLinkCount v
      _ -> mempty
    where
      parseChatInviteLinkCount :: A.Value -> T.Parser ChatInviteLinkCount
      parseChatInviteLinkCount = A.withObject "ChatInviteLinkCount" $ \o -> do
        revoked_invite_link_count_ <- o A..:? "revoked_invite_link_count"
        invite_link_count_ <- o A..:? "invite_link_count"
        user_id_ <- o A..:? "user_id"
        return $ ChatInviteLinkCount {revoked_invite_link_count = revoked_invite_link_count_, invite_link_count = invite_link_count_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatInviteLinkCount where
  toJSON
    ChatInviteLinkCount
      { revoked_invite_link_count = revoked_invite_link_count_,
        invite_link_count = invite_link_count_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatInviteLinkCount",
          "revoked_invite_link_count" A..= revoked_invite_link_count_,
          "invite_link_count" A..= invite_link_count_,
          "user_id" A..= user_id_
        ]
