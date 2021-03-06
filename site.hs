{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid ((<>))
import Hakyll
import Text.Pandoc.Options

brokenLinks =
    [ ("projects/blackstar.html", "/posts/2016-03-11-blackstar.html")
    , ("projects/espway.html", "/posts/2018-03-11-evolving-espway.html")
    ]

main :: IO ()
main = hakyll $ do
    let pandocMathCompiler =
            let pandocOptions = defaultHakyllWriterOptions
                    { writerHTMLMathMethod = MathJax "" }
            in pandocCompilerWith defaultHakyllReaderOptions pandocOptions

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.md"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocMathCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) <>
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

    version "redirects" $ createRedirects brokenLinks


postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" <>
    defaultContext

