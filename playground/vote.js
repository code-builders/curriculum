var vote = {
  results: {},
  question: "Who should win?"
};

vote.cast = function (n) {
  if (!this.results[n]) {
    this.results[n] = 0;
  }
  this.results[n]++;
  return this.results;
};

vote.cast("Bernie");
vote.cast("Bernie");
vote.cast("Bernie");
vote.cast("Bernie");
vote.cast("Trump");
vote.cast("Hillary");
vote.cast("Hillary");
vote.cast("Hillary");

console.log(vote.results);
