{-# LANGUAGE OverloadedStrings #-}

module Templates.Blocks where

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

textRightImg imgSrc titleText bodyText =
	H.div ! class_ "single-features" $ do
	    H.div ! class_ "col-sm-5 wow fadeInLeft" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ img ! src imgSrc ! class_ "img-responsive" ! alt ""
	    H.div ! class_ "col-sm-6 col-sm-offset-1 align-left wow fadeInRight" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ do
		h2 titleText
		p bodyText
	
textLeftImg imgSrc titleText bodyText =
	H.div ! class_ "single-features" $ do
	    H.div ! class_ "col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ do
		h2 titleText
		p bodyText
	    H.div ! class_ "col-sm-5 wow fadeInRight" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ img ! src imgSrc ! class_ "img-responsive" ! alt ""
