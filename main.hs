-- Criando rainha com x e y
data Rainha = Rainha { x :: Int
                   , y :: Int
                   } deriving (Eq)


-- Formato de impressão de rainha
instance Show Rainha where
    show (Rainha x y) = "(" ++ show x ++ "," ++ show y ++ ")"


-- Checa se duas rainhas se atacam
ataca :: Rainha -> Rainha -> Bool
ataca (Rainha x1 y1) (Rainha x2 y2)
    -- same row or column
    | (x1 == x2) || (y1 == y2)       = True
    -- same diagonal
    | abs (x1 - x2) == abs (y1 - y2) = True
    | otherwise                      = False


-- Coloca uma rainha se for possível
valido :: Rainha -> [Rainha] -> Bool
valido try []     = True
valido try (q:qs) = if try `ataca` q
                          then False
                          else valido try qs


-- Coloca todas as rainhas num tabuleiro NxN
nRainhas :: Int -> [[Rainha]]
nRainhas n = map reverse $ nRainhas' n where
    nRainhas' 0 = [[]]
    nRainhas' k =
        let prevQs  = nRainhas' (k - 1)
            legalQs = [Rainha (k - 1) y | y <- [0 .. n - 1]]
         in [q:qs | qs <- prevQs, q <- legalQs, valido q qs]


-- Imprime a lista de configurações válidas
printQs :: [[Rainha]] -> IO ()
printQs []     = putChar '\n'
printQs (q:qs) = do
    putStrLn $ show q
    printQs qs


-- main
main :: IO ()
main = do
    let n = 6

    printQs $ nRainhas n