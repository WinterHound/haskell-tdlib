{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Edits a non-primary invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
data EditChatInviteLink = EditChatInviteLink
  { -- | Pass true if users joining the chat via the link need to be approved by chat administrators. In this case, member_limit must be 0
    creates_join_request :: Maybe Bool,
    -- | The maximum number of chat members that can join the chat via the link simultaneously; 0-99999; pass 0 if not limited
    member_limit :: Maybe Int,
    -- | Point in time (Unix timestamp) when the link will expire; pass 0 if never
    expiration_date :: Maybe Int,
    -- | Invite link name; 0-32 characters
    name :: Maybe String,
    -- | Invite link to be edited
    invite_link :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditChatInviteLink where
  show
    EditChatInviteLink
      { creates_join_request = creates_join_request_,
        member_limit = member_limit_,
        expiration_date = expiration_date_,
        name = name_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      "EditChatInviteLink"
        ++ U.cc
          [ U.p "creates_join_request" creates_join_request_,
            U.p "member_limit" member_limit_,
            U.p "expiration_date" expiration_date_,
            U.p "name" name_,
            U.p "invite_link" invite_link_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON EditChatInviteLink where
  toJSON
    EditChatInviteLink
      { creates_join_request = creates_join_request_,
        member_limit = member_limit_,
        expiration_date = expiration_date_,
        name = name_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "editChatInviteLink",
          "creates_join_request" A..= creates_join_request_,
          "member_limit" A..= member_limit_,
          "expiration_date" A..= expiration_date_,
          "name" A..= name_,
          "invite_link" A..= invite_link_,
          "chat_id" A..= chat_id_
        ]
