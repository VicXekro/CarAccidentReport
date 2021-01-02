package com.car_accident.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.car_accident.model.Accident;

public class DB_Manager {

	public static LinkedList<Accident> get_all_accident(){
		LinkedList<Accident> listAccident = new LinkedList<>();
		
		try {
		String sql_string = "SELECT * FROM accident_record;";
		
		Connection conn = Connector.getConnection();
		PreparedStatement prepStatement = conn.prepareStatement(sql_string);
		ResultSet result = prepStatement.executeQuery();
		
		while(result.next()) {
			Accident accident = new Accident(result.getInt(1), result.getFloat(2), result.getFloat(3), result.getTimestamp(4));
			listAccident.add(accident);
		}
		
		result.close();
		prepStatement.close();
		conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return listAccident;
	}
}
