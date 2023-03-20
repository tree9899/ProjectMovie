package com.MVReservation001.makeUp;

import org.openqa.selenium.By;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class SeleniumTest {

	public static void main(String[] args) throws InterruptedException {
		System.setProperty("webdriver.chrome.driver", "D:\\projectDriver\\chromedriver.exe");
		ChromeOptions options = new ChromeOptions();
		options.setPageLoadStrategy(PageLoadStrategy.NORMAL);
		WebDriver driver = new ChromeDriver(options);
		//WebDriverWait waitDrivers = new WebDriverWait(driver, 10);
		
		driver.get("https://search.naver.com/search.naver?where=image&sm=tab_jum&query=배경화면");
		Thread.sleep(2000);
		//#main_pack > section.sc_new.sp_nimage._prs_img._imageSearchPC > div > div.photo_group._listGrid > div.photo_tile._grid > div:nth-child(1) > div > div.thumb > a > img
		System.out.println("testSrc : " + driver.findElements(By.tagName("img")).size());
		
		driver.quit();
	}

}
