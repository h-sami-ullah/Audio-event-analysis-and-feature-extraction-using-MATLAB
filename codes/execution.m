function [] = execution(x)

all_vari = all_parameters(x);   % Input sound row vector = x

[svmStruct_gun svmStruct_sniper svmStruct_rifle] = train_exe();

class_gun = svmclassify(svmStruct_gun, all_vari);

    if(class_gun==1)
        disp('Gun is detected')
        class_sniper = svmclassify(svmStruct_sniper, all_vari);
        if(class_sniper==1)
            disp('Gun is Sniper')
        else
            class_rifle = svmclassify(svmStruct_rifle, all_vari);
            if(class_rifle==1)
                disp('Gun is Rifle')
            else
                disp('Gun type is unknown')
            end
        end

    else
            disp('No gun detected')
    end
end