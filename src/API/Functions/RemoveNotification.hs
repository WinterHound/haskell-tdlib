-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveNotification = 
 RemoveNotification { notification_id :: Int, notification_group_id :: Int }  -- deriving (Show)

instance T.ToJSON RemoveNotification where
 toJSON (RemoveNotification { notification_id = notification_id, notification_group_id = notification_group_id }) =
  A.object [ "@type" A..= T.String "removeNotification", "notification_id" A..= notification_id, "notification_group_id" A..= notification_group_id ]
-- removeNotification RemoveNotification  { notification_id :: Int, notification_group_id :: Int } 



instance T.FromJSON RemoveNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeNotification" -> parseRemoveNotification v
  where
   parseRemoveNotification :: A.Value -> T.Parser RemoveNotification
   parseRemoveNotification = A.withObject "RemoveNotification" $ \o -> do
    notification_id <- o A..: "notification_id"
    notification_group_id <- o A..: "notification_group_id"
    return $ RemoveNotification { notification_id = notification_id, notification_group_id = notification_group_id }