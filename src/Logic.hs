module Logic 
(handleInput)
where


import Graphics.Gloss.Interface.IO.Game
    ( Key(Char, MouseButton, SpecialKey),
      Event(EventKey),
      KeyState(Down),
      MouseButton(LeftButton),
      SpecialKey(KeySpace) )
import Game
    ( SudokuGame(..),
      gridSize,
      cellWidth,
      cellHeight,
      middleOfGridX,
      middleOfGridY,
      checkFinishedGrid,
      isCellValid,
      updateGrid,
      updateCandidates,
      candidatesFromGrid,
      isInitialValue,
      generateRandomNumber,
      initialCand )



import Data.Char (ord, chr)
import Solver (constraintSudokuSolver)



handleInput :: Event -> SudokuGame -> SudokuGame
handleInput (EventKey (MouseButton LeftButton) Down _ mouse) game =
  case getClickedCell mouse of
    Just cell -> game { selectedCell = Just cell }
    Nothing   -> game { selectedCell = Nothing }

handleInput (EventKey (Char c) Down _ _) game@SudokuGame{ selectedCell = Just (x, y), grid = oldGrid, candidates = oldCandidates }
  | c >= '1' && c <= chr (ord '0' + gridSize)
    && isCellValid (x, y) (read [c]) oldGrid
    && not (isInitialValue (x, y) game) =
      game { grid = updateGrid (x, y) (read [c]) oldGrid,
             candidates = updateCandidates (x,y) (read [c]) oldCandidates,
             selectedCell = Nothing,
             finished = checkFinishedGrid (updateGrid (x, y) (read [c]) oldGrid) }

handleInput (EventKey (SpecialKey KeySpace) Down _ _) game@SudokuGame{ selectedCell = Just (x, y), candidates = oldCandidates }
  | not $ isInitialValue (x, y) game =
      game { grid = updateGrid (x, y) 0 (grid game),
             candidates = updateCandidates (x,y) 0 oldCandidates,
             selectedCell = Nothing }

handleInput (EventKey (Char 't') Down _ _) game@SudokuGame{ selectedCell = Just (x, y), grid = oldGrid, candidates = oldCandidates }
  | oldGrid !! x !! y == 0  =
    let solution = constraintSudokuSolver game
        newGame =
          case solution of
            Just sol -> game { grid = updateGrid (x, y) (sol !! x !! y) oldGrid,
                              candidates = updateCandidates (x,y) (sol !! x !! y) oldCandidates,
                              selectedCell = Nothing,
                              finished = checkFinishedGrid (updateGrid (x, y) (sol !! x !! y) oldGrid) }
            Nothing  -> game { selectedCell = Nothing }
    in newGame

handleInput (EventKey (Char 'f') Down _ _) game@SudokuGame{ grid = oldGrid, candidates = oldCandidates} =
  let solution = constraintSudokuSolver game
      newGame =
        case solution of
          Just sol -> game { grid = sol,
                             candidates   = candidatesFromGrid oldCandidates oldGrid,
                             selectedCell = Nothing
                            }
          Nothing  -> game  {selectedCell = Nothing} -- TODO RETORNAR O GAME COM UMA MENSAGEM DE ERRO
  in newGame

-- handleInput (EventKey (Char 'r') Down _ _) _ = initialGame
handleInput (EventKey (Char 'r') Down _ _) game = game {
                                                        grid= initialCells game,
                                                        candidates   = candidatesFromGrid initialCand (initialCells game),
                                                        solverSelectedCell = Just (0,0),
                                                        selectedCell = Nothing,
                                                        finished     = False,
                                                        menuActive = False
                                                        }


-- Start the game when 'e' key is pressed
handleInput (EventKey (Char 'e') Down _ _) game =
  if menuActive game
    then game {
                grid         = sud,
                initialCells = sud,
                candidates   = candidatesFromGrid initialCand sud,
                solverSelectedCell = Just (0,0),
                selectedCell = Nothing,
                finished     = False,
                menuActive = False
                }
    else game
  where
    sud = chooseSudoku (1::Int) generateRandomNumber

-- Start the game when 'm' key is pressed
handleInput (EventKey (Char 'm') Down _ _) game =
  if menuActive game
    then game {
                grid         = sud,
                initialCells = sud,
                candidates   = candidatesFromGrid initialCand sud,
                solverSelectedCell = Just (0,0),
                selectedCell = Nothing,
                finished     = False,
                menuActive = False
                }
    else game
    where
        sud = chooseSudoku (2::Int) generateRandomNumber


-- Start the game when 'h' key is pressed
handleInput (EventKey (Char 'h') Down _ _) game =
  if menuActive game
    then game {
                grid         = sud,
                initialCells = sud,
                candidates   = candidatesFromGrid initialCand sud,
                solverSelectedCell = Just (0,0),
                selectedCell = Nothing,
                finished     = False,
                menuActive = False
                }
    else game
    where
    sud = chooseSudoku (3::Int) generateRandomNumber

-- Default case for other inputs
handleInput _ game = game


chooseSudoku :: (Eq a, Num a) => a -> Int -> [[Int]]
chooseSudoku dif n
    | dif == 1  = levelOne !! n
    | dif == 2  = levelTwo !! n
    | otherwise = levelThree !! n


