
%s script to get maximum torque and difference in angles

Tc1_list = [];
Tc2_list = [];
Theta1_list= [];
Theta2_list = [];
mu1_array = [0 0.1];
mu2_array = [0 0.1 0.2 0.5 1.0 2.0 10];
label = [];

for i=1:2
    for j=1:7

        mu1_temp = mu1_array(i);
        mu2_temp = mu2_array(j);
        disp([mu1_temp,mu2_temp])
        

        output_from_Model = sim('two_link_manipulator.slx');
        Tc1_list = [Tc1_list,max(abs(output_from_Model.simout))];
        Tc2_list = [Tc2_list,max(output_from_Model.simout1)];
        Theta1_list = [Theta1_list,max(abs(diff(output_from_Model.simout2)))];
        Theta2_list = [Theta2_list,max(abs(diff(output_from_Model.simout3)))];
        label_str = "("+num2str(mu1_temp)+","+num2str(mu2_temp)+")";
        label = [label,label_str];

    end
end

figure
plot(Tc1_list);
hold on
plot(Tc2_list);
set(gca,'xtick',1:14);
set(gca,'xticklabel',label,'fontsize',8)
title('Maximum Control torque for different values of mu_1 and mu_2')
legend('Tc1','Tc2')
xlabel('Different values of ( mu_1,mu_2 )')
ylabel('Control torque (Nm)')

figure
plot(Theta1_list);
hold on
plot(Theta2_list);
set(gca,'xtick',1:14);
set(gca,'xticklabel',label,'fontsize',8)
title('Maximum change in angle per time step for different values of mu_1 and mu_2')
legend('Theta_1','Theta_2')
xlabel('Different values of ( mu_1,mu_2 )')
ylabel('Change in angle (radian)')
ylim([0 0.08])