from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Set up the WebDriver and open the URL directly
driver = webdriver.Chrome()
driver.get("https://docs.google.com/forms/d/e/1FAIpQLSdXmnUb5m7c6xmbmSMWfIJpHlCGgtJHKTp2xjXpZdxmHf9iMw/viewform?usp=sf_link")

# Wait for the email field to be visible and fill it
email_field = WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located((By.XPATH, "//input[@type='email']"))
)
email_field.send_keys("testuser@example.com")

# Find the feedback text area and input some feedback
feedback_area = WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located((By.XPATH, "//textarea"))
)
feedback_area.send_keys("Great app! Keep improving!")

# Click the submit button
submit_button = WebDriverWait(driver, 10).until(
    EC.element_to_be_clickable((By.XPATH, "//span[text()='Submit']"))
)
submit_button.click()

# Optionally, wait for a confirmation message and verify submission
confirmation_message = WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located((By.XPATH, "//div[contains(text(), 'Thank you')]"))
)
assert "Thank you" in confirmation_message.text

# Close the browser
driver.quit()
