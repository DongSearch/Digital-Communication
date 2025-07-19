%  it is a function for choosing symbols randomly in signal constellation
% m : the number of symbols, 4 -> 4ASK, 8 ->8ASK
% b : the number of selection
% c : c=0 -> unipolar, c=1 -> bipolar

function  y = myFirstFunction(m,b,c)
%  initialize the output vector with size of bx1 
y = ones(b,1);


if c==0
     % unipolar, m=4 -> 0,2,4,6
    d = (0:2:2*(m+1));
elseif c==1
    % bipolar, m=4 -> -3,-1,1,3
    d = -(m-1):2:(m-1)
end

% compute the length of our scheme
e = length(d);
% we need to select indices of symbols randomly in d(our modulation scheme) with size
% of b x 1
indices = randi([1,e],b,1);
% we store our symbol we chose to output
y = d(indices);
end
