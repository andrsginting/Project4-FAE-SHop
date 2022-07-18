/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package crud;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Andreas PC
 */
public class listDao {
    Connection con;

    public listDao(Connection con) {
        this.con = con;
    }

    //add books information to database
    public boolean addList(lists list){
        boolean test = false;
        
        try{
            String query =  "insert into lists (lName,lGender,lEmail,lAddress) values(?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, list.getListName());
            pst.setString(2, list.getListGender());
            pst.setString(3, list.getListEmail());
            pst.setString(4, list.getListAddress());
            pst.executeUpdate();
            test= true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }
    
    public List<lists> getAllLists(){
        List<lists> list = new ArrayList<>();
        
        try{
            
            String query = "select * from lists";
            PreparedStatement pt = this.con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();
            
            while(rs.next()){
                int id = rs.getInt("id");
                String lName = rs.getString("lName");
                String lGender = rs.getString("lGender");
                String lEmail = rs.getString("lEmail");
                String lAddress = rs.getString("lAddress");
                
                lists row = new lists(id,lName,lGender,lEmail,lAddress);
                list.add(row);
            }
            
        }catch(Exception e){
            e.printStackTrace();;
        }
        return list;
    }
    
    public lists getSingleList(int id){
        lists ls = null;
        
        try{
            String query = "select * from lists where id=? ";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, id);
            ResultSet rs= pt.executeQuery();
            
            while(rs.next()){
                int bid = rs.getInt("id");
                String lN = rs.getString("lName");
                String lG = rs.getString("lGender");
                String lE = rs.getString("lEmail");
                String lA  = rs.getString("lAddress");
                
                ls = new lists(bid, lN, lG, lE, lA);
            }
        }catch(Exception ex){
            ex.printStackTrace();;
        }
        return ls;
    }
    
    public boolean editListInfo(lists list){
        boolean test = false;
        try{
            String query = "update lists set lName=?, lGender=?, lEmail=?, lAddress=? where id=?";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, list.getListName());
            pt.setString(2, list.getListGender());
            pt.setString(3, list.getListEmail());
            pt.setString(4, list.getListAddress());
            pt.setInt(5, list.getId());
            
            pt.executeUpdate();
            test = true;
        }catch(Exception ex){
            ex.printStackTrace();;
        }
        
        return test;
    }
    
    public void deleteList(int id){
        try{
            
           String query= "delete from lists where id=?";
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setInt(1, id);
           pt.execute();
            
        }catch(Exception e){
            e.printStackTrace();;
        }
    }
    
}
