-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RegisterUser where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RegisterUser = 
 RegisterUser { last_name :: String, first_name :: String }  -- deriving (Show)

instance T.ToJSON RegisterUser where
 toJSON (RegisterUser { last_name = last_name, first_name = first_name }) =
  A.object [ "@type" A..= T.String "registerUser", "last_name" A..= last_name, "first_name" A..= first_name ]
-- registerUser RegisterUser  { last_name :: String, first_name :: String } 



instance T.FromJSON RegisterUser where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "registerUser" -> parseRegisterUser v
  where
   parseRegisterUser :: A.Value -> T.Parser RegisterUser
   parseRegisterUser = A.withObject "RegisterUser" $ \o -> do
    last_name <- o A..: "last_name"
    first_name <- o A..: "first_name"
    return $ RegisterUser { last_name = last_name, first_name = first_name }