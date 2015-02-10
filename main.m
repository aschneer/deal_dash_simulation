% DESCRIPTION:

% This script will generate an n-dimensional
% matrix of values resulting from the variation
% of different parameters associated with the
% auction.  The data can then be graphed any
% which way to determine the best bidding
% strategy.

% The dimensions of the output matrix will
% correspond to different variables, as follows:

% D_01 = Win or loss (boolean)
% D_02 = Number of bidders (integer)
% D_03 = Bid price (double)
% D_04 = Final auction price (double)

% D_XX = Buy-it-now price (double)

% Each dimension will have a length determined
% by the range of values tested for that variable,
% and the resolution of the values in that range.

% The values in the matrix represent the total
% cost to the bidder, whether they win or lose,
% calculated using the unique combination of
% parameters corresponding
% to each location in the output matrix.
% Thus, essentially the total cost to the
% bidder is being examined based on different
% parameters of the auction.

%     Assumptions:
% All bids are purchased for the same price.
% All bidders share the burden of raising
%     the auction price equally.

% ===================================================== %

% Housekeeping:

% Clear workspace.
close all;
clear all;
clc;

% Include parameters from separate file.
parameters_02

% ===================================================== %

% Prompt user to approve simulation based
% on how many operations it will need to execute.
numCalls = (length(win)*length(numBidders)*length(bidPrice)*length(finalAuctionPrice));
while(true)
    fprintf('\n\nSimulation requires: %d function calls\n',numCalls);
    fprintf('Continue with the simulation? (y,n)...\n\n');
    userInput = getline;
    if((userInput == 'y') | (userInput == 'Y'))
        % Continue with simulation.
        fprintf('\n\nRunning simulation...\n\n');
        break;
    elseif((userInput == 'n') | (userInput == 'N'))
        fprintf('\n\nExiting...\n\n');
        return;
    else
        fprintf('\n\nInvalid input, try again.');
    end
end

% ===================================================== %

% Simulation:

for i = (1:length(win))
    for j = (1:length(numBidders))
        for k = (1:length(bidPrice))
            for l = (1:length(finalAuctionPrice))
                outputData(i,j,k,l) = calcTotalCost(win(i),numBidders(j),bidPrice(k),finalAuctionPrice(l));
            end
        end
    end
end

%min(outputData,[],1)
%fprintf('\n\nMinimum cost occurs at:\n\n');
%fprintf('win = %s\n',[answer here]);



