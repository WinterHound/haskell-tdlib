{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessagePositions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessagePosition as MessagePosition
import qualified Utils as U

-- |
data MessagePositions = -- | Contains a list of message positions @total_count Total number of messages found @positions List of message positions
  MessagePositions
  { -- |
    positions :: Maybe [MessagePosition.MessagePosition],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show MessagePositions where
  show
    MessagePositions
      { positions = positions_,
        total_count = total_count_
      } =
      "MessagePositions"
        ++ U.cc
          [ U.p "positions" positions_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON MessagePositions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messagePositions" -> parseMessagePositions v
      _ -> mempty
    where
      parseMessagePositions :: A.Value -> T.Parser MessagePositions
      parseMessagePositions = A.withObject "MessagePositions" $ \o -> do
        positions_ <- o A..:? "positions"
        total_count_ <- o A..:? "total_count"
        return $ MessagePositions {positions = positions_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON MessagePositions where
  toJSON
    MessagePositions
      { positions = positions_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "messagePositions",
          "positions" A..= positions_,
          "total_count" A..= total_count_
        ]
