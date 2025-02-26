{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PageBlockListItem where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified TD.Data.PageBlock as PageBlock
import qualified Utils as U

-- |
data PageBlockListItem = -- | Describes an item of a list page block @label Item label @page_blocks Item blocks
  PageBlockListItem
  { -- |
    page_blocks :: Maybe [PageBlock.PageBlock],
    -- |
    label :: Maybe String
  }
  deriving (Eq)

instance Show PageBlockListItem where
  show
    PageBlockListItem
      { page_blocks = page_blocks_,
        label = label_
      } =
      "PageBlockListItem"
        ++ U.cc
          [ U.p "page_blocks" page_blocks_,
            U.p "label" label_
          ]

instance T.FromJSON PageBlockListItem where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pageBlockListItem" -> parsePageBlockListItem v
      _ -> mempty
    where
      parsePageBlockListItem :: A.Value -> T.Parser PageBlockListItem
      parsePageBlockListItem = A.withObject "PageBlockListItem" $ \o -> do
        page_blocks_ <- o A..:? "page_blocks"
        label_ <- o A..:? "label"
        return $ PageBlockListItem {page_blocks = page_blocks_, label = label_}
  parseJSON _ = mempty

instance T.ToJSON PageBlockListItem where
  toJSON
    PageBlockListItem
      { page_blocks = page_blocks_,
        label = label_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockListItem",
          "page_blocks" A..= page_blocks_,
          "label" A..= label_
        ]
