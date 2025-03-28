{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Request.SignIn where

import ClassyPrelude.Yesod

data SignInRequest = SignInRequest
    { usernameOrPhoneNumber :: Text
    , password :: Text
    } deriving (Show, Eq, Generic)

instance FromJSON SignInRequest
instance ToJSON SignInRequest