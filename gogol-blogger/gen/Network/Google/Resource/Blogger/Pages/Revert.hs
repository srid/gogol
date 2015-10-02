{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.Blogger.Pages.Revert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Revert a published or scheduled page to draft state.
--
-- /See:/ <https://developers.google.com/blogger/docs/3.0/getting_started Blogger API Reference> for @BloggerPagesRevert@.
module Network.Google.Resource.Blogger.Pages.Revert
    (
    -- * REST Resource
      PagesRevertResource

    -- * Creating a Request
    , pagesRevert'
    , PagesRevert'

    -- * Request Lenses
    , pagQuotaUser
    , pagPrettyPrint
    , pagUserIP
    , pagBlogId
    , pagPageId
    , pagKey
    , pagOAuthToken
    , pagFields
    ) where

import           Network.Google.Blogger.Types
import           Network.Google.Prelude

-- | A resource alias for @BloggerPagesRevert@ which the
-- 'PagesRevert'' request conforms to.
type PagesRevertResource =
     "blogs" :>
       Capture "blogId" Text :>
         "pages" :>
           Capture "pageId" Text :>
             "revert" :>
               QueryParam "quotaUser" Text :>
                 QueryParam "prettyPrint" Bool :>
                   QueryParam "userIp" Text :>
                     QueryParam "key" Key :>
                       QueryParam "oauth_token" OAuthToken :>
                         QueryParam "fields" Text :>
                           QueryParam "alt" AltJSON :> Post '[JSON] Page

-- | Revert a published or scheduled page to draft state.
--
-- /See:/ 'pagesRevert'' smart constructor.
data PagesRevert' = PagesRevert'
    { _pagQuotaUser   :: !(Maybe Text)
    , _pagPrettyPrint :: !Bool
    , _pagUserIP      :: !(Maybe Text)
    , _pagBlogId      :: !Text
    , _pagPageId      :: !Text
    , _pagKey         :: !(Maybe Key)
    , _pagOAuthToken  :: !(Maybe OAuthToken)
    , _pagFields      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'PagesRevert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pagQuotaUser'
--
-- * 'pagPrettyPrint'
--
-- * 'pagUserIP'
--
-- * 'pagBlogId'
--
-- * 'pagPageId'
--
-- * 'pagKey'
--
-- * 'pagOAuthToken'
--
-- * 'pagFields'
pagesRevert'
    :: Text -- ^ 'blogId'
    -> Text -- ^ 'pageId'
    -> PagesRevert'
pagesRevert' pPagBlogId_ pPagPageId_ =
    PagesRevert'
    { _pagQuotaUser = Nothing
    , _pagPrettyPrint = True
    , _pagUserIP = Nothing
    , _pagBlogId = pPagBlogId_
    , _pagPageId = pPagPageId_
    , _pagKey = Nothing
    , _pagOAuthToken = Nothing
    , _pagFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
pagQuotaUser :: Lens' PagesRevert' (Maybe Text)
pagQuotaUser
  = lens _pagQuotaUser (\ s a -> s{_pagQuotaUser = a})

-- | Returns response with indentations and line breaks.
pagPrettyPrint :: Lens' PagesRevert' Bool
pagPrettyPrint
  = lens _pagPrettyPrint
      (\ s a -> s{_pagPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
pagUserIP :: Lens' PagesRevert' (Maybe Text)
pagUserIP
  = lens _pagUserIP (\ s a -> s{_pagUserIP = a})

-- | The ID of the blog.
pagBlogId :: Lens' PagesRevert' Text
pagBlogId
  = lens _pagBlogId (\ s a -> s{_pagBlogId = a})

-- | The ID of the page.
pagPageId :: Lens' PagesRevert' Text
pagPageId
  = lens _pagPageId (\ s a -> s{_pagPageId = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
pagKey :: Lens' PagesRevert' (Maybe Key)
pagKey = lens _pagKey (\ s a -> s{_pagKey = a})

-- | OAuth 2.0 token for the current user.
pagOAuthToken :: Lens' PagesRevert' (Maybe OAuthToken)
pagOAuthToken
  = lens _pagOAuthToken
      (\ s a -> s{_pagOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
pagFields :: Lens' PagesRevert' (Maybe Text)
pagFields
  = lens _pagFields (\ s a -> s{_pagFields = a})

instance GoogleAuth PagesRevert' where
        authKey = pagKey . _Just
        authToken = pagOAuthToken . _Just

instance GoogleRequest PagesRevert' where
        type Rs PagesRevert' = Page
        request = requestWithRoute defReq bloggerURL
        requestWithRoute r u PagesRevert'{..}
          = go _pagQuotaUser (Just _pagPrettyPrint) _pagUserIP
              _pagBlogId
              _pagPageId
              _pagKey
              _pagOAuthToken
              _pagFields
              (Just AltJSON)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy PagesRevertResource)
                      r
                      u