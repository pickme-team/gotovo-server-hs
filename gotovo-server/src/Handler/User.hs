{-# LANGUAGE OverloadedStrings #-}

module Handler.User where

import Import

getMyUserR :: Handler Value
getMyUserR = return $ object ["message" .= ("Привет!" :: Text)]