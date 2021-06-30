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
    -- mesma linha ou coluna
    | (x1 == x2) || (y1 == y2)       = True
    -- mesma diagonal
    | abs (x1 - x2) == abs (y1 - y2) = True
    | otherwise                      = False


-- Coloca uma rainha se for possível
valido :: Rainha -> [Rainha] -> Bool
valido try []     = True
valido try (r:rs) = if try `ataca` r
                          then False
                          else valido try rs


-- Coloca todas as rainhas num tabuleiro NxN
nRainhas :: Int -> [[Rainha]]
nRainhas n = map reverse $ nRainhas' n where
    nRainhas' 0 = [[]]
    nRainhas' k =
        let antRs  = nRainhas' (k - 1)
            validas = [Rainha (k - 1) y | y <- [0 .. n - 1]]
         in [r:rs | rs <- antRs, r <- validas, valido r rs]


-- Imprime a lista de configurações válidas
imprimeR :: [[Rainha]] -> IO ()
imprimeR []     = putChar '\n'
imprimeR (r:rs) = do
    putStrLn $ show r
    imprimeR rs


-- main
main :: IO ()
main = do
    let n = 6
    imprimeR $ nRainhas n