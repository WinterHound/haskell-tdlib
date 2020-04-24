-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Users where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Users = 
 Users { user_ids :: Maybe [Int], total_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Users where
 toJSON (Users { user_ids = user_ids, total_count = total_count }) =
  A.object [ "@type" A..= T.String "users", "user_ids" A..= user_ids, "total_count" A..= total_count ]

instance T.FromJSON Users where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "users" -> parseUsers v
   _ -> mempty
  where
   parseUsers :: A.Value -> T.Parser Users
   parseUsers = A.withObject "Users" $ \o -> do
    user_ids <- optional $ o A..: "user_ids"
    total_count <- optional $ o A..: "total_count"
    return $ Users { user_ids = user_ids, total_count = total_count }