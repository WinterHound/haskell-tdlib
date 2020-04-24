-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetUserPrivacySettingRules where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserPrivacySettingRules as UserPrivacySettingRules
import {-# SOURCE #-} qualified API.UserPrivacySetting as UserPrivacySetting

data SetUserPrivacySettingRules = 
 SetUserPrivacySettingRules { rules :: Maybe UserPrivacySettingRules.UserPrivacySettingRules, setting :: Maybe UserPrivacySetting.UserPrivacySetting }  deriving (Show, Eq)

instance T.ToJSON SetUserPrivacySettingRules where
 toJSON (SetUserPrivacySettingRules { rules = rules, setting = setting }) =
  A.object [ "@type" A..= T.String "setUserPrivacySettingRules", "rules" A..= rules, "setting" A..= setting ]

instance T.FromJSON SetUserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setUserPrivacySettingRules" -> parseSetUserPrivacySettingRules v
   _ -> mempty
  where
   parseSetUserPrivacySettingRules :: A.Value -> T.Parser SetUserPrivacySettingRules
   parseSetUserPrivacySettingRules = A.withObject "SetUserPrivacySettingRules" $ \o -> do
    rules <- optional $ o A..: "rules"
    setting <- optional $ o A..: "setting"
    return $ SetUserPrivacySettingRules { rules = rules, setting = setting }