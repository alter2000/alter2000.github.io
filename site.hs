{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

import Control.Lens
import Control.Monad
import Data.Aeson as A
import Data.Aeson.Lens

import GHC.Generics (Generic)

import Development.Shake
import Development.Shake.Classes
import Development.Shake.Forward
import Development.Shake.FilePath

import Slick

import qualified Data.Text as T
import Data.Typeable ( Typeable )

-- | Data for a blog post
data Post = Post
  { title   :: T.Text
  , author  :: T.Text
  , content :: T.Text
  , url     :: T.Text
  , date    :: T.Text
  , image   :: Maybe T.Text
  } deriving (Generic, Eq, Ord, Show
    , FromJSON, ToJSON, Binary)

-- | Data for the index page
newtype IndexInfo = IndexInfo { posts :: [Post] }
  deriving (Generic, Show, FromJSON, ToJSON)

config :: Config
config = Config
  { destinationDirectory = "_site"
  , storeDirectory       = ".cache/"
  , tmpDirectory         = ".cache/tmp"
  , previewPort          = 4000
  }

-- old {{{
loadAndApplyTemplates :: Context T.Text -> [Identifier] -> Item String -> Compiler (Item String)
loadAndApplyTemplates ctx = foldr1 (>=>) . fmap (`loadAndApplyTemplate` ctx)

main :: IO ()
main = slick matchRules

matchRules = do

  match "assets/css/*" $ id' compressCssCompiler

  match ( "assets/**"
     .||. "CNAME"
     -- .||. "css/*"
     .||. "keybase.txt"
        ) $ id' copyFileCompiler

  match "_posts/*" do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplates postCtx [ "_layouts/post.html",  "_layouts/default.html" ]
      >>= relativizeUrls

  create ["archive.html"] $ id' do
    posts <- loadAll "posts/*" >>= recentFirst
    let archiveCtx = listField "posts" postCtx (pure posts)
                  <> constField "title" "Archives"
                  <> defaultContext
    makeItem ""
      >>= loadAndApplyTemplates archiveCtx [ "_layouts/archive.html", "_layouts/default.html" ]
      >>= relativizeUrls


  match "index.html" $ id'
      $ getResourceBody
    >>= applyAsTemplate indexCtx
    >>= loadAndApplyTemplate "templates/default.html" indexCtx
    >>= relativizeUrls

  match "templates/*" $ compile templateCompiler

--------------------------------------------------------------------------------
postCtx :: Context T.Text
postCtx = dateField "date" "%b %-d, %Y"
       <> dateField "shortdate" "%e %b %y"
       <> defaultContext


indexCtx :: Context T.Text
indexCtx = listField "posts" postCtx (loadAll "posts/*" >>= recentFirst)
        <> constField "title" "Home"
        <> defaultContext

id' :: (Binary a, Typeable a, Writable a) => Compiler (Item a) -> Rules ()
id' c = route idRoute >> compile c
-- }}}
