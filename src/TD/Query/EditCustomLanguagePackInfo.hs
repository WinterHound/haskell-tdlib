{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditCustomLanguagePackInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo
import qualified Utils as U

-- |
-- Edits information about a custom local language pack in the current localization target. Can be called before authorization @info New information about the custom local language pack
data EditCustomLanguagePackInfo = EditCustomLanguagePackInfo
  { -- |
    info :: Maybe LanguagePackInfo.LanguagePackInfo
  }
  deriving (Eq)

instance Show EditCustomLanguagePackInfo where
  show
    EditCustomLanguagePackInfo
      { info = info_
      } =
      "EditCustomLanguagePackInfo"
        ++ U.cc
          [ U.p "info" info_
          ]

instance T.ToJSON EditCustomLanguagePackInfo where
  toJSON
    EditCustomLanguagePackInfo
      { info = info_
      } =
      A.object
        [ "@type" A..= T.String "editCustomLanguagePackInfo",
          "info" A..= info_
        ]
