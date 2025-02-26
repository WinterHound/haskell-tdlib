{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddStickerToSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputSticker as InputSticker
import qualified Utils as U

-- |
-- Adds a new sticker to a set; for bots only. Returns the sticker set
data AddStickerToSet = AddStickerToSet
  { -- |
    sticker :: Maybe InputSticker.InputSticker,
    -- |
    name :: Maybe String,
    -- | Sticker set owner @name Sticker set name @sticker Sticker to add to the set
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddStickerToSet where
  show
    AddStickerToSet
      { sticker = sticker_,
        name = name_,
        user_id = user_id_
      } =
      "AddStickerToSet"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "name" name_,
            U.p "user_id" user_id_
          ]

instance T.ToJSON AddStickerToSet where
  toJSON
    AddStickerToSet
      { sticker = sticker_,
        name = name_,
        user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "addStickerToSet",
          "sticker" A..= sticker_,
          "name" A..= name_,
          "user_id" A..= user_id_
        ]
