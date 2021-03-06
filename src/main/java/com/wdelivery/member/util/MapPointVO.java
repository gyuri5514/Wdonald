package com.wdelivery.member.util;

public class MapPointVO {
	private double start_lat;
	private double end_lat;
	private double start_lon;
	private double end_lon;
	private final double lat = 0.009094341037268; // lat per 1km
	private final double lon = 0.0112688753662384;// lon per 1km
    
	/* new logic */
	private double client_lat;
	private double client_lon;
	private double fixed_rad;
	private double direct;
	public MapPointVO() {}
	/* this constructor set lat,lon  4km away from client*/
	public MapPointVO(double client_lat, double client_lon,int radius) {
		/*deprecated */
		this.start_lat = client_lat-(2*lat);
		this.start_lon = client_lon-(2*lon);
		this.end_lat = client_lat+(2*lat);
		this.end_lon = client_lon+(2*lon);
		/*new Logic */
		this.client_lat = client_lat;
		this.client_lon = client_lon;
		this.fixed_rad = 0.012*radius;
		
	}
	public double getStart_lat() {
		return start_lat;
	}
	public void setStart_lat(double start_lat) {
		this.start_lat = start_lat;
	}
	public double getEnd_lat() {
		return end_lat;
	}
	public void setEnd_lat(double end_lat) {
		this.end_lat = end_lat;
	}
	public double getStart_lon() {
		return start_lon;
	}
	public void setStart_lon(double start_lon) {
		this.start_lon = start_lon;
	}
	public double getEnd_lon() {
		return end_lon;
	}
	public void setEnd_lon(double end_lon) {
		this.end_lon = end_lon;
	}
	public double getClient_lat() {
		return client_lat;
	}
	public void setClient_lat(double client_lat) {
		this.client_lat = client_lat;
	}
	public double getClient_lon() {
		return client_lon;
	}
	public void setClient_lon(double client_lon) {
		this.client_lon = client_lon;
	}
	public double getFixed_rad() {
		return fixed_rad;
	}
	public void setFixed_rad(double fixed_rad) {
		this.fixed_rad = fixed_rad;
	}
	public double getDirect() {
		return direct;
	}
	public void setDirect(double direct) {
		this.direct = direct;
	}
	
}
