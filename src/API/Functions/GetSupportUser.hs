-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSupportUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSupportUser = 
 GetSupportUser -- deriving (Show)

instance T.ToJSON GetSupportUser where
 toJSON (GetSupportUser {  }) =
  A.object [ "@type" A..= T.String "getSupportUser" ]
-- getSupportUser GetSupportUser 



instance T.FromJSON GetSupportUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSupportUser" -> parseGetSupportUser v
  where
   parseGetSupportUser :: A.Value -> T.Parser GetSupportUser
   parseGetSupportUser = A.withObject "GetSupportUser" $ \o -> do
    return $ GetSupportUser {  }