{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageReplyInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
data MessageReplyInfo = -- | Contains information about replies to a message
  MessageReplyInfo
  { -- | Identifier of the last reply to the message
    last_message_id :: Maybe Int,
    -- | Identifier of the last read outgoing reply to the message
    last_read_outbox_message_id :: Maybe Int,
    -- | Identifier of the last read incoming reply to the message
    last_read_inbox_message_id :: Maybe Int,
    -- | Identifiers of at most 3 recent repliers to the message; available in channels with a discussion supergroup. The users and chats are expected to be inaccessible: only their photo and name will be available
    recent_replier_ids :: Maybe [MessageSender.MessageSender],
    -- | Number of times the message was directly or indirectly replied
    reply_count :: Maybe Int
  }
  deriving (Eq)

instance Show MessageReplyInfo where
  show
    MessageReplyInfo
      { last_message_id = last_message_id_,
        last_read_outbox_message_id = last_read_outbox_message_id_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        recent_replier_ids = recent_replier_ids_,
        reply_count = reply_count_
      } =
      "MessageReplyInfo"
        ++ U.cc
          [ U.p "last_message_id" last_message_id_,
            U.p "last_read_outbox_message_id" last_read_outbox_message_id_,
            U.p "last_read_inbox_message_id" last_read_inbox_message_id_,
            U.p "recent_replier_ids" recent_replier_ids_,
            U.p "reply_count" reply_count_
          ]

instance T.FromJSON MessageReplyInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageReplyInfo" -> parseMessageReplyInfo v
      _ -> mempty
    where
      parseMessageReplyInfo :: A.Value -> T.Parser MessageReplyInfo
      parseMessageReplyInfo = A.withObject "MessageReplyInfo" $ \o -> do
        last_message_id_ <- o A..:? "last_message_id"
        last_read_outbox_message_id_ <- o A..:? "last_read_outbox_message_id"
        last_read_inbox_message_id_ <- o A..:? "last_read_inbox_message_id"
        recent_replier_ids_ <- o A..:? "recent_replier_ids"
        reply_count_ <- o A..:? "reply_count"
        return $ MessageReplyInfo {last_message_id = last_message_id_, last_read_outbox_message_id = last_read_outbox_message_id_, last_read_inbox_message_id = last_read_inbox_message_id_, recent_replier_ids = recent_replier_ids_, reply_count = reply_count_}
  parseJSON _ = mempty

instance T.ToJSON MessageReplyInfo where
  toJSON
    MessageReplyInfo
      { last_message_id = last_message_id_,
        last_read_outbox_message_id = last_read_outbox_message_id_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        recent_replier_ids = recent_replier_ids_,
        reply_count = reply_count_
      } =
      A.object
        [ "@type" A..= T.String "messageReplyInfo",
          "last_message_id" A..= last_message_id_,
          "last_read_outbox_message_id" A..= last_read_outbox_message_id_,
          "last_read_inbox_message_id" A..= last_read_inbox_message_id_,
          "recent_replier_ids" A..= recent_replier_ids_,
          "reply_count" A..= reply_count_
        ]
