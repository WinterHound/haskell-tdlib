-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddNetworkStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.NetworkStatisticsEntry as NetworkStatisticsEntry

-- |
-- 
-- Adds the specified data to data usage statistics. Can be called before authorization 
-- 
-- __entry__ The network statistics entry with the data to be added to statistics
data AddNetworkStatistics = 

 AddNetworkStatistics { entry :: Maybe NetworkStatisticsEntry.NetworkStatisticsEntry }  deriving (Eq)

instance Show AddNetworkStatistics where
 show AddNetworkStatistics { entry=entry } =
  "AddNetworkStatistics" ++ cc [p "entry" entry ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AddNetworkStatistics where
 toJSON AddNetworkStatistics { entry = entry } =
  A.object [ "@type" A..= T.String "addNetworkStatistics", "entry" A..= entry ]

instance T.FromJSON AddNetworkStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addNetworkStatistics" -> parseAddNetworkStatistics v
   _ -> mempty
  where
   parseAddNetworkStatistics :: A.Value -> T.Parser AddNetworkStatistics
   parseAddNetworkStatistics = A.withObject "AddNetworkStatistics" $ \o -> do
    entry <- o A..:? "entry"
    return $ AddNetworkStatistics { entry = entry }
 parseJSON _ = mempty
