package com.erika;

public class Room {
    private String roomName;
    private int rm_capacity;
    private String rm_feature;
    private String alcohol;

    // Empty Constructor
    Room() {
    }// end Empty Constructor

    // Full constructor
    Room(String rm, int cap, String fea, String al) {
        this.alcohol = al;
        this.rm_feature = fea;
        this.rm_capacity = cap;
        this.roomName = rm;
    }// end full constructor

    //Create get methods
    public String getRoomName() {
        return roomName;
    }

    public int getCapacity() {
        return rm_capacity;
    }

    public String getFeature() {
        return rm_feature;
    }

    public String getAlcohol() {
        return alcohol;
    }

    // Create set methods
    public void SetRoom(String rm) {
        this.roomName = rm;
    }

    public void SetCapacity(int cap) {
        this.rm_capacity = cap;
    }

    public void SetFeature(String fea) {
        this.rm_feature = fea;
    }

    public void setAlcohol(String al) {
        this.alcohol = al;
    }
} // end class