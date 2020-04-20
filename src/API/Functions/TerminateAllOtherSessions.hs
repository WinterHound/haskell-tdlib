-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TerminateAllOtherSessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TerminateAllOtherSessions = 
 TerminateAllOtherSessions -- deriving (Show)

instance T.ToJSON TerminateAllOtherSessions where
 toJSON (TerminateAllOtherSessions {  }) =
  A.object [ "@type" A..= T.String "terminateAllOtherSessions" ]
-- terminateAllOtherSessions TerminateAllOtherSessions 



instance T.FromJSON TerminateAllOtherSessions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "terminateAllOtherSessions" -> parseTerminateAllOtherSessions v
  where
   parseTerminateAllOtherSessions :: A.Value -> T.Parser TerminateAllOtherSessions
   parseTerminateAllOtherSessions = A.withObject "TerminateAllOtherSessions" $ \o -> do
    return $ TerminateAllOtherSessions {  }