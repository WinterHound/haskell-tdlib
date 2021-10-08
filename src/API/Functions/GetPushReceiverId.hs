-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPushReceiverId where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously 
-- 
-- __payload__ JSON-encoded push notification payload
data GetPushReceiverId = 

 GetPushReceiverId { payload :: Maybe String }  deriving (Eq)

instance Show GetPushReceiverId where
 show GetPushReceiverId { payload=payload } =
  "GetPushReceiverId" ++ cc [p "payload" payload ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetPushReceiverId where
 toJSON GetPushReceiverId { payload = payload } =
  A.object [ "@type" A..= T.String "getPushReceiverId", "payload" A..= payload ]

instance T.FromJSON GetPushReceiverId where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPushReceiverId" -> parseGetPushReceiverId v
   _ -> mempty
  where
   parseGetPushReceiverId :: A.Value -> T.Parser GetPushReceiverId
   parseGetPushReceiverId = A.withObject "GetPushReceiverId" $ \o -> do
    payload <- o A..:? "payload"
    return $ GetPushReceiverId { payload = payload }
 parseJSON _ = mempty
