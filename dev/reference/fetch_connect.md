# fetch_connect

Fetch deployment status on Connect of a given app

## Usage

``` r
fetch_connect(
  app_name,
  connect_api_token = Sys.getenv("CONNECT_TOKEN"),
  connect_url = Sys.getenv("CONNECT_URL")
)
```

## Arguments

- app_name:

  character Name of the app to be fetched

- connect_api_token:

  character API token to enable access to Connect

- connect_url:

  character URL to Connect server

## Value

list A list containing the HTTP code status and the guid of the app

## Examples

``` r
if (FALSE) { # \dontrun{
fetch_connect(app_name = "my_app_name")
} # }
```
