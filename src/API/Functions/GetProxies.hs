-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetProxies where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetProxies = 
 GetProxies deriving (Show, Eq)

instance T.ToJSON GetProxies where
 toJSON (GetProxies {  }) =
  A.object [ "@type" A..= T.String "getProxies" ]

instance T.FromJSON GetProxies where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getProxies" -> parseGetProxies v
   _ -> mempty
  where
   parseGetProxies :: A.Value -> T.Parser GetProxies
   parseGetProxies = A.withObject "GetProxies" $ \o -> do
    return $ GetProxies {  }