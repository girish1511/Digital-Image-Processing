Question 3:
Related files: padding.m, imfilter_16110057.m, test_filter.m

-Place all the MATLAB files in the same folder.

-'imfilter_16110057.m' is the main function that performs the filtering operation based on the arguments details of which are provided in the report.

-'padding.m' pads the input image based on the size of the filter mask.

-'test_filter.m' is a MATLAB script to test the user-defined function with the in-built function.

-----------------------------------------------------------------------------
Question 8:
Related files: to_bits.m, gen_im.m, rastor_code.m, run_length_coding.m, test_RLC.m

-Place all the matlab files in the same folder.

-'run_length_coding' is the main function that performs RLC on the input image.

-'gen_im' generates the test image. If the diameter of the inner circle is greater than the outer square length then the outer square length is altered accordingly.

-'to_bits.m' is an user-defined function to convert decimal to binary for bit-plane slicing.

-The output for RLC on original grayscale image is string of values of the form (g,n). The output for RLC on bit-planes and graycode-planes is a cell where each cell corresponds to the RLC of the corresponding bit-plane or graycode-plane in the form of strings.

-'test_RLC.m' tests the user-defined function for RLC on the generated image.