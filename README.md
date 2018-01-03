# 2018-House-Model
A model to simulate the 2018 US House of Representatives Election

This model works by calculating a unique probability for the Democratic candidate of winning each House district in the upcoming 2018 election.  The simuation is performed by generating a random number for each district.  For example, if a Democrat has a 60% chance of winning a district, a random number between 1 and 999 is generated.  If that random number is less or equal to 600, the Democratic candidate wins that district.  Else, the GOP candidate wins.  The entire slate of all 435 elections is performed 1000 times to get a decent sample.

The key to this simulation is the calculation of the probability of the Democrat winning each district.  I use a simple method to calculate this.  The projected Democratic two-party vote share is calculated first.  This is done by taking the district's PVI (negative for GOP, positive for Democrats), then adding the generic ballot average and then subtracting polling deviation that could occur between now and the election.  Incumbency advantage is also accounted for by adding or subtracting 2.5 from the two-party share, as incumbents have about 5 point advantage (NOTE: in some districts, particularly GOP-held districts in NY, the incumbency advantage is even higher than that).  The probability is calculated from the Democratic two-party vote share by taking off 10 points from the probability percentage for every point under 50 in the two-party vote and likewise 10 additional points for every point over 50 in the two-party vote share.  I assume a 50-50 two-party vote share gives a Democratic candidate a 50% chance of winning that district.  For example, if the Democrat is projected to win 51.5% of the vote, that candidate has a 1.5 * 10% + 50% = 65% chance of winning that district.  

Simulation is done in R

Data for the simulation is fed from the csv file.

Column 1: each House district
Column 2: 2017 PVI of the district
Column 3: Projected two-party vote for Democratic candidate
Column 4: National environment swing from a "normal" presidential election year
Column 5: Current representative; 0 for GOP, 1 for Democrat
Column 6-10: Description of results before and after election
Column 11: Win probability for the Democratic candidate on a scale of 0 to 100.  Safe seats are negative for GOP and over 100 for Democrats.
Column 12: Disregard
Column 13: Generic ballot polling average from fivethirtyeight.com
Column 14: National partisan lean of the nation as a whole (around 2% Democratic)
Column 15: Reversion to the mean (for safety)

