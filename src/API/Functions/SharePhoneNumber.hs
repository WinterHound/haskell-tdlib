-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SharePhoneNumber where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SharePhoneNumber = 
 SharePhoneNumber { user_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SharePhoneNumber where
 toJSON (SharePhoneNumber { user_id = user_id }) =
  A.object [ "@type" A..= T.String "sharePhoneNumber", "user_id" A..= user_id ]

instance T.FromJSON SharePhoneNumber where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sharePhoneNumber" -> parseSharePhoneNumber v
   _ -> mempty
  where
   parseSharePhoneNumber :: A.Value -> T.Parser SharePhoneNumber
   parseSharePhoneNumber = A.withObject "SharePhoneNumber" $ \o -> do
    user_id <- optional $ o A..: "user_id"
    return $ SharePhoneNumber { user_id = user_id }