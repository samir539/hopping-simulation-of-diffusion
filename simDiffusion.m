function [x hist_f ] = simDiffusion( )
%SIMDIFFUSION computes the diffusion profile for hopping disks.
%

%
% Input arguments
%  None
%
% Output values
%  x      The positions of the bins
%  hist_f The number of particles in each bin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prompt the user for the parameters for the system size and number of hops
Nhop  = input('Enter number of hops  > ');
Nbin  = input('Enter number of bins  > ');

% Initialise the starting distribution
x = 1:Nbin;
hist_i = zeros(1, Nbin);

% Prompt the user for the initial distribution, one bin at a time
bin = 0;
while bin > -1
    bin = input('Enter bin number (-ve value ends input) > ');
    if bin > -1
        Ndisk = input('Enter number of disks                   > ');
        hist_i(bin) = Ndisk;
    end
end

% Move the disks ...
hist_f = hopDiffusion( hist_i, Nhop );

end
