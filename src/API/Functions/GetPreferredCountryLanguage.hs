-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPreferredCountryLanguage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPreferredCountryLanguage = 
 GetPreferredCountryLanguage { country_code :: String }  -- deriving (Show)

instance T.ToJSON GetPreferredCountryLanguage where
 toJSON (GetPreferredCountryLanguage { country_code = country_code }) =
  A.object [ "@type" A..= T.String "getPreferredCountryLanguage", "country_code" A..= country_code ]
-- getPreferredCountryLanguage GetPreferredCountryLanguage  { country_code :: String } 



instance T.FromJSON GetPreferredCountryLanguage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPreferredCountryLanguage" -> parseGetPreferredCountryLanguage v
  where
   parseGetPreferredCountryLanguage :: A.Value -> T.Parser GetPreferredCountryLanguage
   parseGetPreferredCountryLanguage = A.withObject "GetPreferredCountryLanguage" $ \o -> do
    country_code <- o A..: "country_code"
    return $ GetPreferredCountryLanguage { country_code = country_code }