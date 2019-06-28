{-# LANGUAGE OverloadedStrings #-}
module Templates.Scripts where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A
import Data.String

import System.IO.Unsafe

-- | load common javascript files needs for all pages
htmlScripts :: [String] -> Html
htmlScripts jsSources = do
  mapM_ (\x-> script ! type_ "text/javascript" ! src x $ mempty)
    [ "js/jquery.js"
    , "js/bootstrap.min.js"
    , "js/lightbox.min.js"
    , "js/wow.min.js"
    , "js/jquery.countTo.js"
    , "js/main.js" --what is this?
    , "js/sisyphus.js" -- this is incompatible with css library pretty-checkbox
    ]
  script ! type_ "text/javascript" $ "$( function() { $( \"form\" ).sisyphus(); });"

  -- TODO minify using 'hjsmin'?
  script ! type_ "text/javascript" $ readJS "custom_js/utils.js"

  mapM_ (\s -> script ! src (fromString s) $ "") jsSources  
  --mapM_ (\s -> script ! type_ "text/javascript" $ readJS s) jsSources

readJS = string . unsafePerformIO . readFile

-- | load scripts needed just for the interactive pages
awsScripts :: Html
awsScripts =
  mapM_ (\x-> script ! type_ "text/javascript" ! src x $ mempty)
    [ "aws_js/vendor/jquery-3.1.0.js"
    , "aws_js/vendor/bootstrap.min.js" 
    , "aws_js/vendor/aws-cognito-sdk.min.js" 
    , "aws_js/vendor/amazon-cognito-identity.min.js" 
    , "aws_js/config.js"
    , "aws_js/cognito-auth.js" 
    , "aws_js/profile.js" 
    ]
