{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetMessageReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes chosen reaction for a message
data SetMessageReaction = SetMessageReaction
  { -- | Pass true if the reaction is added with a big animation
    is_big :: Maybe Bool,
    -- | Text representation of the new chosen reaction. Can be an empty string or the currently chosen non-big reaction to remove the reaction
    reaction :: Maybe String,
    -- | Identifier of the message
    message_id :: Maybe Int,
    -- | Identifier of the chat to which the message belongs
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetMessageReaction where
  show
    SetMessageReaction
      { is_big = is_big_,
        reaction = reaction_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "SetMessageReaction"
        ++ U.cc
          [ U.p "is_big" is_big_,
            U.p "reaction" reaction_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetMessageReaction where
  toJSON
    SetMessageReaction
      { is_big = is_big_,
        reaction = reaction_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setMessageReaction",
          "is_big" A..= is_big_,
          "reaction" A..= reaction_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
