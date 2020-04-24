-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageSendingState where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data MessageSendingState = 
 MessageSendingStatePending 
 | MessageSendingStateFailed { retry_after :: Maybe Float, can_retry :: Maybe Bool, error_message :: Maybe String, error_code :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON MessageSendingState where
 toJSON (MessageSendingStatePending {  }) =
  A.object [ "@type" A..= T.String "messageSendingStatePending" ]

 toJSON (MessageSendingStateFailed { retry_after = retry_after, can_retry = can_retry, error_message = error_message, error_code = error_code }) =
  A.object [ "@type" A..= T.String "messageSendingStateFailed", "retry_after" A..= retry_after, "can_retry" A..= can_retry, "error_message" A..= error_message, "error_code" A..= error_code ]

instance T.FromJSON MessageSendingState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageSendingStatePending" -> parseMessageSendingStatePending v
   "messageSendingStateFailed" -> parseMessageSendingStateFailed v
   _ -> mempty
  where
   parseMessageSendingStatePending :: A.Value -> T.Parser MessageSendingState
   parseMessageSendingStatePending = A.withObject "MessageSendingStatePending" $ \o -> do
    return $ MessageSendingStatePending {  }

   parseMessageSendingStateFailed :: A.Value -> T.Parser MessageSendingState
   parseMessageSendingStateFailed = A.withObject "MessageSendingStateFailed" $ \o -> do
    retry_after <- optional $ o A..: "retry_after"
    can_retry <- optional $ o A..: "can_retry"
    error_message <- optional $ o A..: "error_message"
    error_code <- optional $ o A..: "error_code"
    return $ MessageSendingStateFailed { retry_after = retry_after, can_retry = can_retry, error_message = error_message, error_code = error_code }