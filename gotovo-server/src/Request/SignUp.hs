{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Request.SignUp where

import ClassyPrelude.Yesod

data SignUpRequest = SignUpRequest
    { username :: Text
    , firstName :: Maybe Text
    , lastName :: Maybe Text
    , phoneNumber :: Text
    , password :: Text
    } deriving (Show, Eq, Generic)

instance FromJSON SignUpRequest
instance ToJSON SignUpRequest