{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleDownloadIsPaused where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes pause state of a file in the file download list
data ToggleDownloadIsPaused = ToggleDownloadIsPaused
  { -- | Pass true if the download is paused
    is_paused :: Maybe Bool,
    -- | Identifier of the downloaded file
    file_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleDownloadIsPaused where
  show
    ToggleDownloadIsPaused
      { is_paused = is_paused_,
        file_id = file_id_
      } =
      "ToggleDownloadIsPaused"
        ++ U.cc
          [ U.p "is_paused" is_paused_,
            U.p "file_id" file_id_
          ]

instance T.ToJSON ToggleDownloadIsPaused where
  toJSON
    ToggleDownloadIsPaused
      { is_paused = is_paused_,
        file_id = file_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleDownloadIsPaused",
          "is_paused" A..= is_paused_,
          "file_id" A..= file_id_
        ]
