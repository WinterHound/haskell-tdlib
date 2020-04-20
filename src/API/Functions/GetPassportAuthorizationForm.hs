-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportAuthorizationForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPassportAuthorizationForm = 
 GetPassportAuthorizationForm { nonce :: String, public_key :: String, scope :: String, bot_user_id :: Int }  -- deriving (Show)

instance T.ToJSON GetPassportAuthorizationForm where
 toJSON (GetPassportAuthorizationForm { nonce = nonce, public_key = public_key, scope = scope, bot_user_id = bot_user_id }) =
  A.object [ "@type" A..= T.String "getPassportAuthorizationForm", "nonce" A..= nonce, "public_key" A..= public_key, "scope" A..= scope, "bot_user_id" A..= bot_user_id ]
-- getPassportAuthorizationForm GetPassportAuthorizationForm  { nonce :: String, public_key :: String, scope :: String, bot_user_id :: Int } 



instance T.FromJSON GetPassportAuthorizationForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPassportAuthorizationForm" -> parseGetPassportAuthorizationForm v
  where
   parseGetPassportAuthorizationForm :: A.Value -> T.Parser GetPassportAuthorizationForm
   parseGetPassportAuthorizationForm = A.withObject "GetPassportAuthorizationForm" $ \o -> do
    nonce <- o A..: "nonce"
    public_key <- o A..: "public_key"
    scope <- o A..: "scope"
    bot_user_id <- o A..: "bot_user_id"
    return $ GetPassportAuthorizationForm { nonce = nonce, public_key = public_key, scope = scope, bot_user_id = bot_user_id }