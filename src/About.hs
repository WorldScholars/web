{-# LANGUAGE OverloadedStrings #-}
module About where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Head
import Header
import Scripts
import Footer

about :: Html
about = do
    {-section ! A.id "page-breadcrumb" $ H.div ! class_ "vertical-center sun" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "action" $ H.div ! class_ "col-sm-12" $ do
	h1 ! class_ "title" $ "About Us"
	p "Who we are and where we come from"-}
    
    -- /#page-breadcrumb
    section ! A.id "about-company" ! class_ "padding-top wow fadeInUp" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
	img ! src "images/aboutus/CEO.png" ! class_ "margin-bottom" ! alt ""
	h1 ! class_ "margin-bottom" $ "A letter from our CEO"
	p $ do
	    "The World Scholars Program is one of man's great acheivements in the 21st century"
	    br
	    "-Dr. Maria Hwang, Ed.D."
    
    -- /#services
    section ! A.id "action" $ H.div ! class_ "vertical-center" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "action count" $ do
	 h2 "Collectively, we represent..."
         mapM_ 
            (\(x,y) -> do 
	      H.div ! class_ "col-sm-3 text-center wow bounceIn" ! dataAttribute "wow-duration" "1000ms" ! dataAttribute "wow-delay" "300ms" $ do
                h1 ! class_ "timer bold" ! dataAttribute "to" x ! dataAttribute "speed" "3000" ! dataAttribute "from" "0" $ mempty
                h3 y)
	    [("34","Academic Papers"),("6","Countries"),("19","Degrees"),("78","Years of Experience")]
    


    -- /#company-information
    section ! A.id "team" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
	h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "Meet the Team"
	p ! class_ "text-center wow fadeInDown" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
	    "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
	    br
	    "Ut enim ad minim veniam, quis nostrud"
	H.div ! A.id "team-carousel" ! class_ "carousel slide wow fadeIn" ! dataAttribute "ride" "carousel" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ do
	    --  Indicators 
	    ol ! class_ "carousel-indicators visible-xs" $ do
		li ! dataAttribute "target" "#team-carousel" ! dataAttribute "slide-to" "0" ! class_ "active" $ mempty
		li ! dataAttribute "target" "#team-carousel" ! dataAttribute "slide-to" "1" $ mempty
	    --  Wrapper for slides 
	    H.div ! class_ "carousel-inner" $ do
		mapM_ person
		  [("images/aboutus/1.jpg","Mark Santolucito","Yale CS PhD Candidate")
		  ,("images/aboutus/2.jpg","Rahul","Yale CS PhD Candidate")
		  ,("images/aboutus/3.jpg","Aaron Profumo","Yale CS PhD Candidate")
		  ,("images/aboutus/4.jpg","Dao Chantes","Yale CS PhD Candidate")
		  ,("images/aboutus/2.jpg","Chris Klumpp","Yale CS PhD Candidate")
		  ,("images/aboutus/1.jpg","Maria Hwang","Yale CS PhD Candidate")
		  ,("images/aboutus/4.jpg","Diana LeDang","Yale CS PhD Candidate")
		  ,("images/aboutus/3.jpg","Sangwoo Lee","Yale CS PhD Candidate")
		  ,("images/aboutus/1.jpg","Stephan Brunner","Yale CS PhD Candidate")
		  ,("images/aboutus/4.jpg","Rahel Kroeker","Yale CS PhD Candidate")]

person (imgLink, name, position) =
      H.div ! class_ "col-sm-3 col-xs-6" $ H.div ! class_ "team-single-wrapper" $ do
    	H.div ! class_ "team-single" $ do
    	    H.div ! class_ "person-thumb" $ img ! src imgLink ! class_ "img-responsive" ! alt ""
    	    H.div ! class_ "social-profile" $ ul ! class_ "nav nav-pills" $ do
    		li $ a ! href "./santolucito" $ "more info"
    	H.div ! class_ "person-info" $ do
    	    h2 name
    	    p position
