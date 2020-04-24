-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DeepLinkInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

data DeepLinkInfo = 
 DeepLinkInfo { need_update_application :: Maybe Bool, text :: Maybe FormattedText.FormattedText }  deriving (Show, Eq)

instance T.ToJSON DeepLinkInfo where
 toJSON (DeepLinkInfo { need_update_application = need_update_application, text = text }) =
  A.object [ "@type" A..= T.String "deepLinkInfo", "need_update_application" A..= need_update_application, "text" A..= text ]

instance T.FromJSON DeepLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deepLinkInfo" -> parseDeepLinkInfo v
   _ -> mempty
  where
   parseDeepLinkInfo :: A.Value -> T.Parser DeepLinkInfo
   parseDeepLinkInfo = A.withObject "DeepLinkInfo" $ \o -> do
    need_update_application <- optional $ o A..: "need_update_application"
    text <- optional $ o A..: "text"
    return $ DeepLinkInfo { need_update_application = need_update_application, text = text }