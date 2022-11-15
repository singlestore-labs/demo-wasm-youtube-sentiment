wit_bindgen_rust::export!("sentiment.wit");

struct Sentiment;

lazy_static::lazy_static! {
    static ref ANALYZER: vader_sentiment::SentimentIntensityAnalyzer<'static> =
        vader_sentiment::SentimentIntensityAnalyzer::new();
}

impl sentiment::Sentiment for Sentiment {
    fn sentiment(input: String) -> f64 {
        let scores = ANALYZER.polarity_scores(input.as_str());
        scores["compound"]
    }

    fn sentiment_t(input: String) -> Vec<f64> {
        let scores = ANALYZER.polarity_scores(input.as_str());
        vec![scores["compound"]]
    }
}
