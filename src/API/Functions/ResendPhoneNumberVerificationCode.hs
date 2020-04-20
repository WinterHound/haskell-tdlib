-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendPhoneNumberVerificationCode = 
 ResendPhoneNumberVerificationCode -- deriving (Show)

instance T.ToJSON ResendPhoneNumberVerificationCode where
 toJSON (ResendPhoneNumberVerificationCode {  }) =
  A.object [ "@type" A..= T.String "resendPhoneNumberVerificationCode" ]
-- resendPhoneNumberVerificationCode ResendPhoneNumberVerificationCode 



instance T.FromJSON ResendPhoneNumberVerificationCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendPhoneNumberVerificationCode" -> parseResendPhoneNumberVerificationCode v
  where
   parseResendPhoneNumberVerificationCode :: A.Value -> T.Parser ResendPhoneNumberVerificationCode
   parseResendPhoneNumberVerificationCode = A.withObject "ResendPhoneNumberVerificationCode" $ \o -> do
    return $ ResendPhoneNumberVerificationCode {  }