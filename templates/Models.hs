module Models 
    (level1,
    level2,
    level3)
where


level1 = [s11,s12,s13]

level2 = [s21, s22,s23]

level3 = [s31, s32, s33]


s11 =  [[0,4,0,3],
        [0,1,4,2],
        [4,0,0,0],
        [1,2,0,4]]

s12 =  [[0,0,0,1],
        [1,2,3,0],
        [3,4,0,2],
        [2,0,4,3]]

s13 =  [[4,0,3,0],
        [0,1,2,0],
        [0,4,0,3],
        [1,0,4,2]]

-- s11 = [[[0,5,6,0,3,0,8,7,0],[0,0,9,2,8,0,6,5,0],[2,0,0,6,0,0,0,0,0],
--     [5,0,3,1,0,0,2,0,0],[6,0,2,0,0,3,5,0,0],[0,9,0,8,0,2,0,0,6],
--     [8,0,0,3,0,0,4,2,0],[3,0,0,0,4,8,0,0,0],[9,4,0,0,0,0,1,0,0]]


-- s12 = [[0,0,3,0,7,8,0,2,0],[0,0,0,1,0,9,7,0,4],[0,7,0,5,6,2,8,0,0]
--     ,[0,3,2,0,0,0,0,0,1],[5,0,0,6,2,0,4,3,0],[0,4,0,3,8,0,2,5,0]
--     ,[6,0,0,0,1,0,9,0,2],[3,1,0,2,9,0,8,7,0],[0,0,0,5,0,3,1,0,0]]


-- s13 = [[0,0,0,5,8,9,0,4,0],[0,9,0,4,1,0,0,0,0],[4,1,5,0,2,0,0,0,9],
--     [5,8,0,7,0,0,4,0,3],[0,0,0,8,0,0,6,9,0],[7,0,0,0,0,2,8,1,5],
--     [0,6,0,1,4,5,0,0,8],[0,0,7,0,6,8,0,0,4],[0,0,0,9,7,0,1,6,2]]

-- s14 = [[0,0,7,0,6,4,8,9,1],[6,0,0,9,8,0,4,0,7],[8,4,0,2,1,7,6,3,0],
--     [0,8,0,0,0,0,0,0,0],[0,0,0,6,0,0,5,0,2],[0,0,0,0,0,9,1,0,4],
--     [7,0,8,0,3,1,0,0,0],[1,0,0,0,0,0,3,5,6],[0,0,2,0,0,0,0,0,8]]

-- s15 = [[0,5,4,6,2,1,8,0,0],[2,8,1,0,5,0,6,0,4],[6,0,0,8,4,0,0,2,0],
--     [0,1,0,2,0,0,0,5,9],[0,4,0,0,0,6,7,0,0],[0,0,0,4,1,0,0,3,6],
--     [0,0,0,0,0,2,0,0,1],[0,3,8,7,0,0,0,6,2],[4,2,0,0,6,0,0,0,7]]]
    


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