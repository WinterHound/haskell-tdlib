{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FoundMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Message as Message
import qualified Utils as U

-- |
data FoundMessages = -- | Contains a list of messages found by a search @total_count Approximate total number of messages found; -1 if unknown @messages List of messages @next_offset The offset for the next request. If empty, there are no more results
  FoundMessages
  { -- |
    next_offset :: Maybe String,
    -- |
    messages :: Maybe [Message.Message],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show FoundMessages where
  show
    FoundMessages
      { next_offset = next_offset_,
        messages = messages_,
        total_count = total_count_
      } =
      "FoundMessages"
        ++ U.cc
          [ U.p "next_offset" next_offset_,
            U.p "messages" messages_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON FoundMessages where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundMessages" -> parseFoundMessages v
      _ -> mempty
    where
      parseFoundMessages :: A.Value -> T.Parser FoundMessages
      parseFoundMessages = A.withObject "FoundMessages" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        messages_ <- o A..:? "messages"
        total_count_ <- o A..:? "total_count"
        return $ FoundMessages {next_offset = next_offset_, messages = messages_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON FoundMessages where
  toJSON
    FoundMessages
      { next_offset = next_offset_,
        messages = messages_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "foundMessages",
          "next_offset" A..= next_offset_,
          "messages" A..= messages_,
          "total_count" A..= total_count_
        ]
