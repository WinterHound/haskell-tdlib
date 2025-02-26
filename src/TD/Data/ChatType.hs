{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the type of a chat
data ChatType
  = -- | An ordinary chat with a user @user_id User identifier
    ChatTypePrivate
      { -- |
        user_id :: Maybe Int
      }
  | -- | A basic group (a chat with 0-200 other users) @basic_group_id Basic group identifier
    ChatTypeBasicGroup
      { -- |
        basic_group_id :: Maybe Int
      }
  | -- | A supergroup or channel (with unlimited members) @supergroup_id Supergroup or channel identifier @is_channel True, if the supergroup is a channel
    ChatTypeSupergroup
      { -- |
        is_channel :: Maybe Bool,
        -- |
        supergroup_id :: Maybe Int
      }
  | -- | A secret chat with a user @secret_chat_id Secret chat identifier @user_id User identifier of the secret chat peer
    ChatTypeSecret
      { -- |
        user_id :: Maybe Int,
        -- |
        secret_chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show ChatType where
  show
    ChatTypePrivate
      { user_id = user_id_
      } =
      "ChatTypePrivate"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]
  show
    ChatTypeBasicGroup
      { basic_group_id = basic_group_id_
      } =
      "ChatTypeBasicGroup"
        ++ U.cc
          [ U.p "basic_group_id" basic_group_id_
          ]
  show
    ChatTypeSupergroup
      { is_channel = is_channel_,
        supergroup_id = supergroup_id_
      } =
      "ChatTypeSupergroup"
        ++ U.cc
          [ U.p "is_channel" is_channel_,
            U.p "supergroup_id" supergroup_id_
          ]
  show
    ChatTypeSecret
      { user_id = user_id_,
        secret_chat_id = secret_chat_id_
      } =
      "ChatTypeSecret"
        ++ U.cc
          [ U.p "user_id" user_id_,
            U.p "secret_chat_id" secret_chat_id_
          ]

instance T.FromJSON ChatType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatTypePrivate" -> parseChatTypePrivate v
      "chatTypeBasicGroup" -> parseChatTypeBasicGroup v
      "chatTypeSupergroup" -> parseChatTypeSupergroup v
      "chatTypeSecret" -> parseChatTypeSecret v
      _ -> mempty
    where
      parseChatTypePrivate :: A.Value -> T.Parser ChatType
      parseChatTypePrivate = A.withObject "ChatTypePrivate" $ \o -> do
        user_id_ <- o A..:? "user_id"
        return $ ChatTypePrivate {user_id = user_id_}

      parseChatTypeBasicGroup :: A.Value -> T.Parser ChatType
      parseChatTypeBasicGroup = A.withObject "ChatTypeBasicGroup" $ \o -> do
        basic_group_id_ <- o A..:? "basic_group_id"
        return $ ChatTypeBasicGroup {basic_group_id = basic_group_id_}

      parseChatTypeSupergroup :: A.Value -> T.Parser ChatType
      parseChatTypeSupergroup = A.withObject "ChatTypeSupergroup" $ \o -> do
        is_channel_ <- o A..:? "is_channel"
        supergroup_id_ <- o A..:? "supergroup_id"
        return $ ChatTypeSupergroup {is_channel = is_channel_, supergroup_id = supergroup_id_}

      parseChatTypeSecret :: A.Value -> T.Parser ChatType
      parseChatTypeSecret = A.withObject "ChatTypeSecret" $ \o -> do
        user_id_ <- o A..:? "user_id"
        secret_chat_id_ <- o A..:? "secret_chat_id"
        return $ ChatTypeSecret {user_id = user_id_, secret_chat_id = secret_chat_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatType where
  toJSON
    ChatTypePrivate
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "chatTypePrivate",
          "user_id" A..= user_id_
        ]
  toJSON
    ChatTypeBasicGroup
      { basic_group_id = basic_group_id_
      } =
      A.object
        [ "@type" A..= T.String "chatTypeBasicGroup",
          "basic_group_id" A..= basic_group_id_
        ]
  toJSON
    ChatTypeSupergroup
      { is_channel = is_channel_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "chatTypeSupergroup",
          "is_channel" A..= is_channel_,
          "supergroup_id" A..= supergroup_id_
        ]
  toJSON
    ChatTypeSecret
      { user_id = user_id_,
        secret_chat_id = secret_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "chatTypeSecret",
          "user_id" A..= user_id_,
          "secret_chat_id" A..= secret_chat_id_
        ]
