-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLanguagePackInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLanguagePackInfo = 
 GetLanguagePackInfo { language_pack_id :: String }  -- deriving (Show)

instance T.ToJSON GetLanguagePackInfo where
 toJSON (GetLanguagePackInfo { language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "getLanguagePackInfo", "language_pack_id" A..= language_pack_id ]
-- getLanguagePackInfo GetLanguagePackInfo  { language_pack_id :: String } 



instance T.FromJSON GetLanguagePackInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLanguagePackInfo" -> parseGetLanguagePackInfo v
  where
   parseGetLanguagePackInfo :: A.Value -> T.Parser GetLanguagePackInfo
   parseGetLanguagePackInfo = A.withObject "GetLanguagePackInfo" $ \o -> do
    language_pack_id <- o A..: "language_pack_id"
    return $ GetLanguagePackInfo { language_pack_id = language_pack_id }