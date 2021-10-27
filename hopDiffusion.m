function hist_f = hopDiffusion( hist_i, Nhop )
%HOPDIFFUSION computes the diffusion profile for hopping disks
%   Diffusion can be thought of in terms of random hops by particles. This
%   function produces a concentration profile (histogram) for the final
%   time starting from an initial distribution.
%
% Input arguments
%   hist_i       The initial distribution of disks
%   Nhop         The number of hops to be performed
%
% Output arguments
%   hist_f       The histogram of the number of disks.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Get the number of bins in the histogram
[tmp Nbin] = size(hist_i);

% Count the number of disks
Ndisk = sum(hist_i);

% Create an array in which to store the positions of the disks
pos = zeros(1,Ndisk);

% Assign positions to all the disks based on the initial distribution
k = 1;
for i = 1:Nbin
    if hist_i(i) > 0
        for j = 1:hist_i(i)
            pos(k) = i;
            k = k + 1;
        end
    end
end

% Let the disks diffuse
for t = 1:Nhop
    % Pick a disk at random
    disk = floor (random('unif',1,Ndisk+1));
    if disk == Ndisk+1
        disk = Ndisk;
    end
    % Find which direction it will hop and update the position
    if random('unif', 0, 1) > 0.5
        pos(disk) = pos(disk)+1;
        if pos(disk) > Nbin
            pos(disk) = Nbin;
        end
    else
        pos(disk) = pos(disk)-1;
        if pos(disk) < 1
            pos(disk) = 1;
        end
    end
end

% Build the final histogram
hist_f = zeros(1,Nbin);
for i = 1:Ndisk
    hist_f(pos(i)) = hist_f(pos(i)) + 1;
end

end

