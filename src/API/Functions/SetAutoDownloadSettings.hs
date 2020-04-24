-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetAutoDownloadSettings where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkType as NetworkType
import {-# SOURCE #-} qualified API.AutoDownloadSettings as AutoDownloadSettings

data SetAutoDownloadSettings = 
 SetAutoDownloadSettings { _type :: Maybe NetworkType.NetworkType, settings :: Maybe AutoDownloadSettings.AutoDownloadSettings }  deriving (Show, Eq)

instance T.ToJSON SetAutoDownloadSettings where
 toJSON (SetAutoDownloadSettings { _type = _type, settings = settings }) =
  A.object [ "@type" A..= T.String "setAutoDownloadSettings", "type" A..= _type, "settings" A..= settings ]

instance T.FromJSON SetAutoDownloadSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setAutoDownloadSettings" -> parseSetAutoDownloadSettings v
   _ -> mempty
  where
   parseSetAutoDownloadSettings :: A.Value -> T.Parser SetAutoDownloadSettings
   parseSetAutoDownloadSettings = A.withObject "SetAutoDownloadSettings" $ \o -> do
    _type <- optional $ o A..: "type"
    settings <- optional $ o A..: "settings"
    return $ SetAutoDownloadSettings { _type = _type, settings = settings }