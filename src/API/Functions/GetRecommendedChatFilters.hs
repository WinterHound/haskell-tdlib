-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecommendedChatFilters where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns recommended chat filters for the current user
data GetRecommendedChatFilters = 

 GetRecommendedChatFilters deriving (Show, Eq)

instance T.ToJSON GetRecommendedChatFilters where
 toJSON (GetRecommendedChatFilters {  }) =
  A.object [ "@type" A..= T.String "getRecommendedChatFilters" ]

instance T.FromJSON GetRecommendedChatFilters where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecommendedChatFilters" -> parseGetRecommendedChatFilters v
   _ -> mempty
  where
   parseGetRecommendedChatFilters :: A.Value -> T.Parser GetRecommendedChatFilters
   parseGetRecommendedChatFilters = A.withObject "GetRecommendedChatFilters" $ \o -> do
    return $ GetRecommendedChatFilters {  }