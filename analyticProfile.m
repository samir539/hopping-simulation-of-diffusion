function [ x conc ] = analyticProfile( Ndisk, Nbin, Nhop )
%ANALYTICPROFILE evaluates the analytic expression for the concentration
%   profile (histogram) for the final time starting from a single pile
%   containing all the disks.
%
% Input arguments
%   Ndisk        The number of disks
%   Nbin         The number of bins in the histogram
%   Nhop         The number of hops to be performed
%
% Output arguments
%   x            The locations of the bins
%   conc         The theoretical concentration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bin0 = floor((Nbin+1)/2); % The bin in which all the disks start
x = 1:Nbin;
conc = (Ndisk/sqrt(2*pi*Nhop/Ndisk))*exp(-(x-bin0).*(x-bin0)*Ndisk/(2*Nhop));

end
