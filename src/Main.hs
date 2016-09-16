module Main where

import Text.Blaze.Html.Renderer.Pretty (renderHtml)
--import Data.ByteString
import GHC.IO.Encoding

import Index
import About

import Template

main :: IO()
main = do
  setLocaleEncoding utf8
  writeFile "html/index.html" $ renderHtml $ embedInTemplate index
  writeFile "html/about.html" $ renderHtml $ embedInTemplate about

