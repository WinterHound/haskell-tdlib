-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateSupergroupChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CreateSupergroupChat = 
 CreateSupergroupChat { force :: Bool, supergroup_id :: Int }  -- deriving (Show)

instance T.ToJSON CreateSupergroupChat where
 toJSON (CreateSupergroupChat { force = force, supergroup_id = supergroup_id }) =
  A.object [ "@type" A..= T.String "createSupergroupChat", "force" A..= force, "supergroup_id" A..= supergroup_id ]
-- createSupergroupChat CreateSupergroupChat  { force :: Bool, supergroup_id :: Int } 

