# Bin Days Finder

## Version 1 Requirements (Ruby Code):
[x] Store a list of addresses with bin days information in either csv or json  
[x] Write a query to take in an address  
[x] Search if that address exists  
[x] Return a the next bin days for that address  
[x] Return "No Results Found" if address not found  
[x] Terminal App to search and return bin days "bin_days.rb"  
[x] Pass dwelling tests  

## Version 2 Requirements (Rails API):
1. Build a simple rails API to return bin days for a valid address (GET request) in json format
2. Store data in csv, json or in posgreSQL database
3. Deploy to heroku
4. Build front end

### Functions
- Request: Search an address via GET request
- Response: Return next addresses that match request
- Response: Contains "next bin days"
- Response: If no address matches, return error
