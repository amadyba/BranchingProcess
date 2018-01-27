%  04.2016, Amady Ba
%  amady.sba@gmail.com


function Z=random(dist,p1,p2,p3,p4,p5)

if strcmp(dist,"bino")
  Z = binornd(p1,p2,p3,p4);
elseif strcmp(dist,"geo")
  Z = geornd(p1,p2,p3);
elseif strcmp(dist,"hyge")
  Z = hygernd(p1,p2,p3,p4,p5);
elseif strcmp(dist,"poiss")
  Z = poissrnd(p1,p2,p3);
end;
