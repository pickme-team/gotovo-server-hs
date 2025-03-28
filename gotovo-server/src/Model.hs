{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE DerivingStrategies         #-}
{-# LANGUAGE StandaloneDeriving         #-}
{-# LANGUAGE UndecidableInstances       #-}
{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# OPTIONS_GHC -Wno-name-shadowing     #-}
{-# LANGUAGE LambdaCase #-}
module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi
import Data.Aeson (genericParseJSON, genericToJSON, defaultOptions)
import Database.Persist.Sql

-- Database

-- You can define all of your database entities in the entities file.
-- You can find more information on persistent and how to declare entities
-- at:
-- http://www.yesodweb.com/book/persistent/
share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models.persistentmodels")

data QuantityType = Grams | Pcs | Ml
    deriving (Show, Read, Eq, Enum, Generic)

instance FromJSON QuantityType where
    parseJSON = genericParseJSON defaultOptions

instance ToJSON QuantityType where
    toJSON = genericToJSON defaultOptions

instance PersistField QuantityType where
    toPersistValue Grams = PersistText "grams"
    toPersistValue Pcs = PersistText "pcs"
    toPersistValue Ml = PersistText "ml"

    fromPersistValue (PersistText "grams") = Right Grams
    fromPersistValue (PersistText "pcs") = Right Pcs
    fromPersistValue (PersistText "ml") = Right Ml
    fromPersistValue _ = Left "Invalid QuantityType"

instance PersistFieldSql QuantityType where
    sqlType _ = SqlString