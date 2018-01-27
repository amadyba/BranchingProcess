function Z = gen_bp(n,Dist)
% Function Z = gen_bp(n,Dist) returns 
%   the vector of parent pointers and the generation level for a 
%   BGW process.
%
%   INPUT:
%   n - generations
%   Dist.dist - distribution
%   Dist.par1 - parameter1
%   Dist.par2 - parameter2
%   Dist.par3 - parameter3
%
%   OUTPUT:
%   Z(1,:) - vector of parent pointers
%   Z(2,:) - generation
%   Z(3,:) - type ot particle (1 - live, 2 - dead)

%  04.2016, Amady Ba
%  amady.sba@gmail.com

parent = 1;
gen = 1;
%ind = 1;

Z(1,parent) = 0;
Z(2,parent) = gen;
Z(3,parent) = 1;
end_gen = 1;
dead = 0;

while (gen < n+1) & (size(Z,2) <= 5000)
gen = gen + 1;

dist = Dist.dist;
    while parent <= end_gen

    % calculating the number of offsprings
        if Z(3,parent)~= 2 %if is alive
        if isfield(Dist,'par1') & ~isfield(Dist,'par2') & ~isfield(Dist,'par3')
             offspr = random(dist,Dist.par1,1,1);
         elseif isfield(Dist,'par1') & isfield(Dist,'par2') & ~isfield(Dist,'par3')
             offspr = random(dist,Dist.par1,Dist.par2,1,1);
         elseif isfield(Dist,'par1') & isfield(Dist,'par2') & isfield(Dist,'par3')
             offspr = random(dist,Dist.par1,Dist.par2,Dist.par3,1,1);
         else
             error('Wrong stucture of parameters disribution');
         end; %if

        if offspr > 0
            Z_add = [ones(offspr,1)*parent ones(offspr,1)*gen ones(offspr,1)]';
            dead = 0;
        else
            Z_add = [ones(1,1)*parent ones(1,1)*gen 2]';
            dead = 1;
        end;


            Z = [Z Z_add];
        end; %end alive

        parent = parent + 1;

    end %while parent

    end_gen = size(Z,2);
end; %while gen

