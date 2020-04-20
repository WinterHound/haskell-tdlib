-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateNewSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreateNewSecretChat = 
 CreateNewSecretChat { user_id :: Int }  -- deriving (Show)

instance T.ToJSON CreateNewSecretChat where
 toJSON (CreateNewSecretChat { user_id = user_id }) =
  A.object [ "@type" A..= T.String "createNewSecretChat", "user_id" A..= user_id ]
-- createNewSecretChat CreateNewSecretChat  { user_id :: Int } 



instance T.FromJSON CreateNewSecretChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createNewSecretChat" -> parseCreateNewSecretChat v
  where
   parseCreateNewSecretChat :: A.Value -> T.Parser CreateNewSecretChat
   parseCreateNewSecretChat = A.withObject "CreateNewSecretChat" $ \o -> do
    user_id <- o A..: "user_id"
    return $ CreateNewSecretChat { user_id = user_id }