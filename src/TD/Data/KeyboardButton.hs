{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.KeyboardButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.KeyboardButtonType as KeyboardButtonType
import qualified Utils as U

-- |
data KeyboardButton = -- | Represents a single button in a bot keyboard @text Text of the button @type Type of the button
  KeyboardButton
  { -- |
    _type :: Maybe KeyboardButtonType.KeyboardButtonType,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show KeyboardButton where
  show
    KeyboardButton
      { _type = _type_,
        text = text_
      } =
      "KeyboardButton"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "text" text_
          ]

instance T.FromJSON KeyboardButton where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "keyboardButton" -> parseKeyboardButton v
      _ -> mempty
    where
      parseKeyboardButton :: A.Value -> T.Parser KeyboardButton
      parseKeyboardButton = A.withObject "KeyboardButton" $ \o -> do
        _type_ <- o A..:? "type"
        text_ <- o A..:? "text"
        return $ KeyboardButton {_type = _type_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON KeyboardButton where
  toJSON
    KeyboardButton
      { _type = _type_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "keyboardButton",
          "type" A..= _type_,
          "text" A..= text_
        ]
