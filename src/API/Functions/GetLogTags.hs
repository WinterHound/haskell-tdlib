-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogTags = 
 GetLogTags -- deriving (Show)

instance T.ToJSON GetLogTags where
 toJSON (GetLogTags {  }) =
  A.object [ "@type" A..= T.String "getLogTags" ]
-- getLogTags GetLogTags 



instance T.FromJSON GetLogTags where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLogTags" -> parseGetLogTags v
  where
   parseGetLogTags :: A.Value -> T.Parser GetLogTags
   parseGetLogTags = A.withObject "GetLogTags" $ \o -> do
    return $ GetLogTags {  }