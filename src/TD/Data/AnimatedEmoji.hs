{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AnimatedEmoji where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Sticker as Sticker
import qualified Utils as U

-- |
data AnimatedEmoji = -- | Describes an animated representation of an emoji
  AnimatedEmoji
  { -- | File containing the sound to be played when the animated emoji is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
    sound :: Maybe File.File,
    -- | Emoji modifier fitzpatrick type; 0-6; 0 if none
    fitzpatrick_type :: Maybe Int,
    -- | Animated sticker for the emoji
    sticker :: Maybe Sticker.Sticker
  }
  deriving (Eq)

instance Show AnimatedEmoji where
  show
    AnimatedEmoji
      { sound = sound_,
        fitzpatrick_type = fitzpatrick_type_,
        sticker = sticker_
      } =
      "AnimatedEmoji"
        ++ U.cc
          [ U.p "sound" sound_,
            U.p "fitzpatrick_type" fitzpatrick_type_,
            U.p "sticker" sticker_
          ]

instance T.FromJSON AnimatedEmoji where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "animatedEmoji" -> parseAnimatedEmoji v
      _ -> mempty
    where
      parseAnimatedEmoji :: A.Value -> T.Parser AnimatedEmoji
      parseAnimatedEmoji = A.withObject "AnimatedEmoji" $ \o -> do
        sound_ <- o A..:? "sound"
        fitzpatrick_type_ <- o A..:? "fitzpatrick_type"
        sticker_ <- o A..:? "sticker"
        return $ AnimatedEmoji {sound = sound_, fitzpatrick_type = fitzpatrick_type_, sticker = sticker_}
  parseJSON _ = mempty

instance T.ToJSON AnimatedEmoji where
  toJSON
    AnimatedEmoji
      { sound = sound_,
        fitzpatrick_type = fitzpatrick_type_,
        sticker = sticker_
      } =
      A.object
        [ "@type" A..= T.String "animatedEmoji",
          "sound" A..= sound_,
          "fitzpatrick_type" A..= fitzpatrick_type_,
          "sticker" A..= sticker_
        ]
