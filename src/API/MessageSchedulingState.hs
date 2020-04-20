-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSchedulingState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data MessageSchedulingState = 
 MessageSchedulingStateSendAtDate { send_date :: Int }  
 | MessageSchedulingStateSendWhenOnline -- deriving (Show)

instance T.ToJSON MessageSchedulingState where
 toJSON (MessageSchedulingStateSendAtDate { send_date = send_date }) =
  A.object [ "@type" A..= T.String "messageSchedulingStateSendAtDate", "send_date" A..= send_date ]

 toJSON (MessageSchedulingStateSendWhenOnline {  }) =
  A.object [ "@type" A..= T.String "messageSchedulingStateSendWhenOnline" ]
-- messageSchedulingStateSendAtDate MessageSchedulingState  { send_date :: Int } 

-- messageSchedulingStateSendWhenOnline MessageSchedulingState 



instance T.FromJSON MessageSchedulingState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageSchedulingStateSendAtDate" -> parseMessageSchedulingStateSendAtDate v
   "messageSchedulingStateSendWhenOnline" -> parseMessageSchedulingStateSendWhenOnline v
  where
   parseMessageSchedulingStateSendAtDate :: A.Value -> T.Parser MessageSchedulingState
   parseMessageSchedulingStateSendAtDate = A.withObject "MessageSchedulingStateSendAtDate" $ \o -> do
    send_date <- o A..: "send_date"
    return $ MessageSchedulingStateSendAtDate { send_date = send_date }

   parseMessageSchedulingStateSendWhenOnline :: A.Value -> T.Parser MessageSchedulingState
   parseMessageSchedulingStateSendWhenOnline = A.withObject "MessageSchedulingStateSendWhenOnline" $ \o -> do
    return $ MessageSchedulingStateSendWhenOnline {  }