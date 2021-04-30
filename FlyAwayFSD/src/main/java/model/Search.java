package model;

public abstract class Search {
    public static String Date;
    public static String Day;
    public static String Source;
    public static String Destination;
    public static int Persons;

    public static String getQuery() {
        return "SELECT * FROM flight_table WHERE Source = '"+Source+"' AND Destination='"+Destination+"' AND Day='"+Day+"'";
    }
}