getClickedCell :: (Float, Float) -> Maybe (Int, Int)
getClickedCell (x, y)
  |    x' < 0 || x' >= fromIntegral gridSize
    || y' < 0 || y' >= fromIntegral gridSize = Nothing
  | otherwise = Just (floor x', floor y')
  where
    x' = (x + (middleOfGridX + cellWidth/2)) / cellWidth
    y' = (y - (middleOfGridY + cellHeight/2)) / (-cellHeight)


-- Sudokus

levelOne, levelTwo, levelThree :: [[[Int]]]
levelOne = [s11,s12,s13]
levelTwo = [s21, s22,s23]
levelThree = [s31, s32, s33]


s11, s12, s13  :: [[Int]]
s11 = [[4,9,2,7,6,0,0,5,3],
       [6,8,0,3,0,0,2,7,9],
       [0,0,5,8,9,2,0,1,6],
       [0,4,3,9,1,0,0,6,5],
       [0,1,6,4,7,0,3,8,2],
       [8,5,7,6,0,3,1,9,0],
       [1,0,9,5,3,0,6,0,0],
       [5,7,8,0,0,6,9,3,1],
       [3,6,0,0,0,9,5,0,7]]


s12 = [ [0,2,7,0,3,1,9,4,0],
        [1,0,0,8,0,4,6,0,7],
        [6,4,3,0,5,9,0,8,1],
        [7,8,2,1,4,0,3,6,0],
        [4,0,1,3,7,6,0,0,2],
        [5,3,0,9,8,0,7,1,4],
        [2,7,5,0,6,0,1,9,8],
        [9,6,4,2,1,8,0,0,3],
        [0,0,0,5,0,7,4,2,6]]

s13 = [ [0,4,0,0,3,5,6,0,7],
        [7,0,5,4,6,1,2,9,0],
        [1,6,2,0,8,7,4,5,0], 
        [3,8,6,5,0,4,0,2,9],
        [2,7,0,6,9,8,5,0,0],
        [5,0,4,1,2,0,0,8,6],
        [0,0,7,8,4,2,0,6,5],
        [4,0,8,3,0,6,0,7,1],
        [6,0,0,7,1,0,8,4,2]]

s21, s22, s23  :: [[Int]]
s21 =  [[4,9,2,7,0,0,0,5,0],
        [0,0,0,3,0,4,2,7,9],
        [0,0,5,8,9,0,4,0,6],
        [0,4,3,9,0,0,7,0,0],
        [9,0,6,0,7,0,3,8,2],
        [8,5,0,0,0,0,0,9,4],
        [1,0,0,5,3,7,6,4,0],
        [5,7,8,0,0,0,0,3,0],
        [0,0,4,1,8,9,5,0,7]]

s22 =  [[9,4,0,0,8,5,3,0,0],
        [0,0,7,0,0,3,9,4,5],
        [5,3,0,7,0,0,0,1,6],
        [0,0,6,9,3,1,5,8,0],
        [3,8,0,0,6,7,0,0,1],
        [1,0,4,5,0,0,0,6,3],
        [7,0,0,1,0,2,6,3,0],
        [6,1,3,8,0,9,4,0,0],
        [0,2,0,3,5,0,1,0,9]]

s23 =  [[0,0,0,4,0,7,5,1,0],
        [0,0,0,6,1,0,8,0,0],
        [0,7,1,0,0,8,0,0,9],
        [1,4,0,3,0,0,0,0,5],
        [6,0,7,2,0,5,0,0,0],
        [0,9,0,0,0,1,0,6,7],
        [8,0,0,7,0,0,4,0,0],
        [5,0,3,0,0,0,7,9,0],
        [0,1,4,0,6,0,0,5,8]]



s31, s32, s33 :: [[Int]]
s31 =  [[0,0,0,4,0,0,0,0,0],
        [7,0,0,9,0,0,0,0,0],
        [0,0,0,0,0,0,7,0,3],
        [9,0,0,0,0,0,0,0,5],
        [0,0,4,0,9,0,8,0,1],
        [0,0,0,0,0,0,0,0,0],
        [1,0,0,2,5,0,0,8,0],
        [3,4,6,0,1,8,0,0,9],
        [2,0,0,0,0,9,0,0,6]]

s32 =  [[0,0,2,0,0,0,0,0,0],
        [0,0,1,3,0,0,0,7,0],
        [7,0,0,0,0,0,0,1,6],
        [2,0,0,9,0,8,0,0,0],
        [0,0,6,0,7,0,0,0,0],
        [0,0,0,0,0,0,0,0,4],
        [0,0,0,5,0,0,0,0,8],
        [0,7,0,0,0,6,9,0,0],
        [0,6,0,0,8,0,0,2,0]]

s33 =  [[0,0,0,6,0,5,3,0,0],
        [0,0,0,0,0,3,0,4,0],
        [0,3,0,0,0,0,0,0,6],
        [2,0,0,0,0,1,0,0,0],
        [0,0,0,0,6,0,0,0,1],
        [0,0,0,0,2,0,0,0,0],
        [7,0,0,0,0,0,6,3,0],
        [0,0,3,0,0,0,0,0,0],
        [4,0,0,0,0,0,1,0,0]]