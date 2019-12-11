using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Users
/// </summary>
public class Users
{

    public DataSet getUserData(string userName)
    {

        DBManager myDBManager = new DBManager();
        
        string myQuery = "spPlayerSelectUserName";
        SqlParameter[] myParameters = new SqlParameter[1];
        myParameters[0] = new SqlParameter("UserName", userName);


        return myDBManager.createDataSet(myQuery, myParameters);

        
    }

    public DataSet getUserData(int userID)
    {

        DBManager myDBManager = new DBManager();

        string myQuery = "spPlayerSelectID";
        SqlParameter[] myParameters = new SqlParameter[1];
        myParameters[0] = new SqlParameter("PlayerID", userID);


        return myDBManager.createDataSet(myQuery, myParameters);


    }

    public DataSet userCheckLogin(string username, string password)
    {
        DBManager myDBManager = new DBManager();

        string myQuery = "spUserCheckLogin";
        SqlParameter[] myParameters = new SqlParameter[2];
        myParameters[0] = new SqlParameter("username", username);
        myParameters[1] = new SqlParameter("password", myDBManager.encrypt(password));


        DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

        return myDataSet;

    }

    public bool userCheckUsernameExistsExists(string username)
    {
        DBManager myDBManager = new DBManager();

        string myQuery = "spUserCheckUsername";
        SqlParameter[] myParameters = new SqlParameter[1];
        myParameters[0] = new SqlParameter("username", username);


        DataSet myDataSet = myDBManager.createDataSet(myQuery, myParameters);

        return myDataSet.Tables[0].Rows.Count != 0;
    }

    public int updateUser(int PlayerID, string firstName, string lastName, string userName, string address1, string address2, int state, string city, string gamerTag)
    {
        DBManager myDBManager = new DBManager();
        string myQuery = "spPlayerUpdate";

        SqlParameter[] myParameters = new SqlParameter[10];
        myParameters[0] = new SqlParameter("PlayerID", PlayerID);
        myParameters[1] = new SqlParameter("FirstName", firstName);
        myParameters[2] = new SqlParameter("LastName", lastName);
        myParameters[3] = new SqlParameter("UserName", userName);
//        myParameters[3] = new SqlParameter("Password", myDBManager.encrypt(password));
        myParameters[4] = new SqlParameter("City", city);
        myParameters[5] = new SqlParameter("StateID", state);
        myParameters[6] = new SqlParameter("Address1", address1);
        myParameters[7] = new SqlParameter("Address2", (address2 == "" ? null : address2));
        myParameters[8] = new SqlParameter("ZipCode", address1);
        myParameters[9] = new SqlParameter("GamerTag", gamerTag);

        int rows = myDBManager.executeNonQuery(myQuery, myParameters);
        return rows;
    }

    public int deleteUser(int PlayerID)
    {
        DBManager myDBManager = new DBManager();
        string myQuery = "spPlayerDelete";

        SqlParameter[] myParameters = new SqlParameter[1];
        myParameters[0] = new SqlParameter("PlayerID", PlayerID);

        int rows = myDBManager.executeNonQuery(myQuery, myParameters);
        return rows;
    }

    public int insertUser(string firstName, string lastName, string email, string userName, string password)
    {
        DBManager myDBManager = new DBManager();
        string myQuery = "spUserInsert";

        SqlParameter[] myParameters = new SqlParameter[5];
        myParameters[0] = new SqlParameter("first_name", firstName);
        myParameters[1] = new SqlParameter("last_name", lastName);
        myParameters[2] = new SqlParameter("email", email);
        myParameters[3] = new SqlParameter("username", userName);
        myParameters[4] = new SqlParameter("password", myDBManager.encrypt(password));


        int rows = myDBManager.executeNonQuery(myQuery, myParameters);
        return rows;
    }

    public Users()
    {



    }
}
 