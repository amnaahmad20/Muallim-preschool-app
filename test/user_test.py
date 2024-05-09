from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager

# Initialize the WebDriver
driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))

# URL of the Google Form
form_url = "https://docs.google.com/forms/d/e/1FAIpQLScBQnk1TbuxoKV_2Hzm7Ax4Xxq-FDiWBImCLF9Ho-9s3egbyQ/viewform"
driver.get(form_url)

try:
    # Wait for the email field to be visible and fill it
    email_field = WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, "//input[@type='email']"))
    )
    email_field.send_keys("testuser@example.com")

    # Select "Age of your child" option - choosing "5-7"
    age_option = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//div[@data-value='5-7']"))
    )
    age_option.click()

    # Select "How often your children use our application" - choosing "daily"
    usage_option = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//div[@data-value='daily']"))
    )
    usage_option.click()

    # Submit the form
    submit_button = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//span[text()='Submit']"))
    )
    submit_button.click()

    # Optional: Confirm submission by finding a thank-you message
    confirmation_message = WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, "//div[contains(text(), 'Thank you')]"))
    )
    assert "Thank you" in confirmation_message.text
    print("Form submitted successfully!")

finally:
    # Close the WebDriver
    driver.quit()
