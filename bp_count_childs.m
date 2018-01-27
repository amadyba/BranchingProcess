function res=bp_count_childs(Z)
%  res=bp_count_count(Z)
%    returns res with res(i) = number of particles 
%    with i-1 childs
%    The process Z is generated by gen_bp
%   Z(1,:) - vector of parent pointers
%   Z(2,:) - generation
%   Z(3,:) - type ot particle (1 - live, 2 - dead)

% use distinct.m

%  04.2016, Amady Ba
%  amady.sba@gmail.com


%default number of childs = 0
Childs=[];

gen_max = max(Z(2,:));

%find number ot childs for each particle
for k=1:size(Z,2)
    %Exclude the last generation
     if Z(2,k) ~= gen_max & Z(3,k) ~= 2
         T = find(Z(1,:) == k );
         Childs(k) = length(T);
        if Childs(k) == 1 & Z(3,T) == 2
            Childs(k) = 0;
        end;
     else 
         Childs(k) = -1;
     end;
     
  
end;



% Counts numper of particles with l childs
% and prepare the result
res=[];
for l=0:max(distinct(Childs(find(Childs >= 0))))
    res(l+1) = length(find(Childs == l));
end;

