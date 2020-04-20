-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRecentStickers = 
 GetRecentStickers { is_attached :: Bool }  -- deriving (Show)

instance T.ToJSON GetRecentStickers where
 toJSON (GetRecentStickers { is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "getRecentStickers", "is_attached" A..= is_attached ]
-- getRecentStickers GetRecentStickers  { is_attached :: Bool } 



instance T.FromJSON GetRecentStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecentStickers" -> parseGetRecentStickers v
  where
   parseGetRecentStickers :: A.Value -> T.Parser GetRecentStickers
   parseGetRecentStickers = A.withObject "GetRecentStickers" $ \o -> do
    is_attached <- o A..: "is_attached"
    return $ GetRecentStickers { is_attached = is_attached }