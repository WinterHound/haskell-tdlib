-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.KeyboardButtonType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data KeyboardButtonType = 
 KeyboardButtonTypeText 
 | KeyboardButtonTypeRequestPhoneNumber 
 | KeyboardButtonTypeRequestLocation 
 | KeyboardButtonTypeRequestPoll { force_quiz :: Bool, force_regular :: Bool }  -- deriving (Show)

instance T.ToJSON KeyboardButtonType where
 toJSON (KeyboardButtonTypeText {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeText" ]

 toJSON (KeyboardButtonTypeRequestPhoneNumber {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestPhoneNumber" ]

 toJSON (KeyboardButtonTypeRequestLocation {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestLocation" ]

 toJSON (KeyboardButtonTypeRequestPoll { force_quiz = force_quiz, force_regular = force_regular }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestPoll", "force_quiz" A..= force_quiz, "force_regular" A..= force_regular ]
-- keyboardButtonTypeText KeyboardButtonType 

-- keyboardButtonTypeRequestPhoneNumber KeyboardButtonType 

-- keyboardButtonTypeRequestLocation KeyboardButtonType 

-- keyboardButtonTypeRequestPoll KeyboardButtonType  { force_quiz :: Bool, force_regular :: Bool } 



instance T.FromJSON KeyboardButtonType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "keyboardButtonTypeText" -> parseKeyboardButtonTypeText v
   "keyboardButtonTypeRequestPhoneNumber" -> parseKeyboardButtonTypeRequestPhoneNumber v
   "keyboardButtonTypeRequestLocation" -> parseKeyboardButtonTypeRequestLocation v
   "keyboardButtonTypeRequestPoll" -> parseKeyboardButtonTypeRequestPoll v
  where
   parseKeyboardButtonTypeText :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeText = A.withObject "KeyboardButtonTypeText" $ \o -> do
    return $ KeyboardButtonTypeText {  }

   parseKeyboardButtonTypeRequestPhoneNumber :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeRequestPhoneNumber = A.withObject "KeyboardButtonTypeRequestPhoneNumber" $ \o -> do
    return $ KeyboardButtonTypeRequestPhoneNumber {  }

   parseKeyboardButtonTypeRequestLocation :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeRequestLocation = A.withObject "KeyboardButtonTypeRequestLocation" $ \o -> do
    return $ KeyboardButtonTypeRequestLocation {  }

   parseKeyboardButtonTypeRequestPoll :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeRequestPoll = A.withObject "KeyboardButtonTypeRequestPoll" $ \o -> do
    force_quiz <- o A..: "force_quiz"
    force_regular <- o A..: "force_regular"
    return $ KeyboardButtonTypeRequestPoll { force_quiz = force_quiz, force_regular = force_regular }