-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchChatsNearby where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

data SearchChatsNearby = 
 SearchChatsNearby { location :: Maybe Location.Location }  deriving (Show, Eq)

instance T.ToJSON SearchChatsNearby where
 toJSON (SearchChatsNearby { location = location }) =
  A.object [ "@type" A..= T.String "searchChatsNearby", "location" A..= location ]

instance T.FromJSON SearchChatsNearby where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchChatsNearby" -> parseSearchChatsNearby v
   _ -> mempty
  where
   parseSearchChatsNearby :: A.Value -> T.Parser SearchChatsNearby
   parseSearchChatsNearby = A.withObject "SearchChatsNearby" $ \o -> do
    location <- optional $ o A..: "location"
    return $ SearchChatsNearby { location = location }