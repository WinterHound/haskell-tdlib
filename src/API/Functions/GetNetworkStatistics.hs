-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetNetworkStatistics = 
 GetNetworkStatistics { only_current :: Bool }  -- deriving (Show)

instance T.ToJSON GetNetworkStatistics where
 toJSON (GetNetworkStatistics { only_current = only_current }) =
  A.object [ "@type" A..= T.String "getNetworkStatistics", "only_current" A..= only_current ]
-- getNetworkStatistics GetNetworkStatistics  { only_current :: Bool } 

