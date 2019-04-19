{-# LANGUAGE OverloadedStrings #-}

module Pages.Programs.SATPlus2019 (sat2019, registration) where

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


sat2019 = Program{
  name = "SAT+ 2019"
 ,location = "Greater New Haven Area, CT"
 ,dates = "July & Aug 2019"
 ,pageName = Just "SAT2019"
 ,epoch = 1566046151
 ,summary = do
   p "This year World Scholars will bring its SAT+ program back to the community. This intensive SAT prep program goes beyond just preparing students for standardized testing, but helps hone their academic and interpersonal skills to prepare them for the college admissions process. The program is best suited for students in grades 9-12."
 ,mainPic = "images/home/tshirts2018.jpg"
 ,captionedPics = []
 ,extraHTML = do
   p "Students may choose to register for one of the two week sessions."
   myTable ([["July 22th - August 2nd", "Applicaiton form coming soon"] --a !  href "registration.html" $ "Register now"]
            ,["August 5th - 16th", "Application form coming soon"] --a ! href "registration.html" $ "Register now"]
            ]::[[Html]])

   h2 "Key Information"
   p $ do
     "Please sign the "
     a ! href "docs/SAT2019_Forms.pdf" $ "release, consent and classroom behavior forms" 
     "for your student for this program. We will also have copies available on the first day of the program if you are not able to print these ahead of time."
   p "This year our program will be located on the campus of Yale University Divinity School (409 Prospect St). World Scholars teachers will be present to direct you to the appropriate location for parking, pickup, and dropoff."
   H.div ! A.style "width:60%; margin:0 auto;" $ preEscapedToHtml googleMapsEmbed
   p "The program will run from 8:30 AM to 5:30 PM, Monday through Friday. Below is an outline of a student’s typical day. The schedule will change slightly depending in the particular goals of the day (for example when full SAT practice exams are administered)."
   myTable ([["8:25 AM", "Students dropped off"]
            ,["9:00 AM", "SAT English lecture"]
            ,["10:00 AM", "SAT English practice problems"]
            ,["11:00 AM", "SAT English writing workshop"]
            ,["12:00 PM", "Lunch"]
            ,["12:30 PM", "SAT Math Lecture"]
            ,["1:30 PM", "SAT Math practice problems"]
            ,["2:30 PM", "Passion Project"]
            ,["4:30 PM", "Elective (Computer Science/Math/English)"]
            ,["5:30 PM", "Students picked up"]] :: [[String]])

   h2 "Passion Projects"
 --  H.div ! A.style "width:60%; margin:0 auto;" $ preEscapedToHtml youtubeEmbed
   p "What is a Passion Project? In America and around the globe, educators are moving away from test-centric summative evaluations for learning. The educational landscape is moving towards a formative assessment in which students are expressing their learning in a more comprehensive way through projects. Project-based learning is the inspiration behind Passion Projects. We value the multi-dimensional ways of expressing learning through topics that students care about and we want to make sure that we provide an opportunity for students to make that happen. The Passion Projects will allow students to collaborate, innovate, and design a project (whether it be an idea or a product) of their choosing and we will facilitate to see through the project's completion.  Guest lecturers will come on Tuesdays and Thursdays to expose students to potential academic and professional career paths as well as inspire Passion Project work."
   p "By participating in the World Scholars program, students will develop the skills to present themselves, not just as strong students, but as future leaders. The final project gives students the first push to take charge of their own education and find passion in their work. Not all students will continue to work on their Passion Project after the program, but all students will use those skills to find the next Passion Project to work on."
   p "Enrollment for this program is capped at 12 student per session per section, and we run two sections simultaneously in both sessions."
   p "The prices for this summer are listed below"
   priceTable
   h2 "What is changing from SAT+2018?"
   p "We are making a number of changes to SAT+2019 from SAT+2018 to improve the program. We have expanded the hours of the program to make it easier for the parents' schedule with an earlier dropoff time and later pickup time. We have added an extra hour at the end of the day's program to allow students to explore more of the academic subject they care about the most or need the most help on. We have also reduced the maximum classroom size significantly to give an even more personalized expereince."
   p $ do
     "For more information please contact: "
     a ! href "mailto:fiona@worldscholars.global" $ "fiona@worldscholars.global"
}


googleMapsEmbed :: String
googleMapsEmbed = "<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2996.3427827821965!2d-72.9242065845762!3d41.323158979270126!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89e7d9c07a82c48f%3A0x47d743a6be189b52!2s409+Prospect+St%2C+New+Haven%2C+CT+06511!5e0!3m2!1sen!2sus!4v1533434561880\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>"

youtubeEmbed :: String 
youtubeEmbed = "<iframe width=\"100%\" height=\"315\" src=\"https://www.youtube.com/embed/p2UQICvLgNM?rel=0&amp;showinfo=0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"

myTable :: (ToMarkup a) => [[a]] -> Html
myTable xs = table ! A.class_ "price-table" $ forM_ xs (tr . mapM_ (td . toHtml))
    

priceTable = 
   myTable ([["Registation (One Time)", "$45"]
            ,["Tuition (per week)", "$401"]
            ,["Activity (per week)", "$151"]
            ,["Venue & Tech (per week)", "$159"]] :: [[String]])

registration:: String -> Html
registration buttonHTML = do
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "SAT+ 2019 Registration"
      p "Thank you for your interest in SAT+2019. The cost the program this year is listed below. Please register using one of our payment methods by June 1st. If your payment is not postmarked by June 1st, you will be moved to the end of the waitlist."
      priceTable
      preEscapedToHtml $ registrationFormEmbed
      H.div ! class_ "col-sm-12 text-center" $ do
        p "Thank you for choosing World Scholars this summer. Should extenuating circumstances arise such that you cannot attend the progrm, our refund policy is as follows:"
        ul $ do
          li "100% payment back (except the $45 registration fee) before June 15th"
          li "70% payment back before July 1st"
          li "40% payment before July 10th"
          li "No refund on or after July 10th" 
    section ! A.id "payment-options-check" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      H.div ! class_ "col-sm-6 text-center" $ do
        h2 "Option 1: Check (Preferred)"
        p $ do
          "Please make the check payable to \"World Scholars LLC\" and include the student's name on the memo line. Additionally, please print and fill out"
          a ! href "Registration_Form.pdf" $ "this registration form"
          "or include a note with the sessions (session 1 or session 2) for which you are enrolling, preferred t-shirt size, as well as the parent's WeChat ID."
        dl $ do
          dt "Address"
          dd "World Scholars LLC"
          dd "Address TBA "
          dd "..."
      H.div ! class_ "col-sm-6 text-center" $ do
        h2 "Option 2: Paypal"
        preEscapedToHtml $ buttonHTML


registrationFormEmbed :: String
registrationFormEmbed = "<iframe src=\"https://docs.google.com/forms/d/e/1FAIpQLSfqSMvspvKAxzSncYoFggVdNwjjHvWleL-xkxiON6Z8b_Ga3Q/viewform?embedded=true\" width=\"640\" height=\"900\" frameborder=\"0\" marginheight=\"0\" marginwidth=\"0\">Loading...</iframe>" 
