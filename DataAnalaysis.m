fileID =fopen('DATA.txt','r');

repeat_time = 20;  %% Data refresh frequency

data =fscanf(fileID,'Time : %f:%f Temperature : %f°C \n',[3 inf]); %file read
Temperature =data(3,1:end);  % the 3.row of matrix is placed in the array
dataLenght=length(Temperature);%the length of the array
%Each x value is a query required to have a y value.
if mod(dataLenght-1,3) == 1   
Temperature=data(3,1:dataLenght-1)
end
if mod(dataLenght-1,3) == 2  
Temperature=data(3,1:dataLenght-2);
end
max_Temperature =max(Temperature);
min_Temperature =min(Temperature);

average_Temperature = mean(Temperature);

xlabel (' Time ' );
ylabel (' Temperature' );
grid; hold on
 
title('Air Temperature  ', 'fontsize', [14]);
 last_Timing=fix(length((Temperature))/(60/(repeat_time)));
 t =0 :minutes(repeat_time):hours(last_Timing);%the X of the graph is the length of the axis.
 ylim([0 40]);
 plot(t,Temperature,'DurationTickFormat','hh:mm');

   plot(t,Temperature,'--ro','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',8);