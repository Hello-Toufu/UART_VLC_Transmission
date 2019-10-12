// File               : comchk.v
// Author             : Tao Wu
// Created On         : 2017-06-26 16:50
// Last Modified      : 2017-06-30 16:43
// Description        : 
// judge if the data is comma
                        

module COMCHK(
    input   [9:0]       i_Data              ,
    input   [9:0]       i_Mask              ,
    input   [9:0]       i_MComma            ,
    input   [9:0]       i_PComma            ,
    input               i_PComAlignEn       ,
    input               i_MComAlignEn       ,
    output              o_ComDetForAlign    
);

    wire c_ComPDet;
    wire c_ComMDet;
   
    assign c_ComPDet = ((i_Data & i_Mask) == (i_PComma & i_Mask));
    assign c_ComMDet = ((i_Data & i_Mask) == (i_MComma & i_Mask)) ;
    
    assign o_ComDetForAlign = (i_PComAlignEn && c_ComPDet) || (i_MComAlignEn && c_ComMDet);

endmodule
