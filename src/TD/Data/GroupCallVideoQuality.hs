{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GroupCallVideoQuality where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the quality of a group call video
data GroupCallVideoQuality
  = -- | The worst available video quality
    GroupCallVideoQualityThumbnail
  | -- | The medium video quality
    GroupCallVideoQualityMedium
  | -- | The best available video quality
    GroupCallVideoQualityFull
  deriving (Eq)

instance Show GroupCallVideoQuality where
  show GroupCallVideoQualityThumbnail =
    "GroupCallVideoQualityThumbnail"
      ++ U.cc
        []
  show GroupCallVideoQualityMedium =
    "GroupCallVideoQualityMedium"
      ++ U.cc
        []
  show GroupCallVideoQualityFull =
    "GroupCallVideoQualityFull"
      ++ U.cc
        []

instance T.FromJSON GroupCallVideoQuality where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallVideoQualityThumbnail" -> parseGroupCallVideoQualityThumbnail v
      "groupCallVideoQualityMedium" -> parseGroupCallVideoQualityMedium v
      "groupCallVideoQualityFull" -> parseGroupCallVideoQualityFull v
      _ -> mempty
    where
      parseGroupCallVideoQualityThumbnail :: A.Value -> T.Parser GroupCallVideoQuality
      parseGroupCallVideoQualityThumbnail = A.withObject "GroupCallVideoQualityThumbnail" $ \_ -> return GroupCallVideoQualityThumbnail

      parseGroupCallVideoQualityMedium :: A.Value -> T.Parser GroupCallVideoQuality
      parseGroupCallVideoQualityMedium = A.withObject "GroupCallVideoQualityMedium" $ \_ -> return GroupCallVideoQualityMedium

      parseGroupCallVideoQualityFull :: A.Value -> T.Parser GroupCallVideoQuality
      parseGroupCallVideoQualityFull = A.withObject "GroupCallVideoQualityFull" $ \_ -> return GroupCallVideoQualityFull
  parseJSON _ = mempty

instance T.ToJSON GroupCallVideoQuality where
  toJSON GroupCallVideoQualityThumbnail =
    A.object
      [ "@type" A..= T.String "groupCallVideoQualityThumbnail"
      ]
  toJSON GroupCallVideoQualityMedium =
    A.object
      [ "@type" A..= T.String "groupCallVideoQualityMedium"
      ]
  toJSON GroupCallVideoQualityFull =
    A.object
      [ "@type" A..= T.String "groupCallVideoQualityFull"
      ]
