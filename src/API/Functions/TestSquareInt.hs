-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestSquareInt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data TestSquareInt = 
 TestSquareInt { x :: Int }  -- deriving (Show)

instance T.ToJSON TestSquareInt where
 toJSON (TestSquareInt { x = x }) =
  A.object [ "@type" A..= T.String "testSquareInt", "x" A..= x ]
-- testSquareInt TestSquareInt  { x :: Int } 



instance T.FromJSON TestSquareInt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testSquareInt" -> parseTestSquareInt v
  where
   parseTestSquareInt :: A.Value -> T.Parser TestSquareInt
   parseTestSquareInt = A.withObject "TestSquareInt" $ \o -> do
    x <- o A..: "x"
    return $ TestSquareInt { x = x }