% 
% 
% Tc1_list = [];
% Tc2_list = [];
% Theta1_list= [];
% Theta2_list = [];
mu1_array = [0 0.1];
mu2_array = [0 0.1 0.2 0.5 1.0 2.0 10];
label = [];

for i=1:2
    for j=1:7
        disp([mu1_temp,mu2_temp])
        mu1_temp = mu1_array(i);
        mu2_temp = mu2_array(j);
        label_str = "("+num2str(mu1_temp)+","+num2str(mu2_temp)+")";
        label = [label,label_str];

        output_from_Model = sim('two_link_manipulator.slx');
        v1 = output_from_Model.simout;
        v2 = output_from_Model.simout1;
        disp(size(v1))
        plot(v2,'DisplayName','mu_1='+string(mu1_temp)+' , mu_2='+string(mu2_temp))    
        hold on
   
%         plot(v2,'DisplayName','Desired theta2 M='+string(mass)+'and length'+string(length1))
%         hold on

    end
end

legend

title("Auxiliary input for theta 2 with different mu values")
xlabel('Different values of ( mu_1,mu_2 )')
ylabel('auxiliary input, nu_2')
plotbrowser('on')

hold off