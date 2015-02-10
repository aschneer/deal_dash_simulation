function [totalCost] = calcTotalCost(win,numBidders,bidPrice,finalAuctionPrice)
    % This function calculates the total cost to
    % the bidder, whether they win or lose the auction.
    
    % Cost of bids spent by the user to
    % win the auction.
    auctionPriceCost = calcAuctionPriceCost(bidPrice,finalAuctionPrice);
    % Assume burden of raising auction price
    % is shared equally among all the bidders.
    bidCost = (auctionPriceCost / numBidders);
    % Assume there is no promotion, but the winner
    % must pay the final auction price for the item.
    saleCost = finalAuctionPrice;
    
    if(win)
        totalCost = (bidCost + saleCost);
    else
        totalCost = bidCost;
    end
    
    return;
end