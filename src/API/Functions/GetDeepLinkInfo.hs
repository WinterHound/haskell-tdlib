-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetDeepLinkInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetDeepLinkInfo = 
 GetDeepLinkInfo { link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetDeepLinkInfo where
 toJSON (GetDeepLinkInfo { link = link }) =
  A.object [ "@type" A..= T.String "getDeepLinkInfo", "link" A..= link ]

instance T.FromJSON GetDeepLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getDeepLinkInfo" -> parseGetDeepLinkInfo v
   _ -> mempty
  where
   parseGetDeepLinkInfo :: A.Value -> T.Parser GetDeepLinkInfo
   parseGetDeepLinkInfo = A.withObject "GetDeepLinkInfo" $ \o -> do
    link <- optional $ o A..: "link"
    return $ GetDeepLinkInfo { link = link }