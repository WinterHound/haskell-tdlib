{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatPhotos where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatPhoto as ChatPhoto
import qualified Utils as U

-- |
data ChatPhotos = -- | Contains a list of chat or user profile photos @total_count Total number of photos @photos List of photos
  ChatPhotos
  { -- |
    photos :: Maybe [ChatPhoto.ChatPhoto],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ChatPhotos where
  show
    ChatPhotos
      { photos = photos_,
        total_count = total_count_
      } =
      "ChatPhotos"
        ++ U.cc
          [ U.p "photos" photos_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON ChatPhotos where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatPhotos" -> parseChatPhotos v
      _ -> mempty
    where
      parseChatPhotos :: A.Value -> T.Parser ChatPhotos
      parseChatPhotos = A.withObject "ChatPhotos" $ \o -> do
        photos_ <- o A..:? "photos"
        total_count_ <- o A..:? "total_count"
        return $ ChatPhotos {photos = photos_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ChatPhotos where
  toJSON
    ChatPhotos
      { photos = photos_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "chatPhotos",
          "photos" A..= photos_,
          "total_count" A..= total_count_
        ]
