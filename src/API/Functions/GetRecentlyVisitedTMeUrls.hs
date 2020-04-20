-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentlyVisitedTMeUrls where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRecentlyVisitedTMeUrls = 
 GetRecentlyVisitedTMeUrls { referrer :: String }  -- deriving (Show)

instance T.ToJSON GetRecentlyVisitedTMeUrls where
 toJSON (GetRecentlyVisitedTMeUrls { referrer = referrer }) =
  A.object [ "@type" A..= T.String "getRecentlyVisitedTMeUrls", "referrer" A..= referrer ]
-- getRecentlyVisitedTMeUrls GetRecentlyVisitedTMeUrls  { referrer :: String } 



instance T.FromJSON GetRecentlyVisitedTMeUrls where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecentlyVisitedTMeUrls" -> parseGetRecentlyVisitedTMeUrls v
  where
   parseGetRecentlyVisitedTMeUrls :: A.Value -> T.Parser GetRecentlyVisitedTMeUrls
   parseGetRecentlyVisitedTMeUrls = A.withObject "GetRecentlyVisitedTMeUrls" $ \o -> do
    referrer <- o A..: "referrer"
    return $ GetRecentlyVisitedTMeUrls { referrer = referrer }