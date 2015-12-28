package utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Set;

import org.apache.log4j.Logger;

/**
 * This class reads the properties from properties file
 */
public class CitsPropertiesHandler {
	
	private static Logger LOGGER = Logger.getLogger(CitsPropertiesHandler.class);

	private final Properties configProp = new Properties();

	private CitsPropertiesHandler() {

		InputStream in = this.getClass().getClassLoader().getResourceAsStream("Cits.properties");
		try {
			configProp.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static class InstanceHolder {
		private static final CitsPropertiesHandler INSTANCE = new CitsPropertiesHandler();
	}

	public static CitsPropertiesHandler getInstance() {
		return InstanceHolder.INSTANCE;
	}

	public String getProperty(String key) {
		//LOGGER.debug("Getting property: "+key+" value: "+configProp.getProperty(key));
		return configProp.getProperty(key);
	}

	public Set<String> getAllPropertyNames() {
		return configProp.stringPropertyNames();
	}

	public boolean containsKey(String key) {
		return configProp.containsKey(key);
	}
}
