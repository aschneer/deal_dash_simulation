function [auctionPriceCost] = calcAuctionPriceCost(bidPrice,auctionPrice)
    % This function will calculate the total
    % amount of money that has been used
    % (by anyone) to get the auction price
    % to where it currently is, or the "cost"
    % of the current auction price to the users
    % of the site.  This is the amount of money
    % DealDash makes off of bid sales when
    % an item is auctioned off.  The underlying
    % assumption here is that all bids were
    % purchased at the same price by all users.
    % This is definitely not true, since DealDash
    % runs promotions where they drop the price
    % of purchasing bids.

    % Ratio of a bid's cost
    % to its value.  This is the cost of
    % one cent (in cents), or the cost
    % of one dollar (in dollars).  This
    % is the cost of a bid per dollar of
    % auction price.
    bidCostValueRatio = (bidPrice * 100);
    % Cost of getting auction price to where
    % it currently is.
    auctionPriceCost = (bidCostValueRatio * auctionPrice);
    
    return;
end