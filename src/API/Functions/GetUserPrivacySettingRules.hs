-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetUserPrivacySettingRules where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting

data GetUserPrivacySettingRules = 
 GetUserPrivacySettingRules { setting :: Maybe UserPrivacySetting.UserPrivacySetting }  deriving (Show, Eq)

instance T.ToJSON GetUserPrivacySettingRules where
 toJSON (GetUserPrivacySettingRules { setting = setting }) =
  A.object [ "@type" A..= T.String "getUserPrivacySettingRules", "setting" A..= setting ]

instance T.FromJSON GetUserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getUserPrivacySettingRules" -> parseGetUserPrivacySettingRules v
   _ -> mempty
  where
   parseGetUserPrivacySettingRules :: A.Value -> T.Parser GetUserPrivacySettingRules
   parseGetUserPrivacySettingRules = A.withObject "GetUserPrivacySettingRules" $ \o -> do
    setting <- optional $ o A..: "setting"
    return $ GetUserPrivacySettingRules { setting = setting }