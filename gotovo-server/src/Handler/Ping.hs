{-# LANGUAGE OverloadedStrings #-}

module Handler.Ping where

import Import

handlePingR :: Handler Text
handlePingR = return "PONG!"