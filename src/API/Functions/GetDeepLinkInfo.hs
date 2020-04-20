-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetDeepLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetDeepLinkInfo = 
 GetDeepLinkInfo { link :: String }  -- deriving (Show)

instance T.ToJSON GetDeepLinkInfo where
 toJSON (GetDeepLinkInfo { link = link }) =
  A.object [ "@type" A..= T.String "getDeepLinkInfo", "link" A..= link ]
-- getDeepLinkInfo GetDeepLinkInfo  { link :: String } 



instance T.FromJSON GetDeepLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getDeepLinkInfo" -> parseGetDeepLinkInfo v
  where
   parseGetDeepLinkInfo :: A.Value -> T.Parser GetDeepLinkInfo
   parseGetDeepLinkInfo = A.withObject "GetDeepLinkInfo" $ \o -> do
    link <- o A..: "link"
    return $ GetDeepLinkInfo { link = link }