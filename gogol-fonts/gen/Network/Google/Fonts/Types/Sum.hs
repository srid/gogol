{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE OverloadedStrings  #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Network.Google.Fonts.Types.Sum
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.Google.Fonts.Types.Sum where

import           Network.Google.Prelude

-- | Data format for the response.
data Alt
    = JSON
      -- ^ @json@
      -- Responses with Content-Type of application\/json
      deriving (Eq,Ord,Enum,Read,Show,Data,Typeable,Generic)

instance Hashable Alt

instance FromText Alt where
    fromText = \case
        "json" -> Just JSON
        _ -> Nothing

instance ToText Alt where
    toText = \case
        JSON -> "json"

instance FromJSON Alt where
    parseJSON = parseJSONText "Alt"

instance ToJSON Alt where
    toJSON = toJSONText

-- | Enables sorting of the list
data WebfontsList'Sort
    = Alpha
      -- ^ @alpha@
      -- Sort alphabetically
    | Date
      -- ^ @date@
      -- Sort by date added
    | Popularity
      -- ^ @popularity@
      -- Sort by popularity
    | Style
      -- ^ @style@
      -- Sort by number of styles
    | Trending
      -- ^ @trending@
      -- Sort by trending
      deriving (Eq,Ord,Enum,Read,Show,Data,Typeable,Generic)

instance Hashable WebfontsList'Sort

instance FromText WebfontsList'Sort where
    fromText = \case
        "alpha" -> Just Alpha
        "date" -> Just Date
        "popularity" -> Just Popularity
        "style" -> Just Style
        "trending" -> Just Trending
        _ -> Nothing

instance ToText WebfontsList'Sort where
    toText = \case
        Alpha -> "alpha"
        Date -> "date"
        Popularity -> "popularity"
        Style -> "style"
        Trending -> "trending"

instance FromJSON WebfontsList'Sort where
    parseJSON = parseJSONText "WebfontsList'Sort"

instance ToJSON WebfontsList'Sort where
    toJSON = toJSONText