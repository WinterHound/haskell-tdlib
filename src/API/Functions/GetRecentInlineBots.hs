-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentInlineBots where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRecentInlineBots = 
 GetRecentInlineBots -- deriving (Show)

instance T.ToJSON GetRecentInlineBots where
 toJSON (GetRecentInlineBots {  }) =
  A.object [ "@type" A..= T.String "getRecentInlineBots" ]
-- getRecentInlineBots GetRecentInlineBots 



instance T.FromJSON GetRecentInlineBots where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecentInlineBots" -> parseGetRecentInlineBots v
  where
   parseGetRecentInlineBots :: A.Value -> T.Parser GetRecentInlineBots
   parseGetRecentInlineBots = A.withObject "GetRecentInlineBots" $ \o -> do
    return $ GetRecentInlineBots {  }