-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAccountTtl where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetAccountTtl = 
 GetAccountTtl deriving (Show, Eq)

instance T.ToJSON GetAccountTtl where
 toJSON (GetAccountTtl {  }) =
  A.object [ "@type" A..= T.String "getAccountTtl" ]

instance T.FromJSON GetAccountTtl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAccountTtl" -> parseGetAccountTtl v
   _ -> mempty
  where
   parseGetAccountTtl :: A.Value -> T.Parser GetAccountTtl
   parseGetAccountTtl = A.withObject "GetAccountTtl" $ \o -> do
    return $ GetAccountTtl {  }