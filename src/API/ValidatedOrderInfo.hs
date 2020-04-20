-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ValidatedOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ShippingOption as ShippingOption

--main = putStrLn "ok"

data ValidatedOrderInfo = 
 ValidatedOrderInfo { shipping_options :: [ShippingOption.ShippingOption], order_info_id :: String }  -- deriving (Show)

instance T.ToJSON ValidatedOrderInfo where
 toJSON (ValidatedOrderInfo { shipping_options = shipping_options, order_info_id = order_info_id }) =
  A.object [ "@type" A..= T.String "validatedOrderInfo", "shipping_options" A..= shipping_options, "order_info_id" A..= order_info_id ]
-- validatedOrderInfo ValidatedOrderInfo  { shipping_options :: [ShippingOption.ShippingOption], order_info_id :: String } 



instance T.FromJSON ValidatedOrderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "validatedOrderInfo" -> parseValidatedOrderInfo v
  where
   parseValidatedOrderInfo :: A.Value -> T.Parser ValidatedOrderInfo
   parseValidatedOrderInfo = A.withObject "ValidatedOrderInfo" $ \o -> do
    shipping_options <- o A..: "shipping_options"
    order_info_id <- o A..: "order_info_id"
    return $ ValidatedOrderInfo { shipping_options = shipping_options, order_info_id = order_info_id }