-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AcceptTermsOfService where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AcceptTermsOfService = 
 AcceptTermsOfService { terms_of_service_id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON AcceptTermsOfService where
 toJSON (AcceptTermsOfService { terms_of_service_id = terms_of_service_id }) =
  A.object [ "@type" A..= T.String "acceptTermsOfService", "terms_of_service_id" A..= terms_of_service_id ]

instance T.FromJSON AcceptTermsOfService where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "acceptTermsOfService" -> parseAcceptTermsOfService v
   _ -> mempty
  where
   parseAcceptTermsOfService :: A.Value -> T.Parser AcceptTermsOfService
   parseAcceptTermsOfService = A.withObject "AcceptTermsOfService" $ \o -> do
    terms_of_service_id <- optional $ o A..: "terms_of_service_id"
    return $ AcceptTermsOfService { terms_of_service_id = terms_of_service_id }