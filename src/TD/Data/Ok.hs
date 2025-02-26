{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Ok where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Ok
  = -- | An object of this type is returned on a successful function call for certain functions
    Ok
  deriving (Eq)

instance Show Ok where
  show Ok =
    "Ok"
      ++ U.cc
        []

instance T.FromJSON Ok where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "ok" -> parseOk v
      _ -> mempty
    where
      parseOk :: A.Value -> T.Parser Ok
      parseOk = A.withObject "Ok" $ \_ -> return Ok
  parseJSON _ = mempty

instance T.ToJSON Ok where
  toJSON Ok =
    A.object
      [ "@type" A..= T.String "ok"
      ]
