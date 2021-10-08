-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LogOut where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Closes the TDLib instance after a proper logout. Requires an available network connection. All local data will be destroyed. After the logout completes, updateAuthorizationState with authorizationStateClosed will be sent
data LogOut = 

 LogOut deriving (Eq)

instance Show LogOut where
 show LogOut {  } =
  "LogOut" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON LogOut where
 toJSON LogOut {  } =
  A.object [ "@type" A..= T.String "logOut" ]

instance T.FromJSON LogOut where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "logOut" -> parseLogOut v
   _ -> mempty
  where
   parseLogOut :: A.Value -> T.Parser LogOut
   parseLogOut = A.withObject "LogOut" $ \o -> do
    return $ LogOut {  }
 parseJSON _ = mempty
