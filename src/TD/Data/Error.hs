{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Error where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data Error = -- | An object of this type can be returned on every function call, in case of an error
  Error
  { -- | Error message; subject to future changes
    message :: Maybe String,
    -- | Error code; subject to future changes. If the error code is 406, the error message must not be processed in any way and must not be displayed to the user
    code :: Maybe Int
  }
  deriving (Eq)

instance Show Error where
  show
    Error
      { message = message_,
        code = code_
      } =
      "Error"
        ++ U.cc
          [ U.p "message" message_,
            U.p "code" code_
          ]

instance T.FromJSON Error where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "error" -> parseError v
      _ -> mempty
    where
      parseError :: A.Value -> T.Parser Error
      parseError = A.withObject "Error" $ \o -> do
        message_ <- o A..:? "message"
        code_ <- o A..:? "code"
        return $ Error {message = message_, code = code_}
  parseJSON _ = mempty

instance T.ToJSON Error where
  toJSON
    Error
      { message = message_,
        code = code_
      } =
      A.object
        [ "@type" A..= T.String "error",
          "message" A..= message_,
          "code" A..= code_
        ]
