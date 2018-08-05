{-# LANGUAGE OverloadedStrings #-}
module Templates.Scripts where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import System.IO.Unsafe

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

  -- TODO put these into seperate files in compilation so we dont load all the js in every html page (and the browser can then cache the js)
  -- TODO minify using 'hjsmin'?
  script ! type_ "text/javascript" $ readJS "custom_js/utils.js"
  
  mapM_ (\s -> script ! type_ "text/javascript" $ readJS s) jsSources

readJS = string . unsafePerformIO . readFile

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
