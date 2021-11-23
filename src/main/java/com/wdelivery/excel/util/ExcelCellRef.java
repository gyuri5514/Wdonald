package com.wdelivery.excel.util;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.util.CellReference;

public class ExcelCellRef {
	 /**
     * Cell�� �ش��ϴ� Column Name�� �����´�(A,B,C..)
     * ���� Cell�� Null�̶�� int cellIndex�� ������
     * Column Name�� �����´�.
     * @param cell
     * @param cellIndex
     * @return
     */
    public static String getName(Cell cell, int cellIndex) {
        int cellNum = 0;
        if(cell != null) {
            cellNum = cell.getColumnIndex();
        }
        else {
            cellNum = cellIndex;
        }
        
        return CellReference.convertNumToColString(cellNum);
    }
    
    public static String getValue(Cell cell) {
        String value = "";
        
		
        /*if(cell == null) { 
        	value = ""; 
        } else { 
        	if(cell.getCellType() == CellType.FORMULA) { 
        		value = cell.getCellFormula(); 
        	} else if(cell.getCellType() == CellType.NUMERIC ) {
        		value = cell.getNumericCellValue() + ""; 
        	} else if(cell.getCellType() == CellType.STRING ) { 
        		value = cell.getStringCellValue(); 
        	} else if(cell.getCellType() == CellType.BOOLEAN ) {
        		value = cell.getBooleanCellValue() + ""; 
        	} else if(cell.getCellType() == CellType.ERROR ) { 
        		value = cell.getErrorCellValue() + ""; 
        	} else if(cell.getCellType() == CellType.BLANK ) { 
        		value = ""; 
        	} else { 
        		value = cell.getStringCellValue(); 
        	}
        }*/
        if(cell == null) {
            value = "";
        }
        switch(cell.getCellType()) {
            case FORMULA :
                value = cell.getCellFormula();
                break;
            
            case NUMERIC :
                value = (int)cell.getNumericCellValue() + "";
                break;
                
            case STRING :
                value = cell.getStringCellValue();
                break;
            
            case BOOLEAN :
                value = cell.getBooleanCellValue() + "";
                break;
           
            case BLANK :
                value = "";
                break;
            
            case ERROR :
                value = cell.getErrorCellValue() + "";
                break;
            default:
                value = cell.getStringCellValue();
        }


        return value;
    }
}
