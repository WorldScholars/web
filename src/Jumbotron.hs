{-# LANGUAGE OverloadedStrings #-}
module Index where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

index :: Html
index = do
    docTypeHtml ! lang "en" $ do
        H.head $ do
            meta ! charset "utf-8"
            meta ! httpEquiv "X-UA-Compatible" ! content "IE=edge"
            meta ! name "viewport" ! content "width=device-width, initial-scale=1, shrink-to-fit=no"
            --  The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags 
            meta ! name "description" ! content ""
            meta ! name "author" ! content ""
            link ! rel "icon" ! href "../../favicon.ico"
            H.title "Narrow Jumbotron Template for Bootstrap"
            --  Bootstrap core CSS 
            link ! href "../../dist/css/bootstrap.min.css" ! rel "stylesheet"
            --  Custom styles for this template 
            link ! href "narrow-jumbotron.css" ! rel "stylesheet"
        body $ do
            H.div ! class_ "container" $ do
                H.div ! class_ "header clearfix" $ do
                    nav $ ul ! class_ "nav nav-pills pull-xs-right" $ do
                        li ! class_ "nav-item" $ a ! class_ "nav-link active" ! href "#" $ do
                            "Home"
                            H.span ! class_ "sr-only" $ "(current)"
                        li ! class_ "nav-item" $ a ! class_ "nav-link" ! href "#" $ "About"
                        li ! class_ "nav-item" $ a ! class_ "nav-link" ! href "#" $ "Contact"
                    h3 ! class_ "text-muted" $ "Project name"
                H.div ! class_ "jumbotron" $ do
                    h1 ! class_ "display-3" $ "Jumbotron heading"
                    p ! class_ "lead" $ "Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."
                    p $ a ! class_ "btn btn-lg btn-success" ! href "#" $ "Sign up today"
                H.div ! class_ "row marketing" $ do
                    H.div ! class_ "col-lg-6" $ do
                        h4 "Subheading"
                        p "Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum."
                        h4 "Subheading"
                        p "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum."
                        h4 "Subheading"
                        p "Maecenas sed diam eget risus varius blandit sit amet non magna."
                    H.div ! class_ "col-lg-6" $ do
                        h4 "Subheading"
                        p "Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum."
                        h4 "Subheading"
                        p "Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum."
                        h4 "Subheading"
                        p "Maecenas sed diam eget risus varius blandit sit amet non magna."
                footer ! class_ "footer" $ p "© Company 2014"
            --  /container 
            --  Bootstrap core JavaScript
            --     ================================================== 
            --  Placed at the end of the document so the pages load faster 
            --  IE10 viewport hack for Surface/desktop Windows 8 bug 
            script ! src "../../assets/js/ie10-viewport-bug-workaround.js" $ mempty

