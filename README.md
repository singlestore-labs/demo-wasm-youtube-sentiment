# Demo of sentiment analysis of Youtube trending videos using SingleStore and Wasm

**Attention**: The code in this repository is intended for experimental use only and is not fully tested, documented, or supported by SingleStore. Visit the [SingleStore Forums](https://www.singlestore.com/forum/) to ask questions about this repository.

This project demonstrates how to use SingleStore + Wasm to do sentiment analysis on data. In this case we are using data from Kaggle which can be [found here](https://www.kaggle.com/datasets/rsrishav/youtube-trending-video-dataset).

To run this demo you will need to have access to a SingleStore cluster with Wasm enabled. The easiest way to do that is using our official Docker image which you can run locally on your computer. You can find [documentation on this image here](https://github.com/singlestore-labs/singlestoredb-dev-image).

Next you will need to create a database (suggest calling it test, but feel free to call it whatever you like) and run [./youtube_trending/load.sql](./youtube_trending/load.sql) to load the data. You may need to specify `--local-infile` if you are loading from the command line.

Finally you will need to compile the Wasm module in this repo. The code is written in rust so you will need a rust development environment. To simplify things this repo includes VSCode devcontainer support. This means if you open this repo in VSCode you will be prompted to reopen the repo in a "development container". Once you do that, you will have access to the required rust toolchain for compiling Wasm modules. If you don't do this you will need to setup the rust toolchain yourself (install rustup and then run [./.devcontainer/postcreate.sh](./.devcontainer/postcreate.sh)).

To compile the Wasm module you can simply run `cargo wasi build --release` in this directory.

Once you have SingleStore running and setup and the Wasm module compiled, open up [this python notebook](./youtube_trending/youtube_sentiment_analysis.ipynb) and update the connection string in the second cell. Then just follow along with the notebook and play around with the dataset.

For additional documentation on using Wasm with SingleStore [please refer to the docs](https://docs.singlestore.com/db/v8.0/en/reference/code-engine---powered-by-wasm.html).
