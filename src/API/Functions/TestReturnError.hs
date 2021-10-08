-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestReturnError where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Error as Error

-- |
-- 
-- Returns the specified error and ensures that the Error object is used; for testing only. Can be called synchronously 
-- 
-- __error__ The error to be returned
data TestReturnError = 

 TestReturnError { _error :: Maybe Error.Error }  deriving (Eq)

instance Show TestReturnError where
 show TestReturnError { _error=_error } =
  "TestReturnError" ++ cc [p "_error" _error ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TestReturnError where
 toJSON TestReturnError { _error = _error } =
  A.object [ "@type" A..= T.String "testReturnError", "error" A..= _error ]

instance T.FromJSON TestReturnError where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testReturnError" -> parseTestReturnError v
   _ -> mempty
  where
   parseTestReturnError :: A.Value -> T.Parser TestReturnError
   parseTestReturnError = A.withObject "TestReturnError" $ \o -> do
    _error <- o A..:? "error"
    return $ TestReturnError { _error = _error }
 parseJSON _ = mempty
