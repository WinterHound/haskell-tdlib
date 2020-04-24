-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetOption where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.OptionValue as OptionValue

data SetOption = 
 SetOption { value :: Maybe OptionValue.OptionValue, name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SetOption where
 toJSON (SetOption { value = value, name = name }) =
  A.object [ "@type" A..= T.String "setOption", "value" A..= value, "name" A..= name ]

instance T.FromJSON SetOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setOption" -> parseSetOption v
   _ -> mempty
  where
   parseSetOption :: A.Value -> T.Parser SetOption
   parseSetOption = A.withObject "SetOption" $ \o -> do
    value <- optional $ o A..: "value"
    name <- optional $ o A..: "name"
    return $ SetOption { value = value, name = name }