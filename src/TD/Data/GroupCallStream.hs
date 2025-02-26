{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GroupCallStream where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data GroupCallStream = -- | Describes an available stream in a group call
  GroupCallStream
  { -- | Point in time when the stream currently ends; Unix timestamp in milliseconds
    time_offset :: Maybe Int,
    -- | Scale of segment durations in the stream. The duration is 1000/(2**scale) milliseconds
    scale :: Maybe Int,
    -- | Identifier of an audio/video channel
    channel_id :: Maybe Int
  }
  deriving (Eq)

instance Show GroupCallStream where
  show
    GroupCallStream
      { time_offset = time_offset_,
        scale = scale_,
        channel_id = channel_id_
      } =
      "GroupCallStream"
        ++ U.cc
          [ U.p "time_offset" time_offset_,
            U.p "scale" scale_,
            U.p "channel_id" channel_id_
          ]

instance T.FromJSON GroupCallStream where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallStream" -> parseGroupCallStream v
      _ -> mempty
    where
      parseGroupCallStream :: A.Value -> T.Parser GroupCallStream
      parseGroupCallStream = A.withObject "GroupCallStream" $ \o -> do
        time_offset_ <- o A..:? "time_offset"
        scale_ <- o A..:? "scale"
        channel_id_ <- o A..:? "channel_id"
        return $ GroupCallStream {time_offset = time_offset_, scale = scale_, channel_id = channel_id_}
  parseJSON _ = mempty

instance T.ToJSON GroupCallStream where
  toJSON
    GroupCallStream
      { time_offset = time_offset_,
        scale = scale_,
        channel_id = channel_id_
      } =
      A.object
        [ "@type" A..= T.String "groupCallStream",
          "time_offset" A..= time_offset_,
          "scale" A..= scale_,
          "channel_id" A..= channel_id_
        ]
