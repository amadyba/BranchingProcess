%  04.2016, Amady Ba
%  amady.sba@gmail.com


function Z=pdf(dist,p1,p2,p3,p4,p5)

if strcmp(dist,"bino")
  Z = binopdf(p1,p2,p3,p4);
elseif strcmp(dist,"geo")
  Z = geopdf(p1,p2,p3);
elseif strcmp(dist,"hyge")
  Z = hygepdf(p1,p2,p3,p4,p5);
elseif strcmp(dist,"poiss")
  Z = poisspdf(p1,p2,p3);
end;
