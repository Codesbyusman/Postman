# Postman
API testing using Postman for:
https://restful-booker.herokuapp.com/apidoc/index.html

- In newman folder (is the generated report using newman in HTML)
- script.sh take two arguments as input the collection file and environment file and uses test.json automatically as data entries.
- you can modify test.json accordingly

- **Pre-requisites:**
  - node should be installed
  - npm should be there
  - newman should be installed
 
- **How to run**
  - Through script:
     ```bash
     ./script.sh collection.json environment.json
     ```
    (used the --bail flag that stop newman on very first failed assertion and usually time requests failed as they are less then 1 sec. To see the complete can remove --bil flag from script or can run from newman manuallay as shared below)
    
  - Through newman
    ```bash
     newman run collection.json -e environment.json -d tests.json
     ```
