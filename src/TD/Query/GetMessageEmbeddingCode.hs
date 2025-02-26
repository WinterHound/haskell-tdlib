{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageEmbeddingCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an HTML code for embedding the message. Available only for messages in supergroups and channels with a username
data GetMessageEmbeddingCode = GetMessageEmbeddingCode
  { -- | Pass true to return an HTML code for embedding of the whole media album
    for_album :: Maybe Bool,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageEmbeddingCode where
  show
    GetMessageEmbeddingCode
      { for_album = for_album_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageEmbeddingCode"
        ++ U.cc
          [ U.p "for_album" for_album_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageEmbeddingCode where
  toJSON
    GetMessageEmbeddingCode
      { for_album = for_album_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageEmbeddingCode",
          "for_album" A..= for_album_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
