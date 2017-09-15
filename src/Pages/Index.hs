{-# LANGUAGE OverloadedStrings #-}

module Pages.Index where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Templates.Blocks

index :: Html
index = do
    section ! A.id "home-slider" $ do
	H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "main-slider" $ do
	    H.div ! class_ "slide-text" $ do
		h1 "Bringing the world to you"
		p "The World Scholars program is a collective of talented young professionals, dedicated to sharing their educational experiences around the globe. In particular, we bring opportunity out of the ivory tower, to schools that aim to enrich their students' lives with a once in a lifetime opportunity."
		a ! href "#" ! class_ "btn btn-common" $ "CONTACT US"
	    img ! src "images/home/slider/hill.png" ! class_ "slider-hill" ! alt "slider image"
	    img ! src "images/home/slider/house.png" ! class_ "slider-house" ! alt "slider image"
	    img ! src "images/home/slider/sun.png" ! class_ "slider-sun" ! alt "slider image"
	    img ! src "images/home/slider/birds1.png" ! class_ "slider-birds1" ! alt "slider image"
	    img ! src "images/home/slider/birds2.png" ! class_ "slider-birds2" ! alt "slider image"
	H.div ! class_ "preloader" $ i ! class_ "fa fa-sun-o fa-spin" $ mempty
    
    -- /#home-slider
    {-section ! A.id "services" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
	mapM_ 
	  (\(i,t,d) -> 
	    H.div ! class_ "col-sm-4 text-center padding wow fadeIn" ! dataAttribute "wow-duration" "1000ms" ! dataAttribute "wow-delay" "300ms" $ H.div ! class_ "single-service" $ do
	      H.div ! class_ "wow scaleIn" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ img ! src i ! alt ""
	      h2 t
	      p d)
	   [("images/home/icon1.png","New Perspective","Bringing an international experience to local students")
	   ,("images/home/icon2.png","New Perspective","Bringing an international experience to local students")
	   ,("images/home/icon3.png","New Perspective","Bringing an international experience to local students")]-}


    
    -- /#action
    section ! A.id "features" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
	textRightImg "images/home/IMG_0009.JPG" "Interactive Learning" "Learning happens both inside the classroom and out. The World Scholar Program is not only a seminar series, but an entire experience for the school. Combining traditional lectures, with hand-on activities and active learning, students come away from the World Scholars program with a renewed sense of vigour and exploration in their studies."
	textLeftImg "images/home/IMG_1211.JPG" "Passion for Humanities and Sciences" "From Acting to Computer Science, the world scholars bring a range of experience to campus that enlivens the atmosphere, and asks students to push beyond their comfort zone."
	textRightImg "images/home/IMG_1376.JPG" "Experienced and Enthusiastic" "The world scholars come from both academia and industry, giving students a look into what sort of careers are possible when you dream big."

    -- /#features
    
    section ! A.id "clients" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12" $ do
	H.div ! class_ "clients text-center wow fadeInUp" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ do
	    p $ img ! src "images/home/clients.png" ! class_ "img-responsive" ! alt ""
	    h1 ! class_ "title" $ "Past hosts"
	    p $ do
		"The World Scholars have been on tour before, visiting schools around the world."
		br
		"Here are a few of the places we have been."
	H.div ! class_ "clients-logo wow fadeIn" ! dataAttribute "wow-duration" "1000ms" ! dataAttribute "wow-delay" "600ms" $ do
	    H.div ! class_ "col-xs-3 col-sm-2" $ do
	      a ! href "#" $ img ! src "images/home/ggu_logo.png" ! class_ "img-responsive" ! alt ""
	      p "Nonsan, South Korea"
	    H.div ! class_ "col-xs-3 col-sm-2" $ do
	      a ! href "#" $ img ! src "images/home/woodbridge.png" ! class_ "img-responsive" ! alt ""
	      p "Woodbridge, Conneticut"
	    {-H.div ! class_ "col-xs-3 col-sm-2" $ a ! href "#" $ img ! src "images/home/client2.png" ! class_ "img-responsive" ! alt ""
	    H.div ! class_ "col-xs-3 col-sm-2" $ a ! href "#" $ img ! src "images/home/client3.png" ! class_ "img-responsive" ! alt ""
	    H.div ! class_ "col-xs-3 col-sm-2" $ a ! href "#" $ img ! src "images/home/client4.png" ! class_ "img-responsive" ! alt ""
	    H.div ! class_ "col-xs-3 col-sm-2" $ a ! href "#" $ img ! src "images/home/client5.png" ! class_ "img-responsive" ! alt ""
	    H.div ! class_ "col-xs-3 col-sm-2" $ a ! href "#" $ img ! src "images/home/client6.png" ! class_ "img-responsive" ! alt ""-}
    -- /#clients
