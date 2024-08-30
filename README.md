# CSV-to-HTML

A CSV to HTML table converter written Haskell in 28 lines.

## Usage

First, install GHC from the Haskell [website](https://www.haskell.org/downloads/).

Next, clone the repository and `cd` into it:

```shell
git clone https://github.com/m1chaelwilliams/csv-to-table-hs.git
cd csv-to-table-hs
```

Build the project with `GHC`:

```shell
ghc main.hs -o converter
```

Run the program with a test csv file:

```shell
converter test/customers-100.csv out.html
```

## License

This code is licensed under `MIT`.

## Contributing

If you find a way to make this more concise/better, please add it and create a pull request.
