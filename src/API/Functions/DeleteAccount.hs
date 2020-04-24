-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteAccount where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DeleteAccount = 
 DeleteAccount { reason :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON DeleteAccount where
 toJSON (DeleteAccount { reason = reason }) =
  A.object [ "@type" A..= T.String "deleteAccount", "reason" A..= reason ]

instance T.FromJSON DeleteAccount where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteAccount" -> parseDeleteAccount v
   _ -> mempty
  where
   parseDeleteAccount :: A.Value -> T.Parser DeleteAccount
   parseDeleteAccount = A.withObject "DeleteAccount" $ \o -> do
    reason <- optional $ o A..: "reason"
    return $ DeleteAccount { reason = reason }