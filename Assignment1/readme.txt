Question 1:
Related files: find_paths.m, find_4path, find_8path, find_mpath.m, is_pxl.m, Input.mat

-Place all the matlab files in the same folder.

-'find_paths.m' is the main function which calls upon 'find_4path.m', 'find_8path.m', 'find_mpath.m' based on the path_type specified.

-'find_4path.m', 'find_8path.m', 'find_mpath.m' are user-defined functions that find 4,8,m paths respectively.

-'is_pxl.m' is a user-defined function to check whether a given coordinate is inside the image or not.

-'Input.mat' consists of image (I), set (V), start point coordinates ([x1,y1]) and end point coordinates ([x2,y2]).

-'test.m' is a user-defined function that loads inputs from 'Input.mat' and finds the 4 paths and m paths.

-'find_paths.m' returns output in the form of structure with field- 'path','length', 'shortest_path'. 'path' holds the set of coordinates from start to end in a cell, 'length' contains the length of the path and 'shortest_path' indicates whether the path is the shortest path or not(1 for shortest_path and 0 for not shortest path).

-If no path can be found then the function returns a 1x1 struct with a empty cell in the 'path' field and 'length' and 'shortest_path' will have 0.

-If 2 paths are equal in length only one of paths would be shown to be a shortest_path.
-----------------------------------------------------------------------------
Question 6:
Related files: random_rectangles.m ; rand_rect_runfile.m 

NOTE: make sure that the current folder in MATLAB consists the above 2 mentioned 
      files. 

random_rectangles.m contains the function random_rectangles(M,N,border,n,w1,w2,alpha,max_iterations,Vf,Vb)

steps to run the code: 
1. open rand_rect_runfile.m in which all the inputs as well as calling the function is
present.
2. change the inputs as required to check the variations in the outputs. 
3. for each run, the output image is stored in the current folder with the name "output.png"

