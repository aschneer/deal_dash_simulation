% GLOBAL VARIABLES:

win = [true; false];
numBidders = transpose([1:1:100]);
bidPrice = transpose([0.01:0.10:1.00]);
finalAuctionPrice = transpose([20.00:10.00:1500.00]);
% Matrix for output values from cost function.
outputData = [];



% Unused (for now).

%bidBankQty = 220;
%bidBuddyQty = 0;
%buyItNowPrice = 800.00;