package utils;

import java.util.Random;

import org.apache.log4j.Logger;

/**
 * This class contains the utilities and reusable methods of the application
 *
 */
public class CitsUtils {

	private static Logger LOGGER = Logger.getLogger(CitsUtils.class);

	/**
	 * This method generates random integer numbers
	 * 
	 * @param aStart
	 * @param aEnd
	 * @param aRandom
	 */
	public static long createRandomInteger(int aStart, long aEnd) {
		LOGGER.debug("createRandomInteger called...");
		Random aRandom = new Random();
		if (aStart > aEnd) {
			throw new IllegalArgumentException("Start cannot exceed End.");
		}
		// get the range, casting to long to avoid overflow problems
		long range = aEnd - (long) aStart + 1;
		// compute a fraction of the range, 0 <= frac < range
		long fraction = (long) (range * aRandom.nextDouble());
		long randomNumber = fraction + (long) aStart;
		LOGGER.info("Generated : " + randomNumber);
		return randomNumber;

	}
	
	//Main method to unit test
	public static void main(String args[]){
		createRandomInteger(1000000000,9999999999L);
	}

}
