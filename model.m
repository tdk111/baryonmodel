
figure(1),clf

%values of the coefficients
coeff1=    0.11;
coeff2=    0.0;

% Simple plotting code for the baryon feedback model used in Kitching, Verde, Heavens, Jimenez, 2016  
% Copyright (C) 2013 T. Kitching
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

m=dlmread('PCA.dat');

k=zeros(8,103);
em=zeros(8,103);
e1=zeros(8,103);
e2=zeros(8,103);

for i=1:8 
    
   z=0.125+(i-1)*0.125;
   
   k(i,:)=m(int32(103*(i-1))+1:int32(103*i),2);
   e1(i,:)=m(int32(103*(i-1))+1:int32(103*i),3);
   e2(i,:)=m(int32(103*(i-1))+1:int32(103*i),4);
   em(i,:)=m(int32(103*(i-1))+1:int32(103*i),5);

end

for i=1:3:8
    z=0.125+(i-1)*0.125;
    y=1.+(em(i,:)-1.).*coeff1+coeff2.*e1(i,:);
    semilogx(k(i,:),y), hold on
end
legend('z=0.125','z=0.5','z=0.875');
xlim([1e-2 5.])
ylim([0.96 1.02])
hold on
ylabel('P(k)/P_D_M(k)'),xlabel('k h/Mpc')
ax = gca;
ax.XTick = [1e-2, 0.1, 0.5, 1., 2., 3, 4, 5];
set(gca,'FontSize',17.)
plot([0.01 10],[1 1],'k'); %unit line 


