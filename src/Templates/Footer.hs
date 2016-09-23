{-# LANGUAGE OverloadedStrings #-}
module Templates.Footer where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

htmlFooter :: Html
htmlFooter =
    footer ! A.id "footer" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
	H.div ! class_ "col-sm-12 text-center bottom-separator" $ img ! src "images/home/under.png" ! class_ "img-responsive inline" ! alt ""
	H.div ! class_ "col-md-4 col-sm-6" $ H.div ! class_ "testimonial bottom" $ do
	    h2 "Testimonial"
	    H.div ! class_ "media" $ do
		H.div ! class_ "pull-left" $ a ! href "#" $ img ! src "images/home/profile1.png" ! alt ""
		H.div ! class_ "media-body" $ do
		    blockquote "My univeristy is forever indebted to these awesome folks."
		    h3 $ a ! href "#" $ "- President Han, Geumgang University"
	    H.div ! class_ "media" $ do
		H.div ! class_ "pull-left" $ a ! href "#" $ img ! src "images/home/profile2.png" ! alt ""
		H.div ! class_ "media-body" $ do
		    blockquote "I did two great things in my life, freeing the slaves and hiring the World Scholars"
		    h3 $ a ! href "" $ "- Abraham Lincoln"
	H.div ! class_ "col-md-3 col-sm-6" $ H.div ! class_ "contact-info bottom" $ do
	    h2 "Contacts"
	    address $ do
		"E-mail:"
		a ! href "mailto:someone@example.com" $ "email@email.com"
		br
		"Phone: +1 (123) 456 7890"
		br
	    h2 "Address"
	    address $ do
		"225 E 110st"
		br
		"Manhattan NYC, NY"
		br
		"United States of America"
		br
	H.div ! class_ "col-md-4 col-sm-12" $ H.div ! class_ "contact-form bottom" $ do
	    h2 "Send a message"
	    H.form ! A.id "main-contact-form" ! name "contact-form" ! method "post" ! action "sendemail.php" $ do
		H.div ! class_ "form-group" $ input ! type_ "text" ! name "name" ! class_ "form-control" ! required "required" ! placeholder "Name"
		H.div ! class_ "form-group" $ input ! type_ "email" ! name "email" ! class_ "form-control" ! required "required" ! placeholder "Email Id"
		H.div ! class_ "form-group" $ textarea ! name "message" ! A.id "message" ! required "required" ! class_ "form-control" ! rows "8" ! placeholder "Your text here" $ mempty
		H.div ! class_ "form-group" $ input ! type_ "submit" ! name "submit" ! class_ "btn btn-submit" ! value "Submit"
	H.div ! class_ "col-sm-12" $ H.div ! class_ "copyright-text text-center" $ do
	    p "World Scholar 2016. All Rights Reserved."
    -- /#footer