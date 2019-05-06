# Sweater Weather API
---------------------

Sweater Weather API is built with Ruby on Rails. It supplies endpoints for the user with location/weather/image information sourced from: 

### * Google's Geocode API
### * Dark Sky API
### * Flickr API

Sweater Weather API was built to provide information for the Sweater Weather App. 

Click [here](https://github.com/abdullaqudrat/sweater_weather_fe) to visit the Sweater Weather App Repo. 

Click [here](https://abdullaqudrat.github.io/sweater_weather_fe/) to visit the live app!

## Example Requests

### WEATHER ENDPOINT

Enter the *CITY* and *STATE* as LOCATION params:

https://fierce-crag-36750.herokuapp.com/api/v1/forecast?location=denver,co

* returns

"data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "id": null,
            "location": "Denver, CO, USA",
            "current_time": "07:13 AM",
            "current_date": "Monday, Dec 03",
            "current_icon": "partly-cloudy-night",
            "current_temp": 26.03,
            "current_high": 33.67,
            "current_low": 21.25,
            "current_feels_like": 22.54,
            "current_summary": "Mostly Cloudy",
            "later_summary": "Partly cloudy throughout the day.",
            "current_humidity": 0.77,
            "current_visibility": 4.72,
            "current_uv_index": 0,
            "daily": [
                {
                    "day": "Monday",
                    "icon": "partly-cloudy-day",
                    "summary": "Partly cloudy throughout the day.",
                    "high_temp": 33.67,
                    "low_temp": 21.25,
                    "chance_of_precipitation": 0.17
                ......

-------------------

### BACKGROUND IMAGE ENDPOINT

Enter the *CITY* and *STATE* as LOCATION params:

https://fierce-crag-36750.herokuapp.com/api/v1/backgrounds?location=denver,co

* returns

{
    "data": {
        "id": null,
        "type": "background_image",
        "attributes": {
            "id": null,
            "title": "Grand Fountain Life",
            "link": "https://farm8.staticflickr.com/7409/9359700483_2fcda728d7_o.jpg"
        }
    }
}
