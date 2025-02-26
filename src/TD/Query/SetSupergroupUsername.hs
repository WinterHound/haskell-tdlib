{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetSupergroupUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the username of a supergroup or channel, requires owner privileges in the supergroup or channel @supergroup_id Identifier of the supergroup or channel @username New value of the username. Use an empty string to remove the username
data SetSupergroupUsername = SetSupergroupUsername
  { -- |
    username :: Maybe String,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetSupergroupUsername where
  show
    SetSupergroupUsername
      { username = username_,
        supergroup_id = supergroup_id_
      } =
      "SetSupergroupUsername"
        ++ U.cc
          [ U.p "username" username_,
            U.p "supergroup_id" supergroup_id_
          ]

instance T.ToJSON SetSupergroupUsername where
  toJSON
    SetSupergroupUsername
      { username = username_,
        supergroup_id = supergroup_id_
      } =
      A.object
        [ "@type" A..= T.String "setSupergroupUsername",
          "username" A..= username_,
          "supergroup_id" A..= supergroup_id_
        ]
