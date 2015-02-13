% DealDash Simulation
% Strategy 02
% Andrew Schneer
% 02/10/2015

% ===================================================== %

% Determine the auction price threshold at which the
% bidder should either back out of the auction, buy-it-now,
% or keep bidding until he/she wins the item.  Which one
% of these options is best will probably depend on
% the bid price and number of bidders, however the
% best option intuitively seems to be to buy-it-now, since
% all the bids are refunded from the auction and the
% product is still acquired, which can then be sold off
% to cut losses.

% Assumptions:
%     All bidders contribute equally to raising the auction price
%         (all bidders bid an equal # of times before auction ends).
%     All bids are purchased at the same price.

% ===================================================== %

% Procedure:

% The user should first decide to enter an auction.
% Set "buyItNowPrice" to the auction's buy-it-now/retail price.
% Set the "bidPrice" to the price paid for the bids
%     that the user will use for the auction.
% After the auction starts and new bidders are locked out,
%     count the number of bidders in the auction, and set that
%     number as "numBidders".
% Optional - set the auctionPriceResolution to alter the
%     precision of the simulation.

% ===================================================== %

% Housekeeping.
clear all;
close all;
clc;

% ===================================================== %

% User-defined parameters for simulation.
buyItNowPrice = 22.50;
bidPrice = 0.15;
numBidders = 42;
auctionPriceResolution = 0.50;
finalSaleFractionResponsibleFor = 1.0;

% ===================================================== %

% Simulation.

% Create a range of hypothetical final
% auction prices to test.
finalAuctionPriceRange = [1.00:auctionPriceResolution:(1.10 * buyItNowPrice)];
% Assuming each bidder wastes the same number of
% bids getting the auction price to its final value,
% and all the bids were purchased for the same price,
% calculate the cost per bidder in used-bids.
auctionPriceBurdenPerBidder = (finalAuctionPriceRange .* (bidPrice ./ 0.01) ./ numBidders);
% Calculate the total cost for the winner.
totalCost = ((finalSaleFractionResponsibleFor .* finalAuctionPriceRange) + auctionPriceBurdenPerBidder);

% Data analysis.

% Plot the total cost function vs. the hypothetical
% final auction price.
plot(finalAuctionPriceRange,totalCost,'color','blue','lineWidth',2.0);
grid on;
hold on;
% Calculate the auction-price-threshold beyond which
% the winner will wind up spending more than the
% item is worth (buy-it-now price).
for i = (1:length(totalCost))
    % This conditional assumes the function is
    % linear and increasing.  Otherwise it will
    % prematurely find a value >= to the
    % buy-it-now price.
    if(totalCost(i) >= buyItNowPrice)
        % This assumes the x & y variables
        % plotted are vectors of the same
        % length, which they must be in order
        % for the plot to work.
        threshold = finalAuctionPriceRange(i);
        break;
    else
        % Keep looking.
    end
end
% Mark the threshold with red lines.
line([threshold threshold],[0 totalCost(end)]);
line([finalAuctionPriceRange(1) finalAuctionPriceRange(end)],[buyItNowPrice buyItNowPrice]);
hold off;
% Label graph.
title('DealDash - Total Winner Cost');
xlabel('Final Auction Price ($)');
ylabel('Total Cost ($)');














