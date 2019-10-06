package org.yoo.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testConnection() {
		
		try (Connection con = 
				DriverManager.getConnection(
						"jdbc:mariadb://localhost:3310/jsp_practice",
						"jspdb",
						"jspdb")){
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
		
	}
	
	
}
