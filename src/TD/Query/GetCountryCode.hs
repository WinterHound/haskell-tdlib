{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetCountryCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Uses the current IP address to find the current country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
data GetCountryCode = GetCountryCode
  {
  }
  deriving (Eq)

instance Show GetCountryCode where
  show GetCountryCode =
    "GetCountryCode"
      ++ U.cc
        []

instance T.ToJSON GetCountryCode where
  toJSON GetCountryCode =
    A.object
      [ "@type" A..= T.String "getCountryCode"
      ]
