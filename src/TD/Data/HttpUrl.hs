{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.HttpUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data HttpUrl = -- | Contains an HTTP URL @url The URL
  HttpUrl
  { -- |
    url :: Maybe String
  }
  deriving (Eq)

instance Show HttpUrl where
  show
    HttpUrl
      { url = url_
      } =
      "HttpUrl"
        ++ U.cc
          [ U.p "url" url_
          ]

instance T.FromJSON HttpUrl where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "httpUrl" -> parseHttpUrl v
      _ -> mempty
    where
      parseHttpUrl :: A.Value -> T.Parser HttpUrl
      parseHttpUrl = A.withObject "HttpUrl" $ \o -> do
        url_ <- o A..:? "url"
        return $ HttpUrl {url = url_}
  parseJSON _ = mempty

instance T.ToJSON HttpUrl where
  toJSON
    HttpUrl
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "httpUrl",
          "url" A..= url_
        ]
