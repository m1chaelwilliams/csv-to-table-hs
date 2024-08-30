import System.Directory (doesFileExist)
import System.Environment (getArgs)
import System.Exit (ExitCode (..), exitWith)

splitAtComma :: String -> [String]
splitAtComma str = case break (== ',') str of
  (before, []) -> [before]
  (before, _ : after) -> before : splitAtComma after

wrapInTag :: String -> String -> String
wrapInTag t s = "<" ++ t ++ ">" ++ s ++ "</" ++ t ++ ">"

main :: IO ()
main = do
  args <- getArgs
  fileExists <- doesFileExist (head args)
  if not fileExists
    then do
      exitWith (ExitFailure 1)
    else do
      fileContents <- readFile (head args)
      let fileLines = lines fileContents
          tokens = map splitAtComma fileLines
          tds = map (concatMap (wrapInTag "td")) (tail tokens)
          trs = wrapInTag "tr" (concatMap (wrapInTag "th") (head tokens))
          rows = map (wrapInTag "tr") tds
          output = wrapInTag "table" (trs ++ concat rows)
      writeFile (args !! 1) output
