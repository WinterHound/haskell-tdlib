{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PassportElementType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains the type of a Telegram Passport element
data PassportElementType
  = -- | A Telegram Passport element containing the user's personal details
    PassportElementTypePersonalDetails
  | -- | A Telegram Passport element containing the user's passport
    PassportElementTypePassport
  | -- | A Telegram Passport element containing the user's driver license
    PassportElementTypeDriverLicense
  | -- | A Telegram Passport element containing the user's identity card
    PassportElementTypeIdentityCard
  | -- | A Telegram Passport element containing the user's internal passport
    PassportElementTypeInternalPassport
  | -- | A Telegram Passport element containing the user's address
    PassportElementTypeAddress
  | -- | A Telegram Passport element containing the user's utility bill
    PassportElementTypeUtilityBill
  | -- | A Telegram Passport element containing the user's bank statement
    PassportElementTypeBankStatement
  | -- | A Telegram Passport element containing the user's rental agreement
    PassportElementTypeRentalAgreement
  | -- | A Telegram Passport element containing the registration page of the user's passport
    PassportElementTypePassportRegistration
  | -- | A Telegram Passport element containing the user's temporary registration
    PassportElementTypeTemporaryRegistration
  | -- | A Telegram Passport element containing the user's phone number
    PassportElementTypePhoneNumber
  | -- | A Telegram Passport element containing the user's email address
    PassportElementTypeEmailAddress
  deriving (Eq)

instance Show PassportElementType where
  show PassportElementTypePersonalDetails =
    "PassportElementTypePersonalDetails"
      ++ U.cc
        []
  show PassportElementTypePassport =
    "PassportElementTypePassport"
      ++ U.cc
        []
  show PassportElementTypeDriverLicense =
    "PassportElementTypeDriverLicense"
      ++ U.cc
        []
  show PassportElementTypeIdentityCard =
    "PassportElementTypeIdentityCard"
      ++ U.cc
        []
  show PassportElementTypeInternalPassport =
    "PassportElementTypeInternalPassport"
      ++ U.cc
        []
  show PassportElementTypeAddress =
    "PassportElementTypeAddress"
      ++ U.cc
        []
  show PassportElementTypeUtilityBill =
    "PassportElementTypeUtilityBill"
      ++ U.cc
        []
  show PassportElementTypeBankStatement =
    "PassportElementTypeBankStatement"
      ++ U.cc
        []
  show PassportElementTypeRentalAgreement =
    "PassportElementTypeRentalAgreement"
      ++ U.cc
        []
  show PassportElementTypePassportRegistration =
    "PassportElementTypePassportRegistration"
      ++ U.cc
        []
  show PassportElementTypeTemporaryRegistration =
    "PassportElementTypeTemporaryRegistration"
      ++ U.cc
        []
  show PassportElementTypePhoneNumber =
    "PassportElementTypePhoneNumber"
      ++ U.cc
        []
  show PassportElementTypeEmailAddress =
    "PassportElementTypeEmailAddress"
      ++ U.cc
        []

instance T.FromJSON PassportElementType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportElementTypePersonalDetails" -> parsePassportElementTypePersonalDetails v
      "passportElementTypePassport" -> parsePassportElementTypePassport v
      "passportElementTypeDriverLicense" -> parsePassportElementTypeDriverLicense v
      "passportElementTypeIdentityCard" -> parsePassportElementTypeIdentityCard v
      "passportElementTypeInternalPassport" -> parsePassportElementTypeInternalPassport v
      "passportElementTypeAddress" -> parsePassportElementTypeAddress v
      "passportElementTypeUtilityBill" -> parsePassportElementTypeUtilityBill v
      "passportElementTypeBankStatement" -> parsePassportElementTypeBankStatement v
      "passportElementTypeRentalAgreement" -> parsePassportElementTypeRentalAgreement v
      "passportElementTypePassportRegistration" -> parsePassportElementTypePassportRegistration v
      "passportElementTypeTemporaryRegistration" -> parsePassportElementTypeTemporaryRegistration v
      "passportElementTypePhoneNumber" -> parsePassportElementTypePhoneNumber v
      "passportElementTypeEmailAddress" -> parsePassportElementTypeEmailAddress v
      _ -> mempty
    where
      parsePassportElementTypePersonalDetails :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypePersonalDetails = A.withObject "PassportElementTypePersonalDetails" $ \_ -> return PassportElementTypePersonalDetails

      parsePassportElementTypePassport :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypePassport = A.withObject "PassportElementTypePassport" $ \_ -> return PassportElementTypePassport

      parsePassportElementTypeDriverLicense :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeDriverLicense = A.withObject "PassportElementTypeDriverLicense" $ \_ -> return PassportElementTypeDriverLicense

      parsePassportElementTypeIdentityCard :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeIdentityCard = A.withObject "PassportElementTypeIdentityCard" $ \_ -> return PassportElementTypeIdentityCard

      parsePassportElementTypeInternalPassport :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeInternalPassport = A.withObject "PassportElementTypeInternalPassport" $ \_ -> return PassportElementTypeInternalPassport

      parsePassportElementTypeAddress :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeAddress = A.withObject "PassportElementTypeAddress" $ \_ -> return PassportElementTypeAddress

      parsePassportElementTypeUtilityBill :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeUtilityBill = A.withObject "PassportElementTypeUtilityBill" $ \_ -> return PassportElementTypeUtilityBill

      parsePassportElementTypeBankStatement :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeBankStatement = A.withObject "PassportElementTypeBankStatement" $ \_ -> return PassportElementTypeBankStatement

      parsePassportElementTypeRentalAgreement :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeRentalAgreement = A.withObject "PassportElementTypeRentalAgreement" $ \_ -> return PassportElementTypeRentalAgreement

      parsePassportElementTypePassportRegistration :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypePassportRegistration = A.withObject "PassportElementTypePassportRegistration" $ \_ -> return PassportElementTypePassportRegistration

      parsePassportElementTypeTemporaryRegistration :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeTemporaryRegistration = A.withObject "PassportElementTypeTemporaryRegistration" $ \_ -> return PassportElementTypeTemporaryRegistration

      parsePassportElementTypePhoneNumber :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypePhoneNumber = A.withObject "PassportElementTypePhoneNumber" $ \_ -> return PassportElementTypePhoneNumber

      parsePassportElementTypeEmailAddress :: A.Value -> T.Parser PassportElementType
      parsePassportElementTypeEmailAddress = A.withObject "PassportElementTypeEmailAddress" $ \_ -> return PassportElementTypeEmailAddress
  parseJSON _ = mempty

instance T.ToJSON PassportElementType where
  toJSON PassportElementTypePersonalDetails =
    A.object
      [ "@type" A..= T.String "passportElementTypePersonalDetails"
      ]
  toJSON PassportElementTypePassport =
    A.object
      [ "@type" A..= T.String "passportElementTypePassport"
      ]
  toJSON PassportElementTypeDriverLicense =
    A.object
      [ "@type" A..= T.String "passportElementTypeDriverLicense"
      ]
  toJSON PassportElementTypeIdentityCard =
    A.object
      [ "@type" A..= T.String "passportElementTypeIdentityCard"
      ]
  toJSON PassportElementTypeInternalPassport =
    A.object
      [ "@type" A..= T.String "passportElementTypeInternalPassport"
      ]
  toJSON PassportElementTypeAddress =
    A.object
      [ "@type" A..= T.String "passportElementTypeAddress"
      ]
  toJSON PassportElementTypeUtilityBill =
    A.object
      [ "@type" A..= T.String "passportElementTypeUtilityBill"
      ]
  toJSON PassportElementTypeBankStatement =
    A.object
      [ "@type" A..= T.String "passportElementTypeBankStatement"
      ]
  toJSON PassportElementTypeRentalAgreement =
    A.object
      [ "@type" A..= T.String "passportElementTypeRentalAgreement"
      ]
  toJSON PassportElementTypePassportRegistration =
    A.object
      [ "@type" A..= T.String "passportElementTypePassportRegistration"
      ]
  toJSON PassportElementTypeTemporaryRegistration =
    A.object
      [ "@type" A..= T.String "passportElementTypeTemporaryRegistration"
      ]
  toJSON PassportElementTypePhoneNumber =
    A.object
      [ "@type" A..= T.String "passportElementTypePhoneNumber"
      ]
  toJSON PassportElementTypeEmailAddress =
    A.object
      [ "@type" A..= T.String "passportElementTypeEmailAddress"
      ]
