{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetSupergroupMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SupergroupMembersFilter as SupergroupMembersFilter
import qualified Utils as U

-- |
-- Returns information about members or banned users in a supergroup or channel. Can be used only if supergroupFullInfo.can_get_members == true; additionally, administrator privileges may be required for some filters @supergroup_id Identifier of the supergroup or channel
data GetSupergroupMembers = GetSupergroupMembers
  { -- |
    limit :: Maybe Int,
    -- |
    offset :: Maybe Int,
    -- | The type of users to return; pass null to use supergroupMembersFilterRecent @offset Number of users to skip @limit The maximum number of users be returned; up to 200
    _filter :: Maybe SupergroupMembersFilter.SupergroupMembersFilter,
    -- |
    supergroup_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetSupergroupMembers where
  show
    GetSupergroupMembers
      { limit = limit,
        offset = offset,
        _filter = _filter,
        supergroup_id = supergroup_id
      } =
      "GetSupergroupMembers"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset" offset,
            U.p "_filter" _filter,
            U.p "supergroup_id" supergroup_id
          ]

instance T.ToJSON GetSupergroupMembers where
  toJSON
    GetSupergroupMembers
      { limit = limit,
        offset = offset,
        _filter = _filter,
        supergroup_id = supergroup_id
      } =
      A.object
        [ "@type" A..= T.String "getSupergroupMembers",
          "limit" A..= limit,
          "offset" A..= offset,
          "filter" A..= _filter,
          "supergroup_id" A..= supergroup_id
        ]
