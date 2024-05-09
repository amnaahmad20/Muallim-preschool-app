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
    # Intentionally do not fill the email field to trigger validation failure

    # Fill "Age of your child" option - choosing "5-7"
    age_option = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//div[@data-value='5-7']"))
    )
    age_option.click()

    # Fill "How often your children use our application" - choosing "daily"
    usage_option = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//div[@data-value='daily']"))
    )
    usage_option.click()

    # Attempt to submit the form without filling the email
    submit_button = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.XPATH, "//span[text()='Submit']"))
    )
    submit_button.click()

    # Check for validation error message indicating the email is required
    validation_error = WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, "//div[contains(text(), 'This is a required question')]"))
    )
    assert validation_error is not None, "Expected validation error not found."
    print("Form submission failed as expected due to missing email!")

finally:
    # Close the WebDriver
    driver.quit()
