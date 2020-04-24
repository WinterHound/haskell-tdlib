-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.UserPrivacySettingRules where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.UserPrivacySettingRule as UserPrivacySettingRule

data UserPrivacySettingRules = 
 UserPrivacySettingRules { rules :: Maybe [UserPrivacySettingRule.UserPrivacySettingRule] }  deriving (Show, Eq)

instance T.ToJSON UserPrivacySettingRules where
 toJSON (UserPrivacySettingRules { rules = rules }) =
  A.object [ "@type" A..= T.String "userPrivacySettingRules", "rules" A..= rules ]

instance T.FromJSON UserPrivacySettingRules where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "userPrivacySettingRules" -> parseUserPrivacySettingRules v
   _ -> mempty
  where
   parseUserPrivacySettingRules :: A.Value -> T.Parser UserPrivacySettingRules
   parseUserPrivacySettingRules = A.withObject "UserPrivacySettingRules" $ \o -> do
    rules <- optional $ o A..: "rules"
    return $ UserPrivacySettingRules { rules = rules }