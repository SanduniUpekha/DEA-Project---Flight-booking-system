/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author dhanu
 */
public class Flight {
    private String from;
    private String to;
    private String ticket_class;
    private String flight_type;
    private String day;
    private String flight_time;
    private String flight_date;
    private int from_oldCountryId;
    private int to_oldCountryId;
    private int flight_id;

    public int getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(int flight_id) {
        this.flight_id = flight_id;
    }

    public int getFrom_oldCountryId() {
        return from_oldCountryId;
    }

    public void setFrom_oldCountryId(int from_oldCountryId) {
        this.from_oldCountryId = from_oldCountryId;
    }

    public int getTo_oldCountryId() {
        return to_oldCountryId;
    }

    public void setTo_oldCountryId(int to_oldCountryId) {
        this.to_oldCountryId = to_oldCountryId;
    }
    

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getTicket_class() {
        return ticket_class;
    }

    public void setTicket_class(String ticket_class) {
        this.ticket_class = ticket_class;
    }

    public String getFlight_type() {
        return flight_type;
    }

    public void setFlight_type(String flight_type) {
        this.flight_type = flight_type;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getFlight_time() {
        return flight_time;
    }

    public void setFlight_time(String flight_time) {
        this.flight_time = flight_time;
    }

    public String getFlight_date() {
        return flight_date;
    }

    public void setFlight_date(String flight_date) {
        this.flight_date = flight_date;
    }
    
    
}
