-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAutoDownloadSettingsPresets where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetAutoDownloadSettingsPresets = 
 GetAutoDownloadSettingsPresets deriving (Show, Eq)

instance T.ToJSON GetAutoDownloadSettingsPresets where
 toJSON (GetAutoDownloadSettingsPresets {  }) =
  A.object [ "@type" A..= T.String "getAutoDownloadSettingsPresets" ]

instance T.FromJSON GetAutoDownloadSettingsPresets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAutoDownloadSettingsPresets" -> parseGetAutoDownloadSettingsPresets v
   _ -> mempty
  where
   parseGetAutoDownloadSettingsPresets :: A.Value -> T.Parser GetAutoDownloadSettingsPresets
   parseGetAutoDownloadSettingsPresets = A.withObject "GetAutoDownloadSettingsPresets" $ \o -> do
    return $ GetAutoDownloadSettingsPresets {  }