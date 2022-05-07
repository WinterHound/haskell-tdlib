{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatSparseMessagePositions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).
-- Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database
data GetChatSparseMessagePositions = GetChatSparseMessagePositions
  { -- | The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
    limit :: Maybe Int,
    -- | The message identifier from which to return information about message positions
    from_message_id :: Maybe Int,
    -- | Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- | Identifier of the chat in which to return information about message positions
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatSparseMessagePositions where
  show
    GetChatSparseMessagePositions
      { limit = limit,
        from_message_id = from_message_id,
        _filter = _filter,
        chat_id = chat_id
      } =
      "GetChatSparseMessagePositions"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "from_message_id" from_message_id,
            U.p "_filter" _filter,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatSparseMessagePositions where
  toJSON
    GetChatSparseMessagePositions
      { limit = limit,
        from_message_id = from_message_id,
        _filter = _filter,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatSparseMessagePositions",
          "limit" A..= limit,
          "from_message_id" A..= from_message_id,
          "filter" A..= _filter,
          "chat_id" A..= chat_id
        ]
