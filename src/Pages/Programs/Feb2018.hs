{-# LANGUAGE OverloadedStrings #-}

module Pages.Programs.Feb2018 (feb2018) where

import Text.Blaze.Html5 hiding (map,head,summary)
import qualified Text.Blaze.Html5 as H hiding (head,summary)
import Text.Blaze.Internal (AttributeValue)
import Data.String
import qualified Data.List as L
import Text.Blaze.Html5.Attributes hiding (name,summary)
import qualified Text.Blaze.Html5.Attributes as A hiding (name,summary)

import Templates.Blocks 

import Pages.Programs.Util

feb2018 = Program{
  name = "Intercultural Exchange through the Lens of Liberal Arts"
 ,location = "New Haven, CT"
 ,dates = "February 2018"
 ,epoch = 1517493707
 ,summary = "This two week program runs from February 11 - February 24, 2018. It brings together students from 5 different countries, and a broad spectrum of socio-economic backgrounds to provide a multicultural, diverse and unique educational experience. Some of the program highlights are listed below. The application deadline is Jan 25. Due to the small discussion style classes, this program is limited to 20 participants."
 ,mainPic = "images/home/divcampus.jpg"
 ,captionedPics = []
 ,extraHTML = do
   blockquote $ do 
     "A human being should be able to change a diaper, plan an invasion, butcher a hog, conn a ship, design a building, write a sonnet, balance accounts, build a wall, set a bone, comfort the dying, take orders, give orders, cooperate, act alone, solve equations, analyze a new problem, pitch manure, program a computer, cook a tasty meal, fight efficiently, die gallantly." 
     em "Specialization is for insects."
     "- Robert Heinlein, Time Enough for Love"
   section ! A.id "features" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
     textLeftImg "images/programs/feb2017/aaronClass.jpg" "Classes" "Our classes examine a wide range of topics from a multicultural lens to prepare students to make the leap from a student of the classroom to a student of life. Our lecturers expect students to step outside of their comfort zone and make unexpected connections with a diverse group of peers. Students should be prepared to fully engage in discussion style teaching. Some topics from previous programs include \"The Science of Business\", \"Education Across Cultures\", \"Computer Science Without Computers\", and \"The Methodology of Philosophy\". Our roster of instructors is continually updated - a final schedule will be released as the program start date nears."
     textRightImg "images/home/skyline.JPG" "New York Trip" "Led by World Scholars' staff members, our students will visit both the professional and educational institutions in New York City, one of the world's major commercial, financial, and cultural centers. The organizations we visited in the past include Goldman Sachs, JP Morgan Chase, Columbia University, and Metropolitan Museum of Arts. This trip will take place at the end of the program, the weekend before students return home."
     textLeftImg "images/home/evening.JPG" "Evening Activites" "Evening activities are designed to complement the program to give students a truly well-rounded education. Evening activities are paired with lectures during the day from experts in the field, exposing students to the theory and practice behind the events of the evening. Past activities have included a play at the Yale Repertory Theater, seeing a Yale vs Dartmouth Basketball game, and seeing an orchestra performance by the Yale Philharmonic. Attending these extracurricular events gives students a deep cultural experience in the liberal arts."
     iframe ! src "https://cumc.co1.qualtrics.com/jfe/form/SV_3El3rBVezknjKnP" ! height "350px" ! width "100%" $ ""
}

