{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.DraftMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputMessageContent as InputMessageContent
import qualified Utils as U

-- |
data DraftMessage = -- | Contains information about a message draft
  DraftMessage
  { -- | Content of the message draft; must be of the type inputMessageText
    input_message_text :: Maybe InputMessageContent.InputMessageContent,
    -- | Point in time (Unix timestamp) when the draft was created
    date :: Maybe Int,
    -- | Identifier of the replied message; 0 if none
    reply_to_message_id :: Maybe Int
  }
  deriving (Eq)

instance Show DraftMessage where
  show
    DraftMessage
      { input_message_text = input_message_text_,
        date = date_,
        reply_to_message_id = reply_to_message_id_
      } =
      "DraftMessage"
        ++ U.cc
          [ U.p "input_message_text" input_message_text_,
            U.p "date" date_,
            U.p "reply_to_message_id" reply_to_message_id_
          ]

instance T.FromJSON DraftMessage where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "draftMessage" -> parseDraftMessage v
      _ -> mempty
    where
      parseDraftMessage :: A.Value -> T.Parser DraftMessage
      parseDraftMessage = A.withObject "DraftMessage" $ \o -> do
        input_message_text_ <- o A..:? "input_message_text"
        date_ <- o A..:? "date"
        reply_to_message_id_ <- o A..:? "reply_to_message_id"
        return $ DraftMessage {input_message_text = input_message_text_, date = date_, reply_to_message_id = reply_to_message_id_}
  parseJSON _ = mempty

instance T.ToJSON DraftMessage where
  toJSON
    DraftMessage
      { input_message_text = input_message_text_,
        date = date_,
        reply_to_message_id = reply_to_message_id_
      } =
      A.object
        [ "@type" A..= T.String "draftMessage",
          "input_message_text" A..= input_message_text_,
          "date" A..= date_,
          "reply_to_message_id" A..= reply_to_message_id_
        ]
