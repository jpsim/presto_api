# Presto Card API

REST API for interacting with [Presto cards](http://prestocard.ca) using the [`presto`](https://github.com/jpsim/presto-gem) ruby gem.

## Usage

* `/card_status/:card_number`
* `/card_status/:username/:password`
* `/me/:username/:password`
* `/transaction_history/:username/:password`

## Deploying to Heroku

```shell
$ bundle
$ heroku create -s cedar presto-api
$ git push heroku master
$ heroku open
```

## Running Locally

```shell
$ bundle
$ foreman start
```

## License

MIT Licensed.

## Notice

Please respect the Presto website's [Terms and Conditions](https://www.prestocard.ca/en-US/Pages/ContentPages/Terms.aspx).
