{-# LANGUAGE OverloadedStrings #-}

module Pages.Programs.SATPlus2018 (sat2018, registration) where

import Text.Blaze.Html5 hiding (map,head,summary)
import qualified Text.Blaze.Html5 as H hiding (head,summary)
import Text.Blaze.Internal (AttributeValue)
import Data.String
import qualified Data.List as L
import Text.Blaze.Html5.Attributes hiding (name,summary)
import qualified Text.Blaze.Html5.Attributes as A hiding (name,summary)

import Text.Blaze.Html5 (table, td, tr, toHtml, ToMarkup, Html)
import Control.Monad (forM_, mapM_)

import Templates.Blocks 

import Pages.Programs.Util


sat2018 = Program{
  name = "SAT+ 2018"
 ,location = "Greater New Haven Area (Exact Location TBA), CT"
 ,dates = "Aug 2018"
 ,epoch = 1534529026 
 ,summary = do
   p "This year World Scholars will bring its SAT+ program back to the community, condensed into a two week program from August 6-17. This intensive SAT prep program goes beyond just preparing students for standardized testing, but helps hone their academic and interpersonal skills to prepare them for the college admissions process. The program is best suited for students in grades 9-12."
 ,mainPic = "images/home/class.jpg"
 ,captionedPics = []
 ,extraHTML = do
   p "Students may choose to register for either week or both weeks."
   --myTable ([["August 6th - 10th", "See WeChat group for registration"]
   --         ,["August 13th - 17th", "See WeChat group for registration"]]::[[Html]])
   myTable ([["August 6th - 10th", a !  href "registration.html" $ "Register now"]
            ,["August 13th - 17th", a ! href "registration.html" $ "Register now"]]::[[Html]])
   p "The program will run from 9:00 AM to 4:30 PM, Monday through Friday. Below is an outline of a student’s typical day."
   myTable ([["8:55 AM", "Students dropped off"]
            ,["9:00 AM", "SAT English lecture"]
            ,["10:00 AM", "SAT English practice problems"]
            ,["11:00 AM", "SAT English writing workshop"]
            ,["12:00 PM", "Lunch"]
            ,["12:30 PM", "SAT Math Lecture"]
            ,["1:30 PM", "SAT Math practice problems"]
            ,["2:30 PM", "Passion Project"]
            ,["4:30 PM", "Students picked up"]] :: [[String]])
   H.div ! A.style "width:60%; margin:0 auto;" $ preEscapedToHtml youtubeEmbed
   p "What is a Passion Project? In America and around the globe, educators are moving away from test-centric summative evaluations for learning. The educational landscape is moving towards a formative assessment in which students are expressing their learning in a more comprehensive way through projects. Project-based learning is the inspiration behind Passion Projects. We value the multi-dimensional ways of expressing learning through topics that students care about and we want to make sure that we provide an opportunity for students to make that happen. The Passion Projects will allow students to collaborate, innovate, and design a project (whether it be an idea or a product) of their choosing and we will facilitate to see through the project's completion.  Guest lecturers will come on Tuesdays and Thursdays to expose students to potential academic and professional career paths as well as inspire Passion Project work."
   p "By participating in the World Scholars program, students will develop the skills to present themselves, not just as strong students, but as future leaders. The final project gives students the first push to take charge of their own education and find passion in their work. Not all students will continue to work on their Passion Project after the program, but all students will use those skills to find the next Passion Project to work on."
   p "To participate in the next SAT+ program and start your own Passion Project, stay tuned for registration instructions. Enrollment for this program is capped at 23 student per week per section, and we run two sections simultaneously in both weeks."
   p "This year our program will be located on the campus of Alburtus Magnus College, in Aquinas Hall. The prices for this summer are listed below"
   myTable ([["Registation (One Time)", "$45"]
            ,["Tuition (per week)", "$368"]
            ,["Activity (per week)", "$118"]
            ,["Venue & Tech (per week)", "$126"]] :: [[String]])
   p $ do
     "For more information please contact: "
     a ! href "mailto:fiona@worldscholars.global" $ "fiona@worldscholars.global"
}


youtubeEmbed :: String 
youtubeEmbed = "<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/p2UQICvLgNM?rel=0&amp;showinfo=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"

myTable :: (ToMarkup a) => [[a]] -> Html
myTable xs = table ! A.class_ "price-table" $ forM_ xs (tr . mapM_ (td . toHtml))
    

registration:: String -> Html
registration buttonHTML = do
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "SAT+ 2018 Registration"
      p "Thank you for your interest in SAT+2018. The cost the program this year is listed below. Please register using one of our payment methods by June 15th. If your payment is not postmarked by June 15th, you will be moved to the end of the waitlist."
      myTable ([["Registation (One Time)", "$45"]
               ,["Tuition (per week)", "$368"]
               ,["Activity (per week)", "$118"]
               ,["Venue & Tech (per week)", "$126"]] :: [[String]])
    section ! A.id "payment-options-check" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      H.div ! class_ "col-sm-6 text-center" $ do
        h2 "Option 1: Check (Preferred)"
        p $ do
          "Please make the check payable to \"World Scholars LLC\" and include the student's name on the memo line. Additionally, please print and fill out"
          a ! href "Registration_Form.pdf" $ "this registration form"
          "or include a note with the sessions (week 1, week 2, or both weeks) for which you are enrolling, preferred t-shirt size, as well as the parent's WeChat ID."
        dl $ do
          dt "Address"
          dd "World Scholars LLC"
          dd "225 East 110th, Suite C"
          dd "New York, NY 10029"
      H.div ! class_ "col-sm-6 text-center" $ do
        h2 "Option 2: Paypal"
        preEscapedToHtml $ buttonHTML
      H.div ! class_ "col-sm-12 text-center" $ do
        p "Thank you for choosing World Scholars this summer. Our refund policy is as follows:"
        ul $ do
          li "100% payment back (except the $45 registration fee) before July 1st"
          li "70% payment back before July 15th"
          li "40% payment before Aug 1st"
          li "No refund on or after Aug 1st" 
