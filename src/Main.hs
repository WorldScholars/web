module Main where

import Text.Blaze.Html.Renderer.Pretty (renderHtml)
import qualified Text.Blaze.Html5 as H
--import Data.ByteString
import GHC.IO.Encoding

import Pages.Index
import Pages.ThankYou
import Pages.ProgramCap

import Pages.Apply
import Pages.About
import Pages.FAQ
import Pages.People
import Pages.HR
import qualified Pages.People.Everyone as E
import Pages.Programs
import qualified Pages.Programs.AllPrograms as P
import qualified Pages.Programs.SATPlus2018 as SAT2018
import qualified Pages.Programs.SATPlus2019 as SAT2019
import qualified Pages.Programs.Util as P
import Pages.Tutoring
import Pages.Lau

--User stuff
import Pages.Interactive

import Template

main :: IO()
main = do
  setLocaleEncoding utf8
  makePage "html/index.html" index
  makePage "html/about.html" about
  makePage "html/apply.html" apply
  makePage "html/programs.html" programs
  makePage "html/faq.html" faq
  writeEveryone
  writePrograms
  
  --makePage "html/programcap.html" programcap
  makePage "html/thankyou.html" thankyou

  paypalButton <- readFile "src/paypalButton.html"
  makePage "html/registration.html" $ SAT2019.registration paypalButton

  paypalButtonTutoring <- readFile "src/paypalButton_tutoring.html"
  makePage "html/tutoring.html" $ tutoringRegistration paypalButtonTutoring


  writeSigninup
  makeInteractivePage "html/profile.html" [] profile --TODO move profile.js here
  makeInteractivePage "html/scantron.html" ["custom_js/clickRecorder.js"] scantron
  makeInteractivePage "html/examsummary.html" ["custom_js/calculate.js", "custom_js/examReader.js"] examSummary
  makeInteractivePage "html/teacherPortal.html" ["custom_js/teacherPortal.js"] teacherPortal

  makeInteractivePage "html/fitbit_auth.html" ["custom_js/fitbitAuthSaver.js"] fitbitAuthResponse 
  
  gnuCanvas <- readFile "src/gnuCanvas.html"
  writeFile "html/hr.html" $ renderHtml $ embedInTemplate False (map ("gnu_js/"++) ["canvasmath.js", "fitbit_graph.js", "gnuplot_common.js", "gnuplot_mouse.js", "gnuplot_page.js"]) $ hrPrototype gnuCanvas


writeSigninup :: IO()
writeSigninup = do
  makeInteractivePage "html/signup.html" [] signup
  makeInteractivePage "html/verify.html" [] verify
  makeInteractivePage "html/signin.html" [] signin

writeEveryone :: IO()  
writeEveryone = 
    mapM_
      (\p -> makePage ("html/"++E.linkTo p) $ E.makeBio p)
      E.everyone 

writePrograms :: IO()  
writePrograms  = 
    mapM_
      (\p -> makePage ("html/"++P.linkTo p) $ P.makeProgramPage p)
      P.allPrograms 

makePage link p =
  writeFile link $ renderHtml $ embedInTemplate False [] p

makeInteractivePage link jsSources p =
  writeFile link $ renderHtml $ embedInTemplate True jsSources p
