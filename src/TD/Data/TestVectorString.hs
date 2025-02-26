{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.TestVectorString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data TestVectorString = -- | A simple object containing a vector of strings; for testing only @value Vector of strings
  TestVectorString
  { -- |
    value :: Maybe [String]
  }
  deriving (Eq)

instance Show TestVectorString where
  show
    TestVectorString
      { value = value_
      } =
      "TestVectorString"
        ++ U.cc
          [ U.p "value" value_
          ]

instance T.FromJSON TestVectorString where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "testVectorString" -> parseTestVectorString v
      _ -> mempty
    where
      parseTestVectorString :: A.Value -> T.Parser TestVectorString
      parseTestVectorString = A.withObject "TestVectorString" $ \o -> do
        value_ <- o A..:? "value"
        return $ TestVectorString {value = value_}
  parseJSON _ = mempty

instance T.ToJSON TestVectorString where
  toJSON
    TestVectorString
      { value = value_
      } =
      A.object
        [ "@type" A..= T.String "testVectorString",
          "value" A..= value_
        ]
