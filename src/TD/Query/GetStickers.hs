{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns stickers from the installed sticker sets that correspond to a given emoji. If the emoji is non-empty, favorite and recently used stickers may also be returned @emoji String representation of emoji. If empty, returns all known installed stickers @limit The maximum number of stickers to be returned
data GetStickers = GetStickers
  { -- |
    limit :: Maybe Int,
    -- |
    emoji :: Maybe String
  }
  deriving (Eq)

instance Show GetStickers where
  show
    GetStickers
      { limit = limit_,
        emoji = emoji_
      } =
      "GetStickers"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "emoji" emoji_
          ]

instance T.ToJSON GetStickers where
  toJSON
    GetStickers
      { limit = limit_,
        emoji = emoji_
      } =
      A.object
        [ "@type" A..= T.String "getStickers",
          "limit" A..= limit_,
          "emoji" A..= emoji_
        ]
